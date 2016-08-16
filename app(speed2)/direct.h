#ifndef __DIRECT_H_
#define __DIRECT_H_
#include "common.h"
#include "oled.h"
#define AD_NUM 16    //连续采样次数，8或者16均可
#define OFFSET_NUM 10

void get_ad_once(void);
void get_ad(void);               //电感采样函数
void cal_offset(void);           //偏差求值函数
void linear(float x_sum,float y_sum,float xx_sum,float xy_sum,float var[2],int m);


#endif