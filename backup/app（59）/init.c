#include "init.h"
#include "speed.h"

//#define SPEED_TIME 50  //50MS     5ms����һ�����ݣ�ȡ��ʷ45ms�е�9������ƽ��ֵ�������ٶ���
#define DIRECT_TIME  10 //10MS

//�ṹ������
UART_InitTypeDef uart3_init_struct;                       //���ڷ���
ADC_InitTypeDef adc0_init_struct;
ADC_InitTypeDef adc1_init_struct;
ADC_InitTypeDef adc2_init_struct;                        //����
PIT_InitTypeDef pit0_init_struct;                        //�ܹ��ܶ�ʱ��
PIT_InitTypeDef pit1_runTime;                   //����ģ�鶨ʱ��
GPIO_InitTypeDef   INPUT1_Init;
GPIO_InitTypeDef   INPUT2_Init;

void adc_init(void)//��ʼ��ADC����ͨ��
{
  adc0_init_struct.ADC_Adcx = ADC0;                       //E24��E25
  adc0_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
  adc0_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
  adc0_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
  //adc0_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
  adc0_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
  
  adc1_init_struct.ADC_Adcx = ADC0;                       //D5��D6
  adc1_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
  adc1_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
  adc1_init_struct.ADC_MuxSel=MUX_ADXXB;                  //����Bͨ������
  adc1_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
  //adc1_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
  adc1_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
  
  adc2_init_struct.ADC_Adcx = ADC1;                       //E2��E3��A17
  adc2_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
  adc2_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
  adc2_init_struct.ADC_MuxSel=MUX_ADXXA;                  //����Aͨ������
  adc2_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
  //adc2_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
  adc2_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
  
  LPLD_ADC_Init(adc0_init_struct);
  LPLD_ADC_Init(adc1_init_struct);
  LPLD_ADC_Init(adc2_init_struct);                        //��ʼ��ADC
  //�����ǲ�����
  LPLD_ADC_Chn_Enable(ADC1, AD6);                         //PTE2 Y��������ǽӿڣ�ǰ�������ϵģ�
  LPLD_ADC_Chn_Enable(ADC1, AD7);                         //PTE3 X��������ǽӿڣ�ת��ƽ���ϵģ����ã�
  /********��Ų����ڣ�˳��Ϊ�����ϵ�1��5��**********/
  LPLD_ADC_Chn_Enable(ADC0, AD7);                         //D6
  LPLD_ADC_Chn_Enable(ADC0, AD6);                         //D5
  LPLD_ADC_Chn_Enable(ADC1, AD17);                        //A17
  LPLD_ADC_Chn_Enable(ADC0, AD18);                       //E25
  LPLD_ADC_Chn_Enable(ADC0, AD17);                       //E24
}
void uart_init(void)//��ʼ��UART3ģ��
{
  uart3_init_struct.UART_Uartx = UART3;                  //ʹ��UART3
  uart3_init_struct.UART_BaudRate = 115200;              //���ò�����9600
  uart3_init_struct.UART_RxPin = PTE5;                   //��������ΪPTE5
  uart3_init_struct.UART_TxPin = PTE4;                   //��������ΪPTE4
  LPLD_UART_Init(uart3_init_struct);                     //��ʼ��UART
}
void pit_init(void)
{
  //����PIT0����   �����Ƕ�ģ��(�����ǻ��ֲ�Ǽ����ٶȼƶ��ڲ���)
  pit0_init_struct.PIT_Pitx = PIT0;                     //����PIT0����
  pit0_init_struct.PIT_PeriodMs = 5;                    //��ʱ����5ms
  pit0_init_struct.PIT_Isr = pit0_isr;                  //�����жϺ���
  LPLD_PIT_Init(pit0_init_struct);                      //��ʼ��PIT0
  LPLD_PIT_EnableIrq(pit0_init_struct);
  
//  pit1_runTime.PIT_Pitx = PIT1;                //����PIT1����
//  pit1_runTime.PIT_PeriodS = 20;                 //��ʱ����5ms
//  pit1_runTime.PIT_Isr = RunTime_isr;            //�����жϺ���
//  LPLD_PIT_Init(pit1_runTime);                   //��ʼ��PIT0
//  LPLD_PIT_EnableIrq(pit1_runTime);
}


/**
* DMA����ģ��
*/
void GPIO_DMA_Init(void)
{
  INPUT1_Init.GPIO_PTx=PTB;
  INPUT1_Init.GPIO_Pins=GPIO_Pin0;/*���ֲ���*/
  INPUT1_Init.GPIO_Dir=DIR_INPUT;
  INPUT1_Init.GPIO_PinControl=INPUT_PULL_DOWN|IRQC_DMARI;
  LPLD_GPIO_Init(INPUT1_Init);
  
  INPUT2_Init.GPIO_PTx=PTC ;
  INPUT2_Init.GPIO_Pins=GPIO_Pin8;/*���ֲ���*/
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
//�ƻ�5ms����һ�Σ�10���ۼƺ��˲�����
if(PTB9_I) {Speed_LQ[c_s]=(float)ch0_pulseacc;}//���ַ���У׼,������תʱ������˳ʱ��ת��Ϊ��
  else  {Speed_LQ[c_s]=-(float)ch0_pulseacc;}
if(PTC16_I){Speed_RQ[c_s]=-(float)ch1_pulseacc;}//���ַ���У׼��������תʱ��������ʱ��ת��Ϊ��
  else  {Speed_RQ[c_s]=(float)ch1_pulseacc;}
//Speed_Q[c_s]=(Speed_LQ[c_s]+Speed_RQ[c_s])/2;//ƽ���ٶȴ洢

//50ms�Բɵ����ٶ�ֵ�˲�����
if(c_s==10)
{
c_s=0;
GetMotorPulse();//������ǰ���ٶ���
speed_control();//�ٶȵ��������
  }
c_s++;//5ms�ۼ�һ��

//��ʼ��DMAģ��
LPLD_DMA_Init(DMA_Struct1); //��ʼ��DMAģ��
LPLD_DMA_Init(DMA_Struct2);  
LPLD_DMA_EnableReq(DMA_CH1); //����ͨ������
LPLD_DMA_EnableReq(DMA_CH2);

//  get_ad();//��в���
//cal_offset();//��ȡƫ��
oled_flag++;//oled��ʾ��־
direct_flag++;
if(direct_flag==2)//10ms
{
direct_flag=0;
DirectionSpeedControl();//���ٵ��������
  }
if(oled_flag==20)//100msˢ��һ����Ļ
{
oled_flag=0;
show_info();
  }

}*/
