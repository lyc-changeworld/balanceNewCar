/******************************************************************************
*******************************************************************************
*                           Freescale-长春大学--樱                            *
*                               模糊算法子程序                                *
*                                                                             *
*                                                                             *
*                                                                             *
*                                                                             *
*                                               Miz.Wong                      *
*                                                  @                          *
*                                             Innovation.Lab                  *
*******************************************************************************/
#include "common.h"
#include "Fuzzy.h"

/**********************************************************************
* 函数名称：FuzzyCtrl
* 函数功能：模糊化 去模糊
* 入口参数：FuzzyStruct* Fuzzy_S
* 出口参数：Fuzzy Value
**********************************************************************/
float FuzzyCtrl(FuzzyStruct* Fuzzy_S)
{
  float  eFuzzy[2] = { 0.0, 0.0 };//偏差
  float  ecFuzzy[2] = { 0.0, 0.0 };//偏差微分
  float  QRule[4] = { 0.0, 0.0, 0.0, 0.0 }; //URule[]输出值
  float  U1Fuzzy[4] = { 0.0, 0.0, 0.0, 0.0 }; //输出值的隶属度
  int  pe = 0, pec = 0, U1Rule[4] = { 0, 0, 0, 0 };//偏差  偏差的变化率  采用的四条规则
  float U = 0;//输出值的精确量
  int rank;//隶属度级别
  float   temp1, temp2;//重心法中间变量
  rank = Fuzzy_S->Rank;
  
  /*----------------------------------------模糊语言描述------------------------------------------*/
  switch (rank)
  {
  case 9:
    {
      /*-----误差隶属函数描述-----*/
      if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])		            // |x_x_x_x_x_x_x_x_x_
      {
        eFuzzy[0] = 1.0;
        pe = -3;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])	         // _x|x_x_x_x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);//逼近程度表述 归一化
        pe = -3;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])	        // _x_x|x_x_x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        pe = -2;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])	        // _x_x_x|x_x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        pe = -1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		    // _x_x_x_x|x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        pe = 0;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[5])		     // _x_x_x_x_x|x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[5] - Fuzzy_S->fe) / (Fuzzy_S->eRule[5] - Fuzzy_S->eRule[4]);
        pe = 1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[6])		     // _x_x_x_x_x_x|x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[6] - Fuzzy_S->fe) / (Fuzzy_S->eRule[6] - Fuzzy_S->eRule[5]);
        pe = 2;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[7])		     // _x_x_x_x_x_x_x|x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[7] - Fuzzy_S->fe) / (Fuzzy_S->eRule[7] - Fuzzy_S->eRule[6]);
        pe = 3;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[8])		     // _x_x_x_x_x_x_x_x|x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[8] - Fuzzy_S->fe) / (Fuzzy_S->eRule[8] - Fuzzy_S->eRule[7]);
        pe = 4;
      }
      else if (Fuzzy_S->fe >= Fuzzy_S->eRule[8])			     // _x_x_x_x_x_x_x_x_x|
      {
        eFuzzy[0] = 0;
        pe = 4;
      }
      eFuzzy[1] = 1 - eFuzzy[0];
      
      /*-----误差变化隶属函数描述---*/
      if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
      {
        ecFuzzy[0] = 1.0;
        pec = -3;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]); //逼近程度表述
        pec = -3;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        pec = -2;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        pec = -1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        pec = 0;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[5])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[5] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[5] - Fuzzy_S->ecRule[4]);
        pec = 1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[6])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[6] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[6] - Fuzzy_S->ecRule[5]);
        pec = 2;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[7])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[7] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[7] - Fuzzy_S->ecRule[6]);
        pec = 3;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[8])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[8] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[8] - Fuzzy_S->ecRule[7]);
        pec = 4;
      }
      else
      {
        ecFuzzy[0] = 0;
        pec = 4;
      }
      
      ecFuzzy[1] = 1 - ecFuzzy[0];
      break;
    }//...9级隶属度
    
  case 7:
    {
      /*-----误差隶属函数描述-----*/
      if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])		        // |x_x_x_x_x_x_x_
      {
        eFuzzy[0] = 1.0;
        pe = -2;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])	        // _x|x_x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);//逼近程度描述 归一化处理
        pe = -2;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])	        // _x_x|x_x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        pe = -1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])	        // _x_x_x|x_x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        pe = 0;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		        // _x_x_x_x|x_x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        pe = 1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[5])		        // _x_x_x_x_x|x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[5] - Fuzzy_S->fe) / (Fuzzy_S->eRule[5] - Fuzzy_S->eRule[4]);
        pe = 2;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[6])		        // _x_x_x_x_x_x|x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[6] - Fuzzy_S->fe) / (Fuzzy_S->eRule[6] - Fuzzy_S->eRule[5]);
        pe = 3;
      }
      else if (Fuzzy_S->fe >= Fuzzy_S->eRule[6])			  // _x_x_x_x_x_x_x|
      {
        eFuzzy[0] = 0;
        pe = 3;
      }
      eFuzzy[1] = 1 - eFuzzy[0];
      
      /*-----误差变化率隶属函数描述-----*/
      if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
      {
        ecFuzzy[0] = 1.0;
        pec = -2;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        pec = -2;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        pec = -1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        pec = 0;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        pec = 1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[5])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[5] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[5] - Fuzzy_S->ecRule[4]);
        pec = 2;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[6])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[6] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[6] - Fuzzy_S->ecRule[5]);
        pec = 3;
      }
      else
      {
        ecFuzzy[0] = 0;
        pec = 3;
      }
      
      ecFuzzy[1] = 1 - ecFuzzy[0];
      break;
      
    }//...7级隶属度 
    
  case 5:
    {
      /*-----误差隶属函数描述-----*/
      if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])			// |x_x_x_x_x_ 
      {
        eFuzzy[0] = 1.0;
        pe = -1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])               // _x|x_x_x_x_ 
      {
        eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);
        pe = -1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])               // _x_x|x_x_x_ 
      {
        eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        pe = 0;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])               // _x_x_x|x_x_ 
      {
        eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        pe = 1;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		        // _x_x_x_x|x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        pe = 2;
      }
      else							// _x_x_x_x_x| 
      {
        eFuzzy[0] = 0;
        pe = 2;
      }
      eFuzzy[1] = 1 - eFuzzy[0];
      
      /*-----误差变化率隶属函数描述-----*/
      if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
      {
        ecFuzzy[0] = 1.0;
        pec = -1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        pec = -1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        pec = 0;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        pec = 1;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        pec = 2;
      }
      else
      {
        ecFuzzy[0] = 0;
        pec = 2;
      }
      
      ecFuzzy[1] = 1 - ecFuzzy[0];
      break;
    }//...5级隶属度
    
  case 3:
    {
      /*-----误差隶属函数描述-----*/
      if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])			// |x_x_x_
      {
        eFuzzy[0] = 1.0;
        pe = 0;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])		// _x|x_x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);
        pe = 0;
      }
      else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])		// _x_x|x_
      {
        eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        pe = 1;
      }
      else							// _x_x_x|
      {
        eFuzzy[0] = 0;
        pe = 1;
      }
      eFuzzy[1] = 1 - eFuzzy[0];
      
      /*-----误差变化率隶属函数描述-----*/
      if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
      {
        ecFuzzy[0] = 1.0;
        pec = 0;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        pec = 0;
      }
      else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
      {
        ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        pec = 1;
      }
      else
      {
        ecFuzzy[0] = 0;
        pec = 1;
      }
      
      ecFuzzy[1] = 1 - ecFuzzy[0];
      break;
    }//...3级隶属度 
  default: break;
  }//隶属度描述完成
  
  /*查询模糊规则表 rule[][]*/
  /*中心值由URule[]输出*/
  /*一般都是四个规则有效*/
  U1Rule[0] = Fuzzy_S->rule[pe - 1 + 3][pec - 1 + 3];
  U1Rule[1] = Fuzzy_S->rule[pe + 3][pec - 1 + 3];
  U1Rule[2] = Fuzzy_S->rule[pe - 1 + 3][pec + 3];
  U1Rule[3] = Fuzzy_S->rule[pe + 3][pec + 3];
  
  
  //相近隶属度
  if (eFuzzy[0] <= ecFuzzy[0]) // 0-0
    U1Fuzzy[0] = eFuzzy[0];
  else
    U1Fuzzy[0] = ecFuzzy[0];
  
  if (eFuzzy[1] <= ecFuzzy[0]) // 1-0
    U1Fuzzy[1] = eFuzzy[1];
  else
    U1Fuzzy[1] = ecFuzzy[0];
  
  if (eFuzzy[0] <= ecFuzzy[1]) // 0-1
    U1Fuzzy[2] = eFuzzy[0];
  else
    U1Fuzzy[2] = ecFuzzy[1];
  
  if (eFuzzy[1] <= ecFuzzy[1]) // 1-1
    U1Fuzzy[3] = eFuzzy[1];
  else
    U1Fuzzy[3] = ecFuzzy[1];
  
  /*同隶属函数输出语言值求大*/
  
  if (U1Rule[0] == U1Rule[1])
  {
    if (U1Fuzzy[0]>U1Fuzzy[1])
      U1Fuzzy[1] = 0;
    else
      U1Fuzzy[0] = 0;
  }
  if (U1Rule[0] == U1Rule[2])
  {
    if (U1Fuzzy[0]>U1Fuzzy[2])
      U1Fuzzy[2] = 0;
    else
      U1Fuzzy[0] = 0;
  }
  if (U1Rule[0] == U1Rule[3])
  {
    if (U1Fuzzy[0]>U1Fuzzy[3])
      U1Fuzzy[3] = 0;
    else
      U1Fuzzy[0] = 0;
  }
  if (U1Rule[1] == U1Rule[2])
  {
    if (U1Fuzzy[1]>U1Fuzzy[2])
      U1Fuzzy[2] = 0;
    else
      U1Fuzzy[1] = 0;
  }
  if (U1Rule[1] == U1Rule[3])
  {
    if (U1Fuzzy[1]>U1Fuzzy[3])
      U1Fuzzy[3] = 0;
    else
      U1Fuzzy[1] = 0;
  }
  if (U1Rule[2] == U1Rule[3])
  {
    if (U1Fuzzy[2]>U1Fuzzy[3])
      U1Fuzzy[3] = 0;
    else
      U1Fuzzy[2] = 0;
  }
  
  /*重心法反模糊*/
  /*U1Rule[]原值为输出隶属函数标号，转换为URule[]隶属函数值*/
  if (U1Rule[0] >= 0)
    QRule[0] = Fuzzy_S->URule[U1Rule[0]];
  else
    QRule[0] = -(Fuzzy_S->URule[-U1Rule[0]]);
  
  if (U1Rule[1] >= 0)
    QRule[1] = Fuzzy_S->URule[U1Rule[1]];
  else
    QRule[1] = -(Fuzzy_S->URule[-U1Rule[1]]);
  
  if (U1Rule[2] >= 0)
    QRule[2] = Fuzzy_S->URule[U1Rule[2]];
  else
    QRule[2] = -(Fuzzy_S->URule[-U1Rule[2]]);
  
  if (U1Rule[3] >= 0)
    QRule[3] = Fuzzy_S->URule[U1Rule[3]];
  else
    QRule[3] = -(Fuzzy_S->URule[-U1Rule[3]]);
  
  temp1 = U1Fuzzy[0] * QRule[0] + U1Fuzzy[1] * QRule[1] + U1Fuzzy[2] * QRule[2] + U1Fuzzy[3] * QRule[3];
  temp2 = U1Fuzzy[0] + U1Fuzzy[1] + U1Fuzzy[2] + U1Fuzzy[3];
  U = temp1 / temp2;
  return U;
}

/**********************************************************************
* 函数名称：Fuzzy_Update
* 函数功能：模糊控制更新
* 入口参数：FuzzyStruct* F_S
ek
ekc
* 出口参数：Fuzzy Value
**********************************************************************/
float Fuzzy_Update(FuzzyStruct* F_S, float ek, float ekc)
{
  float value = 0;
  F_S->fe = ek;
  F_S->fec = ekc;
  value = FuzzyCtrl(F_S);
  return value;
}
