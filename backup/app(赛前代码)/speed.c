#include "speed.h"
#include "math.h"
#include "Fuzzy.h"
#define SPEED_VALUE           0.1105                                //�ٶȻ���ϵ�� 0.1105

//#define SPEED_TIME   50  //50MS       5ms����һ�����ݣ�ȡ��ʷ45ms�е�9������ƽ��ֵ�������ٶ���
#define DIRECT_TIME  10  //10MS
#define SA_START 13
int speed_time=0;
int direct_time=0;
/******************������Ʊ�������*******************/
float DirectSpeed=0,New_dir_err=0,Last_dir_err=0,D_dir_err=0;//���ƶ���
float gyro_D=150;
//Ŀ���ٶ���
float speedout1=0,speedout2=0;
//��������ٿ��Ʊ���
float SpeedAlone_P1=300,SpeedAlone_P2=300;
float SpeedAlone_D1=2500,SpeedAlone_D2=2500;
float SpeedAlone_I1=0,SpeedAlone_I2=0;
//���ٿ�����
float speed_control_old1=0,speed_control_new1=0,speed_control_old2=0,speed_control_new2=0;  //�ٶȿ�����
float speed_integral1=0,speed_integral2=0;                                                  //�ٶȿ��ƻ���
float Speederror11=0,Speederror12=0,SpeedError1=0;
float Speederror21=0,Speederror22=0,SpeedError2=0;
float DirectSpeedControlOut1=0,DirectSpeedControlOut2=0;
/*********�ٶȿ��Ʊ�������********/
float SA=0;
float SA_his[15] = {SA_START, SA_START, SA_START, SA_START, SA_START,
SA_START, SA_START, SA_START, SA_START, SA_START,
SA_START, SA_START, SA_START, SA_START, SA_START};
//float SA_var[10] = {0.35, 0.25, 0.17, 0.12, 0.1};
uint8 speedgo_flag=0;//���ӿ������ջ���־
//�ٶ�ϵ����    P-350  I- 0.5          
float Speed_Set=0,speed_P=0,speed_I=0,speed_D=0,SpeedControl_Integral=0;
float quit_I=0;//������������ֹײ��ʱ����
float Angle_Zero=MMA8451_Y;
//�ٶȿ��Ʊ���   
float Speed=0,Speed_Old=0,Speed_New=0,SpeedError,Speederror1,Speederror2;//�ٶȿ����м���
float SpeedControlOut_L=0, SpeedControlOut_R=0;//�ٶȿ��������
/*********�Ƕȿ���ϵ����**********/           
float angle_P=1500,angle_D=10/16.0;//2000 10  5/16.0
float AngleControlOut=0;//�Ƕȿ����������
/****�ܿ��Ʊ���****/
float L_PowerValue=0;//�����ܿ������
float R_PowerValue=0;//�ҵ���ܿ������  
float avg_Power = 0;
float D_err = 0;
/******��־λ��*******/
//int FB_Flag =0;//��־����ĵ�ǰת��

