#ifndef _SPEEDCHECK_H_
#define _SPEEDCHECK_H_
#include "common.h"

#define DMA_MAX_NUM (32767)//DMA�������ֵ
/****************�ٶȲ���**************/
void GetMotorPulse();
void DMA_Init(void);
void DMA1_isr(void);
void DMA2_isr(void);
float speedPlus(float aa[],int number);
#endif