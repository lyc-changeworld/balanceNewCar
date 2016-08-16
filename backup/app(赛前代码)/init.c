#include "init.h"
#include "speed.h"

//#define SPEED_TIME 50  //50MS     5ms更新一个数据，取历史45ms中的9个数据平均值来计算速度量
#define DIRECT_TIME  10 //10MS

//结构体声明
UART_InitTypeDef uart3_init_struct;                       //串口发送
ADC_InitTypeDef adc0_init_struct;
ADC_InitTypeDef adc1_init_struct;
ADC_InitTypeDef adc2_init_struct;                        //采样
PIT_InitTypeDef pit0_init_struct;                        //总功能定时器
PIT_InitTypeDef pit1_runTime;                   //测速模块定时器
GPIO_InitTypeDef   INPUT1_Init;
GPIO_InitTypeDef   INPUT2_Init;

void adc_init(void)//初始化ADC及其通道
{
  adc0_init_struct.ADC_Adcx = ADC0;                       //E24、E25
  adc0_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
  adc0_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
  adc0_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
  //adc0_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
  adc0_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
  
  adc1_init_struct.ADC_Adcx = ADC0;                       //D5、D6
  adc1_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
  adc1_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
  adc1_init_struct.ADC_MuxSel=MUX_ADXXB;                  //单端B通道输入
  adc1_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
  //adc1_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
  adc1_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
  
  adc2_init_struct.ADC_Adcx = ADC1;                       //E2、E3、A17
  adc2_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
  adc2_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
  adc2_init_struct.ADC_MuxSel=MUX_ADXXA;                  //单端A通道输入
  adc2_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
  //adc2_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
  adc2_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
  
  LPLD_ADC_Init(adc0_init_struct);
  LPLD_ADC_Init(adc1_init_struct);
  LPLD_ADC_Init(adc2_init_struct);                        //初始化ADC
  //陀螺仪采样口
  LPLD_ADC_Chn_Enable(ADC1, AD6);                         //PTE2 Y轴的陀螺仪接口（前进方向上的）
  LPLD_ADC_Chn_Enable(ADC1, AD7);                         //PTE3 X轴的陀螺仪接口（转弯平面上的，备用）
  /********电磁采样口，顺序为板子上的1到5口**********/
  LPLD_ADC_Chn_Enable(ADC0, AD7);                         //D6
  LPLD_ADC_Chn_Enable(ADC0, AD6);                         //D5
  LPLD_ADC_Chn_Enable(ADC1, AD17);                        //A17
  LPLD_ADC_Chn_Enable(ADC0, AD18);                       //E25
  LPLD_ADC_Chn_Enable(ADC0, AD17);                       //E24
}
void uart_init(void)//初始化UART3模块
{
  uart3_init_struct.UART_Uartx = UART3;                  //使用UART3
  uart3_init_struct.UART_BaudRate = 115200;              //设置波特率9600
  uart3_init_struct.UART_RxPin = PTE5;                   //接收引脚为PTE5
  uart3_init_struct.UART_TxPin = PTE4;                   //发送引脚为PTE4
  LPLD_UART_Init(uart3_init_struct);                     //初始化UART
}
void pit_init(void)
{
  //配置PIT0参数   测量角度模块(陀螺仪积分测角及加速度计定期补偿)
  pit0_init_struct.PIT_Pitx = PIT0;                     //配置PIT0参数
  pit0_init_struct.PIT_PeriodMs = 5;                    //定时周期5ms
  pit0_init_struct.PIT_Isr = pit0_isr;                  //设置中断函数
  LPLD_PIT_Init(pit0_init_struct);                      //初始化PIT0
  LPLD_PIT_EnableIrq(pit0_init_struct);
  
//  pit1_runTime.PIT_Pitx = PIT1;                //配置PIT1参数
//  pit1_runTime.PIT_PeriodS = 20;                 //定时周期5ms
//  pit1_runTime.PIT_Isr = RunTime_isr;            //设置中断函数
//  LPLD_PIT_Init(pit1_runTime);                   //初始化PIT0
//  LPLD_PIT_EnableIrq(pit1_runTime);
}


/**
* DMA测速模块
*/
void GPIO_DMA_Init(void)
{
  INPUT1_Init.GPIO_PTx=PTB;
  INPUT1_Init.GPIO_Pins=GPIO_Pin0;/*左轮测速*/
  INPUT1_Init.GPIO_Dir=DIR_INPUT;
  INPUT1_Init.GPIO_PinControl=INPUT_PULL_DOWN|IRQC_DMARI;
  LPLD_GPIO_Init(INPUT1_Init);
  
  INPUT2_Init.GPIO_PTx=PTC ;
  INPUT2_Init.GPIO_Pins=GPIO_Pin8;/*右轮测速*/
  INPUT2_Init.GPIO_Dir=DIR_INPUT;
  INPUT2_Init.GPIO_PinControl=INPUT_PULL_DOWN|IRQC_DMARI;
  LPLD_GPIO_Init(INPUT2_Init);
}
//void RunTime_isr(void)
//{
//  runTime = 1;
//}
/*void DMA_PIT_isr(void)
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
//计划5ms测速一次，10次累计后滤波处理
if(PTB9_I) {Speed_LQ[c_s]=(float)ch0_pulseacc;}//左轮方向校准,右轮正转时编码器顺时针转，为高
  else  {Speed_LQ[c_s]=-(float)ch0_pulseacc;}
if(PTC16_I){Speed_RQ[c_s]=-(float)ch1_pulseacc;}//右轮方向校准，左轮正转时编码器逆时针转，为低
  else  {Speed_RQ[c_s]=(float)ch1_pulseacc;}
//Speed_Q[c_s]=(Speed_LQ[c_s]+Speed_RQ[c_s])/2;//平均速度存储

//50ms对采到的速度值滤波处理
if(c_s==10)
{
c_s=0;
GetMotorPulse();//测量当前的速度量
speed_control();//速度电机量计算
  }
c_s++;//5ms累加一次

//初始化DMA模块
LPLD_DMA_Init(DMA_Struct1); //初始化DMA模块
LPLD_DMA_Init(DMA_Struct2);  
LPLD_DMA_EnableReq(DMA_CH1); //开启通道请求
LPLD_DMA_EnableReq(DMA_CH2);

//  get_ad();//电感采样
//cal_offset();//获取偏差
oled_flag++;//oled显示标志
direct_flag++;
if(direct_flag==2)//10ms
{
direct_flag=0;
DirectionSpeedControl();//差速电机量计算
  }
if(oled_flag==20)//100ms刷新一次屏幕
{
oled_flag=0;
show_info();
  }

}*/
