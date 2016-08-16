#include "isr.h"
#include "init.h"
#include "speed.h"
int runTime = 0;
int gyro_xMax = 0;
int goDieFlag = 0;
int straightTime = 0;
uint32 Count=0;//5ms��ʱ������
uint32 start_flag=0,direct_start=0,oled_flag=0,direct_flag=0,SpeedCatch_flag=0;
void SendData(void);
void pit0_isr(void) 
{  
  runTime++;
  
  
  if(start_flag<100) start_flag++;
  else {direct_start=1;} 
  direct_flag++;                                     //���ټ����־
  SpeedCatch_flag++;                                 //
  oled_flag++;                                       //oled��ʾ��־
  GetMotorPulse();                                   //������ǰ���ٶ���,�������ٶ�pid����õ������
  speed_control();                                   //�ٶȵ�������� 5ms
  for(int i=0;i<10;i++){
    get_accl();                                      //���ٶ�����ֵ���� 
  }
  get_gyro();                                        //������AD��������ٶ�
  ronghe_angle();                                    //�����˲��õ���Ư��ĽǶ�
  if(direct_flag==2){
    direct_flag=0;
    DirectionSpeedControl();                         //���ٵ�������� 
  }
                                                     //50ms
  if(SpeedCatch_flag==10){                           
    SpeedCatch_flag=0;
    speed_control();                                 //�ٶȵ��������
  }
  
  SpeedControlOutput();                             //�ٶȽǶ���ƽ�����   50ms/10
  DirectionSpeedOut();                              //���ٵ����ƽ�����   10ms/2
  
  angle_control(); 
  
                                   //ֱ����������
//  Motor_Control(); 
  if(goDieFlag<80){Motor_Control();}
  else{Motor_Stop();  //   DisableInterrupts;
  } 

  if(oled_flag==20){oled_flag=0;show_info();}
  if(AD_result[0]+AD_result[2]<30)
  {
    if(goDieFlag<1000)
    {
      goDieFlag++;
    }else{
      goDieFlag=1000;
    }
  }else{goDieFlag = 0;}

  
  if(fabs(offset) < 0.5)
  {
    if(straightTime < 1000)
    {
      straightTime ++;
    }else{
      straightTime = 1000;
    }
  }else{
    straightTime = 0;
  }
  //  SendData();
}

void SendData(void)
{
    //  Send_Data[0]= speedout1*10;
  //  Send_Data[1]= offset*30;
    Send_Data[1]=R_PowerValue;
    Send_Data[0]=L_PowerValue;
    Send_Data[2]=offset*100;
  //  Send_Data[3]=gyro_speed_x;
  //  Send_Data[3]=speed_avg;
  //  Send_Data[1]=SA*10;
  //  Send_Data[0]= angle;
  //  Send_Data[1]=accl_angle_Y;
  //  Send_Data[0]= 100.0*offset;
  //  Send_Data[1]= 100.0*D_err;
  //  Send_Data[2] = SpeedAlone_P1;
  //  Send_Data[0] = AD_result[2];//angle,speed_L  
  //  Send_Data[1] = AD_result[1];
  //  Send_Data[2] = AD_result[3];
  //  Send_Data[2] = second_offset;
  //  Send_Data[3] = AD_2;
  //  Send_Data[3] = offset;
  //  Send_Data[1]=AD_result[2];//D_dir_err;//accl_angle_Y,
  //  Send_Data[2]=gyro_speed_x;//gyro_speed,speed_avg��
    OutPut_Data();
}