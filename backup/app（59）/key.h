/*
功能；k60平台，LPLD库控制，4*4矩阵键盘程序
*/
#ifndef _KEY_H_ 
#define _KEY_H_

#define key1 PTB18_I
#define key2 PTB19_I
#define key3 PTB20_I
#define key4 PTB21_I
#define key5 PTB22_I
#define key6 PTB23_I

int keyScan(void);//键盘扫描程序
void init_gpio_key();//键盘口初始化
void  Key_Handle();//界面切换

#endif