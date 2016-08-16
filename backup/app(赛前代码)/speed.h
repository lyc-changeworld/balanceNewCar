#ifndef _SPEED_H_
#define _SPEED_H_
#include "common.h"
#include "gpio.h"
#include "angle.h"
#include "direct.h"
#include "speedcheck.h"
extern uint32 My_Speed_Set; 
//速度控制
#define Speed_MAX            My_Speed_Set          //速度脉冲量 周期：5ms记得的 学长的基本速度为14
#define Speed_MIN            Speed_MAX*0.8
#define  Angle_Max            16           //最大角度变化量
#define  SA_Exchange          2500         //速度输出转换比例
#define  SpeedIntegral_MAX    3500        //最大I积分量
//#define Speed_Power_Max      6000        //控制速度输出的最大值
#define SpeedP 400  //1400差不多   参考学长     150
#define SpeedI 230   //500                     100
#define SpeedD 0
//单电机差速控制
#define DIRECT_MINIMUM   0 
#define SpeedAloneImax  0
#define SpeedOutMax 3000   //3000

/****差速的先关系数***/
//#define SpeedAP_Left 50//差速控制P量 14
//#define SpeedAI_Left 0
//#define SpeedAD_Left 0//
//左轮跑得比右轮快些
//#define SpeedAP_Right 50//14    
//#define SpeedAI_Right 0
//#define SpeedAD_Right 0//

//总电机输出
#define ADJUST_POWER         9500       //总电机量PWM最大值 9500
#define Direct_POWER         2200       //方向控量PWM最大值
#define LeftMotor_Dead        0        //左电机死区电机量//800
#define RightMotor_Dead       0       //右电机死区电机量//800
/************函数定义*********/
//角度控制函数
void angle_control(void);
void stop_control(void);
//速度控制函数
void speed_control(void); 
void SpeedSpeedControl(void);
void SpeedControlOutput(void);
//方向控制函数
void DirectionControl(void);//偏差量控制输出
void DirectionSpeedControl(void);//偏差量计算
void DirectionSpeedOut(void);//差速控制输出
//输出量总控制
void Motor_Control(void);
void Motor_Stop(void);
void Motor_TurnBack(void);
#endif