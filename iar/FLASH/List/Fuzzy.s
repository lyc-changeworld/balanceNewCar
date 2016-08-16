///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\Fuzzy.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\Fuzzy.c -D LPLD_K60
//        -D USE_K60D10 -lCN
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\ -lB
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\ -o
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M4 -e --fpu=None
//        --dlib_config "F:\Program
//        Files\IAR_FOR_ARM\arm\INC\c\DLib_Config_Normal.h" -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\app\ -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\CPU\ -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\common\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\LPLD\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\LPLD\HW\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\LPLD\DEV\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\LPLD\FUNC\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\uCOS-II\Ports\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\uCOS-II\Source\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\FatFs\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\FatFs\option\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\USB\common\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\USB\driver\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\USB\descriptor\
//        -I
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\..\..\..\lib\USB\class\
//        -Ol -I "F:\Program Files\IAR_FOR_ARM\arm\CMSIS\Include\" -D
//        ARM_MATH_CM4
//    List file    =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\Fuzzy.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_memclr4

        PUBLIC FuzzyCtrl
        PUBLIC Fuzzy_Update

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\Fuzzy.c
//    1 /******************************************************************************
//    2 *******************************************************************************
//    3 *                           Freescale-长春大学--樱                            *
//    4 *                               模糊算法子程序                                *
//    5 *                                                                             *
//    6 *                                                                             *
//    7 *                                                                             *
//    8 *                                                                             *
//    9 *                                               Miz.Wong                      *
//   10 *                                                  @                          *
//   11 *                                             Innovation.Lab                  *
//   12 *******************************************************************************/
//   13 #include "common.h"
//   14 #include "Fuzzy.h"
//   15 
//   16 /**********************************************************************
//   17 * 函数名称：FuzzyCtrl
//   18 * 函数功能：模糊化 去模糊
//   19 * 入口参数：FuzzyStruct* Fuzzy_S
//   20 * 出口参数：Fuzzy Value
//   21 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 float FuzzyCtrl(FuzzyStruct* Fuzzy_S)
//   23 {
FuzzyCtrl:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
//   24   float  eFuzzy[2] = { 0.0, 0.0 };//偏差
        ADD      R0,SP,#+8
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   25   float  ecFuzzy[2] = { 0.0, 0.0 };//偏差微分
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        STM      R0!,{R1,R2}
        SUBS     R0,R0,#+8
//   26   float  QRule[4] = { 0.0, 0.0, 0.0, 0.0 }; //URule[]输出值
        ADD      R0,SP,#+48
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   27   float  U1Fuzzy[4] = { 0.0, 0.0, 0.0, 0.0 }; //输出值的隶属度
        ADD      R0,SP,#+16
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   28   int  pe = 0, pec = 0, U1Rule[4] = { 0, 0, 0, 0 };//偏差  偏差的变化率  采用的四条规则
        MOVS     R5,#+0
        MOVS     R6,#+0
        ADD      R0,SP,#+32
        MOVS     R1,#+16
        BL       __aeabi_memclr4
//   29   float U = 0;//输出值的精确量
        MOVS     R0,#+0
//   30   int rank;//隶属度级别
//   31   float   temp1, temp2;//重心法中间变量
//   32   rank = Fuzzy_S->Rank;
        LDRB     R1,[R4, #+0]
//   33   
//   34   /*----------------------------------------模糊语言描述------------------------------------------*/
//   35   switch (rank)
        CMP      R1,#+3
        BEQ.W    ??FuzzyCtrl_0
        CMP      R1,#+5
        BEQ.W    ??FuzzyCtrl_1
        CMP      R1,#+7
        BEQ.W    ??FuzzyCtrl_2
        CMP      R1,#+9
        BNE.W    ??FuzzyCtrl_3
//   36   {
//   37   case 9:
//   38     {
//   39       /*-----误差隶属函数描述-----*/
//   40       if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])		            // |x_x_x_x_x_x_x_x_x_
??FuzzyCtrl_4:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_5
//   41       {
//   42         eFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+8]
//   43         pe = -3;
        MVNS     R5,#+2
        B.N      ??FuzzyCtrl_6
//   44       }
//   45       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])	         // _x|x_x_x_x_x_x_x_x_
??FuzzyCtrl_5:
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_7
//   46       {
//   47         eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);//逼近程度表述 归一化
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   48         pe = -3;
        MVNS     R5,#+2
        B.N      ??FuzzyCtrl_6
//   49       }
//   50       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])	        // _x_x|x_x_x_x_x_x_x_
??FuzzyCtrl_7:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_8
//   51       {
//   52         eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   53         pe = -2;
        MVNS     R5,#+1
        B.N      ??FuzzyCtrl_6
//   54       }
//   55       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])	        // _x_x_x|x_x_x_x_x_x_
??FuzzyCtrl_8:
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_9
//   56       {
//   57         eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+20]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   58         pe = -1;
        MOVS     R5,#-1
        B.N      ??FuzzyCtrl_6
//   59       }
//   60       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		    // _x_x_x_x|x_x_x_x_x_
??FuzzyCtrl_9:
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_10
//   61       {
//   62         eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+24]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   63         pe = 0;
        MOVS     R5,#+0
        B.N      ??FuzzyCtrl_6
//   64       }
//   65       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[5])		     // _x_x_x_x_x|x_x_x_x_
??FuzzyCtrl_10:
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_11
//   66       {
//   67         eFuzzy[0] = (Fuzzy_S->eRule[5] - Fuzzy_S->fe) / (Fuzzy_S->eRule[5] - Fuzzy_S->eRule[4]);
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+28]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   68         pe = 1;
        MOVS     R5,#+1
        B.N      ??FuzzyCtrl_6
