#ifndef  _INIT_H_
#define  _INIT_H_
#include "common.h"
#include "VisualScope.h"
#include "speed.h"

//函数定义
void uart_init(void);
void adc_init(void);
//测速模块初始化
void GPIO_DMA_Init(void);
//void DMA_PIT_isr(void);
//总定时器
void pit_init(void);
extern void pit0_isr(void);
void RunTime_isr(void);
#endif