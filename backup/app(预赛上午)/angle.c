#include "angle.h"

//-----------��������------------//
/*����ͨ����*/
int ji=0;//�����ǳ�ֵ������
int   count=0;//AD������������
/*�ڼ��ٶȼƵı���*/
float   ad_z[10],ad_x[10];//���ٶȼ�Z��X�����ֵԤ������
float   AD_Z=0,AD_X=0;//���ټ��˲��������
float value_Z=0,value_X=0;//ʵ�ʼ��ٶ�ֵ
float ZZZ=0;//�������Լ��ٶȼ�
/*�������ǵı���*/
float accl_angle_Y=0;//���ٶȼƼ��㵽�ĽǶ�ֵ
float gyro0_AR1=0;//������Y�����AD�� 
float gyro0_AR2=0;//������X�����AD��
int ad_gyro_y=0;//������Y��ʵʱAD��
int ad_gyro_x=0;//������Y��ʵʱAD��
float gyro_speed_y=0,gyro_speed_x=0;//�����ǽ��ٶȱ���
float angle_change=0;//�������������ǵı���ϵ��
/*�����ĽǶ�ֵ*/
float angle=0;                     

//=====================�����˲�=================// 
void one_complementation(float gyro_y,float accl_y)
{
  float K1 =0.02; // �Լ��ٶȼ�ȡֵ��Ȩ��
  angle=(angle+gyro_y*gyro_time)*(1-K1)+accl_y*K1;//һ�׻����˲�
}
//=====================���ȡֵ=================// 
void get_0(void)
{
  int i;
  float add0=0,add1=0;
  for(i=0;i<1000;i++)
  {
    add0=(float)(LPLD_ADC_Get(ADC1,AD6));//Y���ٶ���
    add1=(float)(LPLD_ADC_Get(ADC1,AD7));//X���ٶ���
    gyro0_AR1+=add0;
    gyro0_AR2+=add1;
  }
  gyro0_AR1=gyro0_AR1/1000;
  gyro0_AR2=gyro0_AR2/1000;
}
//=========================��ͨ�˲�====================//  
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
//--------------------AD����-----------------------// 
/***������AD����***/
void get_gyro()   
{   
  ad_gyro_y=LPLD_ADC_Get(ADC1,AD6);
  ad_gyro_x=LPLD_ADC_Get(ADC1,AD7);
  gyro_speed_y=-(float)((ad_gyro_y-gyro0_AR1)*gyro_value_y);//���ٶ�=-(������AD����ֵ-���������ADֵ)*�����Ǳ�������ϵ��
  gyro_speed_x=(float)((ad_gyro_x-gyro0_AR2)*gyro_value_x);
  //angle_change+=gyro_speed_y*gyro_time;
}
/***���ٶȼ�AD����***/
void get_accl() 
{
  if(count==10)   count=0;
  ad_z[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTZ_MSB);//z����ٶ�AD����
//  ad_x[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTX_MSB);//x����ٶ�AD����
  count++;//���ݲ���������
}
//--------------------�Ƕ��ں�-----------------------// 
void ronghe_angle()
{
  AD_Z=lvbo(ad_z);//���ٶ�Z��ȡ���˲����ֵ
//  AD_X=lvbo(ad_x);//���ٶ�X��ȡ���˲����ֵ
  value_Z=0.00025*AD_Z;
//  value_X=0.00025*AD_X;
  
  if(value_Z>0.95)  value_Z=0.95;
  if(value_Z<-0.95)  value_Z=-0.95;
//  if(value_X>1)  value_X=1;
//  if(value_X<-1)  value_X=-1;
//  accl_angle_X=(float)(atan2(value_Z,value_X)/PAI*180.0);
  accl_angle_Y=(float)(asin(value_Z)/PAI*180);//���ٶȼƵõ���Y����Ƕ�ֵ
  if(ji==0)  {angle+=accl_angle_Y;ji=1;}//��¼��һ�εĽǶ�Ϊ���ٶȵĿ�ʼ�Ƕ�        
  one_complementation(gyro_speed_y,accl_angle_Y);//�����˲�
}
//=====================�廪����=================// 
/*void QingHua_AngleCalaulate()
{
float fDeltaValue=0;
angle=gyro_angle;                            //�����ںϽǶ�
fDeltaValue=(Z_angle-angle)/GRAVITY_ADJUST_TIME_CONSTANT;   //ʱ��ϵ������
gyro_angle+=(fDeltaValue+gyro_speed_y)*a_time;          //�ںϽǶ�
}*/
