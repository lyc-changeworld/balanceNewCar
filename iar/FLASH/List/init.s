///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  21:16:01
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\init.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\init.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\init.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_ADC_Chn_Enable
        EXTERN LPLD_ADC_Init
        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_PIT_EnableIrq
        EXTERN LPLD_PIT_Init
        EXTERN LPLD_UART_Init
        EXTERN __aeabi_memcpy4
        EXTERN pit0_isr

        PUBLIC GPIO_DMA_Init
        PUBLIC INPUT1_Init
        PUBLIC INPUT2_Init
        PUBLIC adc0_init_struct
        PUBLIC adc1_init_struct
        PUBLIC adc2_init_struct
        PUBLIC adc_init
        PUBLIC pit0_init_struct
        PUBLIC pit1_runTime
        PUBLIC pit_init
        PUBLIC uart3_init_struct
        PUBLIC uart_init

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\init.c
//    1 #include "init.h"
//    2 #include "speed.h"
//    3 
//    4 //#define SPEED_TIME 50  //50MS     5ms更新一个数据，取历史45ms中的9个数据平均值来计算速度量
//    5 #define DIRECT_TIME  10 //10MS
//    6 
//    7 //结构体声明

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 UART_InitTypeDef uart3_init_struct;                       //串口发送
uart3_init_struct:
        DS8 28

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 ADC_InitTypeDef adc0_init_struct;
adc0_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 ADC_InitTypeDef adc1_init_struct;
adc1_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 ADC_InitTypeDef adc2_init_struct;                        //采样
adc2_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 PIT_InitTypeDef pit0_init_struct;                        //总功能定时器
pit0_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 PIT_InitTypeDef pit1_runTime;                   //测速模块定时器
pit1_runTime:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 GPIO_InitTypeDef   INPUT1_Init;
INPUT1_Init:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 GPIO_InitTypeDef   INPUT2_Init;
INPUT2_Init:
        DS8 20
//   16 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   17 void adc_init(void)//初始化ADC及其通道
//   18 {
adc_init:
        PUSH     {R7,LR}
//   19   adc0_init_struct.ADC_Adcx = ADC0;                       //E24、E25
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   20   adc0_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+4]
//   21   adc0_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+5]
//   22   adc0_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+7]
//   23   //adc0_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
//   24   adc0_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+11]
//   25   
//   26   adc1_init_struct.ADC_Adcx = ADC0;                       //D5、D6
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        LDR.N    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   27   adc1_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+4]
//   28   adc1_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+5]
//   29   adc1_init_struct.ADC_MuxSel=MUX_ADXXB;                  //单端B通道输入
        MOVS     R0,#+16
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+10]
//   30   adc1_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+7]
//   31   //adc1_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
//   32   adc1_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+11]
//   33   
//   34   adc2_init_struct.ADC_Adcx = ADC1;                       //E2、E3、A17
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   35   adc2_init_struct.ADC_DiffMode = ADC_SE;                 //单端采集
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+4]
//   36   adc2_init_struct.ADC_BitMode = SE_8BIT;                 //单端8位精度
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+5]
//   37   adc2_init_struct.ADC_MuxSel=MUX_ADXXA;                  //单端A通道输入
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+10]
//   38   adc2_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //长采样时间
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+7]
//   39   //adc2_init_struct.ADC_HwAvgSel = HW_4AVG;              //4次硬件平均
//   40   adc2_init_struct.ADC_CalEnable = TRUE;                  //使能初始化校验
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+11]
//   41   
//   42   LPLD_ADC_Init(adc0_init_struct);
        LDR.N    R1,??DataTable3_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_ADC_Init
//   43   LPLD_ADC_Init(adc1_init_struct);
        LDR.N    R1,??DataTable3_2
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_ADC_Init
//   44   LPLD_ADC_Init(adc2_init_struct);                        //初始化ADC
        LDR.N    R1,??DataTable3_4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_ADC_Init
