///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:19
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\VisualScope.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\VisualScope.c -D
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\VisualScope.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_UART_PutChar

        PUBLIC CRC_Check
        PUBLIC OutPut_Data
        PUBLIC Send_Data

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\VisualScope.c
//    1 #include "VisualScope.h"
//    2 

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    3 uint16 Send_Data[4] = {0,0,0,0};
Send_Data:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//    4 uint16 CRC_Check(uint8 *buf, uint8 CRC_CNT)
//    5 {
CRC_Check:
        PUSH     {R4,R5}
//    6     uint16 CRC_temp;
//    7     uint8 i,j;
//    8     CRC_temp = 0xffff;
        MOVW     R2,#+65535
//    9     for (i=0;i<CRC_CNT; i++){      
        MOVS     R3,#+0
        B.N      ??CRC_Check_0
??CRC_Check_1:
        ADDS     R3,R3,#+1
??CRC_Check_0:
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R3,R1
        BCS.N    ??CRC_Check_2
//   10         CRC_temp ^= buf[i];
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        LDRB     R4,[R3, R0]
        EORS     R2,R4,R2
//   11         for (j=0;j<8;j++) {
        MOVS     R4,#+0
        B.N      ??CRC_Check_3
//   12             if (CRC_temp & 0x01)
//   13                 CRC_temp = (CRC_temp >>1 ) ^ 0xa001;
//   14             else
//   15                 CRC_temp = CRC_temp >> 1;
??CRC_Check_4:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
??CRC_Check_5:
        ADDS     R4,R4,#+1
??CRC_Check_3:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??CRC_Check_1
        LSLS     R5,R2,#+31
        BPL.N    ??CRC_Check_4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R2,R2,#+1
        EOR      R2,R2,#0xA000
        EORS     R2,R2,#0x1
        B.N      ??CRC_Check_5
//   16         }
//   17     }
//   18     return(CRC_temp);
??CRC_Check_2:
        MOVS     R0,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4,R5}
        BX       LR               ;; return
//   19 }
//   20 //发送数据

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   21 void OutPut_Data(void)
//   22 {
OutPut_Data:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
//   23   uint8 databuf[10] = {0};
        ADD      R0,SP,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        STM      R0!,{R1-R3}
        SUBS     R0,R0,#+12
//   24   uint8 i;
//   25   uint16 CRC16 = 0;
        MOVS     R0,#+0
//   26   for(i=0;i<4;i++) 
        MOVS     R4,#+0
        B.N      ??OutPut_Data_0
//   27   {
//   28     databuf[i*2]   = (uint8)(Send_Data[i]%256);
??OutPut_Data_1:
        LDR.N    R0,??DataTable0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRH     R0,[R0, R4, LSL #+1]
        MOV      R1,#+256
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        ADD      R0,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        STRB     R2,[R0, R4, LSL #+1]
//   29     databuf[i*2+1] = (uint8)(Send_Data[i]/256);
        LDR.N    R0,??DataTable0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRH     R0,[R0, R4, LSL #+1]
        MOV      R1,#+256
        SDIV     R0,R0,R1
        ADD      R1,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        ADDS     R1,R1,R4, LSL #+1
        STRB     R0,[R1, #+1]
//   30   }
        ADDS     R4,R4,#+1
??OutPut_Data_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+4
        BLT.N    ??OutPut_Data_1
//   31   CRC16 = CRC_Check(databuf,8);
        MOVS     R1,#+8
        ADD      R0,SP,#+0
        BL       CRC_Check
//   32   databuf[8] = CRC16%256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        STRB     R2,[SP, #+8]
//   33   databuf[9] = CRC16/256;
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+256
        SDIV     R0,R0,R1
        STRB     R0,[SP, #+9]
//   34   for(i=0;i<10;i++)
        MOVS     R4,#+0
        B.N      ??OutPut_Data_2
//   35      LPLD_UART_PutChar(UART3,databuf[i]);
??OutPut_Data_3:
        ADD      R0,SP,#+0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LDRSB    R1,[R4, R0]
        SXTB     R1,R1            ;; SignExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable0_1  ;; 0x4006d000
        BL       LPLD_UART_PutChar
        ADDS     R4,R4,#+1
??OutPut_Data_2:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+10
        BLT.N    ??OutPut_Data_3
//   36 }
        POP      {R0-R4,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     Send_Data

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0_1:
        DC32     0x4006d000

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
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

        END
//   37 /*只需调用void OutPut_Data(void),就可实现数据的发送。共四个通道，将所要发送的数据放在Send_Data[]里面。
//   38   示例：Send_Data[0] = (uint16)(Set_Speed);
//   39         Send_Data[1] = (uint16)(Get_Speed);
//   40         Send_Data[2] = (uint16)(Recognition_C_Line_1[0]);
//   41         Send_Data[3] = (uint16)(Recognition_C_Line_0[0]);*/
// 
//   8 bytes in section .bss
//  12 bytes in section .rodata
// 228 bytes in section .text
// 
// 228 bytes of CODE  memory
//  12 bytes of CONST memory
//   8 bytes of DATA  memory
//
//Errors: none
//Warnings: none
