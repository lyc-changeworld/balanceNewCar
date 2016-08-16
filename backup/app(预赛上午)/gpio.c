#include "gpio.h"

GPIO_InitTypeDef gpio_init_struct_beep;//������
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Left;//����������
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Right;//����������
GPIO_InitTypeDef gpio_init_struct_StopCar;//ͣ������
GPIO_InitTypeDef gpio_init_struct_Dip_Switch;//���뿪��
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

void init_gpio_StopCar()
{
  //�ɻɹ�
  gpio_init_struct_StopCar.GPIO_PTx=PTE;
  gpio_init_struct_StopCar.GPIO_Pins=GPIO_Pin26;
  gpio_init_struct_StopCar.GPIO_Dir=DIR_INPUT;
  gpio_init_struct_StopCar.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_StopCar);
}
//���뿪�ؿڳ�ʼ��
void init_gpio_Dip_Switch()   //B:10��11��16��17
{
  gpio_init_struct_Dip_Switch.GPIO_PTx = PTB;
  gpio_init_struct_Dip_Switch.GPIO_Pins = GPIO_Pin10|GPIO_Pin11|GPIO_Pin16|GPIO_Pin17;
  gpio_init_struct_Dip_Switch.GPIO_Dir = DIR_OUTPUT;
  gpio_init_struct_Dip_Switch.GPIO_Output = OUTPUT_H;
  gpio_init_struct_Dip_Switch.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_Dip_Switch);
}

//ɨ�貦�뿪�أ���������ٶ�
uint32 Dip_Switch()
{
  uint32 Switch_Value=0;
  if(!dip_0)
  {
    Switch_Value+=1;
  }
  if(!dip_1)
  {
    Switch_Value+=2;
  }
  if(!dip_2)
  {
    Switch_Value+=4;
  }
  if(!dip_3)
  {
    Switch_Value+=8;
  }
  return Switch_Value;
}
