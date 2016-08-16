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
//    4 //#define SPEED_TIME 50  //50MS     5ms����һ�����ݣ�ȡ��ʷ45ms�е�9������ƽ��ֵ�������ٶ���
//    5 #define DIRECT_TIME  10 //10MS
//    6 
//    7 //�ṹ������

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 UART_InitTypeDef uart3_init_struct;                       //���ڷ���
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
//   11 ADC_InitTypeDef adc2_init_struct;                        //����
adc2_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   12 PIT_InitTypeDef pit0_init_struct;                        //�ܹ��ܶ�ʱ��
pit0_init_struct:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 PIT_InitTypeDef pit1_runTime;                   //����ģ�鶨ʱ��
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
//   17 void adc_init(void)//��ʼ��ADC����ͨ��
//   18 {
adc_init:
        PUSH     {R7,LR}
//   19   adc0_init_struct.ADC_Adcx = ADC0;                       //E24��E25
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        LDR.N    R1,??DataTable3_1
        STR      R0,[R1, #+0]
//   20   adc0_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+4]
//   21   adc0_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+5]
//   22   adc0_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+7]
//   23   //adc0_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
//   24   adc0_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_1
        STRB     R0,[R1, #+11]
//   25   
//   26   adc1_init_struct.ADC_Adcx = ADC0;                       //D5��D6
        LDR.N    R0,??DataTable3  ;; 0x4003b000
        LDR.N    R1,??DataTable3_2
        STR      R0,[R1, #+0]
//   27   adc1_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+4]
//   28   adc1_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+5]
//   29   adc1_init_struct.ADC_MuxSel=MUX_ADXXB;                  //����Bͨ������
        MOVS     R0,#+16
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+10]
//   30   adc1_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+7]
//   31   //adc1_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
//   32   adc1_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_2
        STRB     R0,[R1, #+11]
//   33   
//   34   adc2_init_struct.ADC_Adcx = ADC1;                       //E2��E3��A17
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        LDR.N    R1,??DataTable3_4
        STR      R0,[R1, #+0]
//   35   adc2_init_struct.ADC_DiffMode = ADC_SE;                 //���˲ɼ�
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+4]
//   36   adc2_init_struct.ADC_BitMode = SE_8BIT;                 //����8λ����
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+5]
//   37   adc2_init_struct.ADC_MuxSel=MUX_ADXXA;                  //����Aͨ������
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+10]
//   38   adc2_init_struct.ADC_LongSampleTimeSel=LSAMTIME_12EX;   //������ʱ��
        MOVS     R0,#+1
        LDR.N    R1,??DataTable3_4
        STRB     R0,[R1, #+7]
//   39   //adc2_init_struct.ADC_HwAvgSel = HW_4AVG;              //4��Ӳ��ƽ��
//   40   adc2_init_struct.ADC_CalEnable = TRUE;                  //ʹ�ܳ�ʼ��У��
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
//   44   LPLD_ADC_Init(adc2_init_struct);                        //��ʼ��ADC
        LDR.N    R1,??DataTable3_4
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_ADC_Init
//   45   //�����ǲ�����
//   46   LPLD_ADC_Chn_Enable(ADC1, AD6);                         //PTE2 Y��������ǽӿڣ�ǰ�������ϵģ�
        MOVS     R1,#+6
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        BL       LPLD_ADC_Chn_Enable
//   47   LPLD_ADC_Chn_Enable(ADC1, AD7);                         //PTE3 X��������ǽӿڣ�ת��ƽ���ϵģ����ã�
        MOVS     R1,#+7
        LDR.N    R0,??DataTable3_3  ;; 0x400bb000
        BL       LPLD_ADC_Chn_Enable
//   48   /********��Ų����ڣ�˳��Ϊ�����ϵ�1��5��**********/
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
//   55 void uart_init(void)//��ʼ��UART3ģ��
//   56 {
uart_init:
        PUSH     {R5-R7,LR}
//   57   uart3_init_struct.UART_Uartx = UART3;                  //ʹ��UART3
        LDR.N    R0,??DataTable3_5  ;; 0x4006d000
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+0]
//   58   uart3_init_struct.UART_BaudRate = 115200;              //���ò�����9600
        MOVS     R0,#+115200
        LDR.N    R1,??DataTable3_6
        STR      R0,[R1, #+4]
//   59   uart3_init_struct.UART_RxPin = PTE5;                   //��������ΪPTE5
        MOVS     R0,#+129
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+9]
//   60   uart3_init_struct.UART_TxPin = PTE4;                   //��������ΪPTE4
        MOVS     R0,#+128
        LDR.N    R1,??DataTable3_6
        STRB     R0,[R1, #+8]
//   61   LPLD_UART_Init(uart3_init_struct);                     //��ʼ��UART
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
//   65   //����PIT0����   �����Ƕ�ģ��(�����ǻ��ֲ�Ǽ����ٶȼƶ��ڲ���)
//   66   pit0_init_struct.PIT_Pitx = PIT0;                     //����PIT0����
        MOVS     R0,#+0
        LDR.N    R1,??DataTable3_7
        STRB     R0,[R1, #+0]
//   67   pit0_init_struct.PIT_PeriodMs = 5;                    //��ʱ����5ms
        MOVS     R0,#+5
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+8]
//   68   pit0_init_struct.PIT_Isr = pit0_isr;                  //�����жϺ���
        LDR.N    R0,??DataTable3_8
        LDR.N    R1,??DataTable3_7
        STR      R0,[R1, #+16]
//   69   LPLD_PIT_Init(pit0_init_struct);                      //��ʼ��PIT0
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
//   72 //  pit1_runTime.PIT_Pitx = PIT1;                //����PIT1����
//   73 //  pit1_runTime.PIT_PeriodS = 20;                 //��ʱ����5ms
//   74 //  pit1_runTime.PIT_Isr = RunTime_isr;            //�����жϺ���
//   75 //  LPLD_PIT_Init(pit1_runTime);                   //��ʼ��PIT0
//   76 //  LPLD_PIT_EnableIrq(pit1_runTime);
//   77 }
        POP      {R0,PC}          ;; return
//   78 
//   79 
//   80 /**
//   81 * DMA����ģ��
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
//   86   INPUT1_Init.GPIO_Pins=GPIO_Pin0;/*���ֲ���*/
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
//   92   INPUT2_Init.GPIO_Pins=GPIO_Pin8;/*���ֲ���*/
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
//  103 ch0_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH1].CITER_ELINKNO;     //������յ������ۼ�ֵ
//  104 ch1_pulseacc = DMA_MAX_NUM - DMA0->TCD[DMA_CH2].CITER_ELINKNO;
//  105 if(ch0_over_cnt !=0)
//  106 {
//  107 ch0_pulseacc = ch0_pulseacc + DMA_MAX_NUM*ch0_over_cnt;
//  108 ch0_over_cnt = 0;             //�����������
//  109   }
//  110 if(ch1_over_cnt !=0)
//  111 {
//  112 ch1_pulseacc = ch1_pulseacc + DMA_MAX_NUM*ch1_over_cnt;
//  113 ch1_over_cnt = 0;
//  114   }
//  115 //�ƻ�5ms����һ�Σ�10���ۼƺ��˲�����
//  116 if(PTB9_I) {Speed_LQ[c_s]=(float)ch0_pulseacc;}//���ַ���У׼,������תʱ������˳ʱ��ת��Ϊ��
//  117   else  {Speed_LQ[c_s]=-(float)ch0_pulseacc;}
//  118 if(PTC16_I){Speed_RQ[c_s]=-(float)ch1_pulseacc;}//���ַ���У׼��������תʱ��������ʱ��ת��Ϊ��
//  119   else  {Speed_RQ[c_s]=(float)ch1_pulseacc;}
//  120 //Speed_Q[c_s]=(Speed_LQ[c_s]+Speed_RQ[c_s])/2;//ƽ���ٶȴ洢
//  121 
//  122 //50ms�Բɵ����ٶ�ֵ�˲�����
//  123 if(c_s==10)
//  124 {
//  125 c_s=0;
//  126 GetMotorPulse();//������ǰ���ٶ���
//  127 speed_control();//�ٶȵ��������
//  128   }
//  129 c_s++;//5ms�ۼ�һ��
//  130 
//  131 //��ʼ��DMAģ��
//  132 LPLD_DMA_Init(DMA_Struct1); //��ʼ��DMAģ��
//  133 LPLD_DMA_Init(DMA_Struct2);  
//  134 LPLD_DMA_EnableReq(DMA_CH1); //����ͨ������
//  135 LPLD_DMA_EnableReq(DMA_CH2);
//  136 
//  137 //  get_ad();//��в���
//  138 //cal_offset();//��ȡƫ��
//  139 oled_flag++;//oled��ʾ��־
//  140 direct_flag++;
//  141 if(direct_flag==2)//10ms
//  142 {
//  143 direct_flag=0;
//  144 DirectionSpeedControl();//���ٵ��������
//  145   }
//  146 if(oled_flag==20)//100msˢ��һ����Ļ
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
