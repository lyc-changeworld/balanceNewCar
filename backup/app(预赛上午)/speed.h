#ifndef _SPEED_H_
#define _SPEED_H_
#include "common.h"
#include "gpio.h"
#include "angle.h"
#include "direct.h"
#include "speedcheck.h"
extern uint32 My_Speed_Set; 
//�ٶȿ���
#define Speed_MAX            My_Speed_Set          //�ٶ������� ���ڣ�5ms�ǵõ� ѧ���Ļ����ٶ�Ϊ14
#define Speed_MIN            Speed_MAX*0.8
#define  Angle_Max            16           //���Ƕȱ仯��
#define  SA_Exchange          2500         //�ٶ����ת������
#define  SpeedIntegral_MAX    3500        //���I������
//#define Speed_Power_Max      6000        //�����ٶ���������ֵ
#define SpeedP 400  //1400���   �ο�ѧ��     150
#define SpeedI 230   //500                     100
#define SpeedD 0
//��������ٿ���
#define DIRECT_MINIMUM   0 
#define SpeedAloneImax  0
#define SpeedOutMax 3000   //3000

/****���ٵ��ȹ�ϵ��***/
//#define SpeedAP_Left 50//���ٿ���P�� 14
//#define SpeedAI_Left 0
//#define SpeedAD_Left 0//
//�����ܵñ����ֿ�Щ
//#define SpeedAP_Right 50//14    
//#define SpeedAI_Right 0
//#define SpeedAD_Right 0//

//�ܵ�����
#define ADJUST_POWER         9500       //�ܵ����PWM���ֵ 9500
#define Direct_POWER         2200       //�������PWM���ֵ
#define LeftMotor_Dead        0        //�������������//800
#define RightMotor_Dead       0       //�ҵ�����������//800
/************��������*********/
//�Ƕȿ��ƺ���
void angle_control(void);
void stop_control(void);
//�ٶȿ��ƺ���
void speed_control(void); 
void SpeedSpeedControl(void);
void SpeedControlOutput(void);
//������ƺ���
void DirectionControl(void);//ƫ�����������
void DirectionSpeedControl(void);//ƫ��������
void DirectionSpeedOut(void);//���ٿ������
//������ܿ���
void Motor_Control(void);
void Motor_Stop(void);
void Motor_TurnBack(void);
#endif