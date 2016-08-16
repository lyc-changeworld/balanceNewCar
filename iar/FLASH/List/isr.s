///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       16/Aug/2016  10:48:33
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\isr.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\isr.c -D LPLD_K60 -D
//        USE_K60D10 -lCN
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\isr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD_result
        EXTERN DirectionSpeedControl
        EXTERN DirectionSpeedOut
        EXTERN GetMotorPulse
        EXTERN L_PowerValue
        EXTERN Motor_Control
        EXTERN Motor_Stop
        EXTERN OutPut_Data
        EXTERN R_PowerValue
        EXTERN Send_Data
        EXTERN SpeedControlOutput
        EXTERN __aeabi_cdcmple
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_f2d
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN angle_control
        EXTERN get_accl
        EXTERN get_gyro
        EXTERN offset
        EXTERN ronghe_angle
        EXTERN show_info
        EXTERN speed_control
        EXTERN stopCarSetFlag

        PUBLIC Count
        PUBLIC SendData
        PUBLIC SpeedCatch_flag
        PUBLIC curveTime
        PUBLIC direct_flag
        PUBLIC direct_start
        PUBLIC goDieFlag
        PUBLIC gyro_xMax
        PUBLIC oled_flag
        PUBLIC pit0_isr
        PUBLIC runTime
        PUBLIC start_flag
        PUBLIC stopFlag
        PUBLIC stopTime
        PUBLIC straightTime

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\isr.c
//    1 #include "isr.h"
//    2 #include "init.h"
//    3 #include "speed.h"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 int runTime = 0;
runTime:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 int stopTime = 0;
stopTime:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
//    6 uint8 stopFlag = 0;
stopFlag:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 int gyro_xMax = 0;
gyro_xMax:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 int goDieFlag = 0;
goDieFlag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 int straightTime = 0;
straightTime:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 int curveTime = 0;
curveTime:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 uint32 Count=0;//5ms定时计数量
Count:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 uint32 start_flag=0,direct_start=0,oled_flag=0,direct_flag=0,SpeedCatch_flag=0;
start_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
direct_start:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
oled_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
direct_flag:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
SpeedCatch_flag:
        DS8 4
//   13 extern uint8 stopCarSetFlag;
//   14 void SendData(void);

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   15 void pit0_isr(void) 
//   16 {  
pit0_isr:
        PUSH     {R4,LR}
//   17   if(runTime < 60000)
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        MOVW     R1,#+60000
        CMP      R0,R1
        BGE.N    ??pit0_isr_0
