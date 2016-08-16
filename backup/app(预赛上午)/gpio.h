#ifndef __GPIO_H__
#define __GPIO_H__
#include "common.h"

#define dip_3 PTB10_I
#define dip_2 PTB11_I
#define dip_1 PTB16_I
#define dip_0 PTB17_I

void init_gpio_beep(void);
void init_gpio_SpeedDirect(void);
void init_gpio_StopCar(void);//干簧管口初始化
void pwm_init(void);
void init_gpio_Dip_Switch(void);//拨码开关口定义
uint32 Dip_Switch(void);//拨码开关检测

#endif