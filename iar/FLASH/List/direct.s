///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:11
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\direct.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\direct.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\direct.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_ADC_Get
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cdrcmple
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fsub
        EXTERN __aeabi_ui2f
        EXTERN angle
        EXTERN sin

        PUBLIC AD1Basic
        PUBLIC AD_2
        PUBLIC AD_his
        PUBLIC AD_result
        PUBLIC AD_temp
        PUBLIC AD_var
        PUBLIC cal_offset
        PUBLIC channel
        PUBLIC first_offset
        PUBLIC get_ad
        PUBLIC get_ad_once
        PUBLIC his_offset
        PUBLIC nowADBase
        PUBLIC offset
        PUBLIC offsetTemp
        PUBLIC second_offset
        PUBLIC sum_offset
        PUBLIC var
        PUBLIC x
        PUBLIC x_sum
        PUBLIC xx_sum
        PUBLIC xy_sum
        PUBLIC y_sum

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\direct.c
//    1 #include "direct.h"
//    2 #include "math.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 float var[2] = {0.0};
var:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 float x_sum=0,y_sum=0,xx_sum=0,xy_sum=0;
x_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
y_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
xx_sum:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
xy_sum:
        DS8 4

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//    6 const float x[OFFSET_NUM] = {0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0};
x:
        DATA
        DC32 0H, 3F800000H, 40000000H, 40400000H, 40800000H, 40A00000H
        DC32 40C00000H, 40E00000H, 41000000H, 41100000H

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//    7 const float AD_var[5] = {0.35, 0.25, 0.14, 0.13, 0.13};
AD_var:
        DATA
        DC32 3EB33333H, 3E800000H, 3E0F5C29H, 3E051EB8H, 3E051EB8H
//    8 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float first_offset[3] = {0};
first_offset:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 float second_offset = 0;
second_offset:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 float offset = 0;
offset:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float his_offset[5] = {0};
his_offset:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float sum_offset = 0;
sum_offset:
        DS8 4
//   14 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float AD_result[3] = {0};
AD_result:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float AD_2 = 0;
AD_2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 float AD_his[2][5] = {0};
AD_his:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float AD_temp[3] = {0};
AD_temp:
        DS8 12

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float channel[3][AD_NUM];
channel:
        DS8 192
//   20 //float bendflag = 0.0;

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float AD1Basic = 0;
AD1Basic:
        DS8 4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   22 void get_ad_once(void)
//   23 {
get_ad_once:
        PUSH     {R4,LR}
//   24   int j = 0;
        MOVS     R4,#+0
//   25   for(j=AD_NUM-1;j>=0;j--)
        MOVS     R0,#+15
        MOVS     R4,R0
        B.N      ??get_ad_once_0