//--------------�ⲿ����ʹ��------------//
extern float angle,gyro_speed_y,gyro_speed_x,gyro_speed_x,speed_L,speed_R,speed_avg;
extern float offset,speed_L_real,speed_R_real,speed_avg_real;
extern uint32 direct_start,time_flag;
extern float first_offset[2];
extern float AD_result[5];
extern float his_offset[5];
extern int RUN_TIME;
extern int curveTime;
FuzzyStruct Direct_P = { //ģ������P
  Fuzzy_Rank7,
  0,
  0,
  { -60, -40, -20, 0, 20, 40, 60 }, //{ -70, -30, -15, 0, 15, 30, 70 },
  { -10, -8, -5,  0,  5, 8, 10 },// { -10, -8, -5,  0,  5, 8, 10 },
  //  {  10, 11, 11, 12, 12,13, 13  },
  //  {  850, 880, 930, 955, 960,970, 985  },
  {  250, 280, 310, 340, 370,400, 430  },
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


//-------------�Ƕȿ��ƺ���---------//
extern int straightTime;
extern  int runTime;
//float useAngle = 0;
//float useAngleHis[15] = {0};
void angle_control(void) //5ms
{ 
  float nP=0,nD=0,nSpeed=0;
  
  if(runTime > 300)
  {
    nP=-angle_P*(angle-Angle_Zero+SA);//angle-MMA8451_Y+4   +3
  }else if(runTime > 200)
  {
    nP=-angle_P*(angle-Angle_Zero+16-(runTime-200)/25.0);
  }else if(runTime > 100)
  {
    nP=-angle_P*(angle-Angle_Zero+16);
  }else if(runTime > 80)
  {
    nP=-angle_P*(angle-Angle_Zero+(runTime-80));
  }else if(runTime >40)
  {
    nP=-angle_P*(angle-Angle_Zero);
  }else
  {
    nP=-angle_P*(angle-(13-runTime/3.0));
  }
  
  
//  if(runTime < 80)
//  {
//    if(runTime < 40)
//    {
//      nP=-angle_P*(angle-(13-runTime/4.0));
//    }else
//    {
//      nP=-angle_P*(angle-Angle_Zero);
//    }
//    
//  }else if(runTime < 300)
//  {
//    if(runTime < 100)
//    {
//      nP=-angle_P*(angle-Angle_Zero+runTime-80);
//    }else
//    {
//      nP=-angle_P*(angle-Angle_Zero+20);
//    }
//    
//  }
//  else{
//    if(runTime < 400)
//    {
//      nP=-angle_P*(angle-Angle_Zero+20-(runTime-300)/15.0);
//    }else
//    {
//      nP=-angle_P*(angle-Angle_Zero+5+SA);//angle-MMA8451_Y+4   +3
//    }
//    
//  }
//  
  nD = -angle_D*(gyro_speed_y);
  nSpeed = nP + nD;
  AngleControlOut = nSpeed;
}

//--------------------�ٶȿ���---------------------// 
//�ٶ�PID���ƺ���
extern uint8 dChange;
extern uint32 My_Speed_Set;
void speed_control(void) //50ms
{
  float fP=0,fI=0,fD=0;//PID��
  float speed=0,speedout=0;//�ٶȲ����
  
  speed=(speed_L+speed_R)/2;//���ֵ�ƽ���ٶ�����
//  if(direct_start==1)//����
//  {
    Angle_Zero=MMA8451_Y;
    if(My_Speed_Set>160)
  {
    if(straightTime>200)
    {
      Speed_Set = My_Speed_Set*0.75;
    }else if(straightTime>150)
    {
      Speed_Set = My_Speed_Set*0.82;
    }else if(straightTime>100)
    {
      Speed_Set = My_Speed_Set*0.87;
    }else if(straightTime>50)
    {
      Speed_Set = My_Speed_Set*0.93;
    }else
    {
      Speed_Set = My_Speed_Set;
    }
    
    if(Speed_Set<155)
    {
      Speed_Set = 150;
    }
  }else
  {
   // Speed_Set = My_Speed_Set;
    if(straightTime>10)
    {
      Speed_Set = My_Speed_Set;
    }else
    {
      if(My_Speed_Set>145)
      {
        Speed_Set = My_Speed_Set*1.1;
      } else if(My_Speed_Set>135)
      {
        Speed_Set = My_Speed_Set*1.1;
      } else if(My_Speed_Set>125)
      {
        Speed_Set = My_Speed_Set*1.15;
      } else {
        Speed_Set = My_Speed_Set*1.25;
      }
      
    }
    
  }
  
  if(straightTime>10 && speed_avg / My_Speed_Set < 0.8)
  {
    Speed_Set = My_Speed_Set;
  }
  //  Speed_Set=My_Speed_Set;
//    if(Speed_Set==0) Speed_Set=Speed_MAX;
//    if(straightTime > 20 )
//    {
//      Speed_Set = Speed_MAX;
//    }else{
//      Speed_Set = Speed_MAX+30;
//    }
    
    speedout=Speed_Set-speed;//��ǰ�����
    speed_P=SpeedP;
    speed_I=SpeedI;
    speed_D=SpeedD;
 // }
//  else //��ʱ���ȴ�����
//  {
//    speedout=Speed_Set-Speed;
//    Speed_Set=0;
//    speed_P=0;
//    speed_I=0;
//    speed_D=0;
//  }
  //----------------------�ٶ�PID����--------------------------//
  Speederror2=Speederror1;
  Speederror1=speedout;      
  SpeedError=Speederror1-Speederror2;     //��ǰֵ���ȥֵ�Ĳ�
  
  fP=speed_P*speedout;                    //������
  fI=speed_I*speedout;
  fD=speed_D*SpeedError;                  //΢����
  SpeedControl_Integral+=fI;              //������
  //���������޷�
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
  nSpeedOut=nSpeedOut+Speed_Old;//�ٶ����ֳ�10��ƽ����� /SPEED_TIME*speed_time
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
  

}
/***********************������ƺ���*****************************/
/***********����������***********/
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

  
  //  if(direct_start==1)//����
  //  {
  SpeedAlone_P1 = Fuzzy_Update(&Direct_P,New_dir_err*100,D_err*100)+100;
  //SpeedAlone_P1=1600;
  SpeedAlone_P2 = SpeedAlone_P1;
  
  //SpeedAlone_D1 = 2500;
  //SpeedAlone_D1 = Fuzzy_Update(&Direct_D,New_dir_err*100,D_err*100);
  if(runTime > 300)
  {
    //  SpeedAlone_D1 = SpeedAlone_P1*dChange;
    if(straightTime>10 )
    {
      SpeedAlone_D1 = SpeedAlone_P1*dChange;
    }else if(curveTime > 10)
    {
      SpeedAlone_D1 = SpeedAlone_P1 * (dChange);
    }
    
  }else{
    SpeedAlone_D1 = 5000;
  }
  
  if(SpeedAlone_D1>10000)
    SpeedAlone_D1 = 10000;
  
  SpeedAlone_D2 = SpeedAlone_D1;
  //  }
  //  else//����ǰ�ȴ� ���η������
  //  {
  //    SpeedAlone_P1=SpeedAlone_P2=0;
  //    SpeedAlone_D1=SpeedAlone_D2=0;
  //  }
  
  Last_dir_err=New_dir_err;
  
  
  avg_Speed=speed_avg/15;
  if(avg_Speed - 2 < 0)
    avg_Speed = 2;
  else if(avg_Speed - 12 > 0)
    avg_Speed = 12;
  
  speedout1= avg_Speed*offset;//������Ԥ���ٶ�ֵ ����ǰ�ٶ�ֵ�����
  Speederror12=Speederror11;
  Speederror11=10*offset;
  

  SpeedError1=Speederror11-Speederror12;
  fP1=speedout1*SpeedAlone_P1;  //�������� 

//  if(SpeedError1 - 0.5 > 0)
//    SpeedError1 = 0.5;
//  else if(SpeedError1 + 0.5 < 0)
//    SpeedError1 = -0.5;

  fD1=SpeedError1*SpeedAlone_D1; //΢������
  
   if(fD1 - 5000 > 0)
    fD1 = 5000;
  else if(fD1 + 5000 < 0)
    fD1 = -5000;
//  if(fabs(fD1)>fabs(fP1))
//  {
//     if(fD1 > 0)
//       fD1 = fabs(fP1);
//     else
//       fD1 = - fabs(fP1);
//  }
  speed_control_new1 = fP1+fD1;
  speed_control_new2 = -speed_control_new1;
}
//���ٶ������
void DirectionSpeedOut(void)//5ms
{
  DirectSpeedControlOut1 = speed_control_new1;
  DirectSpeedControlOut2 = speed_control_new2;
  /*�������������޷�*/
  if(DirectSpeedControlOut1 < -Direct_POWER) 
    DirectSpeedControlOut1= -Direct_POWER;
  else if(DirectSpeedControlOut1 > Direct_POWER)     
    DirectSpeedControlOut1= Direct_POWER;
  
  if(DirectSpeedControlOut2 < -Direct_POWER) 
    DirectSpeedControlOut2= -Direct_POWER;
  else if(DirectSpeedControlOut2> Direct_POWER)     
    DirectSpeedControlOut2= Direct_POWER;
}
//---------------------�Ƕ�+�ٶ�+�����ܿ��ƺ���----------------------------------//
//�ܿ��ƺ���
extern int curveTime;
void Motor_Control(void)
{
//  static float f_gyro_D;
//  if(gyro_speed_x+25<0)
//    gyro_speed_x = -25;
//  else if(gyro_speed_x - 25 > 0)
//    gyro_speed_x = 25;
//  
//  if(curveTime < 100)
//  {
//    gyro_D = 50 + curveTime;
//  }else{
//    gyro_D = 150;
//  }
//  f_gyro_D=gyro_speed_x*gyro_D;//���������ƴ�ǹ���
//  
//  if(fabs(f_gyro_D)>fabs(AngleControlOut+DirectSpeedControlOut1)*0.8)
//  {
//    if(f_gyro_D>0)
//      f_gyro_D = fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//    else
//      f_gyro_D = - fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//  }
  L_PowerValue =AngleControlOut+DirectSpeedControlOut1;//+f_gyro_D;//-DirectSpeedControlOut2-SpeedControlOut_L
  R_PowerValue =AngleControlOut+DirectSpeedControlOut2;//-f_gyro_D;//-DirectSpeedControlOut1-SpeedControlOut_R
  
  //�������������
//  if(L_PowerValue>0)    L_PowerValue+=LeftMotor_Dead;
//  else if(L_PowerValue<0)   L_PowerValue-=LeftMotor_Dead;
//  if(R_PowerValue>0)    R_PowerValue+=RightMotor_Dead;
//  else if(R_PowerValue<0)   R_PowerValue-=RightMotor_Dead;
  
  if(L_PowerValue-3000 > 0 && R_PowerValue < 0) R_PowerValue = 0;
  else if(R_PowerValue-3000 > 0 && L_PowerValue < 0) L_PowerValue = 0;
  //�����޷�
  if(L_PowerValue< -ADJUST_POWER)   L_PowerValue= -ADJUST_POWER;
  if(L_PowerValue> ADJUST_POWER)    L_PowerValue= ADJUST_POWER;
  //�ҵ���޷�               
  if(R_PowerValue< -ADJUST_POWER)   R_PowerValue= -ADJUST_POWER;
  if(R_PowerValue> ADJUST_POWER)    R_PowerValue= ADJUST_POWER;
  //������� 
  if(L_PowerValue>0)//��ת
  {  
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,(int)L_PowerValue);       
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);  
    //FB_Flag = 8;
  }
  else if(L_PowerValue<0)//��ת
  { 
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,-(int)L_PowerValue);
    //FB_Flag = 16;
  } 
  else//��ת
  {
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
    //FB_Flag = 32;
  }
  //�ҵ����� 
  if(R_PowerValue>0)//��ת
  {  
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);       
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,(int)R_PowerValue); 
    //FB_Flag = 8;
  }
  else if(R_PowerValue<0)//��ת
  {   
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,-(int)R_PowerValue);
    LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
    //FB_Flag = 16;
  } 
  else//��ת
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

void Motor_TurnBack(void)
{
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,5000);
  
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,5000);
  LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
}