#include "speedcheck.h"

/************************���ٱ���**************************/
DMA_InitTypeDef    DMA_Struct1;
DMA_InitTypeDef    DMA_Struct2;
char Data1[1];//������
char Data2[1];
int ch0_over_cnt = 0;//ͨ���������
int ch1_over_cnt = 0;
int  ch0_pulseacc;//�����ۼ�ֵ����  
int  ch1_pulseacc;
//��ǰ��
float Speed_LQ_now[10]={0};
float Speed_RQ_now[10]={0};
float speed_L=0;        //�����ٶ�
float speed_R=0;        //�����ٶ�
float speed_avg=0;     //ƽ���ٶ�

void GetMotorPulse()//5ms
{
  ch0_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH1].CITER_ELINKNO;     //������յ������ۼ�ֵ
  ch1_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH2].CITER_ELINKNO;
  if(ch0_over_cnt !=0)
  {
    ch0_pulseacc = ch0_pulseacc + DMA_MAX_NUM*ch0_over_cnt;
    ch0_over_cnt = 0;             //�����������
  }
  if(ch1_over_cnt !=0)
  {
    ch1_pulseacc = ch1_pulseacc + DMA_MAX_NUM*ch1_over_cnt;
    ch1_over_cnt = 0;
  }
  //��ʼ��DMAģ��
  LPLD_DMA_Init(DMA_Struct1); //��ʼ��DMAģ��
  LPLD_DMA_Init(DMA_Struct2);  
  LPLD_DMA_EnableReq(DMA_CH1); //����ͨ������
  LPLD_DMA_EnableReq(DMA_CH2);
  
  if(ch0_pulseacc-500 > 0)
    ch0_pulseacc = 500;
  if(ch1_pulseacc-500 > 0)
    ch1_pulseacc = 500;
  //�ƻ�5ms����һ�Σ����������е����һ��ֵ
  if(PTB9_I) {Speed_LQ_now[9]=(float)ch0_pulseacc;}//���ַ���У׼,������תʱ������˳ʱ��ת��Ϊ��
  else  {Speed_LQ_now[9]=-(float)ch0_pulseacc;}
  if(PTC16_I){Speed_RQ_now[9]=-(float)ch1_pulseacc;}//���ַ���У׼��������תʱ��������ʱ��ת��Ϊ��
  else  {Speed_RQ_now[9]=(float)ch1_pulseacc;}
  
  //�����е�ֵ������ǰ�ƶ�һ����ȥ���׸�ֵ���������һ����ֵ
  for(int i=0;i<9;i++) //0��8,��9��ֵ
  {
    Speed_LQ_now[i]=Speed_LQ_now[i+1];
    Speed_RQ_now[i]=Speed_RQ_now[i+1];
  }
  //��ʷ9�ε�ֵ���ƽ��ֵ�õ���ǰ���ٶ�ֵ����֤�ٶ�ƽ���仯
  speed_L=speedPlus(Speed_LQ_now,9);//5ms
  speed_R=speedPlus(Speed_RQ_now,9);//5ms
  speed_avg=(speed_L+speed_R)/2;
  
  //speed_control();//�ٶȵ��������
  //speed_L=lvbo(Speed_LQ);//5ms
  //speed_R=lvbo(Speed_RQ);//5ms
}
void DMA_Init(void)
{
  DMA_Struct1.DMA_CHx=DMA_CH1;
  DMA_Struct1.DMA_Req=PORTB_DMAREQ;
  DMA_Struct1.DMA_MajorLoopCnt=DMA_MAX_NUM;/*��ѭ������*/
  DMA_Struct1.DMA_MinorByteCnt=1;
  DMA_Struct1.DMA_SourceAddr=(uint32)&PTB->PDIR;
  DMA_Struct1.DMA_DestAddr=(uint32)Data1;
  DMA_Struct1.DMA_Isr=DMA1_isr;
  LPLD_DMA_Init(DMA_Struct1);
  
  DMA_Struct2.DMA_CHx=DMA_CH2;
  DMA_Struct2.DMA_Req=PORTC_DMAREQ;
  DMA_Struct2.DMA_MajorLoopCnt=DMA_MAX_NUM;/*��ѭ������*/
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
  ch0_over_cnt++;//ͨ��0����ۼ�  
  LPLD_DMA_Init(DMA_Struct1); 
}
void DMA2_isr(void)
{
  ch1_over_cnt++;//ͨ��1����ۼ�
  LPLD_DMA_Init(DMA_Struct2); 
}
//���⵽�������ۼӼ�Ϊ�ٶ���
float speedPlus(float aa[],int number)
{
int i;
float speedNow=0;
for(i=0;i<number;i++)
{
speedNow+=aa[i];
  }
return speedNow/number;//����ƽ��ֵ
}