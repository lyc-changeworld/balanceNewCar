#include "gpio.h"

GPIO_InitTypeDef gpio_init_struct_beep;//蜂鸣器
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Left;//编码器左轮
GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Right;//编码器右轮
FTM_InitTypeDef ftm_init_struct;
//电机pwm初始化
void pwm_init(void)
{
  ftm_init_struct.FTM_Ftmx = FTM0;	//使能FTM0通道
  ftm_init_struct.FTM_Mode = FTM_MODE_PWM;	//使能PWM模式
  ftm_init_struct.FTM_PwmFreq = 9000;	//PWM频率2KHz
  LPLD_FTM_Init(ftm_init_struct);
  
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch0,0, PTC1,ALIGN_LEFT);//左正向
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch1,0, PTC2,ALIGN_LEFT); //左反向:
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch2,0, PTC3,ALIGN_LEFT);//右正向:
  LPLD_FTM_PWM_Enable(FTM0,FTM_Ch3,0, PTC4,ALIGN_LEFT);//右反向
}
//蜂鸣器初始化
void init_gpio_beep()
{
  gpio_init_struct_beep.GPIO_PTx = PTC;
  gpio_init_struct_beep.GPIO_Pins = GPIO_Pin5;
  gpio_init_struct_beep.GPIO_Dir = DIR_OUTPUT;
  gpio_init_struct_beep.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_beep);
} 
//测速方向口初始化
void init_gpio_SpeedDirect()
{
  //左轮方向口
  gpio_init_struct_SpeedDirect_Left.GPIO_PTx=PTB;
  gpio_init_struct_SpeedDirect_Left.GPIO_Pins=GPIO_Pin9;
  gpio_init_struct_SpeedDirect_Left.GPIO_Dir=DIR_INPUT;
  gpio_init_struct_SpeedDirect_Left.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Left);
  //右轮方向口
  gpio_init_struct_SpeedDirect_Right.GPIO_PTx=PTC;
  gpio_init_struct_SpeedDirect_Right.GPIO_Pins=GPIO_Pin16;
  gpio_init_struct_SpeedDirect_Right.GPIO_Dir=DIR_INPUT;
  gpio_init_struct_SpeedDirect_Right.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Right);
}