//   69       }
//   70       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[6])		     // _x_x_x_x_x_x|x_x_x_
??FuzzyCtrl_11:
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_12
//   71       {
//   72         eFuzzy[0] = (Fuzzy_S->eRule[6] - Fuzzy_S->fe) / (Fuzzy_S->eRule[6] - Fuzzy_S->eRule[5]);
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+32]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   73         pe = 2;
        MOVS     R5,#+2
        B.N      ??FuzzyCtrl_6
//   74       }
//   75       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[7])		     // _x_x_x_x_x_x_x|x_x_
??FuzzyCtrl_12:
        LDR      R0,[R4, #+40]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_13
//   76       {
//   77         eFuzzy[0] = (Fuzzy_S->eRule[7] - Fuzzy_S->fe) / (Fuzzy_S->eRule[7] - Fuzzy_S->eRule[6]);
        LDR      R0,[R4, #+40]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+40]
        LDR      R1,[R4, #+36]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   78         pe = 3;
        MOVS     R5,#+3
        B.N      ??FuzzyCtrl_6
//   79       }
//   80       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[8])		     // _x_x_x_x_x_x_x_x|x_
??FuzzyCtrl_13:
        LDR      R0,[R4, #+44]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_14
//   81       {
//   82         eFuzzy[0] = (Fuzzy_S->eRule[8] - Fuzzy_S->fe) / (Fuzzy_S->eRule[8] - Fuzzy_S->eRule[7]);
        LDR      R0,[R4, #+44]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+44]
        LDR      R1,[R4, #+40]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//   83         pe = 4;
        MOVS     R5,#+4
        B.N      ??FuzzyCtrl_6
//   84       }
//   85       else if (Fuzzy_S->fe >= Fuzzy_S->eRule[8])			     // _x_x_x_x_x_x_x_x_x|
??FuzzyCtrl_14:
        LDR      R0,[R4, #+4]
        LDR      R1,[R4, #+44]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_6
//   86       {
//   87         eFuzzy[0] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//   88         pe = 4;
        MOVS     R5,#+4
//   89       }
//   90       eFuzzy[1] = 1 - eFuzzy[0];
??FuzzyCtrl_6:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//   91       
//   92       /*-----误差变化隶属函数描述---*/
//   93       if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
        LDR      R0,[R4, #+48]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_15
//   94       {
//   95         ecFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+0]
//   96         pec = -3;
        MVNS     R6,#+2
        B.N      ??FuzzyCtrl_16
//   97       }
//   98       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
??FuzzyCtrl_15:
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_17
//   99       {
//  100         ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]); //逼近程度表述
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+48]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  101         pec = -3;
        MVNS     R6,#+2
        B.N      ??FuzzyCtrl_16
//  102       }
//  103       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
??FuzzyCtrl_17:
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_18
//  104       {
//  105         ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+52]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  106         pec = -2;
        MVNS     R6,#+1
        B.N      ??FuzzyCtrl_16
//  107       }
//  108       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
??FuzzyCtrl_18:
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_19
//  109       {
//  110         ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+56]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  111         pec = -1;
        MOVS     R6,#-1
        B.N      ??FuzzyCtrl_16
//  112       }
//  113       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
??FuzzyCtrl_19:
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_20
//  114       {
//  115         ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+60]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  116         pec = 0;
        MOVS     R6,#+0
        B.N      ??FuzzyCtrl_16
//  117       }
//  118       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[5])
??FuzzyCtrl_20:
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_21
//  119       {
//  120         ecFuzzy[0] = (Fuzzy_S->ecRule[5] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[5] - Fuzzy_S->ecRule[4]);
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+64]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  121         pec = 1;
        MOVS     R6,#+1
        B.N      ??FuzzyCtrl_16
//  122       }
//  123       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[6])
??FuzzyCtrl_21:
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_22
//  124       {
//  125         ecFuzzy[0] = (Fuzzy_S->ecRule[6] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[6] - Fuzzy_S->ecRule[5]);
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+68]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  126         pec = 2;
        MOVS     R6,#+2
        B.N      ??FuzzyCtrl_16
//  127       }
//  128       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[7])
??FuzzyCtrl_22:
        LDR      R0,[R4, #+76]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_23
//  129       {
//  130         ecFuzzy[0] = (Fuzzy_S->ecRule[7] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[7] - Fuzzy_S->ecRule[6]);
        LDR      R0,[R4, #+76]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+76]
        LDR      R1,[R4, #+72]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  131         pec = 3;
        MOVS     R6,#+3
        B.N      ??FuzzyCtrl_16
//  132       }
//  133       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[8])
??FuzzyCtrl_23:
        LDR      R0,[R4, #+80]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_24
//  134       {
//  135         ecFuzzy[0] = (Fuzzy_S->ecRule[8] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[8] - Fuzzy_S->ecRule[7]);
        LDR      R0,[R4, #+80]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+80]
        LDR      R1,[R4, #+76]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  136         pec = 4;
        MOVS     R6,#+4
        B.N      ??FuzzyCtrl_16
//  137       }
//  138       else
//  139       {
//  140         ecFuzzy[0] = 0;
??FuzzyCtrl_24:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  141         pec = 4;
        MOVS     R6,#+4
//  142       }
//  143       
//  144       ecFuzzy[1] = 1 - ecFuzzy[0];
??FuzzyCtrl_16:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  145       break;
        B.N      ??FuzzyCtrl_25
//  146     }//...9级隶属度
//  147     
//  148   case 7:
//  149     {
//  150       /*-----误差隶属函数描述-----*/
//  151       if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])		        // |x_x_x_x_x_x_x_
??FuzzyCtrl_2:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_26
//  152       {
//  153         eFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+8]
//  154         pe = -2;
        MVNS     R5,#+1
        B.N      ??FuzzyCtrl_27
//  155       }
//  156       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])	        // _x|x_x_x_x_x_x_
??FuzzyCtrl_26:
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_28
//  157       {
//  158         eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);//逼近程度描述 归一化处理
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  159         pe = -2;
        MVNS     R5,#+1
        B.N      ??FuzzyCtrl_27
//  160       }
//  161       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])	        // _x_x|x_x_x_x_x_
??FuzzyCtrl_28:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_29
//  162       {
//  163         eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  164         pe = -1;
        MOVS     R5,#-1
        B.N      ??FuzzyCtrl_27
//  165       }
//  166       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])	        // _x_x_x|x_x_x_x_
??FuzzyCtrl_29:
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_30
//  167       {
//  168         eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+20]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  169         pe = 0;
        MOVS     R5,#+0
        B.N      ??FuzzyCtrl_27
//  170       }
//  171       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		        // _x_x_x_x|x_x_x_
??FuzzyCtrl_30:
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_31
//  172       {
//  173         eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+24]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  174         pe = 1;
        MOVS     R5,#+1
        B.N      ??FuzzyCtrl_27
//  175       }
//  176       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[5])		        // _x_x_x_x_x|x_x_
??FuzzyCtrl_31:
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_32
//  177       {
//  178         eFuzzy[0] = (Fuzzy_S->eRule[5] - Fuzzy_S->fe) / (Fuzzy_S->eRule[5] - Fuzzy_S->eRule[4]);
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+32]
        LDR      R1,[R4, #+28]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  179         pe = 2;
        MOVS     R5,#+2
        B.N      ??FuzzyCtrl_27
//  180       }
//  181       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[6])		        // _x_x_x_x_x_x|x_
??FuzzyCtrl_32:
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_33
//  182       {
//  183         eFuzzy[0] = (Fuzzy_S->eRule[6] - Fuzzy_S->fe) / (Fuzzy_S->eRule[6] - Fuzzy_S->eRule[5]);
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+36]
        LDR      R1,[R4, #+32]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  184         pe = 3;
        MOVS     R5,#+3
        B.N      ??FuzzyCtrl_27
//  185       }
//  186       else if (Fuzzy_S->fe >= Fuzzy_S->eRule[6])			  // _x_x_x_x_x_x_x|
??FuzzyCtrl_33:
        LDR      R0,[R4, #+4]
        LDR      R1,[R4, #+36]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_27
//  187       {
//  188         eFuzzy[0] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  189         pe = 3;
        MOVS     R5,#+3
//  190       }
//  191       eFuzzy[1] = 1 - eFuzzy[0];
??FuzzyCtrl_27:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//  192       
//  193       /*-----误差变化率隶属函数描述-----*/
//  194       if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
        LDR      R0,[R4, #+48]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_34
//  195       {
//  196         ecFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+0]
//  197         pec = -2;
        MVNS     R6,#+1
        B.N      ??FuzzyCtrl_35
//  198       }
//  199       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
??FuzzyCtrl_34:
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_36
//  200       {
//  201         ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+48]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  202         pec = -2;
        MVNS     R6,#+1
        B.N      ??FuzzyCtrl_35
//  203       }
//  204       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
??FuzzyCtrl_36:
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_37
//  205       {
//  206         ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+52]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  207         pec = -1;
        MOVS     R6,#-1
        B.N      ??FuzzyCtrl_35
//  208       }
//  209       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
??FuzzyCtrl_37:
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_38
//  210       {
//  211         ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+56]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  212         pec = 0;
        MOVS     R6,#+0
        B.N      ??FuzzyCtrl_35
//  213       }
//  214       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
??FuzzyCtrl_38:
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_39
//  215       {
//  216         ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+60]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  217         pec = 1;
        MOVS     R6,#+1
        B.N      ??FuzzyCtrl_35
//  218       }
//  219       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[5])
??FuzzyCtrl_39:
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_40
//  220       {
//  221         ecFuzzy[0] = (Fuzzy_S->ecRule[5] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[5] - Fuzzy_S->ecRule[4]);
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+68]
        LDR      R1,[R4, #+64]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  222         pec = 2;
        MOVS     R6,#+2
        B.N      ??FuzzyCtrl_35
//  223       }
//  224       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[6])
??FuzzyCtrl_40:
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_41
//  225       {
//  226         ecFuzzy[0] = (Fuzzy_S->ecRule[6] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[6] - Fuzzy_S->ecRule[5]);
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+72]
        LDR      R1,[R4, #+68]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  227         pec = 3;
        MOVS     R6,#+3
        B.N      ??FuzzyCtrl_35
//  228       }
//  229       else
//  230       {
//  231         ecFuzzy[0] = 0;
??FuzzyCtrl_41:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  232         pec = 3;
        MOVS     R6,#+3
//  233       }
//  234       
//  235       ecFuzzy[1] = 1 - ecFuzzy[0];
??FuzzyCtrl_35:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  236       break;
        B.N      ??FuzzyCtrl_25
//  237       
//  238     }//...7级隶属度 
//  239     
//  240   case 5:
//  241     {
//  242       /*-----误差隶属函数描述-----*/
//  243       if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])			// |x_x_x_x_x_ 
??FuzzyCtrl_1:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_42
//  244       {
//  245         eFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+8]
//  246         pe = -1;
        MOVS     R5,#-1
        B.N      ??FuzzyCtrl_43
//  247       }
//  248       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])               // _x|x_x_x_x_ 
??FuzzyCtrl_42:
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_44
//  249       {
//  250         eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  251         pe = -1;
        MOVS     R5,#-1
        B.N      ??FuzzyCtrl_43
//  252       }
//  253       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])               // _x_x|x_x_x_ 
??FuzzyCtrl_44:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_45
//  254       {
//  255         eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  256         pe = 0;
        MOVS     R5,#+0
        B.N      ??FuzzyCtrl_43
//  257       }
//  258       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[3])               // _x_x_x|x_x_ 
??FuzzyCtrl_45:
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_46
//  259       {
//  260         eFuzzy[0] = (Fuzzy_S->eRule[3] - Fuzzy_S->fe) / (Fuzzy_S->eRule[3] - Fuzzy_S->eRule[2]);
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+24]
        LDR      R1,[R4, #+20]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  261         pe = 1;
        MOVS     R5,#+1
        B.N      ??FuzzyCtrl_43
//  262       }
//  263       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[4])		        // _x_x_x_x|x_
??FuzzyCtrl_46:
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_47
//  264       {
//  265         eFuzzy[0] = (Fuzzy_S->eRule[4] - Fuzzy_S->fe) / (Fuzzy_S->eRule[4] - Fuzzy_S->eRule[3]);
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+28]
        LDR      R1,[R4, #+24]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  266         pe = 2;
        MOVS     R5,#+2
        B.N      ??FuzzyCtrl_43
//  267       }
//  268       else							// _x_x_x_x_x| 
//  269       {
//  270         eFuzzy[0] = 0;
??FuzzyCtrl_47:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  271         pe = 2;
        MOVS     R5,#+2
//  272       }
//  273       eFuzzy[1] = 1 - eFuzzy[0];
??FuzzyCtrl_43:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//  274       
//  275       /*-----误差变化率隶属函数描述-----*/
//  276       if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
        LDR      R0,[R4, #+48]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_48
//  277       {
//  278         ecFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+0]
//  279         pec = -1;
        MOVS     R6,#-1
        B.N      ??FuzzyCtrl_49
//  280       }
//  281       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
??FuzzyCtrl_48:
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_50
//  282       {
//  283         ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+48]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  284         pec = -1;
        MOVS     R6,#-1
        B.N      ??FuzzyCtrl_49
//  285       }
//  286       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
??FuzzyCtrl_50:
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_51
//  287       {
//  288         ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+52]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  289         pec = 0;
        MOVS     R6,#+0
        B.N      ??FuzzyCtrl_49
//  290       }
//  291       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[3])
??FuzzyCtrl_51:
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_52
//  292       {
//  293         ecFuzzy[0] = (Fuzzy_S->ecRule[3] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[3] - Fuzzy_S->ecRule[2]);
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+60]
        LDR      R1,[R4, #+56]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  294         pec = 1;
        MOVS     R6,#+1
        B.N      ??FuzzyCtrl_49
//  295       }
//  296       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[4])
??FuzzyCtrl_52:
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_53
//  297       {
//  298         ecFuzzy[0] = (Fuzzy_S->ecRule[4] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[4] - Fuzzy_S->ecRule[3]);
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+64]
        LDR      R1,[R4, #+60]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  299         pec = 2;
        MOVS     R6,#+2
        B.N      ??FuzzyCtrl_49
//  300       }
//  301       else
//  302       {
//  303         ecFuzzy[0] = 0;
??FuzzyCtrl_53:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  304         pec = 2;
        MOVS     R6,#+2
//  305       }
//  306       
//  307       ecFuzzy[1] = 1 - ecFuzzy[0];
??FuzzyCtrl_49:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  308       break;
        B.N      ??FuzzyCtrl_25
//  309     }//...5级隶属度
//  310     
//  311   case 3:
//  312     {
//  313       /*-----误差隶属函数描述-----*/
//  314       if (Fuzzy_S->fe <= Fuzzy_S->eRule[0])			// |x_x_x_
??FuzzyCtrl_0:
        LDR      R0,[R4, #+12]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_54
//  315       {
//  316         eFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+8]
//  317         pe = 0;
        MOVS     R5,#+0
        B.N      ??FuzzyCtrl_55
//  318       }
//  319       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[1])		// _x|x_x_
??FuzzyCtrl_54:
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_56
//  320       {
//  321         eFuzzy[0] = (Fuzzy_S->eRule[1] - Fuzzy_S->fe) / (Fuzzy_S->eRule[1] - Fuzzy_S->eRule[0]);
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+16]
        LDR      R1,[R4, #+12]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  322         pe = 0;
        MOVS     R5,#+0
        B.N      ??FuzzyCtrl_55
//  323       }
//  324       else if (Fuzzy_S->fe <= Fuzzy_S->eRule[2])		// _x_x|x_
??FuzzyCtrl_56:
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_57
//  325       {
//  326         eFuzzy[0] = (Fuzzy_S->eRule[2] - Fuzzy_S->fe) / (Fuzzy_S->eRule[2] - Fuzzy_S->eRule[1]);
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+4]
        BL       __aeabi_fsub
        MOVS     R5,R0
        LDR      R0,[R4, #+20]
        LDR      R1,[R4, #+16]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R5
        BL       __aeabi_fdiv
        STR      R0,[SP, #+8]
//  327         pe = 1;
        MOVS     R5,#+1
        B.N      ??FuzzyCtrl_55
//  328       }
//  329       else							// _x_x_x|
//  330       {
//  331         eFuzzy[0] = 0;
??FuzzyCtrl_57:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
//  332         pe = 1;
        MOVS     R5,#+1
//  333       }
//  334       eFuzzy[1] = 1 - eFuzzy[0];
??FuzzyCtrl_55:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+8]
        BL       __aeabi_fsub
        STR      R0,[SP, #+12]
//  335       
//  336       /*-----误差变化率隶属函数描述-----*/
//  337       if (Fuzzy_S->fec <= Fuzzy_S->ecRule[0])
        LDR      R0,[R4, #+48]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_58
//  338       {
//  339         ecFuzzy[0] = 1.0;
        MOVS     R0,#+1065353216
        STR      R0,[SP, #+0]
//  340         pec = 0;
        MOVS     R6,#+0
        B.N      ??FuzzyCtrl_59
//  341       }
//  342       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[1])
??FuzzyCtrl_58:
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_60
//  343       {
//  344         ecFuzzy[0] = (Fuzzy_S->ecRule[1] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[1] - Fuzzy_S->ecRule[0]);
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+52]
        LDR      R1,[R4, #+48]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  345         pec = 0;
        MOVS     R6,#+0
        B.N      ??FuzzyCtrl_59
//  346       }
//  347       else if (Fuzzy_S->fec <= Fuzzy_S->ecRule[2])
??FuzzyCtrl_60:
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_61
//  348       {
//  349         ecFuzzy[0] = (Fuzzy_S->ecRule[2] - Fuzzy_S->fec) / (Fuzzy_S->ecRule[2] - Fuzzy_S->ecRule[1]);
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+8]
        BL       __aeabi_fsub
        MOVS     R6,R0
        LDR      R0,[R4, #+56]
        LDR      R1,[R4, #+52]
        BL       __aeabi_fsub
        MOVS     R1,R0
        MOVS     R0,R6
        BL       __aeabi_fdiv
        STR      R0,[SP, #+0]
//  350         pec = 1;
        MOVS     R6,#+1
        B.N      ??FuzzyCtrl_59
//  351       }
//  352       else
//  353       {
//  354         ecFuzzy[0] = 0;
??FuzzyCtrl_61:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
//  355         pec = 1;
        MOVS     R6,#+1
//  356       }
//  357       
//  358       ecFuzzy[1] = 1 - ecFuzzy[0];
??FuzzyCtrl_59:
        MOVS     R0,#+1065353216
        LDR      R1,[SP, #+0]
        BL       __aeabi_fsub
        STR      R0,[SP, #+4]
//  359       break;
        B.N      ??FuzzyCtrl_25
//  360     }//...3级隶属度 
//  361   default: break;
//  362   }//隶属度描述完成
//  363   
//  364   /*查询模糊规则表 rule[][]*/
//  365   /*中心值由URule[]输出*/
//  366   /*一般都是四个规则有效*/
//  367   U1Rule[0] = Fuzzy_S->rule[pe - 1 + 3][pec - 1 + 3];
??FuzzyCtrl_3:
??FuzzyCtrl_25:
        MOVS     R0,#+36
        MLA      R0,R0,R5,R4
        ADDS     R0,R0,R6, LSL #+2
        LDR      R0,[R0, #+200]
        STR      R0,[SP, #+32]
//  368   U1Rule[1] = Fuzzy_S->rule[pe + 3][pec - 1 + 3];
        MOVS     R0,#+36
        MLA      R0,R0,R5,R4
        ADDS     R0,R0,R6, LSL #+2
        LDR      R0,[R0, #+236]
        STR      R0,[SP, #+36]
//  369   U1Rule[2] = Fuzzy_S->rule[pe - 1 + 3][pec + 3];
        MOVS     R0,#+36
        MLA      R0,R0,R5,R4
        ADDS     R0,R0,R6, LSL #+2
        LDR      R0,[R0, #+204]
        STR      R0,[SP, #+40]
//  370   U1Rule[3] = Fuzzy_S->rule[pe + 3][pec + 3];
        MOVS     R0,#+36
        MLA      R0,R0,R5,R4
        ADDS     R0,R0,R6, LSL #+2
        LDR      R0,[R0, #+240]
        STR      R0,[SP, #+44]
//  371   
//  372   
//  373   //相近隶属度
//  374   if (eFuzzy[0] <= ecFuzzy[0]) // 0-0
        LDR      R0,[SP, #+0]
        LDR      R1,[SP, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_62
//  375     U1Fuzzy[0] = eFuzzy[0];
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+16]
        B.N      ??FuzzyCtrl_63
//  376   else
//  377     U1Fuzzy[0] = ecFuzzy[0];
??FuzzyCtrl_62:
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+16]
//  378   
//  379   if (eFuzzy[1] <= ecFuzzy[0]) // 1-0
??FuzzyCtrl_63:
        LDR      R0,[SP, #+0]
        LDR      R1,[SP, #+12]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_64
//  380     U1Fuzzy[1] = eFuzzy[1];
        LDR      R0,[SP, #+12]
        STR      R0,[SP, #+20]
        B.N      ??FuzzyCtrl_65
//  381   else
//  382     U1Fuzzy[1] = ecFuzzy[0];
??FuzzyCtrl_64:
        LDR      R0,[SP, #+0]
        STR      R0,[SP, #+20]
//  383   
//  384   if (eFuzzy[0] <= ecFuzzy[1]) // 0-1
??FuzzyCtrl_65:
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+8]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_66
//  385     U1Fuzzy[2] = eFuzzy[0];
        LDR      R0,[SP, #+8]
        STR      R0,[SP, #+24]
        B.N      ??FuzzyCtrl_67
//  386   else
//  387     U1Fuzzy[2] = ecFuzzy[1];
??FuzzyCtrl_66:
        LDR      R0,[SP, #+4]
        STR      R0,[SP, #+24]
//  388   
//  389   if (eFuzzy[1] <= ecFuzzy[1]) // 1-1
??FuzzyCtrl_67:
        LDR      R0,[SP, #+4]
        LDR      R1,[SP, #+12]
        BL       __aeabi_cfrcmple
        BHI.N    ??FuzzyCtrl_68
//  390     U1Fuzzy[3] = eFuzzy[1];
        LDR      R0,[SP, #+12]
        STR      R0,[SP, #+28]
        B.N      ??FuzzyCtrl_69
//  391   else
//  392     U1Fuzzy[3] = ecFuzzy[1];
??FuzzyCtrl_68:
        LDR      R0,[SP, #+4]
        STR      R0,[SP, #+28]
//  393   
//  394   /*同隶属函数输出语言值求大*/
//  395   
//  396   if (U1Rule[0] == U1Rule[1])
??FuzzyCtrl_69:
        LDR      R0,[SP, #+32]
        LDR      R1,[SP, #+36]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_70
//  397   {
//  398     if (U1Fuzzy[0]>U1Fuzzy[1])
        LDR      R0,[SP, #+20]
        LDR      R1,[SP, #+16]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_71
//  399       U1Fuzzy[1] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        B.N      ??FuzzyCtrl_70
//  400     else
//  401       U1Fuzzy[0] = 0;
??FuzzyCtrl_71:
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  402   }
//  403   if (U1Rule[0] == U1Rule[2])
??FuzzyCtrl_70:
        LDR      R0,[SP, #+32]
        LDR      R1,[SP, #+40]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_72
//  404   {
//  405     if (U1Fuzzy[0]>U1Fuzzy[2])
        LDR      R0,[SP, #+24]
        LDR      R1,[SP, #+16]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_73
//  406       U1Fuzzy[2] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        B.N      ??FuzzyCtrl_72
//  407     else
//  408       U1Fuzzy[0] = 0;
??FuzzyCtrl_73:
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  409   }
//  410   if (U1Rule[0] == U1Rule[3])
??FuzzyCtrl_72:
        LDR      R0,[SP, #+32]
        LDR      R1,[SP, #+44]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_74
//  411   {
//  412     if (U1Fuzzy[0]>U1Fuzzy[3])
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+16]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_75
//  413       U1Fuzzy[3] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        B.N      ??FuzzyCtrl_74
//  414     else
//  415       U1Fuzzy[0] = 0;
??FuzzyCtrl_75:
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
//  416   }
//  417   if (U1Rule[1] == U1Rule[2])
??FuzzyCtrl_74:
        LDR      R0,[SP, #+36]
        LDR      R1,[SP, #+40]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_76
//  418   {
//  419     if (U1Fuzzy[1]>U1Fuzzy[2])
        LDR      R0,[SP, #+24]
        LDR      R1,[SP, #+20]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_77
//  420       U1Fuzzy[2] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        B.N      ??FuzzyCtrl_76
//  421     else
//  422       U1Fuzzy[1] = 0;
??FuzzyCtrl_77:
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//  423   }
//  424   if (U1Rule[1] == U1Rule[3])
??FuzzyCtrl_76:
        LDR      R0,[SP, #+36]
        LDR      R1,[SP, #+44]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_78
//  425   {
//  426     if (U1Fuzzy[1]>U1Fuzzy[3])
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+20]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_79
//  427       U1Fuzzy[3] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        B.N      ??FuzzyCtrl_78
//  428     else
//  429       U1Fuzzy[1] = 0;
??FuzzyCtrl_79:
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
//  430   }
//  431   if (U1Rule[2] == U1Rule[3])
??FuzzyCtrl_78:
        LDR      R0,[SP, #+40]
        LDR      R1,[SP, #+44]
        CMP      R0,R1
        BNE.N    ??FuzzyCtrl_80
//  432   {
//  433     if (U1Fuzzy[2]>U1Fuzzy[3])
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+24]
        BL       __aeabi_cfcmple
        BCS.N    ??FuzzyCtrl_81
//  434       U1Fuzzy[3] = 0;
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        B.N      ??FuzzyCtrl_80
//  435     else
//  436       U1Fuzzy[2] = 0;
??FuzzyCtrl_81:
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
//  437   }
//  438   
//  439   /*重心法反模糊*/
//  440   /*U1Rule[]原值为输出隶属函数标号，转换为URule[]隶属函数值*/
//  441   if (U1Rule[0] >= 0)
??FuzzyCtrl_80:
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BMI.N    ??FuzzyCtrl_82
//  442     QRule[0] = Fuzzy_S->URule[U1Rule[0]];
        LDR      R0,[SP, #+32]
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        STR      R0,[SP, #+48]
        B.N      ??FuzzyCtrl_83
//  443   else
//  444     QRule[0] = -(Fuzzy_S->URule[-U1Rule[0]]);
??FuzzyCtrl_82:
        LDR      R0,[SP, #+32]
        RSBS     R0,R0,#+0
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        EORS     R0,R0,#0x80000000
        STR      R0,[SP, #+48]
//  445   
//  446   if (U1Rule[1] >= 0)
??FuzzyCtrl_83:
        LDR      R0,[SP, #+36]
        CMP      R0,#+0
        BMI.N    ??FuzzyCtrl_84
//  447     QRule[1] = Fuzzy_S->URule[U1Rule[1]];
        LDR      R0,[SP, #+36]
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        STR      R0,[SP, #+52]
        B.N      ??FuzzyCtrl_85
//  448   else
//  449     QRule[1] = -(Fuzzy_S->URule[-U1Rule[1]]);
??FuzzyCtrl_84:
        LDR      R0,[SP, #+36]
        RSBS     R0,R0,#+0
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        EORS     R0,R0,#0x80000000
        STR      R0,[SP, #+52]
//  450   
//  451   if (U1Rule[2] >= 0)
??FuzzyCtrl_85:
        LDR      R0,[SP, #+40]
        CMP      R0,#+0
        BMI.N    ??FuzzyCtrl_86
//  452     QRule[2] = Fuzzy_S->URule[U1Rule[2]];
        LDR      R0,[SP, #+40]
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        STR      R0,[SP, #+56]
        B.N      ??FuzzyCtrl_87
//  453   else
//  454     QRule[2] = -(Fuzzy_S->URule[-U1Rule[2]]);
??FuzzyCtrl_86:
        LDR      R0,[SP, #+40]
        RSBS     R0,R0,#+0
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        EORS     R0,R0,#0x80000000
        STR      R0,[SP, #+56]
//  455   
//  456   if (U1Rule[3] >= 0)
??FuzzyCtrl_87:
        LDR      R0,[SP, #+44]
        CMP      R0,#+0
        BMI.N    ??FuzzyCtrl_88
//  457     QRule[3] = Fuzzy_S->URule[U1Rule[3]];
        LDR      R0,[SP, #+44]
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        STR      R0,[SP, #+60]
        B.N      ??FuzzyCtrl_89
//  458   else
//  459     QRule[3] = -(Fuzzy_S->URule[-U1Rule[3]]);
??FuzzyCtrl_88:
        LDR      R0,[SP, #+44]
        RSBS     R0,R0,#+0
        ADDS     R0,R4,R0, LSL #+2
        LDR      R0,[R0, #+84]
        EORS     R0,R0,#0x80000000
        STR      R0,[SP, #+60]
//  460   
//  461   temp1 = U1Fuzzy[0] * QRule[0] + U1Fuzzy[1] * QRule[1] + U1Fuzzy[2] * QRule[2] + U1Fuzzy[3] * QRule[3];
??FuzzyCtrl_89:
        LDR      R1,[SP, #+16]
        LDR      R0,[SP, #+48]
        BL       __aeabi_fmul
        MOVS     R4,R0
        LDR      R1,[SP, #+20]
        LDR      R0,[SP, #+52]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR      R1,[SP, #+24]
        LDR      R0,[SP, #+56]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
        LDR      R1,[SP, #+28]
        LDR      R0,[SP, #+60]
        BL       __aeabi_fmul
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R4,R0
//  462   temp2 = U1Fuzzy[0] + U1Fuzzy[1] + U1Fuzzy[2] + U1Fuzzy[3];
        LDR      R1,[SP, #+16]
        LDR      R0,[SP, #+20]
        BL       __aeabi_fadd
        LDR      R1,[SP, #+24]
        BL       __aeabi_fadd
        LDR      R1,[SP, #+28]
        BL       __aeabi_fadd
        MOVS     R1,R0
//  463   U = temp1 / temp2;
        MOVS     R0,R4
        BL       __aeabi_fdiv
//  464   return U;
        ADD      SP,SP,#+64
        POP      {R4-R6,PC}       ;; return
//  465 }
//  466 
//  467 /**********************************************************************
//  468 * 函数名称：Fuzzy_Update
//  469 * 函数功能：模糊控制更新
//  470 * 入口参数：FuzzyStruct* F_S
//  471 ek
//  472 ekc
//  473 * 出口参数：Fuzzy Value
//  474 **********************************************************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  475 float Fuzzy_Update(FuzzyStruct* F_S, float ek, float ekc)
//  476 {
Fuzzy_Update:
        PUSH     {R4,LR}
//  477   float value = 0;
        MOVS     R4,#+0
//  478   F_S->fe = ek;
        STR      R1,[R0, #+4]
//  479   F_S->fec = ekc;
        STR      R2,[R0, #+8]
//  480   value = FuzzyCtrl(F_S);
        BL       FuzzyCtrl
        MOVS     R4,R0
//  481   return value;
        MOVS     R0,R4
        POP      {R4,PC}          ;; return
//  482 }

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H, 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0H, 0H, 0H, 0H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC32 0, 0, 0, 0

        END
// 
//    64 bytes in section .rodata
// 2 686 bytes in section .text
// 
// 2 686 bytes of CODE  memory
//    64 bytes of CONST memory
//
//Errors: none
//Warnings: none
