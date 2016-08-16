#include "speedcheck.h"

/************************测速变量**************************/
DMA_InitTypeDef    DMA_Struct1;
DMA_InitTypeDef    DMA_Struct2;
char Data1[1];//缓冲区
char Data2[1];
int ch0_over_cnt = 0;//通道溢出计数
int ch1_over_cnt = 0;
int  ch0_pulseacc;//脉冲累加值计数  
int  ch1_pulseacc;
//当前量
float Speed_LQ_now[10]={0};
float Speed_RQ_now[10]={0};
float speed_L=0;        //左轮速度
float speed_R=0;        //右轮速度
float speed_avg=0;     //平均速度

void GetMotorPulse()//5ms
{
  ch0_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH1].CITER_ELINKNO;     //获得最终的脉冲累加值
  ch1_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH2].CITER_ELINKNO;
  if(ch0_over_cnt !=0)
  {
    ch0_pulseacc = ch0_pulseacc + DMA_MAX_NUM*ch0_over_cnt;
    ch0_over_cnt = 0;             //清零溢出计数
  }
  if(ch1_over_cnt !=0)
  {
    ch1_pulseacc = ch1_pulseacc + DMA_MAX_NUM*ch1_over_cnt;
    ch1_over_cnt = 0;
  }
  //初始化DMA模块
  LPLD_DMA_Init(DMA_Struct1); //初始化DMA模块
  LPLD_DMA_Init(DMA_Struct2);  
  LPLD_DMA_EnableReq(DMA_CH1); //开启通道请求
  LPLD_DMA_EnableReq(DMA_CH2);
  
  if(ch0_pulseacc-500 > 0)
    ch0_pulseacc = 500;
  if(ch1_pulseacc-500 > 0)
    ch1_pulseacc = 500;
  //计划5ms测速一次，更新数组中的最后一个值
  if(PTB9_I) {Speed_LQ_now[9]=(float)ch0_pulseacc;}//左轮方向校准,右轮正转时编码器顺时针转，为高
  else  {Speed_LQ_now[9]=-(float)ch0_pulseacc;}
  if(PTC16_I){Speed_RQ_now[9]=-(float)ch1_pulseacc;}//右轮方向校准，左轮正转时编码器逆时针转，为低
  else  {Speed_RQ_now[9]=(float)ch1_pulseacc;}
  
  //数组中的值依次向前移动一个，去掉首个值，更新最后一个的值
  for(int i=0;i<9;i++) //0到8,有9个值
  {
    Speed_LQ_now[i]=Speed_LQ_now[i+1];
    Speed_RQ_now[i]=Speed_RQ_now[i+1];
  }
  //历史9次的值求个平均值得到当前的速度值，保证速度平缓变化
  speed_L=speedPlus(Speed_LQ_now,9);//5ms
  speed_R=speedPlus(Speed_RQ_now,9);//5ms
  speed_avg=(speed_L+speed_R)/2;
  
  //speed_control();//速度电机量计算
  //speed_L=lvbo(Speed_LQ);//5ms
  //speed_R=lvbo(Speed_RQ);//5ms
}
void DMA_Init(void)
{
  DMA_Struct1.DMA_CHx=DMA_CH1;
  DMA_Struct1.DMA_Req=PORTB_DMAREQ;
  DMA_Struct1.DMA_MajorLoopCnt=DMA_MAX_NUM;/*主循环次数*/
  DMA_Struct1.DMA_MinorByteCnt=1;
  DMA_Struct1.DMA_SourceAddr=(uint32)&PTB->PDIR;
  DMA_Struct1.DMA_DestAddr=(uint32)Data1;
  DMA_Struct1.DMA_Isr=DMA1_isr;
  LPLD_DMA_Init(DMA_Struct1);
  
  DMA_Struct2.DMA_CHx=DMA_CH2;
  DMA_Struct2.DMA_Req=PORTC_DMAREQ;
  DMA_Struct2.DMA_MajorLoopCnt=DMA_MAX_NUM;/*主循环次数*/
  DMA_Struct2.DMA_MinorByteCnt=1;
  DMA_Struct2.DMA_SourceAddr=(uint32)&PTC->PDIR+1;
  DMA_Struct2.DMA_DestAddr=(uint32)Data2;
  DMA_Struct2.DMA_Isr=DMA2_isr;
  LPLD_DMA_Init(DMA_Struct2);
  
  LPLD_DMA_EnableReq(DMA_CH1);
  LPLD_DMA_EnableIrq(DMA_Struct1);
  
  LPLD_DMA_EnableReq(DMA_CH2);
  LPLD_DMA_EnableIrq(DMA_Struct2);      
}
void DMA1_isr(void)
{
  ch0_over_cnt++;//通道0溢出累加  
  LPLD_DMA_Init(DMA_Struct1); 
}
void DMA2_isr(void)
{
  ch1_over_cnt++;//通道1溢出累加
  LPLD_DMA_Init(DMA_Struct2); 
}
//将测到的脉冲累加即为速度量
float speedPlus(float aa[],int number)
{
int i;
float speedNow=0;
for(i=0;i<number;i++)
{
speedNow+=aa[i];
  }
return speedNow/number;//返回平均值
}