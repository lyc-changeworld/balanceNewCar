///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       16/Aug/2016  11:16:12
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
        DC32 43960000H, 439B0000H, 43A00000H, 43A50000H, 43AA0000H, 43A50000H
        DC32 43A00000H
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
//   68   //{  280, 295, 310, 340, 370,400, 430  },//华南赛使用
//   69   {  300, 310, 320, 330, 340,330, 320  },//小-大-小
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
        MOVS     R0,#+0
        MOVS     R1,#+0
//   91   
//   92   if(runTime > 250)
        LDR.W    R2,??DataTable3
        LDR      R2,[R2, #+0]
        CMP      R2,#+251
        BLT.N    ??angle_control_0
//   93   {
//   94     nP=-angle_P*(angle-Angle_Zero+SA);//
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable2_1
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//   95   }else if(runTime > 150)
??angle_control_0:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+151
        BLT.N    ??angle_control_2
//   96   {
//   97     nP=-angle_P*(angle-Angle_Zero+17-(runTime-200)/50.0);
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_3  ;; 0x41880000
        BL       __aeabi_fadd
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+200
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4  ;; 0x40490000
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
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??angle_control_3
//   99   {
//  100     nP=-angle_P*(angle-Angle_Zero+17);
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_3  ;; 0x41880000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//  101   }else if(runTime > 80)
??angle_control_3:
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+81
        BLT.N    ??angle_control_4
//  102   {
//  103     nP=-angle_P*(angle-Angle_Zero+(runTime-80)/1.17);
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        SUBS     R0,R0,#+80
        BL       __aeabi_i2d
        LDR.W    R2,??DataTable4_1  ;; 0xeb851eb8
        LDR.W    R3,??DataTable4_2  ;; 0x3ff2b851
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
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+41
        BLT.N    ??angle_control_5
//  105   {
//  106     nP=-angle_P*(angle-Angle_Zero);
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable2
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable3_2
        LDR      R1,[R1, #+0]
        EORS     R1,R1,#0x80000000
        BL       __aeabi_fmul
        MOVS     R4,R0
        B.N      ??angle_control_1
//  107   }else
//  108   {
//  109     nP=-angle_P*(angle-(13-runTime/3.0));
??angle_control_5:
        LDR.W    R0,??DataTable3_2
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        BL       __aeabi_f2d
        MOVS     R6,R0
        MOVS     R7,R1
        LDR.W    R0,??DataTable3_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable3
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_3  ;; 0x40080000
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.W    R3,??DataTable4_4  ;; 0x402a0000
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
        LDR.W    R0,??DataTable4_5
        LDR      R1,[R0, #+0]
        EORS     R1,R1,#0x80000000
        LDR.W    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
//  146   nSpeed = nP + nD;
        MOVS     R1,R4
        BL       __aeabi_fadd
        MOVS     R1,R0
//  147   AngleControlOut = nSpeed;
        LDR.W    R0,??DataTable7
        STR      R1,[R0, #+0]
//  148 }
        POP      {R0,R4-R7,PC}    ;; return
//  149 
//  150 //--------------------速度控制---------------------// 
//  151 //速度PID控制函数
//  152 extern uint8 dChange;
//  153 extern uint32 My_Speed_Set;
//  154 extern int speedChangeTime;
//  155 extern uint8 speedChangeFlag;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  156 void speed_control(void) //50ms
//  157 {
speed_control:
        PUSH     {R4-R8,LR}
//  158   float fP=0,fI=0,fD=0;//PID量
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//  159   float speed=0,speedout=0;//速度差距量
        MOVS     R4,#+0
        MOVS     R8,#+0
//  160   
//  161   speed=(speed_L+speed_R)/2;//车轮的平均速度脉冲
        LDR.W    R0,??DataTable4_7
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        MOVS     R1,#+1073741824
        BL       __aeabi_fdiv
        MOVS     R4,R0
//  162   //  if(direct_start==1)//开跑
//  163   //  {
//  164   
//  165   Angle_Zero=MMA8451_Y;
        LDR.W    R0,??DataTable4_9  ;; 0xbf800000
        LDR.W    R1,??DataTable2
        STR      R0,[R1, #+0]
//  166   if(My_Speed_Set>160)
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+161
        BCC.N    ??speed_control_0
//  167   {
//  168     if(straightTime>200)
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BLT.N    ??speed_control_1
//  169     {
//  170       Speed_Set = My_Speed_Set*0.77;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable4_10  ;; 0xa3d70a4
        LDR.W    R3,??DataTable4_11  ;; 0x3fe8a3d7
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  171     }else if(straightTime>150)
??speed_control_1:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+151
        BLT.N    ??speed_control_3
//  172     {
//  173       Speed_Set = My_Speed_Set*0.82;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable5  ;; 0xa3d70a3d
        LDR.W    R3,??DataTable5_1  ;; 0x3fea3d70
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  174     }else if(straightTime>100)
??speed_control_3:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??speed_control_4
//  175     {
//  176       Speed_Set = My_Speed_Set*0.87;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable6_3  ;; 0x3d70a3d7
        LDR.W    R3,??DataTable6_4  ;; 0x3febd70a
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  177     }else if(straightTime>50)
??speed_control_4:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+51
        BLT.N    ??speed_control_5
//  178     {
//  179       Speed_Set = My_Speed_Set*0.92;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_1  ;; 0xd70a3d71
        LDR.W    R3,??DataTable7_2  ;; 0x3fed70a3
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_2
//  180     }
//  181     else if(straightTime<10)
??speed_control_5:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BGE.N    ??speed_control_2
//  182     {
//  183       Speed_Set = My_Speed_Set*1.15;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable7_3  ;; 0x3ff26666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  184     }
//  185  
//  186     if(Speed_Set<160)
??speed_control_2:
        LDR.W    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_4  ;; 0x43200000
        BL       __aeabi_cfcmple
        BCS.W    ??speed_control_6
//  187     {
//  188       Speed_Set = 160;
        LDR.W    R0,??DataTable7_4  ;; 0x43200000
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  189     }
//  190   }else //  <=160
//  191   {
//  192     // Speed_Set = My_Speed_Set;
//  193     if(straightTime>10)
??speed_control_0:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??speed_control_7
//  194     {
//  195       if(My_Speed_Set>=160)//160
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+160
        BCC.N    ??speed_control_8
//  196       {
//  197           if(straightTime>200)
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+201
        BLT.N    ??speed_control_9
//  198          {
//  199            Speed_Set = My_Speed_Set*0.8;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_5  ;; 0x9999999a
        LDR.W    R3,??DataTable7_6  ;; 0x3fe99999
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_10
//  200          }else if(straightTime>150)
??speed_control_9:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+151
        BLT.N    ??speed_control_11
//  201          {
//  202            Speed_Set = My_Speed_Set*0.85;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable7_7  ;; 0x3feb3333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_10
//  203          }else if(straightTime>100)
??speed_control_11:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+101
        BLT.N    ??speed_control_12
//  204          {
//  205            Speed_Set = My_Speed_Set*0.9;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_8  ;; 0xcccccccd
        LDR.W    R3,??DataTable7_9  ;; 0x3feccccc
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_10
//  206           }else if(straightTime>50)
??speed_control_12:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+51
        BLT.N    ??speed_control_10
//  207          {
//  208           Speed_Set = My_Speed_Set*0.95;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable7_10  ;; 0x3fee6666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_10
//  209          }
//  210        }
//  211      else 
//  212      {
//  213        Speed_Set = My_Speed_Set;
??speed_control_8:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  214      }
//  215      if(Speed_Set<150)
??speed_control_10:
        LDR.W    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_11  ;; 0x43160000
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_6
//  216      {
//  217        Speed_Set=150;
        LDR.W    R0,??DataTable7_11  ;; 0x43160000
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  218      }
//  219     }
//  220     else
//  221     {
//  222       if(My_Speed_Set>145)
??speed_control_7:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+146
        BCC.N    ??speed_control_13
