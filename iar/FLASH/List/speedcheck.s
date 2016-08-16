///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:17
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speedcheck.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speedcheck.c -D
//        LPLD_K60 -D USE_K60D10 -lCN
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\speedcheck.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_DMA_EnableIrq
        EXTERN LPLD_DMA_Init
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_i2f
        EXTERN __aeabi_memcpy4

        PUBLIC DMA1_isr
        PUBLIC DMA2_isr
        PUBLIC DMA_Init
        PUBLIC DMA_Struct1
        PUBLIC DMA_Struct2
        PUBLIC Data1
        PUBLIC Data2
        PUBLIC GetMotorPulse
        PUBLIC Speed_LQ_now
        PUBLIC Speed_RQ_now
        PUBLIC ch0_over_cnt
        PUBLIC ch0_pulseacc
        PUBLIC ch1_over_cnt
        PUBLIC ch1_pulseacc
        PUBLIC speedPlus
        PUBLIC speed_L
        PUBLIC speed_R
        PUBLIC speed_avg

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speedcheck.c
//    1 #include "speedcheck.h"
//    2 
//    3 /************************测速变量**************************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 DMA_InitTypeDef    DMA_Struct1;
DMA_Struct1:
        DS8 44

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 DMA_InitTypeDef    DMA_Struct2;
DMA_Struct2:
        DS8 44

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 char Data1[1];//缓冲区
Data1:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    7 char Data2[1];
Data2:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 int ch0_over_cnt = 0;//通道溢出计数
ch0_over_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int ch1_over_cnt = 0;
ch1_over_cnt:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int  ch0_pulseacc;//脉冲累加值计数  
ch0_pulseacc:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 int  ch1_pulseacc;
ch1_pulseacc:
        DS8 4
//   12 //当前量

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float Speed_LQ_now[10]={0};
Speed_LQ_now:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 float Speed_RQ_now[10]={0};
Speed_RQ_now:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float speed_L=0;        //左轮速度
speed_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 float speed_R=0;        //右轮速度
speed_R:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 float speed_avg=0;     //平均速度
speed_avg:
        DS8 4
