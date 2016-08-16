#ifndef _ISR_H
#define _ISR_H
#include "common.h"
void pit0_isr(void);
extern int speed_time,direct_time;
extern float SpeedError1,speedout1;
extern float L_PowerValue,R_PowerValue;
extern uint16 Send_Data[4]; 
extern float angle,accl_angle_Y,SA,gyro_speed_y,gyro_speed_x;//  gyro_speed_x
extern float speed_L,speed_R,speed_avg;
extern float offset,second_offset;
extern float AD_result[3];

#endif