//  223       {
//  224         Speed_Set = My_Speed_Set*1.2;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+858993459
        LDR.W    R3,??DataTable7_12  ;; 0x3ff33333
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  225       } else if(My_Speed_Set>135)
??speed_control_13:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+136
        BCC.N    ??speed_control_14
//  226       {
//  227         Speed_Set = My_Speed_Set*1.3;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        LDR.W    R2,??DataTable7_8  ;; 0xcccccccd
        LDR.W    R3,??DataTable7_13  ;; 0x3ff4cccc
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  228       } else if(My_Speed_Set>125)
??speed_control_14:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        CMP      R0,#+126
        BCC.N    ??speed_control_15
//  229       {
//  230         Speed_Set = My_Speed_Set*1.4;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+1717986918
        LDR.W    R3,??DataTable7_14  ;; 0x3ff66666
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
        B.N      ??speed_control_6
//  231       } else {
//  232         Speed_Set = My_Speed_Set*1.5;
??speed_control_15:
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2d
        MOVS     R2,#+0
        LDR.W    R3,??DataTable7_15  ;; 0x3ff80000
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  233       }
//  234     }
//  235     
//  236   }
//  237   if(straightTime>10 && speed_avg / My_Speed_Set < 0.8)
??speed_control_6:
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??speed_control_16
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        MOVS     R1,R0
        LDR.W    R0,??DataTable7_16
        LDR      R0,[R0, #+0]
        BL       __aeabi_fdiv
        LDR.W    R1,??DataTable7_17  ;; 0x3f4ccccd
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_16
//  238   {
//  239     Speed_Set = My_Speed_Set;
        LDR.W    R0,??DataTable6
        LDR      R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable6_2
        STR      R0,[R1, #+0]
//  240   } 
//  241   
//  242   /*if(runTime < speedChangeTime && speedChangeFlag == 1 &&  My_Speed_Set > 150)
//  243   {
//  244     Speed_Set = 145;
//  245   }*/
//  246   //  Speed_Set=My_Speed_Set;
//  247   //    if(Speed_Set==0) Speed_Set=Speed_MAX;
//  248   //    if(straightTime > 20 )
//  249   //    {
//  250   //      Speed_Set = Speed_MAX;
//  251   //    }else{
//  252   //      Speed_Set = Speed_MAX+30;
//  253   //    }
//  254   
//  255   speedout=Speed_Set-speed;//当前误差量
??speed_control_16:
        LDR.W    R0,??DataTable6_2
        LDR      R0,[R0, #+0]
        MOVS     R1,R4
        BL       __aeabi_fsub
        MOV      R8,R0
//  256   speed_P=SpeedP;
        LDR.W    R0,??DataTable7_18  ;; 0x437a0000
        LDR.W    R1,??DataTable7_19
        STR      R0,[R1, #+0]
//  257   speed_I=SpeedI;
        LDR.W    R0,??DataTable7_20  ;; 0x43fa0000
        LDR.W    R1,??DataTable7_21
        STR      R0,[R1, #+0]
//  258   speed_D=SpeedD;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable7_22
        STR      R0,[R1, #+0]
//  259   // }
//  260   //  else //延时：等待发车
//  261   //  {
//  262   //    speedout=Speed_Set-Speed;
//  263   //    Speed_Set=0;
//  264   //    speed_P=0;
//  265   //    speed_I=0;
//  266   //    speed_D=0;
//  267   //  }
//  268   //----------------------速度PID运算--------------------------//
//  269   Speederror2=Speederror1;
        LDR.W    R0,??DataTable7_23
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_24
        STR      R0,[R1, #+0]
//  270   Speederror1=speedout;      
        LDR.W    R0,??DataTable7_23
        STR      R8,[R0, #+0]
//  271   SpeedError=Speederror1-Speederror2;     //当前值与过去值的差
        LDR.W    R0,??DataTable7_23
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_24
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_25
        STR      R0,[R1, #+0]
//  272   
//  273   fP=speed_P*speedout;                    //比例量
        LDR.W    R0,??DataTable7_19
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R5,R0
//  274   fI=speed_I*speedout;
        LDR.W    R0,??DataTable7_21
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        MOVS     R6,R0
//  275   fD=speed_D*SpeedError;                  //微分量
        LDR.W    R0,??DataTable7_22
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_25
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R7,R0
//  276   SpeedControl_Integral+=fI;              //积分量
        LDR.W    R0,??DataTable7_26
        LDR      R0,[R0, #+0]
        MOVS     R1,R6
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_26
        STR      R0,[R1, #+0]
//  277   //给积分量限幅
//  278   if(SpeedControl_Integral>SpeedIntegral_MAX)      SpeedControl_Integral=SpeedIntegral_MAX;
        LDR.W    R0,??DataTable7_26
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_27  ;; 0x455ac001
        BL       __aeabi_cfrcmple
        BHI.N    ??speed_control_17
        LDR.W    R0,??DataTable7_28  ;; 0x455ac000
        LDR.W    R1,??DataTable7_26
        STR      R0,[R1, #+0]
        B.N      ??speed_control_18
//  279   else if(SpeedControl_Integral<-SpeedIntegral_MAX) SpeedControl_Integral=-SpeedIntegral_MAX;
??speed_control_17:
        LDR.W    R0,??DataTable7_26
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_29  ;; 0xc55ac000
        BL       __aeabi_cfcmple
        BCS.N    ??speed_control_18
        LDR.W    R0,??DataTable7_29  ;; 0xc55ac000
        LDR.W    R1,??DataTable7_26
        STR      R0,[R1, #+0]
//  280   
//  281   Speed_Old=Speed_New;
??speed_control_18:
        LDR.W    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_31
        STR      R0,[R1, #+0]
//  282   Speed_New=fP+fD+SpeedControl_Integral;
        MOVS     R0,R5
        MOVS     R1,R7
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_26
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_30
        STR      R0,[R1, #+0]
//  283 }
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  284 void SpeedControlOutput(void)//5ms
//  285 {
SpeedControlOutput:
        PUSH     {R3-R5,LR}
//  286   float nSpeedOut;
//  287   int i = 0;
        MOVS     R0,#+0
//  288   for(i=14;i>0;i--)
        MOVS     R1,#+14
        MOVS     R0,R1
        B.N      ??SpeedControlOutput_0
//  289   {
//  290     SA_his[i] = SA_his[i-1];
??SpeedControlOutput_1:
        LDR.W    R1,??DataTable7_32
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #-4]
        LDR.W    R2,??DataTable7_32
        STR      R1,[R2, R0, LSL #+2]
//  291   }
        SUBS     R0,R0,#+1
??SpeedControlOutput_0:
        CMP      R0,#+1
        BGE.N    ??SpeedControlOutput_1
//  292   nSpeedOut=Speed_New-Speed_Old;
        LDR.W    R0,??DataTable7_30
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_31
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
//  293   nSpeedOut=nSpeedOut+Speed_Old;//速度量分成10份平缓输出 /SPEED_TIME*speed_time
        LDR.W    R1,??DataTable7_31
        LDR      R1,[R1, #+0]
        BL       __aeabi_fadd
//  294   SA=nSpeedOut/SA_Exchange;
        LDR.W    R1,??DataTable7_33  ;; 0x44fa0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  295   
//  296   SA = SA * 0.1
//  297   + SA_his[1] * 0.1
//  298   + SA_his[2] * 0.09
//  299   + SA_his[3] * 0.09  //0.38
//  300   + SA_his[4] * 0.08  
//  301   + SA_his[5] * 0.08
//  302   + SA_his[6] * 0.07 
//  303   + SA_his[7] * 0.07  //+0.3
//  304   + SA_his[8] * 0.06 
//  305   + SA_his[9] * 0.06
//  306   + SA_his[10] * 0.05
//  307   + SA_his[11] * 0.05//0.22
//  308   + SA_his[12] * 0.04 
//  309   + SA_his[13] * 0.03
//  310   + SA_his[14] * 0.03;//0.08
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_5  ;; 0x9999999a
        LDR.W    R3,??DataTable7_34  ;; 0x3fb99999
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_5  ;; 0x9999999a
        LDR.W    R3,??DataTable7_34  ;; 0x3fb99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_35  ;; 0x70a3d70a
        LDR.W    R3,??DataTable7_36  ;; 0x3fb70a3d
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+12]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_35  ;; 0x70a3d70a
        LDR.W    R3,??DataTable7_36  ;; 0x3fb70a3d
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+16]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_37  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_38  ;; 0x3fb47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+20]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_37  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_38  ;; 0x3fb47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+24]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_39  ;; 0x1eb851ec
        LDR.W    R3,??DataTable7_40  ;; 0x3fb1eb85
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+28]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_39  ;; 0x1eb851ec
        LDR.W    R3,??DataTable7_40  ;; 0x3fb1eb85
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+32]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable4_1  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_41  ;; 0x3faeb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+36]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_1  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_41  ;; 0x3faeb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+40]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_5  ;; 0x9999999a
        LDR.W    R3,??DataTable7_42  ;; 0x3fa99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+44]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_5  ;; 0x9999999a
        LDR.W    R3,??DataTable7_42  ;; 0x3fa99999
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+48]
        BL       __aeabi_f2d
        LDR.W    R2,??DataTable7_37  ;; 0x47ae147b
        LDR.W    R3,??DataTable7_43  ;; 0x3fa47ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+52]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_1  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_44  ;; 0x3f9eb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.W    R0,??DataTable7_32
        LDR      R0,[R0, #+56]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_1  ;; 0xeb851eb8
        LDR.W    R3,??DataTable7_44  ;; 0x3f9eb851
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  311   
//  312   SA_his[0] = SA;
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_32
        STR      R0,[R1, #+0]
//  313   
//  314   
//  315   if(SA>Angle_Max) SA=Angle_Max;
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_45  ;; 0x41a00001
        BL       __aeabi_cfrcmple
        BHI.N    ??SpeedControlOutput_2
        LDR.W    R0,??DataTable7_46  ;; 0x41a00000
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
        B.N      ??SpeedControlOutput_3
//  316   else if(SA<-Angle_Max) SA=-Angle_Max;
??SpeedControlOutput_2:
        LDR.N    R0,??DataTable2_1
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_47  ;; 0xc1a00000
        BL       __aeabi_cfcmple
        BCS.N    ??SpeedControlOutput_3
        LDR.W    R0,??DataTable7_47  ;; 0xc1a00000
        LDR.N    R1,??DataTable2_1
        STR      R0,[R1, #+0]
//  317   
//  318 
//  319 }
??SpeedControlOutput_3:
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     Angle_Zero

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     SA
//  320 /***********************方向控制函数*****************************/
//  321 /***********差速量计算***********/
//  322 extern float speed_avg;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  323 void DirectionSpeedControl(void)//10ms
//  324 {
DirectionSpeedControl:
        PUSH     {R4-R8,LR}
//  325   float fP1=0,fP2=0,fD1=0,fD2=0;
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        MOVS     R7,#+0
//  326   float avg_Speed = 0;
        MOVS     R8,#+0
//  327   New_dir_err=offset;
        LDR.W    R0,??DataTable7_48
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_49
        STR      R0,[R1, #+0]
//  328   D_dir_err=New_dir_err-Last_dir_err;
        LDR.W    R0,??DataTable7_49
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_50
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_51
        STR      R0,[R1, #+0]
//  329   D_err = New_dir_err - his_offset[4];
        LDR.W    R0,??DataTable7_49
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_52
        LDR      R1,[R1, #+16]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_53
        STR      R0,[R1, #+0]
//  330   
//  331   if(D_err*100 - 10 > 0)
        LDR.W    R0,??DataTable7_53
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_54  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_55  ;; 0xc1200000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_0
//  332     D_err = 0.1;
        LDR.W    R0,??DataTable7_56  ;; 0x3dcccccd
        LDR.W    R1,??DataTable7_53
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_1
//  333   else if(D_err*100 + 10 < 0)
??DirectionSpeedControl_0:
        LDR.W    R0,??DataTable7_53
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_54  ;; 0x42c80000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_57  ;; 0x41200000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_1
//  334     D_err = -0.1;
        LDR.W    R0,??DataTable7_58  ;; 0xbdcccccd
        LDR.W    R1,??DataTable7_53
        STR      R0,[R1, #+0]
//  335 
//  336   
//  337   //  if(direct_start==1)//开跑
//  338   //  {
//  339   SpeedAlone_P1 = Fuzzy_Update(&Direct_P,New_dir_err*100,D_err*100)+100;
??DirectionSpeedControl_1:
        LDR.W    R0,??DataTable7_53
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_54  ;; 0x42c80000
        BL       __aeabi_fmul
        MOVS     R2,R0
        MOVS     R4,R2
        LDR.W    R0,??DataTable7_49
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_54  ;; 0x42c80000
        BL       __aeabi_fmul
        MOVS     R1,R0
        MOVS     R2,R4
        LDR.W    R0,??DataTable7_59
        BL       Fuzzy_Update
        LDR.W    R1,??DataTable7_54  ;; 0x42c80000
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_60
        STR      R0,[R1, #+0]
//  340   //SpeedAlone_P1=1600;
//  341   SpeedAlone_P2 = SpeedAlone_P1;
        LDR.W    R0,??DataTable7_60
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_61
        STR      R0,[R1, #+0]
//  342   
//  343   //SpeedAlone_D1 = 2500;
//  344   //SpeedAlone_D1 = Fuzzy_Update(&Direct_D,New_dir_err*100,D_err*100);
//  345   if(runTime > 250)
        LDR.N    R0,??DataTable3
        LDR      R0,[R0, #+0]
        CMP      R0,#+251
        BLT.N    ??DirectionSpeedControl_2
//  346   {
//  347     //  SpeedAlone_D1 = SpeedAlone_P1*dChange;
//  348     if(straightTime>10 )
        LDR.W    R0,??DataTable6_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??DirectionSpeedControl_3
//  349     {
//  350       SpeedAlone_D1 = SpeedAlone_P1*dChange;
        LDR.W    R0,??DataTable7_62
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_60
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_63
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_4
//  351       
//  352       
//  353     }else if(curveTime > 10)
??DirectionSpeedControl_3:
        LDR.W    R0,??DataTable7_64
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??DirectionSpeedControl_4
//  354     {
//  355       SpeedAlone_D1 = SpeedAlone_P1 * (dChange);
        LDR.W    R0,??DataTable7_62
        LDRB     R0,[R0, #+0]
        BL       __aeabi_ui2f
        LDR.W    R1,??DataTable7_60
        LDR      R1,[R1, #+0]
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_63
        STR      R0,[R1, #+0]
        B.N      ??DirectionSpeedControl_4
//  356       
//  357     }
//  358   }else{
//  359     SpeedAlone_D1 = 3000;
??DirectionSpeedControl_2:
        LDR.W    R0,??DataTable7_65  ;; 0x453b8000
        LDR.W    R1,??DataTable7_63
        STR      R0,[R1, #+0]
//  360   }
//  361   
//  362   if(SpeedAlone_D1>13000)
??DirectionSpeedControl_4:
        LDR.W    R0,??DataTable7_63
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_66  ;; 0x464b2001
        BL       __aeabi_cfrcmple
        BHI.N    ??DirectionSpeedControl_5
//  363     SpeedAlone_D1 = 13000;
        LDR.W    R0,??DataTable7_67  ;; 0x464b2000
        LDR.W    R1,??DataTable7_63
        STR      R0,[R1, #+0]
//  364   
//  365   SpeedAlone_D2 = SpeedAlone_D1;
??DirectionSpeedControl_5:
        LDR.W    R0,??DataTable7_63
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_68
        STR      R0,[R1, #+0]
//  366   //  }
//  367   //  else//起跑前等待 屏蔽方向控制
//  368   //  {
//  369   //    SpeedAlone_P1=SpeedAlone_P2=0;
//  370   //    SpeedAlone_D1=SpeedAlone_D2=0;
//  371   //  }
//  372   
//  373   Last_dir_err=New_dir_err;
        LDR.W    R0,??DataTable7_49
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_50
        STR      R0,[R1, #+0]
//  374   
//  375   
//  376   avg_Speed=speed_avg/13;
        LDR.W    R0,??DataTable7_16
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_69  ;; 0x41500000
        BL       __aeabi_fdiv
        MOV      R8,R0
//  377   if(avg_Speed - 2 < 0)
        MOVS     R0,#-1073741824
        MOV      R1,R8
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_6
//  378     avg_Speed = 2;
        MOVS     R8,#+1073741824
        B.N      ??DirectionSpeedControl_7
//  379   else if(avg_Speed - 12 > 0)
??DirectionSpeedControl_6:
        LDR.W    R0,??DataTable7_70  ;; 0xc1400000
        MOV      R1,R8
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_7
//  380     avg_Speed = 12;
        LDR.W    R8,??DataTable7_71  ;; 0x41400000
//  381   
//  382   speedout1= avg_Speed*offset;//左右轮预期速度值 按当前速度值计算出
??DirectionSpeedControl_7:
        LDR.W    R0,??DataTable7_48
        LDR      R0,[R0, #+0]
        MOV      R1,R8
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_72
        STR      R0,[R1, #+0]
//  383   Speederror12=Speederror11;
        LDR.W    R0,??DataTable7_73
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_74
        STR      R0,[R1, #+0]
//  384   Speederror11=10*offset;
        LDR.W    R0,??DataTable7_48
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_57  ;; 0x41200000
        BL       __aeabi_fmul
        LDR.W    R1,??DataTable7_73
        STR      R0,[R1, #+0]
//  385   
//  386 
//  387   SpeedError1=Speederror11-Speederror12;
        LDR.W    R0,??DataTable7_73
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_74
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        LDR.W    R1,??DataTable7_75
        STR      R0,[R1, #+0]
//  388   fP1=speedout1*SpeedAlone_P1;  //比例运算 
        LDR.W    R0,??DataTable7_72
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_60
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R4,R0
//  389 
//  390 //  if(SpeedError1 - 0.5 > 0)
//  391 //    SpeedError1 = 0.5;
//  392 //  else if(SpeedError1 + 0.5 < 0)
//  393 //    SpeedError1 = -0.5;
//  394 
//  395   fD1=SpeedError1*SpeedAlone_D1; //微分运算
        LDR.W    R0,??DataTable7_75
        LDR      R1,[R0, #+0]
        LDR.W    R0,??DataTable7_63
        LDR      R0,[R0, #+0]
        BL       __aeabi_fmul
        MOVS     R6,R0
//  396   
//  397    if(fD1 - 5000 > 0)
        LDR.W    R0,??DataTable7_76  ;; 0xc59c4000
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??DirectionSpeedControl_8
//  398     fD1 = 5000;
        LDR.W    R6,??DataTable7_77  ;; 0x459c4000
        B.N      ??DirectionSpeedControl_9
//  399   else if(fD1 + 5000 < 0)
??DirectionSpeedControl_8:
        LDR.W    R0,??DataTable7_77  ;; 0x459c4000
        MOVS     R1,R6
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??DirectionSpeedControl_9
//  400     fD1 = -5000;
        LDR.W    R6,??DataTable7_76  ;; 0xc59c4000
//  401 //  if(fabs(fD1)>fabs(fP1))
//  402 //  {
//  403 //     if(fD1 > 0)
//  404 //       fD1 = fabs(fP1);
//  405 //     else
//  406 //       fD1 = - fabs(fP1);
//  407 //  }
//  408   speed_control_new1 = fP1+fD1;
??DirectionSpeedControl_9:
        MOVS     R0,R4
        MOVS     R1,R6
        BL       __aeabi_fadd
        LDR.W    R1,??DataTable7_78
        STR      R0,[R1, #+0]
//  409   speed_control_new2 = -speed_control_new1;
        LDR.W    R0,??DataTable7_78
        LDR      R0,[R0, #+0]
        EORS     R0,R0,#0x80000000
        LDR.W    R1,??DataTable7_79
        STR      R0,[R1, #+0]
//  410 }
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     runTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     angle_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x41880000
//  411 //差速度输出量

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  412 void DirectionSpeedOut(void)//5ms
//  413 {
//  414   DirectSpeedControlOut1 = speed_control_new1;
DirectionSpeedOut:
        LDR.W    R0,??DataTable7_78
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_80
        STR      R0,[R1, #+0]
//  415   DirectSpeedControlOut2 = speed_control_new2;
        LDR.W    R0,??DataTable7_79
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable7_81
        STR      R0,[R1, #+0]
//  416   /*方向控制输出量限幅*/
//  417   /*if(DirectSpeedControlOut1 < -Direct_POWER) 
//  418     DirectSpeedControlOut1= -Direct_POWER;
//  419   else if(DirectSpeedControlOut1 > Direct_POWER)     
//  420     DirectSpeedControlOut1= Direct_POWER;
//  421   
//  422   if(DirectSpeedControlOut2 < -Direct_POWER) 
//  423     DirectSpeedControlOut2= -Direct_POWER;
//  424   else if(DirectSpeedControlOut2> Direct_POWER)     
//  425     DirectSpeedControlOut2= Direct_POWER;*/
//  426 }
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x40490000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xeb851eb8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x3ff2b851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x40080000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x402a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     angle_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     gyro_speed_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     0xbf800000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0xa3d70a4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x3fe8a3d7
//  427 //---------------------角度+速度+方向总控制函数----------------------------------//
//  428 //总控制函数
//  429 extern int curveTime;

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  430 void Motor_Control(void)
//  431 {
Motor_Control:
        PUSH     {R7,LR}
//  432 //  static float f_gyro_D;
//  433 //  if(gyro_speed_x+25<0)
//  434 //    gyro_speed_x = -25;
//  435 //  else if(gyro_speed_x - 25 > 0)
//  436 //    gyro_speed_x = 25;
//  437 //  
//  438 //  if(curveTime < 100)
//  439 //  {
//  440 //    gyro_D = 50 + curveTime;
//  441 //  }else{
//  442 //    gyro_D = 150;
//  443 //  }
//  444 //  f_gyro_D=gyro_speed_x*gyro_D;//陀螺仪限制打角过冲
//  445 //  
//  446 //  if(fabs(f_gyro_D)>fabs(AngleControlOut+DirectSpeedControlOut1)*0.8)
//  447 //  {
//  448 //    if(f_gyro_D>0)
//  449 //      f_gyro_D = fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//  450 //    else
//  451 //      f_gyro_D = - fabs(AngleControlOut+DirectSpeedControlOut1)*0.8;
//  452 //  }
//  453   L_PowerValue =AngleControlOut+DirectSpeedControlOut1;//+f_gyro_D;//-DirectSpeedControlOut2-SpeedControlOut_L
        LDR.N    R0,??DataTable7
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_80
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable7_82
        STR      R0,[R1, #+0]
//  454   R_PowerValue =AngleControlOut+DirectSpeedControlOut2;//-f_gyro_D;//-DirectSpeedControlOut1-SpeedControlOut_R
        LDR.N    R0,??DataTable7
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_81
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable7_83
        STR      R0,[R1, #+0]
//  455   
//  456   //电机死区量补偿
//  457 //  if(L_PowerValue>0)    L_PowerValue+=LeftMotor_Dead;
//  458 //  else if(L_PowerValue<0)   L_PowerValue-=LeftMotor_Dead;
//  459 //  if(R_PowerValue>0)    R_PowerValue+=RightMotor_Dead;
//  460 //  else if(R_PowerValue<0)   R_PowerValue-=RightMotor_Dead;
//  461   
//  462   if(L_PowerValue-3000 > 0 && R_PowerValue < 0) R_PowerValue = 0;
        LDR.N    R0,??DataTable7_82
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_84  ;; 0xc53b8000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_0
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_83
        STR      R0,[R1, #+0]
        B.N      ??Motor_Control_1
//  463   else if(R_PowerValue-3000 > 0 && L_PowerValue < 0) L_PowerValue = 0;
??Motor_Control_0:
        LDR.N    R0,??DataTable7_83
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable7_84  ;; 0xc53b8000
        BL       __aeabi_fadd
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_1
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_1
        MOVS     R0,#+0
        LDR.N    R1,??DataTable7_82
        STR      R0,[R1, #+0]
//  464   //左电机限幅
//  465   if(L_PowerValue< -ADJUST_POWER)   L_PowerValue= -ADJUST_POWER;
??Motor_Control_1:
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_85  ;; 0xc6147000
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_2
        LDR.N    R0,??DataTable7_85  ;; 0xc6147000
        LDR.N    R1,??DataTable7_82
        STR      R0,[R1, #+0]
//  466   if(L_PowerValue> ADJUST_POWER)    L_PowerValue= ADJUST_POWER;
??Motor_Control_2:
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_86  ;; 0x46147001
        BL       __aeabi_cfrcmple
        BHI.N    ??Motor_Control_3
        LDR.N    R0,??DataTable7_87  ;; 0x46147000
        LDR.N    R1,??DataTable7_82
        STR      R0,[R1, #+0]
//  467   //右电机限幅               
//  468   if(R_PowerValue< -ADJUST_POWER)   R_PowerValue= -ADJUST_POWER;
??Motor_Control_3:
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_85  ;; 0xc6147000
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_4
        LDR.N    R0,??DataTable7_85  ;; 0xc6147000
        LDR.N    R1,??DataTable7_83
        STR      R0,[R1, #+0]
//  469   if(R_PowerValue> ADJUST_POWER)    R_PowerValue= ADJUST_POWER;
??Motor_Control_4:
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable7_86  ;; 0x46147001
        BL       __aeabi_cfrcmple
        BHI.N    ??Motor_Control_5
        LDR.N    R0,??DataTable7_87  ;; 0x46147000
        LDR.N    R1,??DataTable7_83
        STR      R0,[R1, #+0]
//  470   //左电机输出 
//  471   if(L_PowerValue>0)//正转
??Motor_Control_5:
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_6
//  472   {  
//  473     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,(int)L_PowerValue);       
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  474     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);  
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_7
//  475     //FB_Flag = 8;
//  476   }
//  477   else if(L_PowerValue<0)//反转
??Motor_Control_6:
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_8
//  478   { 
//  479     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  480     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,-(int)L_PowerValue);
        LDR.N    R0,??DataTable7_82
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        RSBS     R2,R0,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_7
//  481     //FB_Flag = 16;
//  482   } 
//  483   else//不转
//  484   {
//  485     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
??Motor_Control_8:
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  486     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  487     //FB_Flag = 32;
//  488   }
//  489   //右电机输出 
//  490   if(R_PowerValue>0)//正转
??Motor_Control_7:
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfrcmple
        BCS.N    ??Motor_Control_9
//  491   {  
//  492     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);       
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  493     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,(int)R_PowerValue); 
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_10
//  494     //FB_Flag = 8;
//  495   }
//  496   else if(R_PowerValue<0)//反转
??Motor_Control_9:
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        MOVS     R1,#+0
        BL       __aeabi_cfcmple
        BCS.N    ??Motor_Control_11
//  497   {   
//  498     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,-(int)R_PowerValue);
        LDR.N    R0,??DataTable7_83
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        RSBS     R2,R0,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  499     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
        B.N      ??Motor_Control_10
//  500     //FB_Flag = 16;
//  501   } 
//  502   else//不转
//  503   {
//  504     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
??Motor_Control_11:
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  505     LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  506     //FB_Flag = 32;
//  507   }
//  508 }
??Motor_Control_10:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0xa3d70a3d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x3fea3d70
//  509 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  510 void Motor_Stop(void)
//  511 {
Motor_Stop:
        PUSH     {R7,LR}
//  512   //Left
//  513   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,0);
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  514   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  515   
//  516   //Right
//  517   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,0);
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  518   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  519 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     My_Speed_Set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     straightTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     Speed_Set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0x3d70a3d7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0x3febd70a
//  520 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  521 void Motor_TurnBack(void)
//  522 {
Motor_TurnBack:
        PUSH     {R7,LR}
//  523   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch0,0);
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  524   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch1,5000);
        MOVW     R2,#+5000
        MOVS     R1,#+1
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  525   
//  526   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch3,5000);
        MOVW     R2,#+5000
        MOVS     R1,#+3
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  527   LPLD_FTM_PWM_ChangeDuty(FTM0, FTM_Ch2,0);
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable7_88  ;; 0x40038000
        BL       LPLD_FTM_PWM_ChangeDuty
//  528 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     AngleControlOut

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xd70a3d71

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x3fed70a3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x3ff26666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0x43200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     0x3fe99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_7:
        DC32     0x3feb3333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_8:
        DC32     0xcccccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_9:
        DC32     0x3feccccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_10:
        DC32     0x3fee6666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_11:
        DC32     0x43160000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_12:
        DC32     0x3ff33333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_13:
        DC32     0x3ff4cccc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_14:
        DC32     0x3ff66666

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_15:
        DC32     0x3ff80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_16:
        DC32     speed_avg

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_17:
        DC32     0x3f4ccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_18:
        DC32     0x437a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_19:
        DC32     speed_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_20:
        DC32     0x43fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_21:
        DC32     speed_I

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_22:
        DC32     speed_D

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_23:
        DC32     Speederror1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_24:
        DC32     Speederror2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_25:
        DC32     SpeedError

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_26:
        DC32     SpeedControl_Integral

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_27:
        DC32     0x455ac001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_28:
        DC32     0x455ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_29:
        DC32     0xc55ac000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_30:
        DC32     Speed_New

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_31:
        DC32     Speed_Old

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_32:
        DC32     SA_his

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_33:
        DC32     0x44fa0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_34:
        DC32     0x3fb99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_35:
        DC32     0x70a3d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_36:
        DC32     0x3fb70a3d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_37:
        DC32     0x47ae147b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_38:
        DC32     0x3fb47ae1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_39:
        DC32     0x1eb851ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_40:
        DC32     0x3fb1eb85

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_41:
        DC32     0x3faeb851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_42:
        DC32     0x3fa99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_43:
        DC32     0x3fa47ae1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_44:
        DC32     0x3f9eb851

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_45:
        DC32     0x41a00001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_46:
        DC32     0x41a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_47:
        DC32     0xc1a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_48:
        DC32     offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_49:
        DC32     New_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_50:
        DC32     Last_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_51:
        DC32     D_dir_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_52:
        DC32     his_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_53:
        DC32     D_err

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_54:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_55:
        DC32     0xc1200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_56:
        DC32     0x3dcccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_57:
        DC32     0x41200000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_58:
        DC32     0xbdcccccd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_59:
        DC32     Direct_P

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_60:
        DC32     SpeedAlone_P1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_61:
        DC32     SpeedAlone_P2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_62:
        DC32     dChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_63:
        DC32     SpeedAlone_D1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_64:
        DC32     curveTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_65:
        DC32     0x453b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_66:
        DC32     0x464b2001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_67:
        DC32     0x464b2000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_68:
        DC32     SpeedAlone_D2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_69:
        DC32     0x41500000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_70:
        DC32     0xc1400000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_71:
        DC32     0x41400000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_72:
        DC32     speedout1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_73:
        DC32     Speederror11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_74:
        DC32     Speederror12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_75:
        DC32     SpeedError1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_76:
        DC32     0xc59c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_77:
        DC32     0x459c4000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_78:
        DC32     speed_control_new1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_79:
        DC32     speed_control_new2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_80:
        DC32     DirectSpeedControlOut1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_81:
        DC32     DirectSpeedControlOut2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_82:
        DC32     L_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_83:
        DC32     R_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_84:
        DC32     0xc53b8000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_85:
        DC32     0xc6147000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_86:
        DC32     0x46147001

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_87:
        DC32     0x46147000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_88:
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
// 3 712 bytes in section .text
// 
// 3 712 bytes of CODE memory
//   713 bytes of DATA memory
//
//Errors: none
//Warnings: 2
