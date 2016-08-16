///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       16/Aug/2016  15:26:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\balance.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\balance.c -D
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\balance.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN AD1Basic
        EXTERN AD_result
        EXTERN DMA_Init
        EXTERN Dip_Switch
        EXTERN GPIO_DMA_Init
        EXTERN GetMotorPulse
        EXTERN LCD_Init
        EXTERN LCD_P6x8Str
        EXTERN LPLD_LPTMR_DelayMs
        EXTERN LPLD_MMA8451_Init
        EXTERN Show_Number
        EXTERN SpeedAlone_P1
        EXTERN __aeabi_f2iz
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fmul
        EXTERN adc_init
        EXTERN angle
        EXTERN cal_offset
        EXTERN first_offset
        EXTERN get_0
        EXTERN get_ad
        EXTERN get_ad_once
        EXTERN init_gpio_Dip_Switch
        EXTERN init_gpio_SpeedDirect
        EXTERN init_gpio_StopCar
        EXTERN init_gpio_beep
        EXTERN init_gpio_key
        EXTERN init_gpio_oled
        EXTERN keyScan
        EXTERN nowADBase
        EXTERN offset
        EXTERN pit_init
        EXTERN pwm_init
        EXTERN runTime
        EXTERN speed_L
        EXTERN speed_R
        EXTERN stopFlag
        EXTERN uart_init

        PUBLIC DIP_Ago_Value
        PUBLIC DIP_Switch
        PUBLIC DIP_Switch_Value
        PUBLIC Init_Only_Once
        PUBLIC My_Speed_Set
        PUBLIC My_Start_Go
        PUBLIC dChange
        PUBLIC keyState
        PUBLIC main
        PUBLIC show_info
        PUBLIC speedChangeFlag
        PUBLIC speedChangeTime
        PUBLIC stopCarSetFlag

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\balance.c
//    1 #include "common.h"
//    2 #include "direct.h"
//    3 #include "init.h"
//    4 #define My_Speed_Max 230
//    5 #define My_Speed_Min 140
//    6 
//    7 void DIP_Switch(void);
//    8 void show_info(void);
//    9 
//   10 extern uint32 oled_flag,speed_flag,direct_flag;
//   11 extern float speed_avg,DirectSpeed,SA;
//   12 extern float AD_result[5];
//   13 extern float offset,backup_offset;
//   14 extern uint8 speedgo_flag;
//   15 extern uint32 oled_flag;
//   16 extern float SpeedAlone_P1,SpeedAlone_P1;
//   17 extern float SpeedAlone_D1,SpeedAlone_D1;
//   18 extern float Speed_Set;
//   19 extern float first_offset[3];
//   20 extern float angle;
//   21 
//   22 extern int gyro_xMax;
//   23 extern float speed_L,speed_R;
//   24 extern float AD1Basic;
//   25 extern float nowADBase;
//   26 
//   27 /*重要的变量定义*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   28 uint32 DIP_Ago_Value=0;
DIP_Ago_Value:
        DS8 4

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   29 uint32 DIP_Switch_Value=My_Speed_Min;
DIP_Switch_Value:
        DATA
        DC32 140

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   30 uint32 My_Start_Go=0;//主程序开始执行的标志
My_Start_Go:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   31 uint32 Init_Only_Once=0;//只初始化一次的标志
Init_Only_Once:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   32 uint32 My_Speed_Set=0;//设定的基本速度
My_Speed_Set:
        DS8 4
//   33 
//   34 //主函数
//   35 extern int runTime;
//   36 extern uint8 stopFlag;

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   37 uint8 stopCarSetFlag = 1;
stopCarSetFlag:
        DATA
        DC8 1

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   38 uint8 dChange = 19;
dChange:
        DATA
        DC8 19

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   39 int keyState = 7;
keyState:
        DATA
        DC32 7

        SECTION `.data`:DATA:REORDER:NOROOT(2)
//   40 int speedChangeTime = 1200;
speedChangeTime:
        DATA
        DC32 1200

        SECTION `.data`:DATA:REORDER:NOROOT(0)
//   41 uint8 speedChangeFlag = 1;
speedChangeFlag:
        DATA
        DC8 1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   42 void main (void)
//   43 {
main:
        PUSH     {R7,LR}
//   44   
//   45   init_gpio_Dip_Switch();//拨码开关初始化
        BL       init_gpio_Dip_Switch
//   46   init_gpio_key();//按键初始化 
        BL       init_gpio_key
