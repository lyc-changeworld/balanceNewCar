#include "common.h"
#include "direct.h"
#include "init.h"
#define My_Speed_Max 230
#define My_Speed_Min 140

void DIP_Switch(void);
void show_info(void);

extern uint32 oled_flag,speed_flag,direct_flag;
extern float speed_avg,DirectSpeed,SA;
extern float AD_result[5];
extern float offset,backup_offset;
extern uint8 speedgo_flag;
extern uint32 oled_flag;
extern float SpeedAlone_P1,SpeedAlone_P1;
extern float SpeedAlone_D1,SpeedAlone_D1;
extern float Speed_Set;
extern float first_offset[3];
extern float angle;

extern int gyro_xMax;
extern float speed_L,speed_R;
extern float AD1Basic;
extern float nowADBase;

/*重要的变量定义*/
uint32 DIP_Ago_Value=0;
uint32 DIP_Switch_Value=My_Speed_Min;
uint32 My_Start_Go=0;//主程序开始执行的标志
uint32 Init_Only_Once=0;//只初始化一次的标志
uint32 My_Speed_Set=0;//设定的基本速度

//主函数
extern int runTime;
extern uint8 stopFlag;
uint8 stopCarSetFlag = 1;
uint8 dChange = 19;
int keyState = 7;
int speedChangeTime = 1200;
uint8 speedChangeFlag = 1;
void main (void)
{
  
  init_gpio_Dip_Switch();//拨码开关初始化
  init_gpio_key();//按键初始化 
  init_gpio_StopCar();
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
  //AD1Basic = 60;
  while((keyState=keyScan())!=6)
  {
    switch(keyState)
    {
    case 1:
      AD1Basic += 5;
      break;
    case 2:
      AD1Basic -= 2;
      break;
    case 3:
      if(dChange < 35 ) dChange++; 
      break;
    case 4:
      //if(dChange > 10 ) dChange--; 
      if(speedChangeFlag == 1) speedChangeFlag = 0;
      else speedChangeFlag = 1;
      break;
    case 5:{
      if(stopCarSetFlag == 1) stopCarSetFlag = 0;
      else stopCarSetFlag = 1;
    }
    break;
    default:break;
    }
    DIP_Switch();
    get_ad();//电感采样
    cal_offset();
    GetMotorPulse();
    show_info();
  }
  LPLD_LPTMR_DelayMs(1000);
  pit_init();                  //总定时器初始化
  for(;;)
  {
    get_ad();//电感采样
    cal_offset();
    if(stopCarSetFlag==1 && !PTE26_I && runTime > 1000) 
    {
      stopFlag=1;
      //Motor_Stop();
      //DisableInterrupts;
    }
  }
}
//界面显示模块

void show_info(void)
{
  LCD_P6x8Str(1,0,"sp"); 
  LCD_P6x8Str(1,1,"ADBasic:");
  LCD_P6x8Str(1,2,"M:");
  LCD_P6x8Str(1,3,"L_R:");
  Show_Number(20,0,(int)speed_L);//显示平均速度
  Show_Number(55,0,(int)speed_R);
  //Show_Number(90,0,(int)(SA*100));
  if(stopCarSetFlag == 1)
  {
    LCD_P6x8Str(90,0,"YES");
  }else{
    LCD_P6x8Str(90,0,"NO ");
  }
  
  /*if(speedChangeFlag == 1)
  {
    LCD_P6x8Str(90,7,"1");
  }else{
    LCD_P6x8Str(90,7,"0");
  }*/
  LCD_P6x8Str(1,0,"sp"); 
  LCD_P6x8Str(1,1,"ADBasic:");
  LCD_P6x8Str(1,2,"M:");
  LCD_P6x8Str(1,3,"L_R:");
  Show_Number(20,0,(int)speed_L);//显示平均速度
  Show_Number(55,0,(int)speed_R);
  //Show_Number(90,0,(int)(SA*100));
  if(stopCarSetFlag == 1)
  {
    LCD_P6x8Str(90,0,"YES");
  }else{
    LCD_P6x8Str(90,0,"NO ");
  }
  
//  if(directChoose == 1)
//  {
//    LCD_P6x8Str(90,7,"1");
//  }else{
//    LCD_P6x8Str(90,7,"0");
//  }
  Show_Number(55,1,(int)AD1Basic);
  Show_Number(90,1,(int)nowADBase);
  Show_Number(55,2,(int)AD_result[1]);
  
  Show_Number(27,3,(int)AD_result[0]);
  Show_Number(90,3,(int)AD_result[2]);

  
  LCD_P6x8Str(1,4,"spSet:");
  //Show_Number(55,4,(int)(Speed_Set));
  Show_Number(55,4,(int)(My_Speed_Set));
  LCD_P6x8Str(1,5,"spDp:");
  Show_Number(55,5,(int)(SpeedAlone_P1));
  //Show_Number(90,5,(int)(SpeedAlone_D1));
  Show_Number(90,5,(int)(400*dChange));
  LCD_P6x8Str(1,6,"offset:");
  Show_Number(55,6,(int)(offset*100));
  Show_Number(90,6,(int)(first_offset[1]*100));
  LCD_P6x8Str(1,7,"angle:");
  Show_Number(55,7,(int)(angle));
}

//开机时显示
void DIP_Switch()
{
  DIP_Switch_Value=Dip_Switch();//获取状态
  //判断，设置速度值
  switch(DIP_Switch_Value)
  {
  case 0:My_Speed_Set=My_Speed_Min;break;//120
  case 1:My_Speed_Set=My_Speed_Min+10;break;//130
  case 2:My_Speed_Set=My_Speed_Min+20;break;//140
  case 3:My_Speed_Set=My_Speed_Min+30;break;//150
  case 4:My_Speed_Set=My_Speed_Min+40;break;//160
  case 5:My_Speed_Set=My_Speed_Min+50;break;//170
  case 6:My_Speed_Set=My_Speed_Min+60;break;//180
  case 7:My_Speed_Set=My_Speed_Min+70;break;//180
  case 8:My_Speed_Set=My_Speed_Min+80;break;//180
  case 9:My_Speed_Set=My_Speed_Min+90;break;//180
  case 10:My_Speed_Set=My_Speed_Min+100;break;//180
  default:My_Speed_Set=My_Speed_Max;break;
  }
  //限制速度
  if(My_Speed_Set>My_Speed_Max)
  {
    My_Speed_Set=My_Speed_Max;//180
  }
//  if(My_Speed_Set!=DIP_Ago_Value)
//  {
//    LCD_CLS();//清屏
//    LCD_P8x16Str(0,2,"MySpeed:");
//    Show_Number(64,3,My_Speed_Set);
//  }
//  DIP_Ago_Value=My_Speed_Set;//更新历史值
}