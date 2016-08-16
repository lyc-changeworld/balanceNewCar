#include "speed.h"
#include "math.h"
#include "Fuzzy.h"
#define SPEED_VALUE           0.1105                                //速度换算系数 0.1105

//#define SPEED_TIME   50  //50MS       5ms更新一个数据，取历史45ms中的9个数据平均值来计算速度量
#define DIRECT_TIME  10  //10MS
#define SA_START 13
int speed_time=0;
int direct_time=0;
/******************方向控制变量定义*******************/
float DirectSpeed=0,New_dir_err=0,Last_dir_err=0,D_dir_err=0;//控制定义
float gyro_D=150;
//目标速度量
float speedout1=0,speedout2=0;
//单电机差速控制变量
float SpeedAlone_P1=SpeedAP_Left,SpeedAlone_P2=SpeedAP_Right;
float SpeedAlone_D1=SpeedAD_Left,SpeedAlone_D2=SpeedAD_Right;
float SpeedAlone_I1=SpeedAI_Left,SpeedAlone_I2=SpeedAI_Right;
//差速控制量
float speed_control_old1=0,speed_control_new1=0,speed_control_old2=0,speed_control_new2=0;  //速度控制量
float speed_integral1=0,speed_integral2=0;                                                  //速度控制积分
float Speederror11=0,Speederror12=0,SpeedError1=0;
float Speederror21=0,Speederror22=0,SpeedError2=0;
float DirectSpeedControlOut1=0,DirectSpeedControlOut2=0;
/*********速度控制变量定义********/
float SA=0;
float SA_his[15] = {SA_START, SA_START, SA_START, SA_START, SA_START,
SA_START, SA_START, SA_START, SA_START, SA_START,
SA_START, SA_START, SA_START, SA_START, SA_START};
//float SA_var[10] = {0.35, 0.25, 0.17, 0.12, 0.1};
uint8 speedgo_flag=0;//车子开环、闭环标志
//速度系数量    P-350  I- 0.5          
float Speed_Set=0,speed_P=0,speed_I=0,speed_D=0,SpeedControl_Integral=0;
float quit_I=0;//用来计数，防止撞车时暴走
float Angle_Zero=MMA8451_Y;
//速度控制变量   
float Speed=0,Speed_Old=0,Speed_New=0,SpeedError,Speederror1,Speederror2;//速度控制中间量
float SpeedControlOut_L=0, SpeedControlOut_R=0;//速度控制输出量
/*********角度控制系数量**********/           
float angle_P=1500,angle_D=5/16.0;//2000 10  5/16.0
float AngleControlOut=0;//角度控制输出变量
/****总控制变量****/
float L_PowerValue=0;//左电机总控输出量
float R_PowerValue=0;//右电机总控输出量  
float avg_Power = 0;
float D_err = 0;
/******标志位量*******/
//int FB_Flag =0;//标志电机的当前转况

//--------------外部变量使用------------//
extern float angle,gyro_speed_y,gyro_speed_x,gyro_speed_x,speed_L,speed_R,speed_avg;
extern float offset,speed_L_real,speed_R_real,speed_avg_real;
extern uint32 direct_start,time_flag;
extern float first_offset[2];
extern float AD_result[5];
extern float his_offset[5];
extern int RUN_TIME;
FuzzyStruct Direct_P = { //模糊方向P
  Fuzzy_Rank7,
  0,
  0,
  { -70, -30, -15, 0, 15, 30, 70 }, //{ -70, -30, -15, 0, 15, 30, 70 },
  { -10, -8, -5,  0,  5, 8, 10 },// { -10, -8, -5,  0,  5, 8, 10 },
  //  {  10, 11, 11, 12, 12,13, 13  },
  //  {  600, 610, 610, 615, 620,630, 635  },
  {  350, 360, 365, 375, 380,385, 390  },
  //  {  750, 760, 880, 945, 1000,1050, 1100  },
  {
    { 6, 6, 6, 5, 5, 5, 5, },   //   -3   
    { 5, 4, 4, 3, 2, 2, 1, },   //   -2 
    { 4, 3, 2, 1, 0, 1, 2, },   //   -1 
    { 4, 3, 1, 0, 1, 3, 4, },   //    0 
    { 2, 1, 0, 1, 2, 3, 4, },   //    1 
    { 1, 2, 2, 3, 4, 4, 5, },   //    2 
    { 5, 5, 5, 5, 6, 6, 6, },   //    3
  }
};