//   47   init_gpio_StopCar();
        BL       init_gpio_StopCar
//   48   init_gpio_beep();             //蜂鸣器的端口定义
        BL       init_gpio_beep
//   49   LPLD_LPTMR_DelayMs(2000);
        MOV      R0,#+2000
        BL       LPLD_LPTMR_DelayMs
//   50   
//   51   adc_init();                  //采样初始化
        BL       adc_init
//   52   LPLD_MMA8451_Init();         //陀螺仪I2C协议定义
        BL       LPLD_MMA8451_Init
//   53   get_0();                     //陀螺仪的开机采样
        BL       get_0
//   54   get_ad_once();
        BL       get_ad_once
//   55   init_gpio_oled();            //OLED的端口定义
        BL       init_gpio_oled
//   56   LCD_Init();                  //OLED初始化
        BL       LCD_Init
//   57   init_gpio_SpeedDirect();     //编码器方向端口定义
        BL       init_gpio_SpeedDirect
//   58   pwm_init();                  //电机初始化
        BL       pwm_init
//   59   DMA_Init();
        BL       DMA_Init
//   60   GPIO_DMA_Init();             //测速初始化
        BL       GPIO_DMA_Init
//   61   uart_init();                 //串口初始化
        BL       uart_init
        B.N      ??main_0
//   62   //AD1Basic = 60;
//   63   while((keyState=keyScan())!=6)
//   64   {
//   65     switch(keyState)
//   66     {
//   67     case 1:
//   68       AD1Basic += 5;
//   69       break;
//   70     case 2:
//   71       AD1Basic -= 2;
//   72       break;
//   73     case 3:
//   74       if(dChange < 35 ) dChange++; 
//   75       break;
//   76     case 4:
//   77       //if(dChange > 10 ) dChange--; 
//   78       if(speedChangeFlag == 1) speedChangeFlag = 0;
//   79       else speedChangeFlag = 1;
//   80       break;
//   81     case 5:{
//   82       if(stopCarSetFlag == 1) stopCarSetFlag = 0;
//   83       else stopCarSetFlag = 1;
//   84     }
//   85     break;
//   86     default:break;
//   87     }
//   88     DIP_Switch();
??main_1:
??main_2:
        BL       DIP_Switch
//   89     get_ad();//电感采样
        BL       get_ad
//   90     cal_offset();
        BL       cal_offset
//   91     GetMotorPulse();
        BL       GetMotorPulse
//   92     show_info();
        BL       show_info
