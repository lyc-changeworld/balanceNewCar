#ifndef  _INIT_H_
#define  _INIT_H_
#include "common.h"
#include "VisualScope.h"
#include "speed.h"

//��������
void uart_init(void);
void adc_init(void);
//����ģ���ʼ��
void GPIO_DMA_Init(void);
//void DMA_PIT_isr(void);
//�ܶ�ʱ��
void pit_init(void);
extern void pit0_isr(void);
void RunTime_isr(void);
#endif