//-------------角度控制函数---------//
extern int straightTime;
extern  int runTime;
//float useAngle = 0;
//float useAngleHis[15] = {0};
void angle_control() //5ms
{ 
  float nP=0,nD=0,nSpeed=0;
  
  nP=-angle_P*(angle-Angle_Zero+5+SA);//angle-MMA8451_Y+4   +3
  nD = -angle_D*(gyro_speed_y);
  nSpeed = nP + nD;
  AngleControlOut = nSpeed;
}

//--------------------速度控制---------------------// 
//速度PID控制函数
void speed_control(void) //50ms
{
  float fP=0,fI=0,fD=0;//PID量
  float speed=0,speedout=0;//速度差距量
  
  speed=(speed_L+speed_R)/2;//车轮的平均速度脉冲
  if(direct_start==1)//开跑
  {
    Angle_Zero=MMA8451_Y;
    if(Speed_Set==0) Speed_Set=Speed_MAX;
    if(straightTime > 20 )
    {
      Speed_Set = Speed_MAX;
    }else{
      Speed_Set = Speed_MAX+10;
    }
    
    speedout=Speed_Set-speed;//当前误差量
    /*if(speedgo_flag==0)//车子加速 开环
    {
    if(fabs(Speed_MAX-speed)<15&&direct_start)//车子速度达到一定值 
    speedgo_flag=1;//跳到闭环
  }
    else//闭环
    {*/
    speed_P=SpeedP;
    speed_I=SpeedI;
    speed_D=SpeedD;
    //}
  }
  else //延时：等待发车
  {
    speedout=Speed_Set-Speed;
    Speed_Set=0;
    speed_P=0;
    speed_I=0;
    speed_D=0;
  }
  //----------------------速度PID运算--------------------------//
  Speederror2=Speederror1;
  Speederror1=speedout;      
  SpeedError=Speederror1-Speederror2;     //当前值与过去值的差
  
  fP=speed_P*speedout;                    //比例量
  fI=speed_I*speedout;
  fD=speed_D*SpeedError;                  //微分量
  SpeedControl_Integral+=fI;              //积分量
  //给积分量限幅
  if(SpeedControl_Integral>SpeedIntegral_MAX)      SpeedControl_Integral=SpeedIntegral_MAX;
  else if(SpeedControl_Integral<-SpeedIntegral_MAX) SpeedControl_Integral=-SpeedIntegral_MAX;
  
  Speed_Old=Speed_New;
  Speed_New=fP+fD+SpeedControl_Integral;
}
void SpeedControlOutput(void)//5ms
{
  float nSpeedOut;
  int i = 0;
  for(i=14;i>0;i--)
  {
    SA_his[i] = SA_his[i-1];
  }
  nSpeedOut=Speed_New-Speed_Old;
  nSpeedOut=nSpeedOut+Speed_Old;//速度量分成10份平缓输出 /SPEED_TIME*speed_time
  SA=nSpeedOut/SA_Exchange;
  
  SA = SA * 0.1
  + SA_his[1] * 0.1
  + SA_his[2] * 0.09
  + SA_his[3] * 0.09  //0.38
  + SA_his[4] * 0.08  
  + SA_his[5] * 0.08
  + SA_his[6] * 0.07 
  + SA_his[7] * 0.07  //+0.3
  + SA_his[8] * 0.06 
  + SA_his[9] * 0.06
  + SA_his[10] * 0.05
  + SA_his[11] * 0.05//0.22
  + SA_his[12] * 0.04 
  + SA_his[13] * 0.03
  + SA_his[14] * 0.03;//0.08
  
  SA_his[0] = SA;
  
  
  if(SA>Angle_Max) SA=Angle_Max;
  else if(SA<-Angle_Max) SA=-Angle_Max;
  
  /*if(direct_start&&speedgo_flag==0)
  {
  SA=SA_START;
}*/
  /******速度积分控制方案*******/
  /*if(nSpeedOut>Speed_Power_Max)         nSpeedOut=Speed_Power_Max;
  else if(nSpeedOut<Speed_Power_Max)   nSpeedOut=-Speed_Power_Max;
  SpeedControlOut_L=nSpeedOut;
  SpeedControlOut_R=nSpeedOut;*/
}
/***********************方向控制函数*****************************/
/***********差速量计算***********/
extern float speed_avg;
void DirectionSpeedControl(void)//10ms
{
  float fP1=0,fP2=0,fD1=0,fD2=0;
  float avg_Speed = 0;
  New_dir_err=offset;
  D_dir_err=New_dir_err-Last_dir_err;
  D_err = New_dir_err - his_offset[4];
  
  if(D_err*100 - 10 > 0)
    D_err = 0.1;
  else if(D_err*100 + 10 < 0)
    D_err = -0.1;

  
  if(direct_start==1)//开跑
  {
  //  SpeedAlone_P1 = Fuzzy_Update(&Direct_P,New_dir_err*100,D_err*100);
    SpeedAlone_P1=850;
    SpeedAlone_P2 = SpeedAlone_P1;
   //  SpeedAlone_D1=0;
    SpeedAlone_D1 = SpeedAlone_P1+3500;
    //SpeedAlone_D1 = Fuzzy_Update(&Direct_D,New_dir_err*100,D_err*100);
    SpeedAlone_D2 = SpeedAlone_D1;
  }
  else//起跑前等待 屏蔽方向控制
  {
    SpeedAlone_P1=SpeedAlone_P2=0;
    SpeedAlone_D1=SpeedAlone_D2=0;
  }
  
  Last_dir_err=New_dir_err;
  
  
  avg_Speed=speed_avg/13;
  if(avg_Speed - 1 < 0)
    avg_Speed = 1;
  else if(avg_Speed - 20 > 0)
    avg_Speed = 20;
  
  speedout1= avg_Speed*offset;//左右轮预期速度值 按当前速度值计算出
  Speederror12=Speederror11;
  Speederror11=speedout1;
  

  SpeedError1=Speederror11-Speederror12;
  fP1=speedout1*SpeedAlone_P1;  //比例运算 

  if(SpeedError1 - 1 > 0)
    SpeedError1 = 1;
  else if(SpeedError1 + 1 < 0)
    SpeedError1 = -1;

  fD1=SpeedError1*SpeedAlone_D1; //微分运算
  speed_control_new1 = fP1+fD1;
  speed_control_new2 = -speed_control_new1;
}
//差速度输出量
void DirectionSpeedOut(void)//5ms
{
  DirectSpeedControlOut1 = speed_control_new1;
  DirectSpeedControlOut2 = speed_control_new2;
  /*方向控制输出量限幅*/
  if(DirectSpeedControlOut1 < -Direct_POWER) 
    DirectSpeedControlOut1= -Direct_POWER;
  else if(DirectSpeedControlOut1 > Direct_POWER)     
    DirectSpeedControlOut1= Direct_POWER;
  
  if(DirectSpeedControlOut2 < -Direct_POWER) 
    DirectSpeedControlOut2= -Direct_POWER;
  else if(DirectSpeedControlOut2> Direct_POWER)     
    DirectSpeedControlOut2= Direct_POWER;
}
//---------------------角度+速度+方向总控制函数----------------------------------//
//总控制函数
void Motor_Control(void)
{
  static float f_gyro_D;
  if(gyro_speed_x+25<0)
    gyro_speed_x = -25;
  else if(gyro_speed_x - 25 > 0)
    gyro_speed_x = 25;
  f_gyro_D=gyro_speed_x*gyro_D;//陀螺仪限制打角过冲
  L_PowerValue =AngleControlOut+DirectSpeedControlOut1+f_gyro_D;//-DirectSpeedControlOut2-SpeedControlOut_L
  R_PowerValue =AngleControlOut+DirectSpeedControlOut2-f_gyro_D;//-DirectSpeedControlOut1-SpeedControlOut_R
  
  //电机死区量补偿
//  if(L_PowerValue>0)    L_PowerValue+=LeftMotor_Dead;
//  else if(L_PowerValue<0)   L_PowerValue-=LeftMotor_Dead;
//  if(R_PowerValue>0)    R_PowerValue+=RightMotor_Dead;
//  else if(R_PowerValue<0)   R_PowerValue-=RightMotor_Dead;
  
  //左电机限幅
  if(L_PowerValue< -ADJUST_POWER)   L_PowerValue= -ADJUST_POWER;
  if(L_PowerValue> ADJUST_POWER)    L_PowerValue= ADJUST_POWER;
  //右电机限幅               
  if(R_PowerValue< -ADJUST_POWER)   R_PowerValue= -ADJUST_POWER;
  if(R_PowerValue> ADJUST_POWER)    R_PowerValue= ADJUST_POWER;
  //左电机输出 
  if(L_PowerValue>0)//正转
  {  
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,(int)L_PowerValue);       
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);  
    //FB_Flag = 8;
  }
  else if(L_PowerValue<0)//反转
  { 
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,-(int)L_PowerValue);
    //FB_Flag = 16;
  } 
  else//不转
  {
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
    //FB_Flag = 32;
  }
  //右电机输出 
  if(R_PowerValue>0)//正转
  {  
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);       
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,(int)R_PowerValue); 
    //FB_Flag = 8;
  }
  else if(R_PowerValue<0)//反转
  {   
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,-(int)R_PowerValue);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
    //FB_Flag = 16;
  } 
  else//不转
  {
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
    //FB_Flag = 32;
  }
}

void Motor_Stop(void)
{
  //Left
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
  
  //Right
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
}