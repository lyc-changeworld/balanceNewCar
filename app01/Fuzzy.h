#ifndef _FUZZY_H
#define _FUZZY_H


typedef enum
{ 
  Fuzzy_Rank9 = 9,
  Fuzzy_Rank7 = 7,
  Fuzzy_Rank5 = 5,
  Fuzzy_Rank3 = 3,
}Fuzzy_Rank_e; // �����ȼ���

typedef struct
{
  Fuzzy_Rank_e Rank;  // �ּ�����
  float fe;  // e(k)
  float fec; // e(k)'
  float eRule[9];   //��������Ⱥ�������ֵ
  float ecRule[9];  //���仯�����Ⱥ�������ֵ
  float URule[9];  //���������������ֵ
  int   rule[9][9]; //�����
}FuzzyStruct;  // ģ���ṹ��


extern float Fuzzy_Update(FuzzyStruct* F_S,float ek,float ekc);
extern float FuzzyCtrl(FuzzyStruct* Fuzzy_S);

#endif