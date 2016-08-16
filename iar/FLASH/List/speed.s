///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       16/Aug/2016  22:12:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speed.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speed.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\speed.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN Fuzzy_Update
        EXTERN LPLD_FTM_PWM_ChangeDuty
        EXTERN My_Speed_Set
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_dsub
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2d
        EXTERN __aeabi_ui2d
        EXTERN __aeabi_ui2f
        EXTERN angle
        EXTERN curveTime
        EXTERN dChange
        EXTERN gyro_speed_y
        EXTERN his_offset
        EXTERN offset
        EXTERN runTime
        EXTERN speed_L
        EXTERN speed_R
        EXTERN speed_avg
        EXTERN straightTime

        PUBLIC AngleControlOut
        PUBLIC Angle_Zero
        PUBLIC D_dir_err
        PUBLIC D_err
        PUBLIC DirectSpeed
        PUBLIC DirectSpeedControlOut1
        PUBLIC DirectSpeedControlOut2
        PUBLIC Direct_P
        PUBLIC DirectionSpeedControl
        PUBLIC DirectionSpeedOut
        PUBLIC L_PowerValue
        PUBLIC Last_dir_err
        PUBLIC Motor_Control
        PUBLIC Motor_Stop
        PUBLIC Motor_TurnBack
        PUBLIC New_dir_err
        PUBLIC R_PowerValue
        PUBLIC SA
        PUBLIC SA_his
        PUBLIC Speed
        PUBLIC SpeedAlone_D1
        PUBLIC SpeedAlone_D2
        PUBLIC SpeedAlone_I1
        PUBLIC SpeedAlone_I2
        PUBLIC SpeedAlone_P1
        PUBLIC SpeedAlone_P2
        PUBLIC SpeedControlOut_L
        PUBLIC SpeedControlOut_R
        PUBLIC SpeedControlOutput
        PUBLIC SpeedControl_Integral
        PUBLIC SpeedError
        PUBLIC SpeedError1
        PUBLIC SpeedError2
        PUBLIC Speed_New
        PUBLIC Speed_Old
        PUBLIC Speed_Set
        PUBLIC Speederror1
        PUBLIC Speederror11
        PUBLIC Speederror12
        PUBLIC Speederror2
        PUBLIC Speederror21
        PUBLIC Speederror22
        PUBLIC angle_D
        PUBLIC angle_P
        PUBLIC angle_control
        PUBLIC avg_Power
        PUBLIC direct_time
        PUBLIC gyro_D
        PUBLIC quit_I
        PUBLIC speed_D
        PUBLIC speed_I
        PUBLIC speed_P
        PUBLIC speed_control
        PUBLIC speed_control_new1
        PUBLIC speed_control_new2
        PUBLIC speed_control_old1
        PUBLIC speed_control_old2
        PUBLIC speed_integral1
        PUBLIC speed_integral2
        PUBLIC speed_time
        PUBLIC speedgo_flag
        PUBLIC speedout1
        PUBLIC speedout2

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\speed.c
//    1 #include "speed.h"
//    2 #include "math.h"
//    3 #include "Fuzzy.h"
//    4 #define SPEED_VALUE           0.1105                                //速度换算系数 0.1105
//    5 
//    6 //#define SPEED_TIME   50  //50MS       5ms更新一个数据，取历史45ms中的9个数据平均值来计算速度量
//    7 #define DIRECT_TIME  10  //10MS
//    8 #define SA_START 13

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int speed_time=0;
speed_time:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int direct_time=0;
direct_time:
        DS8 4
//   11 /******************方向控制变量定义*******************/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 float DirectSpeed=0,New_dir_err=0,Last_dir_err=0,D_dir_err=0;//控制定义
DirectSpeed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
New_dir_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Last_dir_err:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
D_dir_err:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   13 float gyro_D=150;
gyro_D:
        DATA
        DC32 43160000H
//   14 //目标速度量

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float speedout1=0,speedout2=0;
speedout1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speedout2:
        DS8 4
//   16 //单电机差速控制变量

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   17 float SpeedAlone_P1=300,SpeedAlone_P2=300;
SpeedAlone_P1:
        DATA
        DC32 43960000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
SpeedAlone_P2:
        DATA
        DC32 43960000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   18 float SpeedAlone_D1=2500,SpeedAlone_D2=2500;
SpeedAlone_D1:
        DATA
        DC32 451C4000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
SpeedAlone_D2:
        DATA
        DC32 451C4000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float SpeedAlone_I1=0,SpeedAlone_I2=0;
SpeedAlone_I1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedAlone_I2:
        DS8 4
//   20 //差速控制量

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float speed_control_old1=0,speed_control_new1=0,speed_control_old2=0,speed_control_new2=0;  //速度控制量
speed_control_old1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_control_new1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_control_old2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_control_new2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   22 float speed_integral1=0,speed_integral2=0;                                                  //速度控制积分
speed_integral1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_integral2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   23 float Speederror11=0,Speederror12=0,SpeedError1=0;
Speederror11:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speederror12:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedError1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   24 float Speederror21=0,Speederror22=0,SpeedError2=0;
Speederror21:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speederror22:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedError2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   25 float DirectSpeedControlOut1=0,DirectSpeedControlOut2=0;
DirectSpeedControlOut1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
DirectSpeedControlOut2:
        DS8 4
