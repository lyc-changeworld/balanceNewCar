#ifndef __ANGLE_H__
#define __ANGLE_H__

#include "common.h"
#include "DEV_MMA8451.h"
#include "math.h"

#define PAI 3.141593
#define gyro_value_y  9.3  //0.56（12位）时还行  8.96（8位）陀螺仪角速度换算系数
#define gyro_value_x  1.0/4// 左扭动为正，右扭动为负 
#define gyro_time   0.005     //陀螺仪采样时间5ms
#define a_time      0.0005    //加速度计采样时间0.5ms
#define MMA8451_Y   0//Y轴加速度计-平衡时角度偏量  
//#define GRAVITY_ADJUST_TIME_CONSTANT 0.18//取0.35时效果较好（陀螺仪还是会漂移，大概漂1度，可用）

//--------------------函数定义----------------//
/*角度获得函数*/
void get_0(void);
void get_gyro(void); 
void get_accl(void);
void ronghe_angle(void);
/*滤波函数*/
//void QingHua_AngleCalaulate();//清华角度滤波方案
float lvbo(float aa[]);//基本滤波函数
void one_complementation(float gyro_y,float accl_y);//一阶互补滤波
#endif