//   45   //陀螺仪采样口
//   46   LPLD_ADC_Chn_Enable(ADC1, AD6);                         //PTE2 Y轴的陀螺仪接口（前进方向上的）
        MOVS     R1,#+6
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        BL       LPLD_ADC_Chn_Enable
//   47   LPLD_ADC_Chn_Enable(ADC1, AD7);                         //PTE3 X轴的陀螺仪接口（转弯平面上的，备用）
        MOVS     R1,#+7
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        BL       LPLD_ADC_Chn_Enable
//   48   /********电磁采样口，顺序为板子上的1到5口**********/
//   49   LPLD_ADC_Chn_Enable(ADC0, AD7);                         //D6
        MOVS     R1,#+7
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        BL       LPLD_ADC_Chn_Enable
//   50   LPLD_ADC_Chn_Enable(ADC0, AD6);                         //D5
        MOVS     R1,#+6
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        BL       LPLD_ADC_Chn_Enable
//   51   LPLD_ADC_Chn_Enable(ADC1, AD17);                        //A17
        MOVS     R1,#+17
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        BL       LPLD_ADC_Chn_Enable
//   52   LPLD_ADC_Chn_Enable(ADC0, AD18);                       //E25
        MOVS     R1,#+18
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        BL       LPLD_ADC_Chn_Enable
//   53   LPLD_ADC_Chn_Enable(ADC0, AD17);                       //E24
        MOVS     R1,#+17
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        BL       LPLD_ADC_Chn_Enable
//   54 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   55 void uart_init(void)//初始化UART3模块
//   56 {
uart_init:
        PUSH     {R5-R7,LR}
//   57   uart3_init_struct.UART_Uartx = UART3;                  //使用UART3
        LDR.N    R0,??DataTable3_5  ;; 0x4006d000
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//   58   uart3_init_struct.UART_BaudRate = 115200;              //设置波特率9600
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+4]
//   59   uart3_init_struct.UART_RxPin = PTE5;                   //接收引脚为PTE5
        MOVS     R0,#+129
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+9]
//   60   uart3_init_struct.UART_TxPin = PTE4;                   //发送引脚为PTE4
        MOVS     R0,#+128
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+8]
//   61   LPLD_UART_Init(uart3_init_struct);                     //初始化UART
        LDR.N    R1,??DataTable3_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_UART_Init
//   62 }
        POP      {R0-R2,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   63 void pit_init(void)
//   64 {
pit_init:
        PUSH     {R7,LR}
//   65   //配置PIT0参数   测量角度模块(陀螺仪积分测角及加速度计定期补偿)
//   66   pit0_init_struct.PIT_Pitx = PIT0;                     //配置PIT0参数
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//   67   pit0_init_struct.PIT_PeriodMs = 5;                    //定时周期5ms
        MOVS     R0,#+5
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+8]
//   68   pit0_init_struct.PIT_Isr = pit0_isr;                  //设置中断函数
        LDR.N    R0,??DataTable3_8
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+16]
//   69   LPLD_PIT_Init(pit0_init_struct);                      //初始化PIT0
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_Init
//   70   LPLD_PIT_EnableIrq(pit0_init_struct);
        LDR.N    R1,??DataTable3_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_PIT_EnableIrq
//   71   
//   72 //  pit1_runTime.PIT_Pitx = PIT1;                //配置PIT1参数
//   73 //  pit1_runTime.PIT_PeriodS = 20;                 //定时周期5ms
//   74 //  pit1_runTime.PIT_Isr = RunTime_isr;            //设置中断函数
//   75 //  LPLD_PIT_Init(pit1_runTime);                   //初始化PIT0
//   76 //  LPLD_PIT_EnableIrq(pit1_runTime);
//   77 }
        POP      {R0,PC}          ;; return
//   78 
//   79 
//   80 /**
//   81 * DMA测速模块
//   82 */

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   83 void GPIO_DMA_Init(void)
//   84 {
GPIO_DMA_Init:
        PUSH     {R7,LR}
