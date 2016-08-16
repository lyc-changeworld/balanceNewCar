#include "gpio.h"

GPIO_InitTypeDef gpio_init_struct_beep;//������
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Left;//����������
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Right;//����������
FTM_InitTypeDef ftm_init_struct;
//���pwm��ʼ��
void pwm_init(void)
{
  ftm_init_struct.FTM_Ftmx = FTM0;	//ʹ��FTM0ͨ��
  ftm_init_struct.FTM_Mode = FTM_MODE_PWM;	//ʹ��PWMģʽ
  ftm_init_struct.FTM_PwmFreq = 9000;	//PWMƵ��2KHz
  LPLD_FTM_Init(ftm_init_struct);
  
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch0,0, PTC1,ALIGN_LEFT);//������
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch1,0, PTC2,ALIGN_LEFT); //����:
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch2,0, PTC3,ALIGN_LEFT);//������:
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch3,0, PTC4,ALIGN_LEFT);//�ҷ���
}
//��������ʼ��
void init_gpio_beep()
{
  gpio_init_struct_beep.GPIO_PTx = PTC;
  gpio_init_struct_beep.GPIO_Pins = GPIO_Pin5;
  gpio_init_struct_beep.GPIO_Dir = DIR_OUTPUT;
  gpio_init_struct_beep.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_beep);
} 
//���ٷ���ڳ�ʼ��
void init_gpio_SpeedDirect()
{
  //���ַ����
  gpio_init_struct_SpeedDirect_Left.GPIO_PTx=PTB;
  gpio_init_struct_SpeedDirect_Left.GPIO_Pins=GPIO_Pin9;
  gpio_init_struct_SpeedDirect_Left.GPIO_Dir=DIR_INPUT;
  gpio_init_struct_SpeedDirect_Left.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Left);
  //���ַ����
  gpio_init_struct_SpeedDirect_Right.GPIO_PTx=PTC;
  gpio_init_struct_SpeedDirect_Right.GPIO_Pins=GPIO_Pin16;
  gpio_init_struct_SpeedDirect_Right.GPIO_Dir=DIR_INPUT;
  gpio_init_struct_SpeedDirect_Right.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Right);
}