//   18 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   19 void GetMotorPulse()//5ms
//   20 {
GetMotorPulse:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   21   ch0_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH1].CITER_ELINKNO;     //获得最终的脉冲累加值
        MOVW     R0,#+32767
        LDR.N    R1,??DataTable3  ;; 0x40009036
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   22   ch1_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH2].CITER_ELINKNO;
        MOVW     R0,#+32767
        LDR.N    R1,??DataTable3_2  ;; 0x40009056
        LDRH     R1,[R1, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        SUBS     R0,R0,R1
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   23   if(ch0_over_cnt !=0)
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??GetMotorPulse_0
//   24   {
//   25     ch0_pulseacc = ch0_pulseacc + DMA_MAX_NUM*ch0_over_cnt;
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_4
        LDR      R1,[R1, #+0]
        MOVW     R2,#+32767
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   26     ch0_over_cnt = 0;             //清零溢出计数
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   27   }
//   28   if(ch1_over_cnt !=0)
??GetMotorPulse_0:
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??GetMotorPulse_1
//   29   {
//   30     ch1_pulseacc = ch1_pulseacc + DMA_MAX_NUM*ch1_over_cnt;
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_5
        LDR      R1,[R1, #+0]
        MOVW     R2,#+32767
        MLA      R0,R2,R1,R0
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   31     ch1_over_cnt = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_5
        STR      R0,[R1, #+0]
//   32   }
//   33   //初始化DMA模块
//   34   LPLD_DMA_Init(DMA_Struct1); //初始化DMA模块
??GetMotorPulse_1:
        LDR.N    R1,??DataTable3_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   35   LPLD_DMA_Init(DMA_Struct2);  
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   36   LPLD_DMA_EnableReq(DMA_CH1); //开启通道请求
        LDR.N    R0,??DataTable3_8  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_8  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   37   LPLD_DMA_EnableReq(DMA_CH2);
        LDR.N    R0,??DataTable3_8  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable3_8  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   38   
//   39   if(ch0_pulseacc-500 > 0)
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+500
        CMP      R0,#+1
        BLT.N    ??GetMotorPulse_2
//   40     ch0_pulseacc = 500;
        MOV      R0,#+500
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   41   if(ch1_pulseacc-500 > 0)
??GetMotorPulse_2:
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+500
        CMP      R0,#+1
        BLT.N    ??GetMotorPulse_3
//   42     ch1_pulseacc = 500;
        MOV      R0,#+500
        LDR.N    R1,??DataTable3_3
        STR      R0,[R1, #+0]
//   43   //计划5ms测速一次，更新数组中的最后一个值
//   44   if(PTB9_I) {Speed_LQ_now[9]=(float)ch0_pulseacc;}//左轮方向校准,右轮正转时编码器顺时针转，为高
??GetMotorPulse_3:
        LDR.N    R0,??DataTable3_9  ;; 0x43fe0a24
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??GetMotorPulse_4
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+36]
        B.N      ??GetMotorPulse_5
//   45   else  {Speed_LQ_now[9]=-(float)ch0_pulseacc;}
??GetMotorPulse_4:
        LDR.N    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        EORS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+36]
//   46   if(PTC16_I){Speed_RQ_now[9]=-(float)ch1_pulseacc;}//右轮方向校准，左轮正转时编码器逆时针转，为低
??GetMotorPulse_5:
        LDR.N    R0,??DataTable3_11  ;; 0x43fe1240
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??GetMotorPulse_6
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        EORS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable3_12
        STR      R0,[R1, #+36]
        B.N      ??GetMotorPulse_7
//   47   else  {Speed_RQ_now[9]=(float)ch1_pulseacc;}
??GetMotorPulse_6:
        LDR.N    R0,??DataTable3_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable3_12
        STR      R0,[R1, #+36]
//   48   
//   49   //数组中的值依次向前移动一个，去掉首个值，更新最后一个的值
//   50   for(int i=0;i<9;i++) //0到8,有9个值
??GetMotorPulse_7:
        MOVS     R0,#+0
        B.N      ??GetMotorPulse_8
//   51   {
//   52     Speed_LQ_now[i]=Speed_LQ_now[i+1];
??GetMotorPulse_9:
        LDR.N    R1,??DataTable3_10
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #+4]
        LDR.N    R2,??DataTable3_10
        STR      R1,[R2, R0, LSL #+2]
//   53     Speed_RQ_now[i]=Speed_RQ_now[i+1];
        LDR.N    R1,??DataTable3_12
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #+4]
        LDR.N    R2,??DataTable3_12
        STR      R1,[R2, R0, LSL #+2]
//   54   }
        ADDS     R0,R0,#+1
??GetMotorPulse_8:
        CMP      R0,#+9
        BLT.N    ??GetMotorPulse_9
//   55   //历史9次的值求个平均值得到当前的速度值，保证速度平缓变化
//   56   speed_L=speedPlus(Speed_LQ_now,9);//5ms
        MOVS     R1,#+9
        LDR.N    R0,??DataTable3_10
        BL       speedPlus
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//   57   speed_R=speedPlus(Speed_RQ_now,9);//5ms
        MOVS     R1,#+9
        LDR.N    R0,??DataTable3_12
        BL       speedPlus
        LDR.N    R1,??DataTable3_14
        STR      R0,[R1, #+0]
//   58   speed_avg=(speed_L+speed_R)/2;
        LDR.N    R0,??DataTable3_13
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable3_14
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable3_15
        STR      R0,[R1, #+0]
//   59   
//   60   //speed_control();//速度电机量计算
//   61   //speed_L=lvbo(Speed_LQ);//5ms
//   62   //speed_R=lvbo(Speed_RQ);//5ms
//   63 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   64 void DMA_Init(void)
//   65 {
DMA_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   66   DMA_Struct1.DMA_CHx=DMA_CH1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+0]
//   67   DMA_Struct1.DMA_Req=PORTB_DMAREQ;
        MOVS     R0,#+50
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+1]
//   68   DMA_Struct1.DMA_MajorLoopCnt=DMA_MAX_NUM;/*主循环次数*/
        MOVW     R0,#+32767
        LDR.N    R1,??DataTable3_6
        STRH     R0,[R1, #+4]
//   69   DMA_Struct1.DMA_MinorByteCnt=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+8]
//   70   DMA_Struct1.DMA_SourceAddr=(uint32)&PTB->PDIR;
        LDR.N    R0,??DataTable3_16  ;; 0x400ff050
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+12]
//   71   DMA_Struct1.DMA_DestAddr=(uint32)Data1;
        LDR.N    R0,??DataTable3_17
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+24]
//   72   DMA_Struct1.DMA_Isr=DMA1_isr;
        ADR.W    R0,DMA1_isr
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+40]
//   73   LPLD_DMA_Init(DMA_Struct1);
        LDR.N    R1,??DataTable3_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   74   
//   75   DMA_Struct2.DMA_CHx=DMA_CH2;
        MOVS     R0,#+2
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//   76   DMA_Struct2.DMA_Req=PORTC_DMAREQ;
        MOVS     R0,#+51
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+1]
//   77   DMA_Struct2.DMA_MajorLoopCnt=DMA_MAX_NUM;/*主循环次数*/
        MOVW     R0,#+32767
        LDR.N    R1,??DataTable3_7
        STRH     R0,[R1, #+4]
//   78   DMA_Struct2.DMA_MinorByteCnt=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+8]
//   79   DMA_Struct2.DMA_SourceAddr=(uint32)&PTC->PDIR+1;
        LDR.N    R0,??DataTable3_18  ;; 0x400ff091
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+12]
//   80   DMA_Struct2.DMA_DestAddr=(uint32)Data2;
        LDR.N    R0,??DataTable3_19
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+24]
//   81   DMA_Struct2.DMA_Isr=DMA2_isr;
        ADR.W    R0,DMA2_isr
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+40]
//   82   LPLD_DMA_Init(DMA_Struct2);
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   83   
//   84   LPLD_DMA_EnableReq(DMA_CH1);
        LDR.N    R0,??DataTable3_8  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable3_8  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   85   LPLD_DMA_EnableIrq(DMA_Struct1);
        LDR.N    R1,??DataTable3_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_EnableIrq
//   86   
//   87   LPLD_DMA_EnableReq(DMA_CH2);
        LDR.N    R0,??DataTable3_8  ;; 0x4000800c
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable3_8  ;; 0x4000800c
        STR      R0,[R1, #+0]
//   88   LPLD_DMA_EnableIrq(DMA_Struct2);      
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_EnableIrq
//   89 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   90 void DMA1_isr(void)
//   91 {
DMA1_isr:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   92   ch0_over_cnt++;//通道0溢出累加  
        LDR.N    R0,??DataTable3_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   93   LPLD_DMA_Init(DMA_Struct1); 
        LDR.N    R1,??DataTable3_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   94 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//   95 void DMA2_isr(void)
//   96 {
DMA2_isr:
        PUSH     {LR}
        SUB      SP,SP,#+28
//   97   ch1_over_cnt++;//通道1溢出累加
        LDR.N    R0,??DataTable3_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable3_5
        STR      R0,[R1, #+0]
//   98   LPLD_DMA_Init(DMA_Struct2); 
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+44
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_DMA_Init
//   99 }
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x40009036

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     ch0_pulseacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     0x40009056

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     ch1_pulseacc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     ch0_over_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     ch1_over_cnt

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     DMA_Struct1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     DMA_Struct2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     0x4000800c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x43fe0a24

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     Speed_LQ_now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x43fe1240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     Speed_RQ_now

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_14:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_15:
        DC32     speed_avg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_16:
        DC32     0x400ff050

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_17:
        DC32     Data1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_18:
        DC32     0x400ff091

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_19:
        DC32     Data2
//  100 //将测到的脉冲累加即为速度量

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  101 float speedPlus(float aa[],int number)
//  102 {
speedPlus:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  103 int i;
//  104 float speedNow=0;
        MOVS     R7,#+0
//  105 for(i=0;i<number;i++)
        MOVS     R6,#+0
        B.N      ??speedPlus_0
//  106 {
//  107 speedNow+=aa[i];
??speedPlus_1:
        LDR      R0,[R4, R6, LSL #+2]
        MOVS     R1,R7
        BL       __aeabi_fadd
        MOVS     R7,R0
//  108   }
        ADDS     R6,R6,#+1
??speedPlus_0:
        CMP      R6,R5
        BLT.N    ??speedPlus_1
//  109 return speedNow/number;//返回平均值
        MOVS     R0,R5
        BL       __aeabi_i2f
        MOVS     R1,R0
        MOVS     R0,R7
        BL       __aeabi_fdiv
        POP      {R1,R4-R7,PC}    ;; return
//  110 }

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
// 198 bytes in section .bss
// 764 bytes in section .text
// 
// 764 bytes of CODE memory
// 198 bytes of DATA memory
//
//Errors: none
//Warnings: none
