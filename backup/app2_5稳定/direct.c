#include "direct.h"
#include "math.h"

float var[2] = {0.0};
float x_sum=0,y_sum=0,xx_sum=0,xy_sum=0;
const float x[OFFSET_NUM] = {0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0};
const float AD_var[5] = {0.35, 0.25, 0.14, 0.13, 0.13};

float first_offset[3] = {0};
float second_offset = 0;
float offset = 0;
float his_offset[5] = {0};
float sum_offset = 0;

float AD_result[3] = {0};
float AD_2 = 0;
float AD_his[2][5] = {0};
float AD_temp[3] = {0};
float channel[3][AD_NUM];
//float bendflag = 0.0;
float AD1Basic = 0;
void get_ad_once(void)
{
  int j = 0;
  for(j=AD_NUM-1;j>=0;j--)
  {
    
    
    //channel[0][j] = LPLD_ADC_Get(ADC0,AD17);//E24
    channel[0][j] = LPLD_ADC_Get(ADC0,AD18);//E24
    channel[1][j] = LPLD_ADC_Get(ADC0,AD6);
    channel[2][j] = LPLD_ADC_Get(ADC0,AD7);//E25
    AD_temp[0] += channel[0][j];
    AD_temp[1] += channel[1][j];
    AD_temp[2] += channel[2][j];
  }
  
  AD_result[0] = AD_temp[0]/AD_NUM;
  AD_result[1] = AD_temp[1]/AD_NUM;
  AD_result[2] = AD_temp[2]/AD_NUM;
  AD_temp[0] = 0;
  AD_temp[1] = 0;
  AD_temp[2] = 0;
  
  AD1Basic = AD_result[1];
}


void get_ad(void)
{
//  int i = 0;
  int j = 0;
  for(j=AD_NUM-1;j>=0;j--)
  {
    
    
    //channel[0][j] = LPLD_ADC_Get(ADC0,AD17);//E24
    channel[0][j] = LPLD_ADC_Get(ADC0,AD18);//E24
    channel[1][j] = LPLD_ADC_Get(ADC0,AD6);
    channel[2][j] = LPLD_ADC_Get(ADC0,AD7);//E25
    AD_temp[0] += channel[0][j];
    AD_temp[1] += channel[1][j];
    AD_temp[2] += channel[2][j];
  }
  
  AD_result[0] = AD_temp[0]/AD_NUM;
  AD_result[1] = AD_temp[1]/AD_NUM;
  AD_result[2] = AD_temp[2]/AD_NUM;
  AD_temp[0] = 0;
  AD_temp[1] = 0;
  AD_temp[2] = 0;
  //  AD_result[0] = LPLD_ADC_Get(ADC0,AD17); //水平左边
  //  AD_result[1] = LPLD_ADC_Get(ADC0,AD18); //水平右边
  
}
float nowADBase = 0;
float offsetTemp = 0;
extern float angle;
void cal_offset(void)
{
//  static int i = 0;
  
  nowADBase = AD1Basic*pow(1+sin((12.5-angle)/60),2);

  first_offset[0] = (AD_result[2] - AD_result[0])*0.6/(1+AD_result[0] + AD_result[2]);
  
  if(AD_result[1]>nowADBase)
  {
    first_offset[1] = 0;
  }else
  {
    first_offset[1] = (nowADBase - AD_result[1])/(1+nowADBase);
  }
  

  if(AD_result[0]+AD_result[2] > 100  )
  {
    if(fabs(first_offset[1])<0.2)
    {
      offsetTemp = first_offset[0];
    }else{
      if(first_offset[0]>=0)
        offsetTemp = first_offset[1];
      else
        offsetTemp = -first_offset[1];
    }
    
    
  }else
  {
    if(first_offset[0]>=0)
      offsetTemp = first_offset[1];
    else
      offsetTemp = -first_offset[1];
  }

  
  if(offsetTemp - 0.6 > 0)
  {
    offsetTemp = 0.6;
  }else if(offsetTemp + 0.6 < 0)
  {
    offsetTemp = -0.6;
  }
  
  offset = offsetTemp;
//  second_offset = offset;
//  offset = offset * 0.3
//           + his_offset[0]*0.15
//           + his_offset[1]*0.15
//           + his_offset[2]*0.15
//           + his_offset[3]*0.15
//           + his_offset[4]*0.1;
//  

  
//  for(i = 4;i>0;i--)
//  {
//    his_offset[i] = his_offset[i-1];
//  }
//  his_offset[0] = offset;

}
