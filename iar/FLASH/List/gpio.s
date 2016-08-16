///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:12
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\gpio.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\gpio.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_FTM_Init
        EXTERN LPLD_FTM_PWM_Enable
        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC Dip_Switch
        PUBLIC ftm_init_struct
        PUBLIC gpio_init_struct_Dip_Switch
        PUBLIC gpio_init_struct_SpeedDirect_Left
        PUBLIC gpio_init_struct_SpeedDirect_Right
        PUBLIC gpio_init_struct_StopCar
        PUBLIC gpio_init_struct_beep
        PUBLIC init_gpio_Dip_Switch
        PUBLIC init_gpio_SpeedDirect
        PUBLIC init_gpio_StopCar
        PUBLIC init_gpio_beep
        PUBLIC pwm_init

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\gpio.c
//    1 #include "gpio.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 GPIO_InitTypeDef gpio_init_struct_beep;//蜂鸣器
gpio_init_struct_beep:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    4 GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Left;//编码器左轮
gpio_init_struct_SpeedDirect_Left:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 GPIO_InitTypeDef gpio_init_struct_SpeedDirect_Right;//编码器右轮
gpio_init_struct_SpeedDirect_Right:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 GPIO_InitTypeDef gpio_init_struct_StopCar;//停车检测口
gpio_init_struct_StopCar:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    7 GPIO_InitTypeDef gpio_init_struct_Dip_Switch;//拨码开关
gpio_init_struct_Dip_Switch:
        DS8 20

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 FTM_InitTypeDef ftm_init_struct;
ftm_init_struct:
        DS8 28
//    9 //电机pwm初始化

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   10 void pwm_init(void)
//   11 {
pwm_init:
        PUSH     {R5-R7,LR}
