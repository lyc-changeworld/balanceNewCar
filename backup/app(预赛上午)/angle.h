#ifndef __ANGLE_H__
#define __ANGLE_H__

#include "common.h"
#include "DEV_MMA8451.h"
#include "math.h"

#define PAI 3.141593
#define gyro_value_y  9.3  //0.56��12λ��ʱ����  8.96��8λ�������ǽ��ٶȻ���ϵ��
#define gyro_value_x  1.0/4// ��Ť��Ϊ������Ť��Ϊ�� 
#define gyro_time   0.005     //�����ǲ���ʱ��5ms
#define a_time      0.0005    //���ٶȼƲ���ʱ��0.5ms
#define MMA8451_Y   0//Y����ٶȼ�-ƽ��ʱ�Ƕ�ƫ��  
//#define GRAVITY_ADJUST_TIME_CONSTANT 0.18//ȡ0.35ʱЧ���Ϻã������ǻ��ǻ�Ư�ƣ����Ư1�ȣ����ã�

//--------------------��������----------------//
/*�ǶȻ�ú���*/
void get_0(void);
void get_gyro(void); 
void get_accl(void);
void ronghe_angle(void);
/*�˲�����*/
//void QingHua_AngleCalaulate();//�廪�Ƕ��˲�����
float lvbo(float aa[]);//�����˲�����
void one_complementation(float gyro_y,float accl_y);//һ�׻����˲�
#endif