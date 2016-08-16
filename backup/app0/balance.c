#include "common.h"
#include "direct.h"
#include "init.h"
extern uint32 oled_flag,speed_flag,direct_flag;
extern float speed_avg,DirectSpeed,SA;
extern float AD_result[5];
extern float offset,backup_offset;
extern uint8 speedgo_flag;
extern uint32 oled_flag;
extern float SpeedAlone_P1;
extern float Speed_Set;
extern float first_offset[3];
extern float angle;

void show_info(void);
//主函数
void main (void)
{
  init_gpio_beep();             //蜂鸣器的端口定义
  LPLD_LPTMR_DelayMs(2000);
  
  adc_init();                  //采样初始化
  LPLD_MMA8451_Init();         //陀螺仪I2C协议定义
  get_0();                     //陀螺仪的开机采样
  get_ad_once();
  init_gpio_oled();            //OLED的端口定义
  LCD_Init();                  //OLED初始化
  init_gpio_SpeedDirect();     //编码器方向端口定义
  pwm_init();                  //电机初始化
  DMA_Init();
  GPIO_DMA_Init();             //测速初始化
  
  uart_init();                 //串口初始化
  pit_init();                  //总定时器初始化
  //for(;;){;}
  while(1)
  {
    get_ad();//电感采样
    cal_offset();
  }
}
//界面显示模块
extern int gyro_xMax;
extern float speed_L,speed_R;
extern float AD1Basic;
extern float nowADBase;
void show_info(void)
{
  LCD_P6x8Str(1,0,"sp"); 
  LCD_P6x8Str(1,1,"ADBasic:");
  LCD_P6x8Str(1,2,"M:");
  LCD_P6x8Str(1,3,"L_R:");
  Show_Number(20,0,(int)speed_L);//显示平均速度
  Show_Number(55,0,(int)speed_R);
  Show_Number(90,0,(int)(SA*100));
  Show_Number(55,1,(int)AD1Basic);
  Show_Number(90,1,(int)nowADBase);
  Show_Number(55,2,(int)AD_result[1]);
  
  Show_Number(27,3,(int)AD_result[0]);
  Show_Number(90,3,(int)AD_result[2]);

  
  LCD_P6x8Str(1,4,"spSet:");
  Show_Number(55,4,(int)(Speed_Set));
  LCD_P6x8Str(1,5,"spDp:");
  Show_Number(55,5,(int)(SpeedAlone_P1));
  LCD_P6x8Str(1,6,"offset:");
  Show_Number(55,6,(int)(offset*100));
  Show_Number(90,6,(int)(first_offset[1]*100));
  LCD_P6x8Str(1,7,"angle:");
  Show_Number(55,7,(int)(angle));
  
  
}