//   26 /*********速度控制变量定义********/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   27 float SA=0;
SA:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   28 float SA_his[15] = {SA_START, SA_START, SA_START, SA_START, SA_START,
SA_his:
        DATA
        DC32 41500000H, 41500000H, 41500000H, 41500000H, 41500000H, 41500000H
        DC32 41500000H, 41500000H, 41500000H, 41500000H, 41500000H, 41500000H
        DC32 41500000H, 41500000H, 41500000H
//   29 SA_START, SA_START, SA_START, SA_START, SA_START,
//   30 SA_START, SA_START, SA_START, SA_START, SA_START};
//   31 //float SA_var[10] = {0.35, 0.25, 0.17, 0.12, 0.1};

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//   32 uint8 speedgo_flag=0;//车子开环、闭环标志
speedgo_flag:
        DS8 1
//   33 //速度系数量    P-350  I- 0.5          

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   34 float Speed_Set=0,speed_P=0,speed_I=0,speed_D=0,SpeedControl_Integral=0;
Speed_Set:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_P:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_I:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
speed_D:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedControl_Integral:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   35 float quit_I=0;//用来计数，防止撞车时暴走
quit_I:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   36 float Angle_Zero=MMA8451_Y;
Angle_Zero:
        DATA
        DC32 0BF800000H
//   37 //速度控制变量   

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   38 float Speed=0,Speed_Old=0,Speed_New=0,SpeedError,Speederror1,Speederror2;//速度控制中间量
Speed:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_Old:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speed_New:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedError:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speederror1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
Speederror2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   39 float SpeedControlOut_L=0, SpeedControlOut_R=0;//速度控制输出量
SpeedControlOut_L:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedControlOut_R:
        DS8 4
//   40 /*********角度控制系数量**********/           

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   41 float angle_P=1500,angle_D=10/16.0;//2000 10  5/16.0
angle_P:
        DATA
        DC32 44BB8000H

        SECTION `.data`:DATA:REORDER:NOROOT(2)
angle_D:
        DATA
        DC32 3F200000H

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   42 float AngleControlOut=0;//角度控制输出变量
AngleControlOut:
        DS8 4
//   43 /****总控制变量****/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   44 float L_PowerValue=0;//左电机总控输出量
L_PowerValue:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   45 float R_PowerValue=0;//右电机总控输出量  
R_PowerValue:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   46 float avg_Power = 0;
avg_Power:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 float D_err = 0;
D_err:
        DS8 4
//   48 /******标志位量*******/
//   49 //int FB_Flag =0;//标志电机的当前转况
//   50 
//   51 //--------------外部变量使用------------//
//   52 extern float angle,gyro_speed_y,gyro_speed_x,gyro_speed_x,speed_L,speed_R,speed_avg;
//   53 extern float offset,speed_L_real,speed_R_real,speed_avg_real;
//   54 extern uint32 direct_start,time_flag;
//   55 extern float first_offset[2];
//   56 extern float AD_result[5];
//   57 extern float his_offset[5];
//   58 extern int RUN_TIME;
//   59 extern int curveTime;

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   60 FuzzyStruct Direct_P = { //模糊方向P
Direct_P:
        DATA
        DC8 7, 0, 0, 0
        DC32 0H, 0H, 0C2700000H, 0C2200000H, 0C1A00000H, 0H, 41A00000H
        DC32 42200000H, 42700000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 0C1200000H, 0C1000000H, 0C0A00000H, 0H, 40A00000H, 41000000H
        DC32 41200000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 438C0000H, 43938000H, 439B0000H, 43AA0000H, 43B90000H, 43C80000H
        DC32 43D70000H
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 6, 6, 6, 5, 5, 5, 5
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 5, 4, 4, 3, 2, 2, 1
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 4, 3, 2, 1, 0, 1, 2
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 4, 3, 1, 0, 1, 3, 4
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 2, 1, 0, 1, 2, 3, 4
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 1, 2, 2, 3, 4, 4, 5
        DC8 0, 0, 0, 0, 0, 0, 0, 0
        DC32 5, 5, 5, 5, 6, 6, 6
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
//   61   Fuzzy_Rank7,
//   62   0,
//   63   0,
//   64   { -60, -40, -20, 0, 20, 40, 60 }, //{ -70, -30, -15, 0, 15, 30, 70 },
//   65   { -10, -8, -5,  0,  5, 8, 10 },// { -10, -8, -5,  0,  5, 8, 10 },
//   66   //  {  10, 11, 11, 12, 12,13, 13  },
//   67   //  {  850, 880, 930, 955, 960,970, 985  },
//   68   {  280, 295, 310, 340, 370,400, 430  },//华南赛使用
//   69   //{  300, 310, 320, 330, 340,330, 320  },//小-大-小
//   70   //  {  750, 760, 880, 945, 1000,1050, 1100  },
//   71   {
//   72     { 6, 6, 6, 5, 5, 5, 5, },   //   -3   
//   73     { 5, 4, 4, 3, 2, 2, 1, },   //   -2 
//   74     { 4, 3, 2, 1, 0, 1, 2, },   //   -1 
//   75     { 4, 3, 1, 0, 1, 3, 4, },   //    0 
//   76     { 2, 1, 0, 1, 2, 3, 4, },   //    1 
//   77     { 1, 2, 2, 3, 4, 4, 5, },   //    2 
//   78     { 5, 5, 5, 5, 6, 6, 6, },   //    3
//   79   }
//   80 };
//   81 
//   82 
//   83 //-------------角度控制函数---------//
//   84 extern int straightTime;
//   85 extern  int runTime;
//   86 //float useAngle = 0;
//   87 //float useAngleHis[15] = {0};

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   88 void angle_control(void) //5ms
//   89 { 
angle_control:
        PUSH     {R3-R7,LR}
//   90   float nP=0,nD=0,nSpeed=0;
        MOVS     R4,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
//   91   
//   92   if(runTime > 250)
        LDR.W    R2,??DataTable4
        LDR      R2,[R2, #+0]
        CMP      R2,#+251
        BLT.N    ??angle_control_0
//   93   {
//   94     nP=-angle_P*(angle-Angle_Zero+SA);//
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable4_3
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable4_4
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//   95   }else if(runTime > 150)
??angle_control_0:
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+151
        BLT.N    ??angle_control_2
//   96   {
//   97     nP=-angle_P*(angle-Angle_Zero+17-(runTime-200)/50.0);
        LDR.W    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable4_5  ;; 0x41880000
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+200
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_6  ;; 0x40490000
        BL       __aeabi_ddiv
        MOVS     R2,R0
        MOVS     R3,R1
        MOVS     R0,R4
        MOVS     R1,R5
        BL       __aeabi_dsub
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R4,R0
        B.N      ??angle_control_1
//   98   }else if(runTime > 100)
??angle_control_2:
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??angle_control_3
//   99   {
//  100     nP=-angle_P*(angle-Angle_Zero+17);
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable4_5  ;; 0x41880000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable4_4
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//  101   }else if(runTime > 80)
??angle_control_3:
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+81
        BLT.N    ??angle_control_4
//  102   {
//  103     nP=-angle_P*(angle-Angle_Zero+(runTime-80)/1.17);
        LDR.W    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+80
        BL       __aeabi_i2d
        LDR.W    R2,??DataTable4_7  ;; 0xeb851eb8
        LDR.W    R3,??DataTable4_8  ;; 0x3ff2b851
        BL       __aeabi_ddiv
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R4,R0
        B.N      ??angle_control_1
//  104   }else if(runTime >40)
??angle_control_4:
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+41
        BLT.N    ??angle_control_5
//  105   {
//  106     nP=-angle_P*(angle-Angle_Zero);
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable4_2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable4_4
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//  107   }else
//  108   {
//  109     nP=-angle_P*(angle-(13-runTime/3.0));
??angle_control_5:
        LDR.W    R0,??DataTable4_4
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable4
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable7  ;; 0x40080000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable7_1  ;; 0x402a0000
        BL       __aeabi_dsub
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R2,R6
        MOVS     R3,R7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        MOVS     R4,R0
//  110   }
//  111   
//  112   
//  113 //  if(runTime < 80)
//  114 //  {
//  115 //    if(runTime < 40)
//  116 //    {
//  117 //      nP=-angle_P*(angle-(13-runTime/4.0));
//  118 //    }else
//  119 //    {
//  120 //      nP=-angle_P*(angle-Angle_Zero);
//  121 //    }
//  122 //    
//  123 //  }else if(runTime < 300)
//  124 //  {
//  125 //    if(runTime < 100)
//  126 //    {
//  127 //      nP=-angle_P*(angle-Angle_Zero+runTime-80);
//  128 //    }else
//  129 //    {
//  130 //      nP=-angle_P*(angle-Angle_Zero+20);
//  131 //    }
//  132 //    
//  133 //  }
//  134 //  else{
//  135 //    if(runTime < 400)
//  136 //    {
//  137 //      nP=-angle_P*(angle-Angle_Zero+20-(runTime-300)/15.0);
//  138 //    }else
//  139 //    {
//  140 //      nP=-angle_P*(angle-Angle_Zero+5+SA);//angle-MMA8451_Y+4   +3
//  141 //    }
//  142 //    
//  143 //  }
//  144 //  
//  145   nD = -angle_D*(gyro_speed_y);
??angle_control_1:
        LDR.W    R0,??DataTable7_2
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR.W    R0,??DataTable7_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R1,R0
//  146   nSpeed = nP + nD;
        MOVS     R0,R4
        BL       __aeabi_fadd
//  147   
//  148   //对直立量限幅
//  149   if(nSpeed < -Angle_POWER) 
        LDR.W    R1,??DataTable7_4  ;; 0xc5dac000
        BL       __aeabi_cfcmple
        BCS.N    ??angle_control_6
//  150     nSpeed= -Angle_POWER;
        LDR.W    R0,??DataTable7_4  ;; 0xc5dac000
        B.N      ??angle_control_7
//  151   else if(nSpeed > Angle_POWER)     
??angle_control_6:
        LDR.W    R1,??DataTable7_5  ;; 0x45dac001
        BL       __aeabi_cfrcmple
        BHI.N    ??angle_control_7
//  152     nSpeed= Angle_POWER;
        LDR.W    R0,??DataTable7_6  ;; 0x45dac000
//  153   
//  154   AngleControlOut = nSpeed;
??angle_control_7:
        LDR.W    R1,??DataTable7_7
        STR      R0,[R1, #+0]
//  155 }
        POP      {R0,R4-R7,PC}    ;; return
//  156 
//  157 //--------------------速度控制---------------------// 
//  158 //速度PID控制函数
//  159 extern uint8 dChange;
//  160 extern uint32 My_Speed_Set;
//  161 extern int speedChangeTime;
//  162 extern uint8 speedChangeFlag;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  163 void speed_control(void) //50ms
//  164 {
speed_control:
        PUSH     {R4-R8,LR}
//  165   float fP=0,fI=0,fD=0;//PID量
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//  166   float speed=0,speedout=0;//速度差距量
        MOVS     R4,#+0
        MOVS     R8,#+0
//  167   
//  168   speed=(speed_L+speed_R)/2;//车轮的平均速度脉冲
        LDR.W    R0,??DataTable7_8
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R4,R0
//  169   //  if(direct_start==1)//开跑
//  170   //  {
//  171   
//  172   Angle_Zero=MMA8451_Y;
        LDR.W    R0,??DataTable7_10  ;; 0xbf800000
        LDR.W    R1,??DataTable4_2
        STR      R0,[R1, #+0]
//  173   if(My_Speed_Set>160)
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        CMP      R0,#+161
        BCC.N    ??speed_control_0
//  174   {
//  175     if(straightTime>200)
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BLT.N    ??speed_control_1
//  176     {
//  177       Speed_Set = My_Speed_Set*0.80;
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_13  ;; 0x9999999a
        LDR.W    R3,??DataTable7_14  ;; 0x3fe99999
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  178     }else if(straightTime>150)
??speed_control_1:
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+151
        BLT.N    ??speed_control_3
//  179     {
//  180       Speed_Set = My_Speed_Set*0.85;
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable7_16  ;; 0x3feb3333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  181     }else if(straightTime>100)
??speed_control_3:
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??speed_control_4
//  182     {
//  183       Speed_Set = My_Speed_Set*0.9;
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_17  ;; 0xcccccccd
        LDR.W    R3,??DataTable7_18  ;; 0x3feccccc
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  184     }else if(straightTime>50)
??speed_control_4:
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+51
        BLT.N    ??speed_control_5
//  185     {
//  186       Speed_Set = My_Speed_Set*0.95;
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable7_19  ;; 0x3fee6666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  187     }
//  188     else if(straightTime<10)
??speed_control_5:
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE.N    ??speed_control_2
//  189     {
//  190       Speed_Set = 200;
        LDR.W    R0,??DataTable7_20  ;; 0x43480000
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
//  191     }
//  192     if(Speed_Set<160)
??speed_control_2:
        LDR.W    R0,??DataTable7_15
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_21  ;; 0x43200000
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_6
//  193     {
//  194       Speed_Set = 160;
        LDR.W    R0,??DataTable7_21  ;; 0x43200000
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  195     }
//  196   }else //  <=160
//  197   {
//  198     // Speed_Set = My_Speed_Set;
//  199     if(straightTime>10)
??speed_control_0:
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??speed_control_7
//  200     {
//  201       //PTC5_O=0;
//  202       Speed_Set = My_Speed_Set;
        LDR.W    R0,??DataTable7_11
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  203     }
//  204     else
//  205     {
//  206       //PTC5_O=1;
//  207       Speed_Set =200; //My_Speed_Set*1.3;
??speed_control_7:
        LDR.W    R0,??DataTable7_20  ;; 0x43480000
        LDR.W    R1,??DataTable7_15
        STR      R0,[R1, #+0]
//  208     }
//  209     
//  210   }
//  211   /*if(straightTime>10 && speed_avg / My_Speed_Set < 0.8)
//  212   {
//  213     Speed_Set = My_Speed_Set;
//  214   }*/ 
//  215   
//  216   /*if(runTime < speedChangeTime && speedChangeFlag == 1 &&  My_Speed_Set > 150)
//  217   {
//  218     Speed_Set = 145;
//  219   }*/
//  220   //  Speed_Set=My_Speed_Set;
//  221   //    if(Speed_Set==0) Speed_Set=Speed_MAX;
//  222   //    if(straightTime > 20 )
//  223   //    {
//  224   //      Speed_Set = Speed_MAX;
//  225   //    }else{
//  226   //      Speed_Set = Speed_MAX+30;
//  227   //    }
//  228   
//  229   speedout=Speed_Set-speed;//当前误差量
??speed_control_6:
        LDR.W    R0,??DataTable7_15
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fsub
        MOV      R8,R0
//  230   speed_P=SpeedP;
        LDR.W    R0,??DataTable7_22  ;; 0x437a0000
        LDR.W    R1,??DataTable7_23
        STR      R0,[R1, #+0]
//  231   speed_I=SpeedI;
        LDR.W    R0,??DataTable7_24  ;; 0x43fa0000
        LDR.W    R1,??DataTable7_25
        STR      R0,[R1, #+0]
//  232   speed_D=SpeedD;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable7_26
        STR      R0,[R1, #+0]
//  233   // }
//  234   //  else //延时：等待发车
//  235   //  {
//  236   //    speedout=Speed_Set-Speed;
//  237   //    Speed_Set=0;
//  238   //    speed_P=0;
//  239   //    speed_I=0;
//  240   //    speed_D=0;
//  241   //  }
//  242   //----------------------速度PID运算--------------------------//
//  243   Speederror2=Speederror1;
        LDR.W    R0,??DataTable7_27
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_28
        STR      R0,[R1, #+0]
//  244   Speederror1=speedout;      
        LDR.W    R0,??DataTable7_27
        STR      R8,[R0, #+0]
//  245   SpeedError=Speederror1-Speederror2;     //当前值与过去值的差
        LDR.W    R0,??DataTable7_27
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_28
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_29
        STR      R0,[R1, #+0]
//  246   
//  247   fP=speed_P*speedout;                    //比例量
        LDR.W    R0,??DataTable7_23
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R5,R0
//  248   fI=speed_I*speedout;
        LDR.W    R0,??DataTable7_25
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R6,R0
//  249   fD=speed_D*SpeedError;                  //微分量
        LDR.W    R0,??DataTable7_26
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_29
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R7,R0
//  250   SpeedControl_Integral+=fI;              //积分量
        LDR.W    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_30
        STR      R0,[R1, #+0]
//  251   //给积分量限幅
//  252   if(SpeedControl_Integral>SpeedIntegral_MAX)      SpeedControl_Integral=SpeedIntegral_MAX;
        LDR.W    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_31  ;; 0x455ac001
        BL       __aeabi_cfrcmple
        BHI.N    ??speed_control_8
        LDR.W    R0,??DataTable7_32  ;; 0x455ac000
        LDR.W    R1,??DataTable7_30
        STR      R0,[R1, #+0]
        B.N      ??speed_control_9
//  253   else if(SpeedControl_Integral<-SpeedIntegral_MAX) SpeedControl_Integral=-SpeedIntegral_MAX;
??speed_control_8:
        LDR.W    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_33  ;; 0xc55ac000
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_9
        LDR.W    R0,??DataTable7_33  ;; 0xc55ac000
        LDR.W    R1,??DataTable7_30
        STR      R0,[R1, #+0]
//  254   
//  255   Speed_Old=Speed_New;
??speed_control_9:
        LDR.W    R0,??DataTable7_34
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_35
        STR      R0,[R1, #+0]
//  256   Speed_New=fP+fD+SpeedControl_Integral;
        MOVS     R0,R5
        MOVS     R1,R7
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_30
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_34
        STR      R0,[R1, #+0]
//  257 }
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  258 void SpeedControlOutput(void)//5ms
//  259 {
SpeedControlOutput:
        PUSH     {R3-R5,LR}
//  260   float nSpeedOut;
//  261   int i = 0;
        MOVS     R0,#+0
//  262   for(i=14;i>0;i--)
        MOVS     R1,#+14
        MOVS     R0,R1
        B.N      ??SpeedControlOutput_0
//  263   {
//  264     SA_his[i] = SA_his[i-1];
??SpeedControlOutput_1:
        LDR.W    R1,??DataTable7_36
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #-4]
        LDR.W    R2,??DataTable7_36
        STR      R1,[R2, R0, LSL #+2]
//  265   }
        SUBS     R0,R0,#+1
??SpeedControlOutput_0:
        CMP      R0,#+1
        BGE.N    ??SpeedControlOutput_1
//  266   nSpeedOut=Speed_New-Speed_Old;
        LDR.W    R0,??DataTable7_34
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_35
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
//  267   nSpeedOut=nSpeedOut+Speed_Old;//速度量分成10份平缓输出 /SPEED_TIME*speed_time
        LDR.W    R1,??DataTable7_35
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
//  268   SA=nSpeedOut/SA_Exchange;
        LDR.W    R1,??DataTable7_37  ;; 0x44fa0000
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable4_3
        STR      R0,[R1, #+0]
//  269   
//  270   SA = SA * 0.1
//  271   + SA_his[1] * 0.1
//  272   + SA_his[2] * 0.09
//  273   + SA_his[3] * 0.09  //0.38
//  274   + SA_his[4] * 0.08  
//  275   + SA_his[5] * 0.08
//  276   + SA_his[6] * 0.07 
//  277   + SA_his[7] * 0.07  //+0.3
//  278   + SA_his[8] * 0.06 
//  279   + SA_his[9] * 0.06
//  280   + SA_his[10] * 0.05
//  281   + SA_his[11] * 0.05//0.22
//  282   + SA_his[12] * 0.04 
//  283   + SA_his[13] * 0.03
//  284   + SA_his[14] * 0.03;//0.08
        LDR.W    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_13  ;; 0x9999999a
        LDR.W    R3,??DataTable7_38  ;; 0x3fb99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_13  ;; 0x9999999a
        LDR.W    R3,??DataTable7_38  ;; 0x3fb99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_39  ;; 0x70a3d70a
        LDR.W    R3,??DataTable7_40  ;; 0x3fb70a3d
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_39  ;; 0x70a3d70a
        LDR.W    R3,??DataTable7_40  ;; 0x3fb70a3d
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+16]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_41  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_42  ;; 0x3fb47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+20]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_41  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_42  ;; 0x3fb47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+24]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_43  ;; 0x1eb851ec
        LDR.W    R3,??DataTable7_44  ;; 0x3fb1eb85
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+28]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_43  ;; 0x1eb851ec
        LDR.W    R3,??DataTable7_44  ;; 0x3fb1eb85
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+32]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable4_7  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_45  ;; 0x3faeb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+36]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable4_7  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_45  ;; 0x3faeb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+40]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_13  ;; 0x9999999a
        LDR.W    R3,??DataTable7_46  ;; 0x3fa99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+44]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_13  ;; 0x9999999a
        LDR.W    R3,??DataTable7_46  ;; 0x3fa99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+48]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_41  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_47  ;; 0x3fa47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+52]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_7  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_48  ;; 0x3f9eb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_36
        LDR      R0,[R0, #+56]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_7  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_48  ;; 0x3f9eb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_3
        STR      R0,[R1, #+0]
//  285   
//  286   SA_his[0] = SA;
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_36
        STR      R0,[R1, #+0]
//  287   
//  288   
//  289   if(SA>Angle_Max) SA=Angle_Max;
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_49  ;; 0x41800001
        BL       __aeabi_cfrcmple
        BHI.N    ??SpeedControlOutput_2
        MOVS     R0,#+1098907648
        LDR.N    R1,??DataTable4_3
        STR      R0,[R1, #+0]
        B.N      ??SpeedControlOutput_3
//  290   else if(SA<-Angle_Max) SA=-Angle_Max;
??SpeedControlOutput_2:
        LDR.N    R0,??DataTable4_3
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_50  ;; 0xc1800000
        BL       __aeabi_cfcmple
        BCS.N    ??SpeedControlOutput_3
        LDR.W    R0,??DataTable7_50  ;; 0xc1800000
        LDR.N    R1,??DataTable4_3
        STR      R0,[R1, #+0]
//  291   
//  292 
//  293 }
??SpeedControlOutput_3:
        POP      {R0,R4,R5,PC}    ;; return
//  294 /***********************方向控制函数*****************************/
//  295 /***********差速量计算***********/
//  296 extern float speed_avg;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  297 void DirectionSpeedControl(void)//10ms
//  298 {
DirectionSpeedControl:
        PUSH     {R4-R8,LR}
//  299   float fP1=0,fP2=0,fD1=0,fD2=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//  300   float avg_Speed = 0;
        MOVS     R8,#+0
//  301   New_dir_err=offset;
        LDR.W    R0,??DataTable7_51
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_52
        STR      R0,[R1, #+0]
//  302   D_dir_err=New_dir_err-Last_dir_err;
        LDR.W    R0,??DataTable7_52
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_53
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_54
        STR      R0,[R1, #+0]
//  303   D_err = New_dir_err - his_offset[4];
        LDR.W    R0,??DataTable7_52
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_55
        LDR      R1,[R1, #+16]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_56
        STR      R0,[R1, #+0]
//  304   
//  305   if(D_err*100 - 10 > 0)
        LDR.W    R0,??DataTable7_56
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_57  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_58  ;; 0xc1200000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_0
//  306     D_err = 0.1;
        LDR.W    R0,??DataTable7_59  ;; 0x3dcccccd
        LDR.W    R1,??DataTable7_56
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_1
//  307   else if(D_err*100 + 10 < 0)
??DirectionSpeedControl_0:
        LDR.W    R0,??DataTable7_56
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_57  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_60  ;; 0x41200000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_1
//  308     D_err = -0.1;
        LDR.W    R0,??DataTable7_61  ;; 0xbdcccccd
        LDR.W    R1,??DataTable7_56
        STR      R0,[R1, #+0]
//  309 
//  310   
//  311   //  if(direct_start==1)//开跑
//  312   //  {
//  313   SpeedAlone_P1 = Fuzzy_Update(&Direct_P,New_dir_err*100,D_err*100)+100;
??DirectionSpeedControl_1:
        LDR.W    R0,??DataTable7_56
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_57  ;; 0x42c80000
        BL       __aeabi_fmul
        MOVS     R2,R0
        MOVS     R4,R2
        LDR.W    R0,??DataTable7_52
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_57  ;; 0x42c80000
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R2,R4
        LDR.W    R0,??DataTable7_62
        BL       Fuzzy_Update
        LDR.W    R1,??DataTable7_57  ;; 0x42c80000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_63
        STR      R0,[R1, #+0]
//  314   //SpeedAlone_P1=1600;
//  315   SpeedAlone_P2 = SpeedAlone_P1;
        LDR.W    R0,??DataTable7_63
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_64
        STR      R0,[R1, #+0]
//  316   
//  317   //SpeedAlone_D1 = 2500;
//  318   //SpeedAlone_D1 = Fuzzy_Update(&Direct_D,New_dir_err*100,D_err*100);
//  319   if(runTime > 250)
        LDR.N    R0,??DataTable4
        LDR      R0,[R0, #+0]
        CMP      R0,#+251
        BLT.N    ??DirectionSpeedControl_2
//  320   {
//  321     //  SpeedAlone_D1 = SpeedAlone_P1*dChange;
//  322     if(straightTime>10 )
        LDR.W    R0,??DataTable7_12
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??DirectionSpeedControl_3
//  323     {
//  324       SpeedAlone_D1 = SpeedAlone_P1*dChange;
        LDR.W    R0,??DataTable7_65
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_63
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_66
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_4
//  325       
//  326       
//  327     }else if(curveTime > 10)
??DirectionSpeedControl_3:
        LDR.W    R0,??DataTable7_67
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??DirectionSpeedControl_4
//  328     {
//  329       SpeedAlone_D1 = SpeedAlone_P1 * (dChange);
        LDR.W    R0,??DataTable7_65
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_63
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_66
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_4
//  330       
//  331     }
//  332   }else{
//  333     SpeedAlone_D1 = 3000;
??DirectionSpeedControl_2:
        LDR.W    R0,??DataTable7_68  ;; 0x453b8000
        LDR.W    R1,??DataTable7_66
        STR      R0,[R1, #+0]
//  334   }
//  335   
//  336   if(SpeedAlone_D1>13000)
??DirectionSpeedControl_4:
        LDR.W    R0,??DataTable7_66
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_69  ;; 0x464b2001
        BL       __aeabi_cfrcmple
        BHI.N    ??DirectionSpeedControl_5
//  337     SpeedAlone_D1 = 13000;
        LDR.W    R0,??DataTable7_70  ;; 0x464b2000
        LDR.W    R1,??DataTable7_66
        STR      R0,[R1, #+0]
//  338   
//  339   SpeedAlone_D2 = SpeedAlone_D1;
??DirectionSpeedControl_5:
        LDR.W    R0,??DataTable7_66
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_71
        STR      R0,[R1, #+0]
//  340   //  }
//  341   //  else//起跑前等待 屏蔽方向控制
//  342   //  {
//  343   //    SpeedAlone_P1=SpeedAlone_P2=0;
//  344   //    SpeedAlone_D1=SpeedAlone_D2=0;
//  345   //  }
//  346   
//  347   Last_dir_err=New_dir_err;
        LDR.W    R0,??DataTable7_52
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_53
        STR      R0,[R1, #+0]
//  348   
//  349   
//  350   avg_Speed=speed_avg/13;
        LDR.W    R0,??DataTable7_72
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_73  ;; 0x41500000
        BL       __aeabi_fdiv
        MOV      R8,R0
//  351   if(avg_Speed - 2 < 0)
        MOVS     R0,#-1073741824
        MOV      R1,R8
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_6
//  352     avg_Speed = 2;
        MOVS     R8,#+1073741824
        B.N      ??DirectionSpeedControl_7
//  353   else if(avg_Speed - 12 > 0)
??DirectionSpeedControl_6:
        LDR.W    R0,??DataTable7_74  ;; 0xc1400000
        MOV      R1,R8
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_7
//  354     avg_Speed = 12;
        LDR.W    R8,??DataTable7_75  ;; 0x41400000
//  355   
//  356   speedout1= avg_Speed*offset;//左右轮预期速度值 按当前速度值计算出
??DirectionSpeedControl_7:
        LDR.W    R0,??DataTable7_51
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_76
        STR      R0,[R1, #+0]
//  357   Speederror12=Speederror11;
        LDR.W    R0,??DataTable7_77
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_78
        STR      R0,[R1, #+0]
//  358   Speederror11=10*offset;
        LDR.W    R0,??DataTable7_51
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_60  ;; 0x41200000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_77
        STR      R0,[R1, #+0]
//  359   
//  360 
//  361   SpeedError1=Speederror11-Speederror12;
        LDR.W    R0,??DataTable7_77
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_78
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_79
        STR      R0,[R1, #+0]
//  362   fP1=speedout1*SpeedAlone_P1;  //比例运算 
        LDR.W    R0,??DataTable7_76
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_63
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
//  363 
//  364 //  if(SpeedError1 - 0.5 > 0)
//  365 //    SpeedError1 = 0.5;
//  366 //  else if(SpeedError1 + 0.5 < 0)
//  367 //    SpeedError1 = -0.5;
//  368 
//  369   fD1=SpeedError1*SpeedAlone_D1; //微分运算
        LDR.W    R0,??DataTable7_79
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_66
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R6,R0
//  370   
//  371    if(fD1 - 5000 > 0)
        LDR.W    R0,??DataTable7_80  ;; 0xc59c4000
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_8
//  372     fD1 = 5000;
        LDR.W    R6,??DataTable7_81  ;; 0x459c4000
        B.N      ??DirectionSpeedControl_9
//  373   else if(fD1 + 5000 < 0)
??DirectionSpeedControl_8:
        LDR.W    R0,??DataTable7_81  ;; 0x459c4000
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_9
//  374     fD1 = -5000;
        LDR.W    R6,??DataTable7_80  ;; 0xc59c4000
//  375 //  if(fabs(fD1)>fabs(fP1))
//  376 //  {
//  377 //     if(fD1 > 0)
//  378 //       fD1 = fabs(fP1);
//  379 //     else
//  380 //       fD1 = - fabs(fP1);
//  381 //  }
//  382   speed_control_new1 = fP1+fD1;
??DirectionSpeedControl_9:
        MOVS     R0,R4
        MOVS     R1,R6
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_82
        STR      R0,[R1, #+0]
//  383   speed_control_new2 = -speed_control_new1;
        LDR.W    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        LDR.W    R1,??DataTable7_83
        STR      R0,[R1, #+0]
//  384 }
        POP      {R4-R8,PC}       ;; return
//  385 //差速度输出量

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  386 void DirectionSpeedOut(void)//5ms
//  387 {
DirectionSpeedOut:
        PUSH     {R7,LR}
//  388   DirectSpeedControlOut1 = speed_control_new1;
        LDR.W    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_84
        STR      R0,[R1, #+0]
//  389   DirectSpeedControlOut2 = speed_control_new2;
        LDR.W    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_85
        STR      R0,[R1, #+0]
//  390   /*方向控制输出量限幅*/
//  391   if(DirectSpeedControlOut1 < -Direct_POWER) 
        LDR.W    R0,??DataTable7_84
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_86  ;; 0xc53b8000
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedOut_0
//  392     DirectSpeedControlOut1= -Direct_POWER;
        LDR.W    R0,??DataTable7_86  ;; 0xc53b8000
        LDR.W    R1,??DataTable7_84
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedOut_1
//  393   else if(DirectSpeedControlOut1 > Direct_POWER)     
??DirectionSpeedOut_0:
        LDR.W    R0,??DataTable7_84
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_87  ;; 0x453b8001
        BL       __aeabi_cfrcmple
        BHI.N    ??DirectionSpeedOut_1
//  394     DirectSpeedControlOut1= Direct_POWER;
        LDR.W    R0,??DataTable7_68  ;; 0x453b8000
        LDR.W    R1,??DataTable7_84
        STR      R0,[R1, #+0]
//  395   
//  396   if(DirectSpeedControlOut2 < -Direct_POWER) 
??DirectionSpeedOut_1:
        LDR.W    R0,??DataTable7_85
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_86  ;; 0xc53b8000
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedOut_2
//  397     DirectSpeedControlOut2= -Direct_POWER;
        LDR.W    R0,??DataTable7_86  ;; 0xc53b8000
        LDR.W    R1,??DataTable7_85
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedOut_3
//  398   else if(DirectSpeedControlOut2> Direct_POWER)     
??DirectionSpeedOut_2:
        LDR.W    R0,??DataTable7_85
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_87  ;; 0x453b8001
        BL       __aeabi_cfrcmple
        BHI.N    ??DirectionSpeedOut_3
//  399     DirectSpeedControlOut2= Direct_POWER;
        LDR.N    R0,??DataTable7_68  ;; 0x453b8000
        LDR.W    R1,??DataTable7_85
        STR      R0,[R1, #+0]
//  400 }
??DirectionSpeedOut_3:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     runTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     Angle_Zero

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     SA

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     0x41880000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     0x40490000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0xeb851eb8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     0x3ff2b851
//  401 //---------------------角度+速度+方向总控制函数----------------------------------//
//  402 //总控制函数
//  403 extern int curveTime;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  404 void Motor_Control(void)
//  405 {
Motor_Control:
        PUSH     {R7,LR}
//  406 //  static float f_gyro_D;
//  407 //  if(gyro_speed_x+25<0)
//  408 //    gyro_speed_x = -25;
//  409 //  else if(gyro_speed_x - 25 > 0)
//  410 //    gyro_speed_x = 25;
//  411 //  
//  412 //  if(curveTime < 100)
//  413 //  {
//  414 //    gyro_D = 50 + curveTime;
//  415 //  }else{
//  416 //    gyro_D = 150;
//  417 //  }
//  418 //  f_gyro_D=gyro_speed_x*gyro_D;//陀螺仪限制打角过冲
//  419 //  
//  420 //  if(fabs(f_gyro_D)>fabs(AngleControlOut+DirectSpeedControlOut1)*0.8)
//  421 //  {
//  422 //    if(f_gyro_D>0)
//  423 //      f_gyro_D = fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//  424 //    else
//  425 //      f_gyro_D = - fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//  426 //  }
//  427   
//  428   L_PowerValue =AngleControlOut+DirectSpeedControlOut1;//+f_gyro_D;//-DirectSpeedControlOut2-SpeedControlOut_L
        LDR.N    R0,??DataTable7_7
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_84
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable7_88
        STR      R0,[R1, #+0]
//  429   R_PowerValue =AngleControlOut+DirectSpeedControlOut2;//-f_gyro_D;//-DirectSpeedControlOut1-SpeedControlOut_R
        LDR.N    R0,??DataTable7_7
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_85
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable7_89
        STR      R0,[R1, #+0]
//  430   
//  431   //电机死区量补偿
//  432 //  if(L_PowerValue>0)    L_PowerValue+=LeftMotor_Dead;
//  433 //  else if(L_PowerValue<0)   L_PowerValue-=LeftMotor_Dead;
//  434 //  if(R_PowerValue>0)    R_PowerValue+=RightMotor_Dead;
//  435 //  else if(R_PowerValue<0)   R_PowerValue-=RightMotor_Dead;
//  436   
//  437   if(L_PowerValue-3000 > 0 && R_PowerValue < 0) R_PowerValue = 0;
        LDR.N    R0,??DataTable7_88
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_86  ;; 0xc53b8000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_0
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_89
        STR      R0,[R1, #+0]
        B.N      ??Motor_Control_1
//  438   else if(R_PowerValue-3000 > 0 && L_PowerValue < 0) L_PowerValue = 0;
??Motor_Control_0:
        LDR.N    R0,??DataTable7_89
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_86  ;; 0xc53b8000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_1
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_88
        STR      R0,[R1, #+0]
//  439   //左电机限幅
//  440   if(L_PowerValue< -ADJUST_POWER)   L_PowerValue= -ADJUST_POWER;
??Motor_Control_1:
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_90  ;; 0xc6147000
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_2
        LDR.N    R0,??DataTable7_90  ;; 0xc6147000
        LDR.N    R1,??DataTable7_88
        STR      R0,[R1, #+0]
//  441   if(L_PowerValue> ADJUST_POWER)    L_PowerValue= ADJUST_POWER;
??Motor_Control_2:
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_91  ;; 0x46147001
        BL       __aeabi_cfrcmple
        BHI.N    ??Motor_Control_3
        LDR.N    R0,??DataTable7_92  ;; 0x46147000
        LDR.N    R1,??DataTable7_88
        STR      R0,[R1, #+0]
//  442   //右电机限幅               
//  443   if(R_PowerValue< -ADJUST_POWER)   R_PowerValue= -ADJUST_POWER;
??Motor_Control_3:
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_90  ;; 0xc6147000
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_4
        LDR.N    R0,??DataTable7_90  ;; 0xc6147000
        LDR.N    R1,??DataTable7_89
        STR      R0,[R1, #+0]
//  444   if(R_PowerValue> ADJUST_POWER)    R_PowerValue= ADJUST_POWER;
??Motor_Control_4:
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_91  ;; 0x46147001
        BL       __aeabi_cfrcmple
        BHI.N    ??Motor_Control_5
        LDR.N    R0,??DataTable7_92  ;; 0x46147000
        LDR.N    R1,??DataTable7_89
        STR      R0,[R1, #+0]
//  445   //左电机输出 
//  446   if(L_PowerValue>0)//正转
??Motor_Control_5:
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_6
//  447   {  
//  448     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,(int)L_PowerValue);       
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  449     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);  
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_7
//  450     //FB_Flag = 8;
//  451   }
//  452   else if(L_PowerValue<0)//反转
??Motor_Control_6:
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_8
//  453   { 
//  454     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  455     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,-(int)L_PowerValue);
        LDR.N    R0,??DataTable7_88
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        RSBS     R2,R0,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_7
//  456     //FB_Flag = 16;
//  457   } 
//  458   else//不转
//  459   {
//  460     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
??Motor_Control_8:
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  461     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  462     //FB_Flag = 32;
//  463   }
//  464   //右电机输出 
//  465   if(R_PowerValue>0)//正转
??Motor_Control_7:
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_9
//  466   {  
//  467     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);       
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  468     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,(int)R_PowerValue); 
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_10
//  469     //FB_Flag = 8;
//  470   }
//  471   else if(R_PowerValue<0)//反转
??Motor_Control_9:
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_11
//  472   {   
//  473     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,-(int)R_PowerValue);
        LDR.N    R0,??DataTable7_89
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        RSBS     R2,R0,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  474     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_10
//  475     //FB_Flag = 16;
//  476   } 
//  477   else//不转
//  478   {
//  479     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
??Motor_Control_11:
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  480     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  481     //FB_Flag = 32;
//  482   }
//  483 }
??Motor_Control_10:
        POP      {R0,PC}          ;; return
//  484 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  485 void Motor_Stop(void)
//  486 {
Motor_Stop:
        PUSH     {R7,LR}
//  487   //Left
//  488   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  489   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  490   
//  491   //Right
//  492   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  493   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  494 }
        POP      {R0,PC}          ;; return
//  495 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  496 void Motor_TurnBack(void)
//  497 {
Motor_TurnBack:
        PUSH     {R7,LR}
//  498   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  499   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,5000);
        MOVW     R2,#+5000
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  500   
//  501   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,5000);
        MOVW     R2,#+5000
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  502   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_93  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  503 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x40080000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x402a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     gyro_speed_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0xc5dac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x45dac001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x45dac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     AngleControlOut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     My_Speed_Set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     straightTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0x3fe99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     Speed_Set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     0x3feb3333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     0xcccccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     0x3feccccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_19:
        DC32     0x3fee6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_20:
        DC32     0x43480000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_21:
        DC32     0x43200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_22:
        DC32     0x437a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_23:
        DC32     speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_24:
        DC32     0x43fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_25:
        DC32     speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_26:
        DC32     speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_27:
        DC32     Speederror1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_28:
        DC32     Speederror2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_29:
        DC32     SpeedError

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_30:
        DC32     SpeedControl_Integral

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_31:
        DC32     0x455ac001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_32:
        DC32     0x455ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_33:
        DC32     0xc55ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_34:
        DC32     Speed_New

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_35:
        DC32     Speed_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_36:
        DC32     SA_his

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_37:
        DC32     0x44fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_38:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_39:
        DC32     0x70a3d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_40:
        DC32     0x3fb70a3d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_41:
        DC32     0x47ae147b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_42:
        DC32     0x3fb47ae1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_43:
        DC32     0x1eb851ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_44:
        DC32     0x3fb1eb85

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_45:
        DC32     0x3faeb851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_46:
        DC32     0x3fa99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_47:
        DC32     0x3fa47ae1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_48:
        DC32     0x3f9eb851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_49:
        DC32     0x41800001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_50:
        DC32     0xc1800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_51:
        DC32     offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_52:
        DC32     New_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_53:
        DC32     Last_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_54:
        DC32     D_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_55:
        DC32     his_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_56:
        DC32     D_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_57:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_58:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_59:
        DC32     0x3dcccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_60:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_61:
        DC32     0xbdcccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_62:
        DC32     Direct_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_63:
        DC32     SpeedAlone_P1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_64:
        DC32     SpeedAlone_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_65:
        DC32     dChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_66:
        DC32     SpeedAlone_D1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_67:
        DC32     curveTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_68:
        DC32     0x453b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_69:
        DC32     0x464b2001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_70:
        DC32     0x464b2000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_71:
        DC32     SpeedAlone_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_72:
        DC32     speed_avg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_73:
        DC32     0x41500000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_74:
        DC32     0xc1400000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_75:
        DC32     0x41400000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_76:
        DC32     speedout1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_77:
        DC32     Speederror11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_78:
        DC32     Speederror12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_79:
        DC32     SpeedError1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_80:
        DC32     0xc59c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_81:
        DC32     0x459c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_82:
        DC32     speed_control_new1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_83:
        DC32     speed_control_new2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_84:
        DC32     DirectSpeedControlOut1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_85:
        DC32     DirectSpeedControlOut2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_86:
        DC32     0xc53b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_87:
        DC32     0x453b8001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_88:
        DC32     L_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_89:
        DC32     R_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_90:
        DC32     0xc6147000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_91:
        DC32     0x46147001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_92:
        DC32     0x46147000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_93:
        DC32     0x40038000

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
//   177 bytes in section .bss
//   536 bytes in section .data
// 3 366 bytes in section .text
// 
// 3 366 bytes of CODE memory
//   713 bytes of DATA memory
//
//Errors: none
//Warnings: 2
