/*
���ܣ�k60ƽ̨��LPLD����ƣ�4*4������̳���
*/
#ifndef _KEY_H_ 
#define _KEY_H_

#define key1 PTB18_I
#define key2 PTB19_I
#define key3 PTB20_I
#define key4 PTB21_I
#define key5 PTB22_I
#define key6 PTB23_I

int keyScan(void);//����ɨ�����
void init_gpio_key();//���̿ڳ�ʼ��
void  Key_Handle();//�����л�

#endif