//   85   INPUT1_Init.GPIO_PTx=PTB;
        LDR.N    R0,??DataTable3_9  ;; 0x400ff040
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+0]
//   86   INPUT1_Init.GPIO_Pins=GPIO_Pin0;/*左轮测速*/
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+4]
//   87   INPUT1_Init.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_10
        STRB     R0,[R1, #+12]
//   88   INPUT1_Init.GPIO_PinControl=INPUT_PULL_DOWN|IRQC_DMARI;
        LDR.N    R0,??DataTable3_11  ;; 0x10002
        LDR.N    R1,??DataTable3_10
        STR      R0,[R1, #+8]
//   89   LPLD_GPIO_Init(INPUT1_Init);
        LDR.N    R1,??DataTable3_10
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   90   
//   91   INPUT2_Init.GPIO_PTx=PTC ;
        LDR.N    R0,??DataTable3_12  ;; 0x400ff080
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+0]
//   92   INPUT2_Init.GPIO_Pins=GPIO_Pin8;/*右轮测速*/
        MOV      R0,#+256
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+4]
//   93   INPUT2_Init.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_13
        STRB     R0,[R1, #+12]
//   94   INPUT2_Init.GPIO_PinControl=INPUT_PULL_DOWN|IRQC_DMARI;
        LDR.N    R0,??DataTable3_11  ;; 0x10002
        LDR.N    R1,??DataTable3_13
        STR      R0,[R1, #+8]
//   95   LPLD_GPIO_Init(INPUT2_Init);
        LDR.N    R1,??DataTable3_13
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   96 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3:
        DC32     0x4003b000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_1:
        DC32     adc0_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_2:
        DC32     adc1_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_3:
        DC32     0x400bb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_4:
        DC32     adc2_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_5:
        DC32     0x4006d000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_6:
        DC32     uart3_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_7:
        DC32     pit0_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_8:
        DC32     pit0_isr

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_9:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_10:
        DC32     INPUT1_Init

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_11:
        DC32     0x10002

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_12:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable3_13:
        DC32     INPUT2_Init

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   97 //void RunTime_isr(void)
//   98 //{
//   99 //  runTime = 1;
//  100 //}
//  101 /*void DMA_PIT_isr(void)
//  102 {
//  103 ch0_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH1].CITER_ELINKNO;     //获得最终的脉冲累加值
//  104 ch1_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH2].CITER_ELINKNO;
//  105 if(ch0_over_cnt !=0)
//  106 {
//  107 ch0_pulseacc = ch0_pulseacc + DMA_MAX_NUM*ch0_over_cnt;
//  108 ch0_over_cnt = 0;             //清零溢出计数
//  109   }
//  110 if(ch1_over_cnt !=0)
//  111 {
//  112 ch1_pulseacc = ch1_pulseacc + DMA_MAX_NUM*ch1_over_cnt;
//  113 ch1_over_cnt = 0;
//  114   }
//  115 //计划5ms测速一次，10次累计后滤波处理
//  116 if(PTB9_I) {Speed_LQ[c_s]=(float)ch0_pulseacc;}//左轮方向校准,右轮正转时编码器顺时针转，为高
//  117   else  {Speed_LQ[c_s]=-(float)ch0_pulseacc;}
//  118 if(PTC16_I){Speed_RQ[c_s]=-(float)ch1_pulseacc;}//右轮方向校准，左轮正转时编码器逆时针转，为低
//  119   else  {Speed_RQ[c_s]=(float)ch1_pulseacc;}
//  120 //Speed_Q[c_s]=(Speed_LQ[c_s]+Speed_RQ[c_s])/2;//平均速度存储
//  121 
//  122 //50ms对采到的速度值滤波处理
//  123 if(c_s==10)
//  124 {
//  125 c_s=0;
//  126 GetMotorPulse();//测量当前的速度量
//  127 speed_control();//速度电机量计算
//  128   }
//  129 c_s++;//5ms累加一次
//  130 
//  131 //初始化DMA模块
//  132 LPLD_DMA_Init(DMA_Struct1); //初始化DMA模块
//  133 LPLD_DMA_Init(DMA_Struct2);  
//  134 LPLD_DMA_EnableReq(DMA_CH1); //开启通道请求
//  135 LPLD_DMA_EnableReq(DMA_CH2);
//  136 
//  137 //  get_ad();//电感采样
//  138 //cal_offset();//获取偏差
//  139 oled_flag++;//oled显示标志
//  140 direct_flag++;
//  141 if(direct_flag==2)//10ms
//  142 {
//  143 direct_flag=0;
//  144 DirectionSpeedControl();//差速电机量计算
//  145   }
//  146 if(oled_flag==20)//100ms刷新一次屏幕
//  147 {
//  148 oled_flag=0;
//  149 show_info();
//  150   }
//  151 
//  152 }*/
// 
// 168 bytes in section .bss
// 468 bytes in section .text
// 
// 468 bytes of CODE memory
// 168 bytes of DATA memory
//
//Errors: none
//Warnings: none
