#include "common.h"
#include "key.h"

GPIO_InitTypeDef gpio_init_struct_key;//结构体定义

/*按键处理函数*/
void  Key_Handle()
{
  
  
  
}


/*键盘扫描程序*/
int keyScan(void)
{
  if(!key6|| !key1 || !key2 || !key3 || !key4 || !key5)
  {
    LPLD_LPTMR_DelayMs(10);
    if(!key6|| !key1 || !key2 || !key3 || !key4 || !key5)
    {
      if(!key1)
      {
        while(!key1);
        return 1;
      }
      else if(!key2)
      {
        while(!key2);
        return 2;
      }
      else if(!key3)
      {
        while(!key3);
        return 3;
      }
      else if(!key4)
      {
        while(!key4);
        return 4;
      }
      else if(!key5)
      {
        while(!key5);
        return 5;
      }
      else if(!key6)
      {
        while(!key6);
        return 6;
      }
      else
        return 7;
    }
    else
      return 7;
  }
  else
    return 7;
} 
/*键盘口初始化*/
void init_gpio_key()
{
  gpio_init_struct_key.GPIO_PTx = PTB;
  gpio_init_struct_key.GPIO_Pins = GPIO_Pin18|GPIO_Pin19|GPIO_Pin20|GPIO_Pin21|GPIO_Pin22|GPIO_Pin23;
  gpio_init_struct_key.GPIO_Dir = DIR_OUTPUT;
  gpio_init_struct_key.GPIO_Output = OUTPUT_H;
  gpio_init_struct_key.GPIO_PinControl = IRQC_DIS;
  LPLD_GPIO_Init(gpio_init_struct_key);
}