//   26   {
//   27     
//   28     
//   29     //channel[0][j] = LPLD_ADC_Get(ADC0,AD17);//E24
//   30     channel[0][j] = LPLD_ADC_Get(ADC0,AD18);//E24
??get_ad_once_1:
        MOVS     R1,#+18
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, R4, LSL #+2]
//   31     channel[1][j] = LPLD_ADC_Get(ADC0,AD6);
        MOVS     R1,#+6
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+64]
//   32     channel[2][j] = LPLD_ADC_Get(ADC0,AD7);//E25
        MOVS     R1,#+7
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+128]
//   33     AD_temp[0] += channel[0][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_1
        LDR      R1,[R1, R4, LSL #+2]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   34     AD_temp[1] += channel[1][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        LDR      R1,[R1, #+64]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+4]
//   35     AD_temp[2] += channel[2][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        LDR      R1,[R1, #+128]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+8]
//   36   }
        SUBS     R4,R4,#+1
??get_ad_once_0:
        CMP      R4,#+0
        BPL.N    ??get_ad_once_1
//   37   
//   38   AD_result[0] = AD_temp[0]/AD_NUM;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
//   39   AD_result[1] = AD_temp[1]/AD_NUM;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+4]
//   40   AD_result[2] = AD_temp[2]/AD_NUM;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+8]
//   41   AD_temp[0] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   42   AD_temp[1] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+4]
//   43   AD_temp[2] = 0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+8]
//   44   
//   45   AD1Basic = AD_result[1];
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable2_4
        STR      R0,[R1, #+0]
//   46 }
        POP      {R4,PC}          ;; return
//   47 
//   48 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   49 void get_ad(void)
//   50 {
get_ad:
        PUSH     {R4,LR}
//   51 //  int i = 0;
//   52   int j = 0;
        MOVS     R4,#+0
//   53   for(j=AD_NUM-1;j>=0;j--)
        MOVS     R0,#+15
        MOVS     R4,R0
        B.N      ??get_ad_0
//   54   {
//   55     
//   56     
//   57     //channel[0][j] = LPLD_ADC_Get(ADC0,AD17);//E24
//   58     channel[0][j] = LPLD_ADC_Get(ADC0,AD18);//E24
??get_ad_1:
        MOVS     R1,#+18
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        STR      R0,[R1, R4, LSL #+2]
//   59     channel[1][j] = LPLD_ADC_Get(ADC0,AD6);
        MOVS     R1,#+6
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+64]
//   60     channel[2][j] = LPLD_ADC_Get(ADC0,AD7);//E25
        MOVS     R1,#+7
        LDR.W    R0,??DataTable2  ;; 0x4003b000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+128]
//   61     AD_temp[0] += channel[0][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2_1
        LDR      R1,[R1, R4, LSL #+2]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   62     AD_temp[1] += channel[1][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+4]
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        LDR      R1,[R1, #+64]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+4]
//   63     AD_temp[2] += channel[2][j];
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+8]
        LDR.W    R1,??DataTable2_1
        ADDS     R1,R1,R4, LSL #+2
        LDR      R1,[R1, #+128]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+8]
//   64   }
        SUBS     R4,R4,#+1
??get_ad_0:
        CMP      R4,#+0
        BPL.N    ??get_ad_1
//   65   
//   66   AD_result[0] = AD_temp[0]/AD_NUM;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable2_3
        STR      R0,[R1, #+0]
//   67   AD_result[1] = AD_temp[1]/AD_NUM;
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+4]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+4]
//   68   AD_result[2] = AD_temp[2]/AD_NUM;
        LDR.N    R0,??DataTable2_2
        LDR      R0,[R0, #+8]
        MOVS     R1,#+1098907648
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+8]
//   69   AD_temp[0] = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+0]
//   70   AD_temp[1] = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+4]
//   71   AD_temp[2] = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_2
        STR      R0,[R1, #+8]
//   72   //  AD_result[0] = LPLD_ADC_Get(ADC0,AD17); //水平左边
//   73   //  AD_result[1] = LPLD_ADC_Get(ADC0,AD18); //水平右边
//   74   
//   75 }
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   76 float nowADBase = 0;
nowADBase:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   77 float offsetTemp = 0;
offsetTemp:
        DS8 4
//   78 extern float angle;
//   79 extern int straightTime;
//   80 extern int runTime;
//   81 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   82 void cal_offset(void)
//   83 {
cal_offset:
        PUSH     {R3-R7,LR}
//   84   static int i = 0;
//   85   
//   86   nowADBase = AD1Basic*pow(1+sin((12.5-angle)/60),2);
        LDR.N    R0,??DataTable2_5
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_6  ;; 0x40290000
        BL       __aeabi_dsub
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_7  ;; 0x404e0000
        BL       __aeabi_ddiv
        BL       sin
        MOVS     R2,#+0
        LDR.N    R3,??DataTable2_8  ;; 0x3ff00000
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        MOVS     R0,R4
        MOVS     R1,R5
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
//   87   if(nowADBase>254)
        LDR.N    R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_10  ;; 0x437e0001
        BL       __aeabi_cfrcmple
        BHI.N    ??cal_offset_0
//   88     nowADBase = 254;
        LDR.N    R0,??DataTable2_11  ;; 0x437e0000
        LDR.N    R1,??DataTable2_9
        STR      R0,[R1, #+0]
//   89  // nowADBase = AD1Basic*pow(1+sin((12.5-angle)/60),2);
//   90   first_offset[0] = (AD_result[2] - AD_result[0])/(1+AD_result[0] + AD_result[2]);
??cal_offset_0:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR.N    R0,??DataTable2_3
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+8]
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+0]
//   91   
//   92   if(AD_result[1]>nowADBase)
        LDR.N    R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS.N    ??cal_offset_1
//   93   {
//   94     first_offset[1] = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+4]
        B.N      ??cal_offset_2
//   95   }else
//   96   {
//   97     first_offset[1] = (nowADBase - AD_result[1])/(1+nowADBase);
??cal_offset_1:
        LDR.N    R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_fsub
        MOVS     R4,R0
        LDR.N    R0,??DataTable2_9
        LDR      R1,[R0, #+0]
        MOVS     R0,#+1065353216
        BL       __aeabi_fadd
        MOVS     R1,R0
        MOVS     R0,R4
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable2_12
        STR      R0,[R1, #+4]
//   98   }
//   99 //  
//  100 
//  101   if(AD_result[1] > AD1Basic*0.7  )
??cal_offset_2:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R4,R2
        MOVS     R5,R3
        LDR.N    R0,??DataTable2_4
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+1717986918
        LDR.N    R3,??DataTable2_13  ;; 0x3fe66666
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_cdcmple
        BCS.N    ??cal_offset_3
//  102   {
//  103     if(first_offset[0]>0)
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??cal_offset_4
//  104     {
//  105       offsetTemp = first_offset[0]*0.6 + first_offset[1]*0.4;
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable2_14  ;; 0x3fe33333
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_16  ;; 0x3fd99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
        B.N      ??cal_offset_5
//  106     }else
//  107     {
//  108       offsetTemp = first_offset[0]*0.6 - first_offset[1]*0.4;
??cal_offset_4:
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable2_14  ;; 0x3fe33333
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_16  ;; 0x3fd99999
        BL       __aeabi_dmul
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
        B.N      ??cal_offset_5
//  109     }
//  110     //offsetTemp = first_offset[0];
//  111     
//  112     
//  113   }else
//  114   {
//  115     
//  116     if(first_offset[0]>0)
??cal_offset_3:
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??cal_offset_6
//  117     {
//  118       offsetTemp = first_offset[1];
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
        B.N      ??cal_offset_5
//  119     }else if(first_offset[0]<0)
??cal_offset_6:
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??cal_offset_5
//  120     {
//  121       offsetTemp =  - first_offset[1];
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+4]
        EORS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
//  122     }
//  123     
//  124     //offsetTemp = his_offset[0];
//  125   }
//  126 
//  127   if(AD_result[1]>AD_result[0] && AD_result[1]>AD_result[2])
??cal_offset_5:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS.N    ??cal_offset_7
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+8]
        LDR.N    R1,??DataTable2_3
        LDR      R1,[R1, #+4]
        BL       __aeabi_cfcmple
        BCS.N    ??cal_offset_7
//  128   {
//  129     offsetTemp = first_offset[0];
        LDR.N    R0,??DataTable2_12
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
//  130   }
//  131 //  
//  132 //  if(AD_result[1]>40 &&fabs(first_offset[1])>0.35 && fabs(first_offset[0])< 0.2 && straightTime > 200)
//  133 //  {
//  134 //    offsetTemp = first_offset[0];
//  135 //  }
//  136 //  
//  137 //  if(runTime<200)
//  138 //  {
//  139 //    offsetTemp = first_offset[0];
//  140 //  }
//  141   
//  142   if(offsetTemp - 0.6 > 0)
??cal_offset_7:
        LDR.N    R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable2_18  ;; 0xbfe33333
        BL       __aeabi_dadd
        MOVS     R2,#+0
        MOVS     R3,#+0
        BL       __aeabi_cdrcmple
        BCS.N    ??cal_offset_8
//  143   {
//  144     offsetTemp = 0.6;
        LDR.N    R0,??DataTable2_19  ;; 0x3f19999a
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
        B.N      ??cal_offset_9
//  145   }else if(offsetTemp + 0.6 < 0)
??cal_offset_8:
        LDR.N    R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R2,#+858993459
        LDR.N    R3,??DataTable2_14  ;; 0x3fe33333
        BL       __aeabi_dadd
        MOVS     R2,#+0
        MOVS     R3,#+0
        BL       __aeabi_cdcmple
        BCS.N    ??cal_offset_9
//  146   {
//  147     offsetTemp = -0.6;
        LDR.N    R0,??DataTable2_20  ;; 0xbf19999a
        LDR.N    R1,??DataTable2_17
        STR      R0,[R1, #+0]
//  148   }
//  149   
//  150 //  offset = offsetTemp;
//  151   
//  152 ////  second_offset = offset;
//  153   offset = offsetTemp*0.2
//  154            + his_offset[1]*0.2
//  155            + his_offset[2]*0.2
//  156            + his_offset[3]*0.2
//  157            + his_offset[4]*0.2;
??cal_offset_9:
        LDR.N    R0,??DataTable2_17
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_22
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_22
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_22
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable2_22
        LDR      R0,[R0, #+16]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable2_15  ;; 0x9999999a
        LDR.N    R3,??DataTable2_21  ;; 0x3fc99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable2_23
        STR      R0,[R1, #+0]
//  158 //  
//  159 //
//  160 //  
//  161   for(i = 4;i>0;i--)
        MOVS     R0,#+4
        LDR.N    R1,??DataTable2_24
        STR      R0,[R1, #+0]
        B.N      ??cal_offset_10
//  162   {
//  163     his_offset[i] = his_offset[i-1];
??cal_offset_11:
        LDR.N    R0,??DataTable2_22
        LDR.N    R1,??DataTable2_24
        LDR      R1,[R1, #+0]
        ADDS     R0,R0,R1, LSL #+2
        LDR      R0,[R0, #-4]
        LDR.N    R1,??DataTable2_22
        LDR.N    R2,??DataTable2_24
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
//  164   }
        LDR.N    R0,??DataTable2_24
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+1
        LDR.N    R1,??DataTable2_24
        STR      R0,[R1, #+0]
??cal_offset_10:
        LDR.N    R0,??DataTable2_24
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BGE.N    ??cal_offset_11
//  165   his_offset[0] = offset;
        LDR.N    R0,??DataTable2_23
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_22
        STR      R0,[R1, #+0]
//  166 
//  167 }
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     channel

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     AD_temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     AD_result

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     AD1Basic

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     0x40290000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     0x404e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     nowADBase

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     0x437e0001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     0x437e0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     first_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     0x3fe66666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     0x3fe33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     0x3fd99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     offsetTemp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     0xbfe33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     0x3f19999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     0xbf19999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     0x3fc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     his_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     ??i

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??i:
        DS8 4

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
//   344 bytes in section .bss
//    60 bytes in section .rodata
// 1 334 bytes in section .text
// 
// 1 334 bytes of CODE  memory
//    60 bytes of CONST memory
//   344 bytes of DATA  memory
//
//Errors: none
//Warnings: none