//   12   ftm_init_struct.FTM_Ftmx = FTM0;	//使能FTM0通道
        LDR.N    R0,??DataTable5  ;; 0x40038000
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+0]
//   13   ftm_init_struct.FTM_Mode = FTM_MODE_PWM;	//使能PWM模式
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_1
        STRB     R0,[R1, #+4]
//   14   ftm_init_struct.FTM_PwmFreq = 9000;	//PWM频率2KHz
        MOVW     R0,#+9000
        LDR.N    R1,??DataTable5_1
        STR      R0,[R1, #+8]
//   15   LPLD_FTM_Init(ftm_init_struct);
        LDR.N    R1,??DataTable5_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+28
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_FTM_Init
//   16   
//   17   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch0,0, PTC1,ALIGN_LEFT);//左正向
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+61
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR.N    R0,??DataTable5  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   18   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch1,0, PTC2,ALIGN_LEFT); //左反向:
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+62
        MOVS     R2,#+0
        MOVS     R1,#+1
        LDR.N    R0,??DataTable5  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   19   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch2,0, PTC3,ALIGN_LEFT);//右正向:
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+63
        MOVS     R2,#+0
        MOVS     R1,#+2
        LDR.N    R0,??DataTable5  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   20   LPLD_FTM_PWM_Enable(FTM0,FTM_Ch3,0, PTC4,ALIGN_LEFT);//右反向
        MOVS     R0,#+40
        STR      R0,[SP, #+0]
        MOVS     R3,#+64
        MOVS     R2,#+0
        MOVS     R1,#+3
        LDR.N    R0,??DataTable5  ;; 0x40038000
        BL       LPLD_FTM_PWM_Enable
//   21 }
        POP      {R0-R2,PC}       ;; return
//   22 //蜂鸣器初始化

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   23 void init_gpio_beep()
//   24 {
init_gpio_beep:
        PUSH     {R7,LR}
//   25   gpio_init_struct_beep.GPIO_PTx = PTC;
        LDR.N    R0,??DataTable5_2  ;; 0x400ff080
        LDR.N    R1,??DataTable5_3
        STR      R0,[R1, #+0]
//   26   gpio_init_struct_beep.GPIO_Pins = GPIO_Pin5;
        MOVS     R0,#+32
        LDR.N    R1,??DataTable5_3
        STR      R0,[R1, #+4]
//   27   gpio_init_struct_beep.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_3
        STRB     R0,[R1, #+12]
//   28   gpio_init_struct_beep.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_3
        STR      R0,[R1, #+8]
//   29   LPLD_GPIO_Init(gpio_init_struct_beep);
        LDR.N    R1,??DataTable5_3
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   30 } 
        POP      {R0,PC}          ;; return
//   31 //测速方向口初始化

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   32 void init_gpio_SpeedDirect()
//   33 {
init_gpio_SpeedDirect:
        PUSH     {R7,LR}
//   34   //左轮方向口
//   35   gpio_init_struct_SpeedDirect_Left.GPIO_PTx=PTB;
        LDR.N    R0,??DataTable5_4  ;; 0x400ff040
        LDR.N    R1,??DataTable5_5
        STR      R0,[R1, #+0]
//   36   gpio_init_struct_SpeedDirect_Left.GPIO_Pins=GPIO_Pin9;
        MOV      R0,#+512
        LDR.N    R1,??DataTable5_5
        STR      R0,[R1, #+4]
//   37   gpio_init_struct_SpeedDirect_Left.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5
        STRB     R0,[R1, #+12]
//   38   gpio_init_struct_SpeedDirect_Left.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_5
        STR      R0,[R1, #+8]
//   39   LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Left);
        LDR.N    R1,??DataTable5_5
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   40   //右轮方向口
//   41   gpio_init_struct_SpeedDirect_Right.GPIO_PTx=PTC;
        LDR.N    R0,??DataTable5_2  ;; 0x400ff080
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+0]
//   42   gpio_init_struct_SpeedDirect_Right.GPIO_Pins=GPIO_Pin16;
        MOVS     R0,#+65536
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+4]
//   43   gpio_init_struct_SpeedDirect_Right.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_6
        STRB     R0,[R1, #+12]
//   44   gpio_init_struct_SpeedDirect_Right.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_6
        STR      R0,[R1, #+8]
//   45   LPLD_GPIO_Init(gpio_init_struct_SpeedDirect_Right);
        LDR.N    R1,??DataTable5_6
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   46 }
        POP      {R0,PC}          ;; return
//   47 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   48 void init_gpio_StopCar()
//   49 {
init_gpio_StopCar:
        PUSH     {R7,LR}
//   50   //干簧管
//   51   gpio_init_struct_StopCar.GPIO_PTx=PTE;
        LDR.N    R0,??DataTable5_7  ;; 0x400ff100
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+0]
//   52   gpio_init_struct_StopCar.GPIO_Pins=GPIO_Pin26;
        MOVS     R0,#+67108864
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+4]
//   53   gpio_init_struct_StopCar.GPIO_Dir=DIR_INPUT;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_8
        STRB     R0,[R1, #+12]
//   54   gpio_init_struct_StopCar.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_8
        STR      R0,[R1, #+8]
//   55   LPLD_GPIO_Init(gpio_init_struct_StopCar);
        LDR.N    R1,??DataTable5_8
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   56 }
        POP      {R0,PC}          ;; return
//   57 //拨码开关口初始化

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   58 void init_gpio_Dip_Switch()   //B:10、11、16、17
//   59 {
init_gpio_Dip_Switch:
        PUSH     {R7,LR}
//   60   gpio_init_struct_Dip_Switch.GPIO_PTx = PTB;
        LDR.N    R0,??DataTable5_4  ;; 0x400ff040
        LDR.N    R1,??DataTable5_9
        STR      R0,[R1, #+0]
//   61   gpio_init_struct_Dip_Switch.GPIO_Pins = GPIO_Pin10|GPIO_Pin11|GPIO_Pin16|GPIO_Pin17;
        MOVS     R0,#+199680
        LDR.N    R1,??DataTable5_9
        STR      R0,[R1, #+4]
//   62   gpio_init_struct_Dip_Switch.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_9
        STRB     R0,[R1, #+12]
//   63   gpio_init_struct_Dip_Switch.GPIO_Output = OUTPUT_H;
        MOVS     R0,#+1
        LDR.N    R1,??DataTable5_9
        STRB     R0,[R1, #+13]
//   64   gpio_init_struct_Dip_Switch.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.N    R1,??DataTable5_9
        STR      R0,[R1, #+8]
//   65   LPLD_GPIO_Init(gpio_init_struct_Dip_Switch);
        LDR.N    R1,??DataTable5_9
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   66 }
        POP      {R0,PC}          ;; return
//   67 
//   68 //扫描拨码开关，设置相关速度

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   69 uint32 Dip_Switch()
//   70 {
//   71   uint32 Switch_Value=0;
Dip_Switch:
        MOVS     R0,#+0
//   72   if(!dip_0)
        LDR.N    R1,??DataTable5_10  ;; 0x43fe0a44
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Dip_Switch_0
//   73   {
//   74     Switch_Value+=1;
        ADDS     R0,R0,#+1
//   75   }
//   76   if(!dip_1)
??Dip_Switch_0:
        LDR.N    R1,??DataTable5_11  ;; 0x43fe0a40
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Dip_Switch_1
//   77   {
//   78     Switch_Value+=2;
        ADDS     R0,R0,#+2
//   79   }
//   80   if(!dip_2)
??Dip_Switch_1:
        LDR.N    R1,??DataTable5_12  ;; 0x43fe0a2c
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Dip_Switch_2
//   81   {
//   82     Switch_Value+=4;
        ADDS     R0,R0,#+4
//   83   }
//   84   if(!dip_3)
??Dip_Switch_2:
        LDR.N    R1,??DataTable5_13  ;; 0x43fe0a28
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Dip_Switch_3
//   85   {
//   86     Switch_Value+=8;
        ADDS     R0,R0,#+8
//   87   }
//   88   return Switch_Value;
??Dip_Switch_3:
        BX       LR               ;; return
//   89 }

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40038000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     ftm_init_struct

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x400ff080

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     gpio_init_struct_beep

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x400ff040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     gpio_init_struct_SpeedDirect_Left

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     gpio_init_struct_SpeedDirect_Right

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x400ff100

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     gpio_init_struct_StopCar

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     gpio_init_struct_Dip_Switch

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x43fe0a44

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x43fe0a40

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x43fe0a2c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_13:
        DC32     0x43fe0a28

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
// 128 bytes in section .bss
// 446 bytes in section .text
// 
// 446 bytes of CODE memory
// 128 bytes of DATA memory
//
//Errors: none
//Warnings: none