??main_0:
        BL       keyScan
        LDR.W    R1,??DataTable2_2
        STR      R0,[R1, #+0]
        CMP      R0,#+6
        BEQ.N    ??main_3
        LDR.W    R0,??DataTable2_2
        LDR      R0,[R0, #+0]
        CMP      R0,#+1
        BEQ.N    ??main_4
        BCC.N    ??main_1
        CMP      R0,#+3
        BEQ.N    ??main_5
        BCC.N    ??main_6
        CMP      R0,#+5
        BEQ.N    ??main_7
        BCC.N    ??main_8
        B.N      ??main_1
??main_4:
        LDR.W    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_4  ;; 0x40a00000
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??main_2
??main_6:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        MOVS     R1,#-1073741824
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable2_3
        STR      R0,[R1, #+0]
        B.N      ??main_2
??main_5:
        LDR.N    R0,??DataTable2_5
        LDRB     R0,[R0, #+0]
        CMP      R0,#+35
        BGE.N    ??main_9
        LDR.N    R0,??DataTable2_5
        LDRB     R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable2_5
        STRB     R0,[R1, #+0]
??main_9:
        B.N      ??main_2
??main_8:
        LDR.N    R0,??DataTable2_6
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_10
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
        B.N      ??main_11
??main_10:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_6
        STRB     R0,[R1, #+0]
??main_11:
        B.N      ??main_2
??main_7:
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_12
        MOVS     R0,#+0
        LDR.N    R1,??DataTable2_7
        STRB     R0,[R1, #+0]
        B.N      ??main_13
??main_12:
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_7
        STRB     R0,[R1, #+0]
??main_13:
        B.N      ??main_2
//   93   }
//   94   LPLD_LPTMR_DelayMs(1000);
??main_3:
        MOV      R0,#+1000
        BL       LPLD_LPTMR_DelayMs
//   95   pit_init();                  //总定时器初始化
        BL       pit_init
//   96   for(;;)
//   97   {
//   98     get_ad();//电感采样
??main_14:
        BL       get_ad
//   99     cal_offset();
        BL       cal_offset
//  100     if(stopCarSetFlag==1 && !PTE26_I && runTime > 1000) 
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??main_14
        LDR.N    R0,??DataTable2_8  ;; 0x43fe2268
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??main_14
        LDR.N    R0,??DataTable2_9
        LDR      R0,[R0, #+0]
        CMP      R0,#+1000
        BLE.N    ??main_14
//  101     {
//  102       stopFlag=1;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable2_10
        STRB     R0,[R1, #+0]
        B.N      ??main_14
//  103       //Motor_Stop();
//  104       //DisableInterrupts;
//  105     }
//  106   }
//  107 }
//  108 //界面显示模块
//  109 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  110 void show_info(void)
//  111 {
show_info:
        PUSH     {R7,LR}
//  112   LCD_P6x8Str(1,0,"sp"); 
        ADR.N    R2,??DataTable1  ;; 0x73, 0x70, 0x00, 0x00
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  113   LCD_P6x8Str(1,1,"ADBasic:");
        LDR.N    R2,??DataTable2_11
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  114   LCD_P6x8Str(1,2,"M:");
        ADR.N    R2,??DataTable1_1  ;; 0x4D, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  115   LCD_P6x8Str(1,3,"L_R:");
        LDR.N    R2,??DataTable2_12
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  116   Show_Number(20,0,(int)speed_L);//显示平均速度
        LDR.N    R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       Show_Number
//  117   Show_Number(55,0,(int)speed_R);
        LDR.N    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       Show_Number
//  118   //Show_Number(90,0,(int)(SA*100));
//  119   if(stopCarSetFlag == 1)
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??show_info_0
//  120   {
//  121     LCD_P6x8Str(90,0,"YES");
        ADR.N    R2,??DataTable2  ;; "YES"
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
        B.N      ??show_info_1
//  122   }else{
//  123     LCD_P6x8Str(90,0,"NO ");
??show_info_0:
        ADR.N    R2,??DataTable2_1  ;; "NO "
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  124   }
//  125   
//  126   /*if(speedChangeFlag == 1)
//  127   {
//  128     LCD_P6x8Str(90,7,"1");
//  129   }else{
//  130     LCD_P6x8Str(90,7,"0");
//  131   }*/
//  132   LCD_P6x8Str(1,0,"sp"); 
??show_info_1:
        ADR.N    R2,??DataTable1  ;; 0x73, 0x70, 0x00, 0x00
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  133   LCD_P6x8Str(1,1,"ADBasic:");
        LDR.N    R2,??DataTable2_11
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  134   LCD_P6x8Str(1,2,"M:");
        ADR.N    R2,??DataTable1_1  ;; 0x4D, 0x3A, 0x00, 0x00
        MOVS     R1,#+2
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  135   LCD_P6x8Str(1,3,"L_R:");
        LDR.N    R2,??DataTable2_12
        MOVS     R1,#+3
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  136   Show_Number(20,0,(int)speed_L);//显示平均速度
        LDR.N    R0,??DataTable2_13
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+20
        BL       Show_Number
//  137   Show_Number(55,0,(int)speed_R);
        LDR.N    R0,??DataTable2_14
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+0
        MOVS     R0,#+55
        BL       Show_Number
//  138   //Show_Number(90,0,(int)(SA*100));
//  139   if(stopCarSetFlag == 1)
        LDR.N    R0,??DataTable2_7
        LDRB     R0,[R0, #+0]
        CMP      R0,#+1
        BNE.N    ??show_info_2
//  140   {
//  141     LCD_P6x8Str(90,0,"YES");
        ADR.N    R2,??DataTable2  ;; "YES"
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
        B.N      ??show_info_3
//  142   }else{
//  143     LCD_P6x8Str(90,0,"NO ");
??show_info_2:
        ADR.N    R2,??DataTable2_1  ;; "NO "
        MOVS     R1,#+0
        MOVS     R0,#+90
        BL       LCD_P6x8Str
//  144   }
//  145   
//  146 //  if(directChoose == 1)
//  147 //  {
//  148 //    LCD_P6x8Str(90,7,"1");
//  149 //  }else{
//  150 //    LCD_P6x8Str(90,7,"0");
//  151 //  }
//  152   Show_Number(55,1,(int)AD1Basic);
??show_info_3:
        LDR.N    R0,??DataTable2_3
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+55
        BL       Show_Number
//  153   Show_Number(90,1,(int)nowADBase);
        LDR.N    R0,??DataTable2_15
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+1
        MOVS     R0,#+90
        BL       Show_Number
//  154   Show_Number(55,2,(int)AD_result[1]);
        LDR.N    R0,??DataTable2_16
        LDR      R0,[R0, #+4]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+2
        MOVS     R0,#+55
        BL       Show_Number
//  155   
//  156   Show_Number(27,3,(int)AD_result[0]);
        LDR.N    R0,??DataTable2_16
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+3
        MOVS     R0,#+27
        BL       Show_Number
//  157   Show_Number(90,3,(int)AD_result[2]);
        LDR.N    R0,??DataTable2_16
        LDR      R0,[R0, #+8]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+3
        MOVS     R0,#+90
        BL       Show_Number
//  158 
//  159   
//  160   LCD_P6x8Str(1,4,"spSet:");
        LDR.N    R2,??DataTable2_17
        MOVS     R1,#+4
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  161   //Show_Number(55,4,(int)(Speed_Set));
//  162   Show_Number(55,4,(int)(My_Speed_Set));
        LDR.N    R0,??DataTable2_18
        LDR      R2,[R0, #+0]
        MOVS     R1,#+4
        MOVS     R0,#+55
        BL       Show_Number
//  163   LCD_P6x8Str(1,5,"spDp:");
        LDR.N    R2,??DataTable2_19
        MOVS     R1,#+5
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  164   Show_Number(55,5,(int)(SpeedAlone_P1));
        LDR.N    R0,??DataTable2_20
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+5
        MOVS     R0,#+55
        BL       Show_Number
//  165   //Show_Number(90,5,(int)(SpeedAlone_D1));
//  166   Show_Number(90,5,(int)(400*dChange));
        LDR.N    R0,??DataTable2_5
        LDRB     R0,[R0, #+0]
        MOV      R1,#+400
        MUL      R2,R1,R0
        MOVS     R1,#+5
        MOVS     R0,#+90
        BL       Show_Number
//  167   LCD_P6x8Str(1,6,"offset:");
        LDR.N    R2,??DataTable2_21
        MOVS     R1,#+6
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  168   Show_Number(55,6,(int)(offset*100));
        LDR.N    R0,??DataTable2_22
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable2_23  ;; 0x42c80000
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+6
        MOVS     R0,#+55
        BL       Show_Number
//  169   Show_Number(90,6,(int)(first_offset[1]*100));
        LDR.N    R0,??DataTable2_24
        LDR      R0,[R0, #+4]
        LDR.N    R1,??DataTable2_23  ;; 0x42c80000
        BL       __aeabi_fmul
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+6
        MOVS     R0,#+90
        BL       Show_Number
//  170   LCD_P6x8Str(1,7,"angle:");
        LDR.N    R2,??DataTable2_25
        MOVS     R1,#+7
        MOVS     R0,#+1
        BL       LCD_P6x8Str
//  171   Show_Number(55,7,(int)(angle));
        LDR.N    R0,??DataTable2_26
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2iz
        MOVS     R2,R0
        MOVS     R1,#+7
        MOVS     R0,#+55
        BL       Show_Number
//  172 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC8      0x73, 0x70, 0x00, 0x00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC8      0x4D, 0x3A, 0x00, 0x00
//  173 
//  174 //开机时显示

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  175 void DIP_Switch()
//  176 {
DIP_Switch:
        PUSH     {R7,LR}
//  177   DIP_Switch_Value=Dip_Switch();//获取状态
        BL       Dip_Switch
        LDR.N    R1,??DataTable2_27
        STR      R0,[R1, #+0]
//  178   //判断，设置速度值
//  179   switch(DIP_Switch_Value)
        LDR.N    R0,??DataTable2_27
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??DIP_Switch_0
        CMP      R0,#+2
        BEQ.N    ??DIP_Switch_1
        BCC.N    ??DIP_Switch_2
        CMP      R0,#+4
        BEQ.N    ??DIP_Switch_3
        BCC.N    ??DIP_Switch_4
        CMP      R0,#+6
        BEQ.N    ??DIP_Switch_5
        BCC.N    ??DIP_Switch_6
        CMP      R0,#+8
        BEQ.N    ??DIP_Switch_7
        BCC.N    ??DIP_Switch_8
        CMP      R0,#+10
        BEQ.N    ??DIP_Switch_9
        BCC.N    ??DIP_Switch_10
        B.N      ??DIP_Switch_11
//  180   {
//  181   case 0:My_Speed_Set=My_Speed_Min;break;//120
??DIP_Switch_0:
        MOVS     R0,#+140
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  182   case 1:My_Speed_Set=My_Speed_Min+10;break;//130
??DIP_Switch_2:
        MOVS     R0,#+150
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  183   case 2:My_Speed_Set=My_Speed_Min+20;break;//140
??DIP_Switch_1:
        MOVS     R0,#+160
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  184   case 3:My_Speed_Set=My_Speed_Min+30;break;//150
??DIP_Switch_4:
        MOVS     R0,#+170
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  185   case 4:My_Speed_Set=My_Speed_Min+40;break;//160
??DIP_Switch_3:
        MOVS     R0,#+180
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  186   case 5:My_Speed_Set=My_Speed_Min+50;break;//170
??DIP_Switch_6:
        MOVS     R0,#+190
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  187   case 6:My_Speed_Set=My_Speed_Min+60;break;//180
??DIP_Switch_5:
        MOVS     R0,#+200
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  188   case 7:My_Speed_Set=My_Speed_Min+70;break;//180
??DIP_Switch_8:
        MOVS     R0,#+210
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  189   case 8:My_Speed_Set=My_Speed_Min+80;break;//180
??DIP_Switch_7:
        MOVS     R0,#+220
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  190   case 9:My_Speed_Set=My_Speed_Min+90;break;//180
??DIP_Switch_10:
        MOVS     R0,#+230
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  191   case 10:My_Speed_Set=My_Speed_Min+100;break;//180
??DIP_Switch_9:
        MOVS     R0,#+240
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
        B.N      ??DIP_Switch_12
//  192   default:My_Speed_Set=My_Speed_Max;break;
??DIP_Switch_11:
        MOVS     R0,#+230
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  193   }
//  194   //限制速度
//  195   if(My_Speed_Set>My_Speed_Max)
??DIP_Switch_12:
        LDR.N    R0,??DataTable2_18
        LDR      R0,[R0, #+0]
        CMP      R0,#+231
        BCC.N    ??DIP_Switch_13
//  196   {
//  197     My_Speed_Set=My_Speed_Max;//180
        MOVS     R0,#+230
        LDR.N    R1,??DataTable2_18
        STR      R0,[R1, #+0]
//  198   }
//  199 //  if(My_Speed_Set!=DIP_Ago_Value)
//  200 //  {
//  201 //    LCD_CLS();//清屏
//  202 //    LCD_P8x16Str(0,2,"MySpeed:");
//  203 //    Show_Number(64,3,My_Speed_Set);
//  204 //  }
//  205 //  DIP_Ago_Value=My_Speed_Set;//更新历史值
//  206 }
??DIP_Switch_13:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC8      "YES"

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC8      "NO "

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     keyState

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_3:
        DC32     AD1Basic

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_4:
        DC32     0x40a00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_5:
        DC32     dChange

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_6:
        DC32     speedChangeFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_7:
        DC32     stopCarSetFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_8:
        DC32     0x43fe2268

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_9:
        DC32     runTime

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_10:
        DC32     stopFlag

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_11:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_12:
        DC32     ?_3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_13:
        DC32     speed_L

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_14:
        DC32     speed_R

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_15:
        DC32     nowADBase

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_16:
        DC32     AD_result

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_17:
        DC32     ?_6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_18:
        DC32     My_Speed_Set

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_19:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_20:
        DC32     SpeedAlone_P1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_21:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_22:
        DC32     offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_23:
        DC32     0x42c80000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_24:
        DC32     first_offset

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_25:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_26:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_27:
        DC32     DIP_Switch_Value

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
        DC8 "sp"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "ADBasic:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "M:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_3:
        DATA
        DC8 "L_R:"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "YES"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
        DATA
        DC8 "NO "

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_6:
        DATA
        DC8 "spSet:"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "spDp:"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "offset:"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "angle:"
        DC8 0

        END
// 
//    16 bytes in section .bss
//    15 bytes in section .data
//    68 bytes in section .rodata
// 1 032 bytes in section .text
// 
// 1 032 bytes of CODE  memory
//    68 bytes of CONST memory
//    31 bytes of DATA  memory
//
//Errors: none
//Warnings: 2
