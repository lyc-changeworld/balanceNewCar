#include "angle.h"

//-----------变量定义------------//
/*①普通变量*/
int ji=0;//陀螺仪初值计数量
int   count=0;//AD采样计数变量
/*②加速度计的变量*/
float   ad_z[10],ad_x[10];//加速度计Z、X轴采样值预存数组
float   AD_Z=0,AD_X=0;//加速计滤波后的数据
float value_Z=0,value_X=0;//实际加速度值
float ZZZ=0;//用来测试加速度计
/*③陀螺仪的变量*/
float accl_angle_Y=0;//加速度计计算到的角度值
float gyro0_AR1=0;//陀螺仪Y轴零点AD量 
float gyro0_AR2=0;//陀螺仪X轴零点AD量
int ad_gyro_y=0;//陀螺仪Y轴实时AD量
int ad_gyro_x=0;//陀螺仪Y轴实时AD量
float gyro_speed_y=0,gyro_speed_x=0;//陀螺仪角速度变量
float angle_change=0;//用来测试陀螺仪的比例系数
/*④最后的角度值*/
float angle=0;                     

//=====================互补滤波=================// 
void one_complementation(float gyro_y,float accl_y)
{
  float K1 =0.02; // 对加速度计取值的权重
  angle=(angle+gyro_y*gyro_time)*(1-K1)+accl_y*K1;//一阶互补滤波
}
//=====================零点取值=================// 
void get_0(void)
{
  int i;
  float add0=0,add1=0;
  for(i=0;i<1000;i++)
  {
    add0=(float)(LPLD_ADC_Get(ADC1,AD6));//Y角速度量
    add1=(float)(LPLD_ADC_Get(ADC1,AD7));//X角速度量
    gyro0_AR1+=add0;
    gyro0_AR2+=add1;
  }
  gyro0_AR1=gyro0_AR1/1000;
  gyro0_AR2=gyro0_AR2/1000;
}
//=========================普通滤波====================//  
float lvbo(float aa[]) 
{
  int i;
  float max,min,sum=0;
  max=min=aa[0];
  for(i=0;i<10;i++) {
    sum+=aa[i];
    if(aa[i]<min)
      min=aa[i];
    else if(aa[i]>max)
      max=aa[i];
  }
  sum=(sum-max-min)/8;
  return sum;
}
//--------------------AD采样-----------------------// 
/***陀螺仪AD采样***/
void get_gyro()   
{   
  ad_gyro_y=LPLD_ADC_Get(ADC1,AD6);
  ad_gyro_x=LPLD_ADC_Get(ADC1,AD7);
  gyro_speed_y=-(float)((ad_gyro_y-gyro0_AR1)*gyro_value_y);//角速度=-(陀螺仪AD采样值-陀螺仪零点AD值)*陀螺仪比例换算系数
  gyro_speed_x=(float)((ad_gyro_x-gyro0_AR2)*gyro_value_x);
  //angle_change+=gyro_speed_y*gyro_time;
}
/***加速度计AD采样***/
void get_accl() 
{
  if(count==10)   count=0;
  ad_z[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTZ_MSB);//z轴加速度AD采样
//  ad_x[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTX_MSB);//x轴加速度AD采样
  count++;//数据采样计数量
}
//--------------------角度融合-----------------------// 
void ronghe_angle()
{
  AD_Z=lvbo(ad_z);//加速度Z轴取得滤波后的值
//  AD_X=lvbo(ad_x);//加速度X轴取得滤波后的值
  value_Z=0.00025*AD_Z;
//  value_X=0.00025*AD_X;
  
  if(value_Z>0.95)  value_Z=0.95;
  if(value_Z<-0.95)  value_Z=-0.95;
//  if(value_X>1)  value_X=1;
//  if(value_X<-1)  value_X=-1;
//  accl_angle_X=(float)(atan2(value_Z,value_X)/PAI*180.0);
  accl_angle_Y=(float)(asin(value_Z)/PAI*180);//加速度计得到的Y方向角度值
  if(ji==0)  {angle+=accl_angle_Y;ji=1;}//记录第一次的角度为加速度的开始角度        
  one_complementation(gyro_speed_y,accl_angle_Y);//互补滤波
}
//=====================清华方案=================// 
/*void QingHua_AngleCalaulate()
{
float fDeltaValue=0;
angle=gyro_angle;                            //最终融合角度
fDeltaValue=(Z_angle-angle)/GRAVITY_ADJUST_TIME_CONSTANT;   //时间系数矫正
gyro_angle+=(fDeltaValue+gyro_speed_y)*a_time;          //融合角度
}*/