//   18     runTime++;
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1
        STR      R0,[R1, #+0]
//   19   if(start_flag<50) start_flag++;
??pit0_isr_0:
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        CMP      R0,#+50
        BCS.N    ??pit0_isr_1
        LDR.N    R0,??DataTable1_1
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_1
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_2
//   20   else {direct_start=1;} 
??pit0_isr_1:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_2
        STR      R0,[R1, #+0]
//   21   direct_flag++;                                     //差速计算标志
??pit0_isr_2:
        LDR.N    R0,??DataTable1_3
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_3
        STR      R0,[R1, #+0]
//   22   SpeedCatch_flag++;                                 //
        LDR.N    R0,??DataTable1_4
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_4
        STR      R0,[R1, #+0]
//   23   oled_flag++;                                       //oled显示标志
        LDR.N    R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_5
        STR      R0,[R1, #+0]
//   24   GetMotorPulse();                                   //测量当前的速度量,并进行速度pid计算得到电机量
        BL       GetMotorPulse
//   25   speed_control();                                   //速度电机量计算 5ms
        BL       speed_control
//   26   for(int i=0;i<10;i++){
        MOVS     R4,#+0
        B.N      ??pit0_isr_3
//   27     get_accl();                                      //加速度数据值采样 
??pit0_isr_4:
        BL       get_accl
//   28   }
        ADDS     R4,R4,#+1
??pit0_isr_3:
        CMP      R4,#+10
        BLT.N    ??pit0_isr_4
//   29   get_gyro();                                        //陀螺仪AD采样求角速度
        BL       get_gyro
//   30   ronghe_angle();                                    //互补滤波得到清漂后的角度
        BL       ronghe_angle
//   31   
//   32   DirectionSpeedControl();                         //差速电机量计算
        BL       DirectionSpeedControl
//   33 //  if(direct_flag==2){
//   34 //    direct_flag=0;
//   35 //    DirectionSpeedControl();                         //差速电机量计算 
//   36 //  }
//   37   
//   38   //50ms
//   39   speed_control();  
        BL       speed_control
//   40 //  if(SpeedCatch_flag==10){                           
//   41 //    SpeedCatch_flag=0;
//   42 //    speed_control();                                 //速度电机量计算
//   43 //  }
//   44   
//   45   SpeedControlOutput();                             //速度角度量平缓输出   50ms/10
        BL       SpeedControlOutput
//   46   DirectionSpeedOut();                              //差速电机量平缓输出   10ms/2
        BL       DirectionSpeedOut
//   47   angle_control();                                  //直立电机量输出
        BL       angle_control
//   48 //  Motor_Control(); 
//   49   if(stopFlag==0)
        LDR.N    R0,??DataTable1_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??pit0_isr_5
//   50   {
//   51     if(goDieFlag>80)  
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+81
        BLT.N    ??pit0_isr_6
//   52     {
//   53       Motor_Stop();
        BL       Motor_Stop
        B.N      ??pit0_isr_7
//   54     }else if(stopCarSetFlag==1 && !PTE26_I && runTime > 1000) 
??pit0_isr_6:
        LDR.N    R0,??DataTable1_8
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??pit0_isr_8
        LDR.N    R0,??DataTable1_9  ;; 0x43fe2268
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??pit0_isr_8
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLE.N    ??pit0_isr_8
//   55     {
//   56       stopFlag = 1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_6
        STRB     R0,[R1, #+0]
//   57       stopTime = runTime;
        LDR.N    R0,??DataTable1
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable1_10
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_7
//   58       //Motor_Stop();
//   59       //DisableInterrupts;
//   60     }else{
//   61       Motor_Control();
??pit0_isr_8:
        BL       Motor_Control
        B.N      ??pit0_isr_7
//   62     }
//   63   }else{
//   64     Motor_Stop();
??pit0_isr_5:
        BL       Motor_Stop
//   65 //    if(runTime - stopTime < 40)
//   66 //    {
//   67 //      Motor_TurnBack();
//   68 //    }else{
//   69 //      Motor_Stop();
//   70 //    }
//   71   }
//   72   
//   73   
//   74 
//   75   if(oled_flag==20){oled_flag=0;show_info();}
??pit0_isr_7:
        LDR.N    R0,??DataTable1_5
        LDR      R0,[R0, #+0]
        CMP      R0,#+20
        BNE.N    ??pit0_isr_9
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_5
        STR      R0,[R1, #+0]
        BL       show_info
//   76   if(AD_result[0]+AD_result[2]<30)
??pit0_isr_9:
        LDR.N    R0,??DataTable1_11
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_11
        LDR      R0,[R0, #+8]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable1_12  ;; 0x41f00000
        BL       __aeabi_cfcmple
        BCS.N    ??pit0_isr_10
//   77   {
//   78     if(goDieFlag<1000)
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??pit0_isr_11
//   79     {
//   80       goDieFlag++;
        LDR.N    R0,??DataTable1_7
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_12
//   81     }else{
//   82       goDieFlag=1000;
??pit0_isr_11:
        MOV      R0,#+1000
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_12
//   83     }
//   84   }else{goDieFlag = 0;}
??pit0_isr_10:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   85 
//   86   
//   87   if(fabs(offset) < 0.20)//0.20
??pit0_isr_12:
        LDR.N    R0,??DataTable1_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BICS     R1,R1,#0x80000000
        LDR.N    R2,??DataTable1_14  ;; 0x9999999a
        LDR.N    R3,??DataTable1_15  ;; 0x3fc99999
        BL       __aeabi_cdcmple
        BCS.N    ??pit0_isr_13
//   88   {
//   89     if(straightTime < 1000)
        LDR.N    R0,??DataTable1_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??pit0_isr_14
//   90     {
//   91       straightTime ++;
        LDR.N    R0,??DataTable1_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_16
        STR      R0,[R1, #+0]
//   92     }
//   93     if(straightTime>10)
??pit0_isr_14:
        LDR.N    R0,??DataTable1_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??pit0_isr_15
//   94       curveTime=0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_17
        STR      R0,[R1, #+0]
        B.N      ??pit0_isr_15
//   95   }else{
//   96     if(curveTime < 1000)
??pit0_isr_13:
        LDR.N    R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BGE.N    ??pit0_isr_16
//   97       curveTime++;
        LDR.N    R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable1_17
        STR      R0,[R1, #+0]
//   98     if(curveTime>10)
??pit0_isr_16:
        LDR.N    R0,??DataTable1_17
        LDR      R0,[R0, #+0]
        CMP      R0,#+11
        BLT.N    ??pit0_isr_15
//   99       straightTime = 0;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_16
        STR      R0,[R1, #+0]
//  100   }
//  101   //  SendData();
//  102 }
??pit0_isr_15:
        POP      {R4,PC}          ;; return
//  103 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  104 void SendData(void)
//  105 {
SendData:
        PUSH     {R7,LR}
//  106     //  Send_Data[0]= speedout1*10;
//  107   //  Send_Data[1]= offset*30;
//  108     Send_Data[1]=R_PowerValue;
        LDR.N    R0,??DataTable1_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable1_19
        STRH     R0,[R1, #+2]
//  109     Send_Data[0]=L_PowerValue;
        LDR.N    R0,??DataTable1_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable1_19
        STRH     R0,[R1, #+0]
//  110     Send_Data[2]=offset*100;
        LDR.N    R0,??DataTable1_13
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable1_21  ;; 0x42c80000
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        LDR.N    R1,??DataTable1_19
        STRH     R0,[R1, #+4]
//  111   //  Send_Data[3]=gyro_speed_x;
//  112   //  Send_Data[3]=speed_avg;
//  113   //  Send_Data[1]=SA*10;
//  114   //  Send_Data[0]= angle;
//  115   //  Send_Data[1]=accl_angle_Y;
//  116   //  Send_Data[0]= 100.0*offset;
//  117   //  Send_Data[1]= 100.0*D_err;
//  118   //  Send_Data[2] = SpeedAlone_P1;
//  119   //  Send_Data[0] = AD_result[2];//angle,speed_L  
//  120   //  Send_Data[1] = AD_result[1];
//  121   //  Send_Data[2] = AD_result[3];
//  122   //  Send_Data[2] = second_offset;
//  123   //  Send_Data[3] = AD_2;
//  124   //  Send_Data[3] = offset;
//  125   //  Send_Data[1]=AD_result[2];//D_dir_err;//accl_angle_Y,
//  126   //  Send_Data[2]=gyro_speed_x;//gyro_speed,speed_avg，
//  127     OutPut_Data();
        BL       OutPut_Data
//  128 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     runTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     start_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     direct_start

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     direct_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     SpeedCatch_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     oled_flag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     stopFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     goDieFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_8:
        DC32     stopCarSetFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_9:
        DC32     0x43fe2268

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_10:
        DC32     stopTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_11:
        DC32     AD_result

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_12:
        DC32     0x41f00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_13:
        DC32     offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_14:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_15:
        DC32     0x3fc99999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_16:
        DC32     straightTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_17:
        DC32     curveTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_18:
        DC32     R_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_19:
        DC32     Send_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_20:
        DC32     L_PowerValue

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_21:
        DC32     0x42c80000

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
//  49 bytes in section .bss
// 512 bytes in section .text
// 
// 512 bytes of CODE memory
//  49 bytes of DATA memory
//
//Errors: none
//Warnings: 4
