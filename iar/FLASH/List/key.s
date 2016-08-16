///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:15
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\key.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\key.c -D LPLD_K60 -D
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\key.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN LPLD_LPTMR_DelayMs
        EXTERN __aeabi_memcpy4

        PUBLIC Key_Handle
        PUBLIC gpio_init_struct_key
        PUBLIC init_gpio_key
        PUBLIC keyScan

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\key.c
//    1 #include "common.h"
//    2 #include "key.h"
//    3 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 GPIO_InitTypeDef gpio_init_struct_key;//结构体定义
gpio_init_struct_key:
        DS8 20
//    5 
//    6 /*按键处理函数*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    7 void  Key_Handle()
//    8 {
//    9   
//   10   
//   11   
//   12 }
Key_Handle:
        BX       LR               ;; return
//   13 
//   14 
//   15 /*键盘扫描程序*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   16 int keyScan(void)
//   17 {
keyScan:
        PUSH     {R7,LR}
//   18   if(!key6|| !key1 || !key2 || !key3 || !key4 || !key5)
        LDR.N    R0,??DataTable1  ;; 0x43fe0a5c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_0
        LDR.N    R0,??DataTable1_1  ;; 0x43fe0a48
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_0
        LDR.N    R0,??DataTable1_2  ;; 0x43fe0a4c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_0
        LDR.N    R0,??DataTable1_3  ;; 0x43fe0a50
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_0
        LDR.N    R0,??DataTable1_4  ;; 0x43fe0a54
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_0
        LDR.N    R0,??DataTable1_5  ;; 0x43fe0a58
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_1
//   19   {
//   20     LPLD_LPTMR_DelayMs(10);
??keyScan_0:
        MOVS     R0,#+10
        BL       LPLD_LPTMR_DelayMs
//   21     if(!key6|| !key1 || !key2 || !key3 || !key4 || !key5)
        LDR.N    R0,??DataTable1  ;; 0x43fe0a5c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_2
        LDR.N    R0,??DataTable1_1  ;; 0x43fe0a48
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_2
        LDR.N    R0,??DataTable1_2  ;; 0x43fe0a4c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_2
        LDR.N    R0,??DataTable1_3  ;; 0x43fe0a50
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_2
        LDR.N    R0,??DataTable1_4  ;; 0x43fe0a54
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_2
        LDR.N    R0,??DataTable1_5  ;; 0x43fe0a58
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_3
//   22     {
//   23       if(!key1)
??keyScan_2:
        LDR.N    R0,??DataTable1_1  ;; 0x43fe0a48
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_4
//   24       {
//   25         while(!key1);
??keyScan_5:
        LDR.N    R0,??DataTable1_1  ;; 0x43fe0a48
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_5
//   26         return 1;
        MOVS     R0,#+1
        B.N      ??keyScan_6
//   27       }
//   28       else if(!key2)
??keyScan_4:
        LDR.N    R0,??DataTable1_2  ;; 0x43fe0a4c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_7
//   29       {
//   30         while(!key2);
??keyScan_8:
        LDR.N    R0,??DataTable1_2  ;; 0x43fe0a4c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_8
//   31         return 2;
        MOVS     R0,#+2
        B.N      ??keyScan_6
//   32       }
//   33       else if(!key3)
??keyScan_7:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe0a50
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_9
//   34       {
//   35         while(!key3);
??keyScan_10:
        LDR.N    R0,??DataTable1_3  ;; 0x43fe0a50
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_10
//   36         return 3;
        MOVS     R0,#+3
        B.N      ??keyScan_6
//   37       }
//   38       else if(!key4)
??keyScan_9:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe0a54
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_11
//   39       {
//   40         while(!key4);
??keyScan_12:
        LDR.N    R0,??DataTable1_4  ;; 0x43fe0a54
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_12
//   41         return 4;
        MOVS     R0,#+4
        B.N      ??keyScan_6
//   42       }
//   43       else if(!key5)
??keyScan_11:
        LDR.N    R0,??DataTable1_5  ;; 0x43fe0a58
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_13
//   44       {
//   45         while(!key5);
??keyScan_14:
        LDR.N    R0,??DataTable1_5  ;; 0x43fe0a58
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_14
//   46         return 5;
        MOVS     R0,#+5
        B.N      ??keyScan_6
//   47       }
//   48       else if(!key6)
??keyScan_13:
        LDR.N    R0,??DataTable1  ;; 0x43fe0a5c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??keyScan_15
//   49       {
//   50         while(!key6);
??keyScan_16:
        LDR.N    R0,??DataTable1  ;; 0x43fe0a5c
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BEQ.N    ??keyScan_16
//   51         return 6;
        MOVS     R0,#+6
        B.N      ??keyScan_6
//   52       }
//   53       else
//   54         return 7;
??keyScan_15:
        MOVS     R0,#+7
        B.N      ??keyScan_6
//   55     }
//   56     else
//   57       return 7;
??keyScan_3:
        MOVS     R0,#+7
        B.N      ??keyScan_6
//   58   }
//   59   else
//   60     return 7;
??keyScan_1:
        MOVS     R0,#+7
??keyScan_6:
        POP      {R1,PC}          ;; return
//   61 } 
//   62 /*键盘口初始化*/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   63 void init_gpio_key()
//   64 {
init_gpio_key:
        PUSH     {R7,LR}
//   65   gpio_init_struct_key.GPIO_PTx = PTB;
        LDR.N    R0,??DataTable1_6  ;; 0x400ff040
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+0]
//   66   gpio_init_struct_key.GPIO_Pins = GPIO_Pin18|GPIO_Pin19|GPIO_Pin20|GPIO_Pin21|GPIO_Pin22|GPIO_Pin23;
        MOVS     R0,#+16515072
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+4]
//   67   gpio_init_struct_key.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_7
        STRB     R0,[R1, #+12]
//   68   gpio_init_struct_key.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable1_7
        STRB     R0,[R1, #+13]
//   69   gpio_init_struct_key.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable1_7
        STR      R0,[R1, #+8]
//   70   LPLD_GPIO_Init(gpio_init_struct_key);
        LDR.N    R1,??DataTable1_7
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   71 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x43fe0a5c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x43fe0a48

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0x43fe0a4c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x43fe0a50

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_4:
        DC32     0x43fe0a54

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_5:
        DC32     0x43fe0a58

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_6:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_7:
        DC32     gpio_init_struct_key

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
//  20 bytes in section .bss
// 324 bytes in section .text
// 
// 324 bytes of CODE memory
//  20 bytes of DATA memory
//
//Errors: none
//Warnings: none
