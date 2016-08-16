#ifndef _OLED_H
#define _OLED_H
#include "common.h"

#define byte uint8
#define word uint16
#define GPIO_PIN_MASK      0x1Fu    //0x1f=31,限制位数为0--31有效
#define GPIO_PIN(x)        (((1)<<(x & GPIO_PIN_MASK)))  //把当前位置1

#define X_WIDTH 128
#define Y_WIDTH 64

#define XLevelL		0x00
#define XLevelH		0x10
#define XLevel		((XLevelH&0x0F)*16+XLevelL)
#define Max_Column	128
#define Max_Row		  64
#define	Brightness	0xCF 



//extern uint8 shuju[10];
void Num2Str(uint8 *str,int32 number);//数字转字符显示
void init_gpio_oled();//OLED显示屏引脚初始化
void LCD_Init(void);//OLED显示屏触发启动

void LCD_P6x8char(byte x,byte y,byte ch);
void LCD_P6x8Str(byte x,byte y,byte ch[]); //打印6x8字符串
void LCD_P6x8s(byte x,byte y,int32 number);//打印数字
void LCD_P8x16s(byte x,byte y,int32 number);
void LCD_P8x16Str(byte x,byte y,byte ch[]);//打印8x16字符串
void LCD_Print(byte x, byte y, byte ch[]); //输出汉字和字符混合字符串

void LCD_PutPixel(byte x,byte y);
void LCD_Rectangle(byte x1,byte y1,byte x2,byte y2,byte gif);
void Draw_BMP(byte x0,byte y0,byte x1,byte y1,byte bmp[]); 
void LCD_Fill(byte dat);
void LCD_CLS(void);
void LCD_WrCmd(byte cmd);
void LCD_Set_Pos(byte x, byte y);
void LCD_DLY_ms(word ms);
void Show_Number(uint8 X,uint8 Y,int32 number);
#endif

