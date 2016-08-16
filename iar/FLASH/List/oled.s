///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       15/Aug/2016  15:07:16
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\oled.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\oled.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\oled.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_GPIO_Init
        EXTERN __aeabi_memcpy4

        PUBLIC Draw_BMP
        PUBLIC F16x16
        PUBLIC F16x16_Idx
        PUBLIC F6x8
        PUBLIC F8X16
        PUBLIC LCD_CLS
        PUBLIC LCD_DLY_ms
        PUBLIC LCD_Fill
        PUBLIC LCD_Init
        PUBLIC LCD_P16x16Str
        PUBLIC LCD_P6x8Str
        PUBLIC LCD_P6x8char
        PUBLIC LCD_P6x8s
        PUBLIC LCD_P8x16Str
        PUBLIC LCD_P8x16s
        PUBLIC LCD_Print
        PUBLIC LCD_PutPixel
        PUBLIC LCD_Rectangle
        PUBLIC LCD_Set_Pos
        PUBLIC LCD_WrCmd
        PUBLIC LCD_WrDat
        PUBLIC Num2Str
        PUBLIC Show_Number
        PUBLIC gpio_init_struct0
        PUBLIC init_gpio_oled
        PUBLIC table

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\oled.c
//    1 /********************************************
//    2 使用说明：
//    3 OLED电源使用3.3V。   
//    4 ----------------
//    5 G    电源地
//    6 3.3V 接3.3V电源
//    7 D0   PORTA_PA15 
//    8 D1   PORTA_PA16
//    9 RST  PORTA_PA13 
//   10 DC   PORTA_PA12
//   11 CS   已接地，不用接
//   12 ********************************************/
//   13 /*
//   14 4线SPI使用说明：
//   15 VBT 供内部DC-DC电压，3.3~4.3V，如果使用5V电压，为保险起见串一个100~500欧的电阻
//   16 VCC 供内部逻辑电压 1.8~6V   
//   17 GND 地
//   18 
//   19 BS0 低电平
//   20 BS1 低电平
//   21 BS2 低电平
//   22 
//   23 CS  片选管脚
//   24 DC  命令数据选择管脚
//   25 RES 模块复位管脚 
//   26 D0（SCLK） ，时钟脚，由MCU控制
//   27 D1（MOSI） ，主输出从输入数据脚，由MCU控制
//   28 
//   29 D2 悬空      
//   30 D3-D7 ， 低电平 ， 也可悬空，但最好设为低电平
//   31 RD  低电平 ，也可悬空，但最好设为低电平
//   32 RW  低电平 ，也可悬空，但最好设为低电平
//   33 RD  低电平 ，也可悬空，但最好设为低电平   
//   34 */
//   35 //GPIOA_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(14));	//IO口输出低电平，亮
//   36 //GPIOA_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(14));	//IO口输出高电平，灭
//   37 //GPIOA_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(15));	//IO口输出低电平，亮
//   38 //GPIOA_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(15));	//IO口输出高电平，灭
//   39 //GPIOA_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(16));	//IO口输出低电平，亮
//   40 //GPIOA_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(16));	//IO口输出高电平，灭
//   41 //GPIOA_PDOR &= ~GPIO_PDOR_PDO(GPIO_PIN(17));	//IO口输出低电平，亮
//   42 //GPIOA_PDOR |=  GPIO_PDOR_PDO(GPIO_PIN(17));	//IO口输出高电平，灭
//   43 
//   44 #include "common.h"
//   45 #include "oled.h"
//   46 #include "HW_GPIO.H"

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   47 GPIO_InitTypeDef gpio_init_struct0;
gpio_init_struct0:
        DS8 20
//   48 

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//   49 const char table[10]={'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
table:
        DATA
        DC8 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 0, 0
//   50 
//   51 /**********************OLED显示屏引脚初始化********************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   52 void init_gpio_oled()
//   53 {
init_gpio_oled:
        PUSH     {R7,LR}
//   54   gpio_init_struct0.GPIO_PTx = PTA;
        LDR.W    R0,??DataTable10  ;; 0x400ff000
        LDR.W    R1,??DataTable10_1
        STR      R0,[R1, #+0]
//   55   gpio_init_struct0.GPIO_Pins = GPIO_Pin15|GPIO_Pin16|GPIO_Pin13|GPIO_Pin12;
        MOVS     R0,#+110592
        LDR.W    R1,??DataTable10_1
        STR      R0,[R1, #+4]
//   56   gpio_init_struct0.GPIO_Dir = DIR_OUTPUT;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+12]
//   57   gpio_init_struct0.GPIO_Output = OUTPUT_L;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STRB     R0,[R1, #+13]
//   58   gpio_init_struct0.GPIO_PinControl = IRQC_DIS;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_1
        STR      R0,[R1, #+8]
//   59   LPLD_GPIO_Init(gpio_init_struct0);
        LDR.W    R1,??DataTable10_1
        SUB      SP,SP,#+16
        MOV      R0,SP
        MOVS     R2,#+20
        BL       __aeabi_memcpy4
        POP      {R0-R3}
        BL       LPLD_GPIO_Init
//   60 }
        POP      {R0,PC}          ;; return
//   61 /********************数字转字符显示*************************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62 void  Num2Str(uint8 *str,int32 number)
//   63 {
Num2Str:
        PUSH     {R4}
//   64   static uint8 i,j,Num_Wide;
//   65   static int32 number_sign;
//   66   static int32 temp;
//   67   j=0;
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_2
        STRB     R2,[R3, #+0]
//   68   if(number<0)
        CMP      R1,#+0
        BPL.N    ??Num2Str_0
//   69   {
//   70     number = -number;
        RSBS     R1,R1,#+0
//   71     str[0]='-';
        MOVS     R2,#+45
        STRB     R2,[R0, #+0]
//   72     j=1;
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_2
        STRB     R2,[R3, #+0]
//   73   }
//   74   number_sign = temp = number;
??Num2Str_0:
        LDR.W    R2,??DataTable10_3
        STR      R1,[R2, #+0]
        LDR.W    R2,??DataTable10_3
        LDR      R2,[R2, #+0]
        LDR.W    R3,??DataTable10_4
        STR      R2,[R3, #+0]
//   75   if(number>=10)
        CMP      R1,#+10
        BLT.N    ??Num2Str_1
//   76   {
//   77     for(Num_Wide = j;temp != 0;Num_Wide++)
        LDR.W    R1,??DataTable10_2
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable10_5
        STRB     R1,[R2, #+0]
        B.N      ??Num2Str_2
//   78     {
//   79       temp = temp/10;
??Num2Str_3:
        LDR.W    R1,??DataTable10_3
        LDR      R1,[R1, #+0]
        MOVS     R2,#+10
        SDIV     R1,R1,R2
        LDR.W    R2,??DataTable10_3
        STR      R1,[R2, #+0]
//   80     }
        LDR.W    R1,??DataTable10_5
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable10_5
        STRB     R1,[R2, #+0]
??Num2Str_2:
        LDR.W    R1,??DataTable10_3
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Num2Str_3
//   81     for(i=0;i<Num_Wide && number_sign!=0;i++)
        MOVS     R1,#+0
        LDR.W    R2,??DataTable10_6
        STRB     R1,[R2, #+0]
        B.N      ??Num2Str_4
//   82     {
//   83       str[Num_Wide-i-1] = table[number_sign%10];
??Num2Str_5:
        MOVS     R1,#+10
        LDR.W    R2,??DataTable10_5
        LDRB     R2,[R2, #+0]
        LDR.W    R3,??DataTable10_6
        LDRB     R3,[R3, #+0]
        SUBS     R2,R2,R3
        ADDS     R2,R2,R0
        LDR.W    R3,??DataTable10_4
        LDR      R3,[R3, #+0]
        LDR.W    R4,??DataTable10_4
        LDR      R4,[R4, #+0]
        SDIV     R4,R4,R1
        MLS      R1,R1,R4,R3
        LDR.W    R3,??DataTable10_7
        LDRB     R1,[R1, R3]
        STRB     R1,[R2, #-1]
//   84       number_sign = number_sign/10;
        LDR.W    R1,??DataTable10_4
        LDR      R1,[R1, #+0]
        MOVS     R2,#+10
        SDIV     R1,R1,R2
        LDR.W    R2,??DataTable10_4
        STR      R1,[R2, #+0]
//   85     }
        LDR.W    R1,??DataTable10_6
        LDRB     R1,[R1, #+0]
        ADDS     R1,R1,#+1
        LDR.W    R2,??DataTable10_6
        STRB     R1,[R2, #+0]
??Num2Str_4:
        LDR.W    R1,??DataTable10_6
        LDRB     R1,[R1, #+0]
        LDR.W    R2,??DataTable10_5
        LDRB     R2,[R2, #+0]
        CMP      R1,R2
        BCS.N    ??Num2Str_6
        LDR.W    R1,??DataTable10_4
        LDR      R1,[R1, #+0]
        CMP      R1,#+0
        BNE.N    ??Num2Str_5
//   86     str[Num_Wide] = '\0';
??Num2Str_6:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable10_5
        LDRB     R2,[R2, #+0]
        STRB     R1,[R2, R0]
        B.N      ??Num2Str_7
//   87   }
//   88   else
//   89   {
//   90     str[j] = table[number];
??Num2Str_1:
        LDR.W    R2,??DataTable10_7
        LDRB     R1,[R1, R2]
        LDR.W    R2,??DataTable10_2
        LDRB     R2,[R2, #+0]
        STRB     R1,[R2, R0]
//   91     str[j+1] ='\0';
        MOVS     R1,#+0
        LDR.W    R2,??DataTable10_2
        LDRB     R2,[R2, #+0]
        ADDS     R0,R2,R0
        STRB     R1,[R0, #+1]
//   92   }
//   93 }
??Num2Str_7:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??i:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??j:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(0)
??Num_Wide:
        DS8 1

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??number_sign:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??temp:
        DS8 4
//   94 /**********************OLED显示屏触发启动**********************/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   95 void LCD_Init(void)        
//   96 {
LCD_Init:
        PUSH     {R7,LR}
//   97   PTA15_O=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_8  ;; 0x43fe003c
        STR      R0,[R1, #+0]
//   98   //LCD_CS=1;	//预制SLK和SS为高电平   	
//   99   PTA13_O=0;
        MOVS     R0,#+0
        LDR.W    R1,??DataTable10_9  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  100   LCD_DLY_ms(50);
        MOVS     R0,#+50
        BL       LCD_DLY_ms
//  101   PTA13_O=1;
        MOVS     R0,#+1
        LDR.W    R1,??DataTable10_9  ;; 0x43fe0034
        STR      R0,[R1, #+0]
//  102   
//  103   LCD_WrCmd(0xae);//--turn off oled panel
        MOVS     R0,#+174
        BL       LCD_WrCmd
//  104   LCD_WrCmd(0x00);//---set low column address
        MOVS     R0,#+0
        BL       LCD_WrCmd
//  105   LCD_WrCmd(0x10);//---set high column address
        MOVS     R0,#+16
        BL       LCD_WrCmd
//  106   LCD_WrCmd(0x40);//--set start line address  Set Mapping RAM Display Start Line (0x00~0x3F)
        MOVS     R0,#+64
        BL       LCD_WrCmd
//  107   LCD_WrCmd(0x81);//--set contrast control register
        MOVS     R0,#+129
        BL       LCD_WrCmd
//  108   LCD_WrCmd(0xcf); // Set SEG Output Current Brightness
        MOVS     R0,#+207
        BL       LCD_WrCmd
//  109   LCD_WrCmd(0xa1);//--Set SEG/Column Mapping     0xa0左右反置 0xa1正常
        MOVS     R0,#+161
        BL       LCD_WrCmd
//  110   LCD_WrCmd(0xc8);//Set COM/Row Scan Direction   0xc0上下反置 0xc8正常
        MOVS     R0,#+200
        BL       LCD_WrCmd
//  111   LCD_WrCmd(0xa6);//--set normal display
        MOVS     R0,#+166
        BL       LCD_WrCmd
//  112   LCD_WrCmd(0xa8);//--set multiplex ratio(1 to 64)
        MOVS     R0,#+168
        BL       LCD_WrCmd
//  113   LCD_WrCmd(0x3f);//--1/64 duty
        MOVS     R0,#+63
        BL       LCD_WrCmd
//  114   LCD_WrCmd(0xd3);//-set display offset	Shift Mapping RAM Counter (0x00~0x3F)
        MOVS     R0,#+211
        BL       LCD_WrCmd
//  115   LCD_WrCmd(0x00);//-not offset
        MOVS     R0,#+0
        BL       LCD_WrCmd
//  116   LCD_WrCmd(0xd5);//--set display clock divide ratio/oscillator frequency
        MOVS     R0,#+213
        BL       LCD_WrCmd
//  117   LCD_WrCmd(0x80);//--set divide ratio, Set Clock as 100 Frames/Sec
        MOVS     R0,#+128
        BL       LCD_WrCmd
//  118   LCD_WrCmd(0xd9);//--set pre-charge period
        MOVS     R0,#+217
        BL       LCD_WrCmd
//  119   LCD_WrCmd(0xf1);//Set Pre-Charge as 15 Clocks & Discharge as 1 Clock
        MOVS     R0,#+241
        BL       LCD_WrCmd
//  120   LCD_WrCmd(0xda);//--set com pins hardware configuration
        MOVS     R0,#+218
        BL       LCD_WrCmd
//  121   LCD_WrCmd(0x12);
        MOVS     R0,#+18
        BL       LCD_WrCmd
//  122   LCD_WrCmd(0xdb);//--set vcomh
        MOVS     R0,#+219
        BL       LCD_WrCmd
//  123   LCD_WrCmd(0x40);//Set VCOM Deselect Level
        MOVS     R0,#+64
        BL       LCD_WrCmd
//  124   LCD_WrCmd(0x20);//-Set Page Addressing Mode (0x00/0x01/0x02)
        MOVS     R0,#+32
        BL       LCD_WrCmd
//  125   LCD_WrCmd(0x02);//
        MOVS     R0,#+2
        BL       LCD_WrCmd
//  126   LCD_WrCmd(0x8d);//--set Charge Pump enable/disable
        MOVS     R0,#+141
        BL       LCD_WrCmd
//  127   LCD_WrCmd(0x14);//--set(0x10) disable
        MOVS     R0,#+20
        BL       LCD_WrCmd
//  128   LCD_WrCmd(0xa4);// Disable Entire Display On (0xa4/0xa5)
        MOVS     R0,#+164
        BL       LCD_WrCmd
//  129   LCD_WrCmd(0xa6);// Disable Inverse Display On (0xa6/a7) 
        MOVS     R0,#+166
        BL       LCD_WrCmd
//  130   LCD_WrCmd(0xaf);//--turn on oled panel
        MOVS     R0,#+175
        BL       LCD_WrCmd
//  131   LCD_Fill(0x00);  //初始清屏
        MOVS     R0,#+0
        BL       LCD_Fill
//  132   LCD_Set_Pos(0,0);  	
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       LCD_Set_Pos
//  133 }
        POP      {R0,PC}          ;; return
//  134 /******延时函数******/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  135 void LCD_DLY_ms(word ms)
//  136 {                         
LCD_DLY_ms:
        B.N      ??LCD_DLY_ms_0
//  137   word a;
//  138   while(ms)
//  139   {
//  140     a=13350;
??LCD_DLY_ms_1:
        MOVW     R1,#+13350
//  141     while(a--);
??LCD_DLY_ms_2:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??LCD_DLY_ms_2
//  142     ms--;
        SUBS     R0,R0,#+1
//  143   }
??LCD_DLY_ms_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+0
        BNE.N    ??LCD_DLY_ms_1
//  144   return;
        BX       LR               ;; return
//  145 }

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  146 const byte F16x16_Idx[] = 
F16x16_Idx:
        DATA
        DC8 "\326\307\304\334\263\265\265\347\321\271\316\302\266\310"
        DC8 0
//  147 {
//  148   "智能车电压温度"
//  149 };
//  150 //16x16,宋体，小四号

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  151 const byte F16x16[]={
F16x16:
        DATA
        DC8 20, 19, 146, 126, 50, 82, 146, 0, 124, 68, 68, 68, 124, 0, 1, 1, 0
        DC8 255, 73, 73, 73, 73, 73, 73, 255, 0, 0, 0, 184, 151, 146, 144, 148
        DC8 184, 16, 0, 127, 72, 72, 68, 116, 32, 255, 10, 10, 74, 138, 127, 0
        DC8 0, 63, 68, 68, 66, 114, 32, 4, 132, 196, 164, 156, 135, 132, 244
        DC8 132, 132, 132, 132, 132, 0, 4, 4, 4, 4, 4, 4, 4, 255, 4, 4, 4, 4, 4
        DC8 4, 0, 248, 72, 72, 72, 72, 255, 72, 72, 72, 72, 248, 0, 0, 0, 15, 4
        DC8 4, 4, 4, 63, 68, 68, 68, 68, 79, 64, 112, 0, 254, 2, 66, 66, 66, 66
        DC8 250, 66, 66, 66, 98, 66, 2, 24, 39, 32, 32, 32, 32, 32, 63, 32, 33
        DC8 46, 36, 32, 32, 33, 134, 112, 0, 126, 74, 74, 74, 74, 74, 126, 0, 0
        DC8 0, 254, 1, 64, 127, 65, 65, 127, 65, 65, 127, 65, 65, 127, 64, 0
        DC8 252, 4, 36, 36, 252, 165, 166, 164, 252, 36, 36, 36, 4, 96, 31, 128
        DC8 128, 66, 70, 42, 18, 18, 42, 38, 66, 192, 64
//  152   0x14,0x13,0x92,0x7E,0x32,0x52,0x92,0x00,0x7C,0x44,0x44,0x44,0x7C,0x00,
//  153   0x01,0x01,0x00,0xFF,0x49,0x49,0x49,0x49,0x49,0x49,0xFF,0x00,0x00,0x00,//智
//  154   0xB8,0x97,0x92,0x90,0x94,0xB8,0x10,0x00,0x7F,0x48,0x48,0x44,0x74,0x20,
//  155   0xFF,0x0A,0x0A,0x4A,0x8A,0x7F,0x00,0x00,0x3F,0x44,0x44,0x42,0x72,0x20,//能
//  156   0x04,0x84,0xC4,0xA4,0x9C,0x87,0x84,0xF4,0x84,0x84,0x84,0x84,0x84,0x00,
//  157   0x04,0x04,0x04,0x04,0x04,0x04,0x04,0xFF,0x04,0x04,0x04,0x04,0x04,0x04,//车
//  158   0x00,0xF8,0x48,0x48,0x48,0x48,0xFF,0x48,0x48,0x48,0x48,0xF8,0x00,0x00,
//  159   0x00,0x0F,0x04,0x04,0x04,0x04,0x3F,0x44,0x44,0x44,0x44,0x4F,0x40,0x70,//电
//  160   0x00,0xFE,0x02,0x42,0x42,0x42,0x42,0xFA,0x42,0x42,0x42,0x62,0x42,0x02,
//  161   0x18,0x27,0x20,0x20,0x20,0x20,0x20,0x3F,0x20,0x21,0x2E,0x24,0x20,0x20,//压
//  162   0x21,0x86,0x70,0x00,0x7E,0x4A,0x4A,0x4A,0x4A,0x4A,0x7E,0x00,0x00,0x00,
//  163   0xFE,0x01,0x40,0x7F,0x41,0x41,0x7F,0x41,0x41,0x7F,0x41,0x41,0x7F,0x40,//温
//  164   0x00,0xFC,0x04,0x24,0x24,0xFC,0xA5,0xA6,0xA4,0xFC,0x24,0x24,0x24,0x04,
//  165   0x60,0x1F,0x80,0x80,0x42,0x46,0x2A,0x12,0x12,0x2A,0x26,0x42,0xC0,0x40,//度
//  166 };
//  167 //======================================

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  168 const byte F6x8[][6] =
F6x8:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 47, 0, 0, 0, 0, 7, 0, 7, 0, 0, 20, 127
        DC8 20, 127, 20, 0, 36, 42, 127, 42, 18, 0, 98, 100, 8, 19, 35, 0, 54
        DC8 73, 85, 34, 80, 0, 0, 5, 3, 0, 0, 0, 0, 28, 34, 65, 0, 0, 0, 65, 34
        DC8 28, 0, 0, 20, 8, 62, 8, 20, 0, 8, 8, 62, 8, 8, 0, 0, 0, 160, 96, 0
        DC8 0, 8, 8, 8, 8, 8, 0, 0, 96, 96, 0, 0, 0, 32, 16, 8, 4, 2, 0, 62, 81
        DC8 73, 69, 62, 0, 0, 66, 127, 64, 0, 0, 66, 97, 81, 73, 70, 0, 33, 65
        DC8 69, 75, 49, 0, 24, 20, 18, 127, 16, 0, 39, 69, 69, 69, 57, 0, 60
        DC8 74, 73, 73, 48, 0, 1, 113, 9, 5, 3, 0, 54, 73, 73, 73, 54, 0, 6, 73
        DC8 73, 41, 30, 0, 0, 54, 54, 0, 0, 0, 0, 86, 54, 0, 0, 0, 8, 20, 34
        DC8 65, 0, 0, 20, 20, 20, 20, 20, 0, 0, 65, 34, 20, 8, 0, 2, 1, 81, 9
        DC8 6, 0, 50, 73, 89, 81, 62, 0, 124, 18, 17, 18, 124, 0, 127, 73, 73
        DC8 73, 54, 0, 62, 65, 65, 65, 34, 0, 127, 65, 65, 34, 28, 0, 127, 73
        DC8 73, 73, 65, 0, 127, 9, 9, 9, 1, 0, 62, 65, 73, 73, 122, 0, 127, 8
        DC8 8, 8, 127, 0, 0, 65, 127, 65, 0, 0, 32, 64, 65, 63, 1, 0, 127, 8
        DC8 20, 34, 65, 0, 127, 64, 64, 64, 64, 0, 127, 2, 12, 2, 127, 0, 127
        DC8 4, 8, 16, 127, 0, 62, 65, 65, 65, 62, 0, 127, 9, 9, 9, 6, 0, 62, 65
        DC8 81, 33, 94, 0, 127, 9, 25, 41, 70, 0, 70, 73, 73, 73, 49, 0, 1, 1
        DC8 127, 1, 1, 0, 63, 64, 64, 64, 63, 0, 31, 32, 64, 32, 31, 0, 63, 64
        DC8 56, 64, 63, 0, 99, 20, 8, 20, 99, 0, 7, 8, 112, 8, 7, 0, 97, 81, 73
        DC8 69, 67, 0, 0, 127, 65, 65, 0, 0, 85, 42, 85, 42, 85, 0, 0, 65, 65
        DC8 127, 0, 0, 4, 2, 1, 2, 4, 0, 64, 64, 64, 64, 64, 0, 0, 1, 2, 4, 0
        DC8 0, 32, 84, 84, 84, 120, 0, 127, 72, 68, 68, 56, 0, 56, 68, 68, 68
        DC8 32, 0, 56, 68, 68, 72, 127, 0, 56, 84, 84, 84, 24, 0, 8, 126, 9, 1
        DC8 2, 0, 24, 164, 164, 164, 124, 0, 127, 8, 4, 4, 120, 0, 0, 68, 125
        DC8 64, 0, 0, 64, 128, 132, 125, 0, 0, 127, 16, 40, 68, 0, 0, 0, 65
        DC8 127, 64, 0, 0, 124, 4, 24, 4, 120, 0, 124, 8, 4, 4, 120, 0, 56, 68
        DC8 68, 68, 56, 0, 252, 36, 36, 36, 24, 0, 24, 36, 36, 24, 252, 0, 124
        DC8 8, 4, 4, 8, 0, 72, 84, 84, 84, 32, 0, 4, 63, 68, 64, 32, 0, 60, 64
        DC8 64, 32, 124, 0, 28, 32, 64, 32, 28, 0, 60, 64, 48, 64, 60, 0, 68
        DC8 40, 16, 40, 68, 0, 28, 160, 160, 160, 124, 0, 68, 100, 84, 76, 68
        DC8 20, 20, 20, 20, 20, 20
//  169 {
//  170   { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },   // sp
//  171   { 0x00, 0x00, 0x00, 0x2f, 0x00, 0x00 },   // !
//  172   { 0x00, 0x00, 0x07, 0x00, 0x07, 0x00 },   // "
//  173   { 0x00, 0x14, 0x7f, 0x14, 0x7f, 0x14 },   // #
//  174   { 0x00, 0x24, 0x2a, 0x7f, 0x2a, 0x12 },   // $
//  175   { 0x00, 0x62, 0x64, 0x08, 0x13, 0x23 },   // %
//  176   { 0x00, 0x36, 0x49, 0x55, 0x22, 0x50 },   // &
//  177   { 0x00, 0x00, 0x05, 0x03, 0x00, 0x00 },   // '
//  178   { 0x00, 0x00, 0x1c, 0x22, 0x41, 0x00 },   // (
//  179   { 0x00, 0x00, 0x41, 0x22, 0x1c, 0x00 },   // )
//  180   { 0x00, 0x14, 0x08, 0x3E, 0x08, 0x14 },   // *
//  181   { 0x00, 0x08, 0x08, 0x3E, 0x08, 0x08 },   // +
//  182   { 0x00, 0x00, 0x00, 0xA0, 0x60, 0x00 },   // ,
//  183   { 0x00, 0x08, 0x08, 0x08, 0x08, 0x08 },   // -
//  184   { 0x00, 0x00, 0x60, 0x60, 0x00, 0x00 },   // .
//  185   { 0x00, 0x20, 0x10, 0x08, 0x04, 0x02 },   // /
//  186   { 0x00, 0x3E, 0x51, 0x49, 0x45, 0x3E },   // 0
//  187   { 0x00, 0x00, 0x42, 0x7F, 0x40, 0x00 },   // 1
//  188   { 0x00, 0x42, 0x61, 0x51, 0x49, 0x46 },   // 2
//  189   { 0x00, 0x21, 0x41, 0x45, 0x4B, 0x31 },   // 3
//  190   { 0x00, 0x18, 0x14, 0x12, 0x7F, 0x10 },   // 4
//  191   { 0x00, 0x27, 0x45, 0x45, 0x45, 0x39 },   // 5
//  192   { 0x00, 0x3C, 0x4A, 0x49, 0x49, 0x30 },   // 6
//  193   { 0x00, 0x01, 0x71, 0x09, 0x05, 0x03 },   // 7
//  194   { 0x00, 0x36, 0x49, 0x49, 0x49, 0x36 },   // 8
//  195   { 0x00, 0x06, 0x49, 0x49, 0x29, 0x1E },   // 9
//  196   { 0x00, 0x00, 0x36, 0x36, 0x00, 0x00 },   // :
//  197   { 0x00, 0x00, 0x56, 0x36, 0x00, 0x00 },   // ;
//  198   { 0x00, 0x08, 0x14, 0x22, 0x41, 0x00 },   // <
//  199   { 0x00, 0x14, 0x14, 0x14, 0x14, 0x14 },   // =
//  200   { 0x00, 0x00, 0x41, 0x22, 0x14, 0x08 },   // >
//  201   { 0x00, 0x02, 0x01, 0x51, 0x09, 0x06 },   // ?
//  202   { 0x00, 0x32, 0x49, 0x59, 0x51, 0x3E },   // @
//  203   { 0x00, 0x7C, 0x12, 0x11, 0x12, 0x7C },   // A
//  204   { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x36 },   // B
//  205   { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x22 },   // C
//  206   { 0x00, 0x7F, 0x41, 0x41, 0x22, 0x1C },   // D
//  207   { 0x00, 0x7F, 0x49, 0x49, 0x49, 0x41 },   // E
//  208   { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x01 },   // F
//  209   { 0x00, 0x3E, 0x41, 0x49, 0x49, 0x7A },   // G
//  210   { 0x00, 0x7F, 0x08, 0x08, 0x08, 0x7F },   // H
//  211   { 0x00, 0x00, 0x41, 0x7F, 0x41, 0x00 },   // I
//  212   { 0x00, 0x20, 0x40, 0x41, 0x3F, 0x01 },   // J
//  213   { 0x00, 0x7F, 0x08, 0x14, 0x22, 0x41 },   // K
//  214   { 0x00, 0x7F, 0x40, 0x40, 0x40, 0x40 },   // L
//  215   { 0x00, 0x7F, 0x02, 0x0C, 0x02, 0x7F },   // M
//  216   { 0x00, 0x7F, 0x04, 0x08, 0x10, 0x7F },   // N
//  217   { 0x00, 0x3E, 0x41, 0x41, 0x41, 0x3E },   // O
//  218   { 0x00, 0x7F, 0x09, 0x09, 0x09, 0x06 },   // P
//  219   { 0x00, 0x3E, 0x41, 0x51, 0x21, 0x5E },   // Q
//  220   { 0x00, 0x7F, 0x09, 0x19, 0x29, 0x46 },   // R
//  221   { 0x00, 0x46, 0x49, 0x49, 0x49, 0x31 },   // S
//  222   { 0x00, 0x01, 0x01, 0x7F, 0x01, 0x01 },   // T
//  223   { 0x00, 0x3F, 0x40, 0x40, 0x40, 0x3F },   // U
//  224   { 0x00, 0x1F, 0x20, 0x40, 0x20, 0x1F },   // V
//  225   { 0x00, 0x3F, 0x40, 0x38, 0x40, 0x3F },   // W
//  226   { 0x00, 0x63, 0x14, 0x08, 0x14, 0x63 },   // X
//  227   { 0x00, 0x07, 0x08, 0x70, 0x08, 0x07 },   // Y
//  228   { 0x00, 0x61, 0x51, 0x49, 0x45, 0x43 },   // Z
//  229   { 0x00, 0x00, 0x7F, 0x41, 0x41, 0x00 },   // [
//  230   { 0x00, 0x55, 0x2A, 0x55, 0x2A, 0x55 },   // 55
//  231   { 0x00, 0x00, 0x41, 0x41, 0x7F, 0x00 },   // ]
//  232   { 0x00, 0x04, 0x02, 0x01, 0x02, 0x04 },   // ^
//  233   { 0x00, 0x40, 0x40, 0x40, 0x40, 0x40 },   // _
//  234   { 0x00, 0x00, 0x01, 0x02, 0x04, 0x00 },   // '
//  235   { 0x00, 0x20, 0x54, 0x54, 0x54, 0x78 },   // a
//  236   { 0x00, 0x7F, 0x48, 0x44, 0x44, 0x38 },   // b
//  237   { 0x00, 0x38, 0x44, 0x44, 0x44, 0x20 },   // c
//  238   { 0x00, 0x38, 0x44, 0x44, 0x48, 0x7F },   // d
//  239   { 0x00, 0x38, 0x54, 0x54, 0x54, 0x18 },   // e
//  240   { 0x00, 0x08, 0x7E, 0x09, 0x01, 0x02 },   // f
//  241   { 0x00, 0x18, 0xA4, 0xA4, 0xA4, 0x7C },   // g
//  242   { 0x00, 0x7F, 0x08, 0x04, 0x04, 0x78 },   // h
//  243   { 0x00, 0x00, 0x44, 0x7D, 0x40, 0x00 },   // i
//  244   { 0x00, 0x40, 0x80, 0x84, 0x7D, 0x00 },   // j
//  245   { 0x00, 0x7F, 0x10, 0x28, 0x44, 0x00 },   // k
//  246   { 0x00, 0x00, 0x41, 0x7F, 0x40, 0x00 },   // l
//  247   { 0x00, 0x7C, 0x04, 0x18, 0x04, 0x78 },   // m
//  248   { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x78 },   // n
//  249   { 0x00, 0x38, 0x44, 0x44, 0x44, 0x38 },   // o
//  250   { 0x00, 0xFC, 0x24, 0x24, 0x24, 0x18 },   // p
//  251   { 0x00, 0x18, 0x24, 0x24, 0x18, 0xFC },   // q
//  252   { 0x00, 0x7C, 0x08, 0x04, 0x04, 0x08 },   // r
//  253   { 0x00, 0x48, 0x54, 0x54, 0x54, 0x20 },   // s
//  254   { 0x00, 0x04, 0x3F, 0x44, 0x40, 0x20 },   // t
//  255   { 0x00, 0x3C, 0x40, 0x40, 0x20, 0x7C },   // u
//  256   { 0x00, 0x1C, 0x20, 0x40, 0x20, 0x1C },   // v
//  257   { 0x00, 0x3C, 0x40, 0x30, 0x40, 0x3C },   // w
//  258   { 0x00, 0x44, 0x28, 0x10, 0x28, 0x44 },   // x
//  259   { 0x00, 0x1C, 0xA0, 0xA0, 0xA0, 0x7C },   // y
//  260   { 0x00, 0x44, 0x64, 0x54, 0x4C, 0x44 },   // z
//  261   { 0x14, 0x14, 0x14, 0x14, 0x14, 0x14 }    // horiz lines
//  262 };
//  263 //======================================================
//  264 // 128X64I液晶底层驱动[8X16]字体库
//  265 // 设计者: powerint
//  266 // 描  述: [8X16]西文字符的字模数据 (纵向取模,字节倒序)
//  267 // !"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~
//  268 //======================================================

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
//  269 const byte F8X16[]=
F8X16:
        DATA
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 248, 0, 0
        DC8 0, 0, 0, 0, 0, 51, 48, 0, 0, 0, 0, 16, 12, 6, 16, 12, 6, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 64, 192, 120, 64, 192, 120, 64, 0, 4, 63, 4, 4, 63
        DC8 4, 4, 0, 0, 112, 136, 252, 8, 48, 0, 0, 0, 24, 32, 255, 33, 30, 0
        DC8 0, 240, 8, 240, 0, 224, 24, 0, 0, 0, 33, 28, 3, 30, 33, 30, 0, 0
        DC8 240, 8, 136, 112, 0, 0, 0, 30, 33, 35, 36, 25, 39, 33, 16, 16, 22
        DC8 14, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 224, 24, 4, 2
        DC8 0, 0, 0, 0, 7, 24, 32, 64, 0, 0, 2, 4, 24, 224, 0, 0, 0, 0, 64, 32
        DC8 24, 7, 0, 0, 0, 64, 64, 128, 240, 128, 64, 64, 0, 2, 2, 1, 15, 1, 2
        DC8 2, 0, 0, 0, 0, 240, 0, 0, 0, 0, 1, 1, 1, 31, 1, 1, 1, 0, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 128, 176, 112, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 48, 48, 0, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 128, 96, 24, 4, 0, 96, 24, 6, 1, 0, 0, 0, 0, 224, 16
        DC8 8, 8, 16, 224, 0, 0, 15, 16, 32, 32, 16, 15, 0, 0, 16, 16, 248, 0
        DC8 0, 0, 0, 0, 32, 32, 63, 32, 32, 0, 0, 0, 112, 8, 8, 8, 136, 112, 0
        DC8 0, 48, 40, 36, 34, 33, 48, 0, 0, 48, 8, 136, 136, 72, 48, 0, 0, 24
        DC8 32, 32, 32, 17, 14, 0, 0, 0, 192, 32, 16, 248, 0, 0, 0, 7, 4, 36
        DC8 36, 63, 36, 0, 0, 248, 8, 136, 136, 8, 8, 0, 0, 25, 33, 32, 32, 17
        DC8 14, 0, 0, 224, 16, 136, 136, 24, 0, 0, 0, 15, 17, 32, 32, 17, 14, 0
        DC8 0, 56, 8, 8, 200, 56, 8, 0, 0, 0, 0, 63, 0, 0, 0, 0, 0, 112, 136, 8
        DC8 8, 136, 112, 0, 0, 28, 34, 33, 33, 34, 28, 0, 0, 224, 16, 8, 8, 16
        DC8 224, 0, 0, 0, 49, 34, 34, 17, 15, 0, 0, 0, 0, 192, 192, 0, 0, 0, 0
        DC8 0, 0, 48, 48, 0, 0, 0, 0, 0, 0, 128, 0, 0, 0, 0, 0, 0, 128, 96, 0
        DC8 0, 0, 0, 0, 0, 128, 64, 32, 16, 8, 0, 0, 1, 2, 4, 8, 16, 32, 0, 64
        DC8 64, 64, 64, 64, 64, 64, 0, 4, 4, 4, 4, 4, 4, 4, 0, 0, 8, 16, 32, 64
        DC8 128, 0, 0, 0, 32, 16, 8, 4, 2, 1, 0, 0, 112, 72, 8, 8, 8, 240, 0, 0
        DC8 0, 0, 48, 54, 1, 0, 0, 192, 48, 200, 40, 232, 16, 224, 0, 7, 24, 39
        DC8 36, 35, 20, 11, 0, 0, 0, 192, 56, 224, 0, 0, 0, 32, 60, 35, 2, 2
        DC8 39, 56, 32, 8, 248, 136, 136, 136, 112, 0, 0, 32, 63, 32, 32, 32
        DC8 17, 14, 0, 192, 48, 8, 8, 8, 8, 56, 0, 7, 24, 32, 32, 32, 16, 8, 0
        DC8 8, 248, 8, 8, 8, 16, 224, 0, 32, 63, 32, 32, 32, 16, 15, 0, 8, 248
        DC8 136, 136, 232, 8, 16, 0, 32, 63, 32, 32, 35, 32, 24, 0, 8, 248, 136
        DC8 136, 232, 8, 16, 0, 32, 63, 32, 0, 3, 0, 0, 0, 192, 48, 8, 8, 8, 56
        DC8 0, 0, 7, 24, 32, 32, 34, 30, 2, 0, 8, 248, 8, 0, 0, 8, 248, 8, 32
        DC8 63, 33, 1, 1, 33, 63, 32, 0, 8, 8, 248, 8, 8, 0, 0, 0, 32, 32, 63
        DC8 32, 32, 0, 0, 0, 0, 8, 8, 248, 8, 8, 0, 192, 128, 128, 128, 127, 0
        DC8 0, 0, 8, 248, 136, 192, 40, 24, 8, 0, 32, 63, 32, 1, 38, 56, 32, 0
        DC8 8, 248, 8, 0, 0, 0, 0, 0, 32, 63, 32, 32, 32, 32, 48, 0, 8, 248
        DC8 248, 0, 248, 248, 8, 0, 32, 63, 0, 63, 0, 63, 32, 0, 8, 248, 48
        DC8 192, 0, 8, 248, 8, 32, 63, 32, 0, 7, 24, 63, 0, 224, 16, 8, 8, 8
        DC8 16, 224, 0, 15, 16, 32, 32, 32, 16, 15, 0, 8, 248, 8, 8, 8, 8, 240
        DC8 0, 32, 63, 33, 1, 1, 1, 0, 0, 224, 16, 8, 8, 8, 16, 224, 0, 15, 24
        DC8 36, 36, 56, 80, 79, 0, 8, 248, 136, 136, 136, 136, 112, 0, 32, 63
        DC8 32, 0, 3, 12, 48, 32, 0, 112, 136, 8, 8, 8, 56, 0, 0, 56, 32, 33
        DC8 33, 34, 28, 0, 24, 8, 8, 248, 8, 8, 24, 0, 0, 0, 32, 63, 32, 0, 0
        DC8 0, 8, 248, 8, 0, 0, 8, 248, 8, 0, 31, 32, 32, 32, 32, 31, 0, 8, 120
        DC8 136, 0, 0, 200, 56, 8, 0, 0, 7, 56, 14, 1, 0, 0, 248, 8, 0, 248, 0
        DC8 8, 248, 0, 3, 60, 7, 0, 7, 60, 3, 0, 8, 24, 104, 128, 128, 104, 24
        DC8 8, 32, 48, 44, 3, 3, 44, 48, 32, 8, 56, 200, 0, 200, 56, 8, 0, 0, 0
        DC8 32, 63, 32, 0, 0, 0, 16, 8, 8, 8, 200, 56, 8, 0, 32, 56, 38, 33, 32
        DC8 32, 24, 0, 0, 0, 0, 254, 2, 2, 2, 0, 0, 0, 0, 127, 64, 64, 64, 0, 0
        DC8 12, 48, 192, 0, 0, 0, 0, 0, 0, 0, 1, 6, 56, 192, 0, 0, 2, 2, 2, 254
        DC8 0, 0, 0, 0, 64, 64, 64, 127, 0, 0, 0, 0, 0, 4, 2, 2, 2, 4, 0, 0, 0
        DC8 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 128, 128, 0, 2, 2, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        DC8 128, 128, 128, 128, 0, 0, 0, 25, 36, 34, 34, 34, 63, 32, 8, 248, 0
        DC8 128, 128, 0, 0, 0, 0, 63, 17, 32, 32, 17, 14, 0, 0, 0, 0, 128, 128
        DC8 128, 0, 0, 0, 14, 17, 32, 32, 32, 17, 0, 0, 0, 0, 128, 128, 136
        DC8 248, 0, 0, 14, 17, 32, 32, 16, 63, 32, 0, 0, 128, 128, 128, 128, 0
        DC8 0, 0, 31, 34, 34, 34, 34, 19, 0, 0, 128, 128, 240, 136, 136, 136
        DC8 24, 0, 32, 32, 63, 32, 32, 0, 0, 0, 0, 128, 128, 128, 128, 128, 0
        DC8 0, 107, 148, 148, 148, 147, 96, 0, 8, 248, 0, 128, 128, 128, 0, 0
        DC8 32, 63, 33, 0, 0, 32, 63, 32, 0, 128, 152, 152, 0, 0, 0, 0, 0, 32
        DC8 32, 63, 32, 32, 0, 0, 0, 0, 0, 128, 152, 152, 0, 0, 0, 192, 128
        DC8 128, 128, 127, 0, 0, 8, 248, 0, 0, 128, 128, 128, 0, 32, 63, 36, 2
        DC8 45, 48, 32, 0, 0, 8, 8, 248, 0, 0, 0, 0, 0, 32, 32, 63, 32, 32, 0
        DC8 0, 128, 128, 128, 128, 128, 128, 128, 0, 32, 63, 32, 0, 63, 32, 0
        DC8 63, 128, 128, 0, 128, 128, 128, 0, 0, 32, 63, 33, 0, 0, 32, 63, 32
        DC8 0, 0, 128, 128, 128, 128, 0, 0, 0, 31, 32, 32, 32, 32, 31, 0, 128
        DC8 128, 0, 128, 128, 0, 0, 0, 128, 255, 161, 32, 32, 17, 14, 0, 0, 0
        DC8 0, 128, 128, 128, 128, 0, 0, 14, 17, 32, 32, 160, 255, 128, 128
        DC8 128, 128, 0, 128, 128, 128, 0, 32, 32, 63, 33, 32, 0, 1, 0, 0, 0
        DC8 128, 128, 128, 128, 128, 0, 0, 51, 36, 36, 36, 36, 25, 0, 0, 128
        DC8 128, 224, 128, 128, 0, 0, 0, 0, 0, 31, 32, 32, 0, 0, 128, 128, 0, 0
        DC8 0, 128, 128, 0, 0, 31, 32, 32, 32, 16, 63, 32, 128, 128, 128, 0, 0
        DC8 128, 128, 128, 0, 1, 14, 48, 8, 6, 1, 0, 128, 128, 0, 128, 0, 128
        DC8 128, 128, 15, 48, 12, 3, 12, 48, 15, 0, 0, 128, 128, 0, 128, 128
        DC8 128, 0, 0, 32, 49, 46, 14, 49, 32, 0, 128, 128, 128, 0, 0, 128, 128
        DC8 128, 128, 129, 142, 112, 24, 6, 1, 0, 0, 128, 128, 128, 128, 128
        DC8 128, 0, 0, 33, 48, 44, 34, 33, 48, 0, 0, 0, 0, 0, 128, 124, 2, 2, 0
        DC8 0, 0, 0, 0, 63, 64, 64, 0, 0, 0, 0, 255, 0, 0, 0, 0, 0, 0, 0, 255
        DC8 0, 0, 0, 0, 2, 2, 124, 128, 0, 0, 0, 0, 64, 64, 63, 0, 0, 0, 0, 0
        DC8 6, 1, 1, 2, 2, 4, 4, 0, 0, 0, 0, 0, 0, 0, 0
//  270 {
//  271   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,// 0
//  272   0x00,0x00,0x00,0xF8,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x33,0x30,0x00,0x00,0x00,//!1
//  273   0x00,0x10,0x0C,0x06,0x10,0x0C,0x06,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//"2
//  274   0x40,0xC0,0x78,0x40,0xC0,0x78,0x40,0x00,0x04,0x3F,0x04,0x04,0x3F,0x04,0x04,0x00,//#3
//  275   0x00,0x70,0x88,0xFC,0x08,0x30,0x00,0x00,0x00,0x18,0x20,0xFF,0x21,0x1E,0x00,0x00,//$4
//  276   0xF0,0x08,0xF0,0x00,0xE0,0x18,0x00,0x00,0x00,0x21,0x1C,0x03,0x1E,0x21,0x1E,0x00,//%5
//  277   0x00,0xF0,0x08,0x88,0x70,0x00,0x00,0x00,0x1E,0x21,0x23,0x24,0x19,0x27,0x21,0x10,//&6
//  278   0x10,0x16,0x0E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//'7
//  279   0x00,0x00,0x00,0xE0,0x18,0x04,0x02,0x00,0x00,0x00,0x00,0x07,0x18,0x20,0x40,0x00,//(8
//  280   0x00,0x02,0x04,0x18,0xE0,0x00,0x00,0x00,0x00,0x40,0x20,0x18,0x07,0x00,0x00,0x00,//)9
//  281   0x40,0x40,0x80,0xF0,0x80,0x40,0x40,0x00,0x02,0x02,0x01,0x0F,0x01,0x02,0x02,0x00,//*10
//  282   0x00,0x00,0x00,0xF0,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x1F,0x01,0x01,0x01,0x00,//+11
//  283   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0xB0,0x70,0x00,0x00,0x00,0x00,0x00,//,12
//  284   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x01,0x01,0x01,0x01,0x01,0x01,//-13
//  285   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,0x00,0x00,//.14
//  286   0x00,0x00,0x00,0x00,0x80,0x60,0x18,0x04,0x00,0x60,0x18,0x06,0x01,0x00,0x00,0x00,///15
//  287   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x0F,0x10,0x20,0x20,0x10,0x0F,0x00,//016
//  288   0x00,0x10,0x10,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//117
//  289   0x00,0x70,0x08,0x08,0x08,0x88,0x70,0x00,0x00,0x30,0x28,0x24,0x22,0x21,0x30,0x00,//218
//  290   0x00,0x30,0x08,0x88,0x88,0x48,0x30,0x00,0x00,0x18,0x20,0x20,0x20,0x11,0x0E,0x00,//319
//  291   0x00,0x00,0xC0,0x20,0x10,0xF8,0x00,0x00,0x00,0x07,0x04,0x24,0x24,0x3F,0x24,0x00,//420
//  292   0x00,0xF8,0x08,0x88,0x88,0x08,0x08,0x00,0x00,0x19,0x21,0x20,0x20,0x11,0x0E,0x00,//521
//  293   0x00,0xE0,0x10,0x88,0x88,0x18,0x00,0x00,0x00,0x0F,0x11,0x20,0x20,0x11,0x0E,0x00,//622
//  294   0x00,0x38,0x08,0x08,0xC8,0x38,0x08,0x00,0x00,0x00,0x00,0x3F,0x00,0x00,0x00,0x00,//723
//  295   0x00,0x70,0x88,0x08,0x08,0x88,0x70,0x00,0x00,0x1C,0x22,0x21,0x21,0x22,0x1C,0x00,//824
//  296   0x00,0xE0,0x10,0x08,0x08,0x10,0xE0,0x00,0x00,0x00,0x31,0x22,0x22,0x11,0x0F,0x00,//925
//  297   0x00,0x00,0x00,0xC0,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x30,0x30,0x00,0x00,0x00,//:26
//  298   0x00,0x00,0x00,0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x60,0x00,0x00,0x00,0x00,//;27
//  299   0x00,0x00,0x80,0x40,0x20,0x10,0x08,0x00,0x00,0x01,0x02,0x04,0x08,0x10,0x20,0x00,//<28
//  300   0x40,0x40,0x40,0x40,0x40,0x40,0x40,0x00,0x04,0x04,0x04,0x04,0x04,0x04,0x04,0x00,//=29
//  301   0x00,0x08,0x10,0x20,0x40,0x80,0x00,0x00,0x00,0x20,0x10,0x08,0x04,0x02,0x01,0x00,//>30
//  302   0x00,0x70,0x48,0x08,0x08,0x08,0xF0,0x00,0x00,0x00,0x00,0x30,0x36,0x01,0x00,0x00,//?31
//  303   0xC0,0x30,0xC8,0x28,0xE8,0x10,0xE0,0x00,0x07,0x18,0x27,0x24,0x23,0x14,0x0B,0x00,//@32
//  304   0x00,0x00,0xC0,0x38,0xE0,0x00,0x00,0x00,0x20,0x3C,0x23,0x02,0x02,0x27,0x38,0x20,//A33
//  305   0x08,0xF8,0x88,0x88,0x88,0x70,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x11,0x0E,0x00,//B34
//  306   0xC0,0x30,0x08,0x08,0x08,0x08,0x38,0x00,0x07,0x18,0x20,0x20,0x20,0x10,0x08,0x00,//C35
//  307   0x08,0xF8,0x08,0x08,0x08,0x10,0xE0,0x00,0x20,0x3F,0x20,0x20,0x20,0x10,0x0F,0x00,//D36
//  308   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x20,0x23,0x20,0x18,0x00,//E37
//  309   0x08,0xF8,0x88,0x88,0xE8,0x08,0x10,0x00,0x20,0x3F,0x20,0x00,0x03,0x00,0x00,0x00,//F38
//  310   0xC0,0x30,0x08,0x08,0x08,0x38,0x00,0x00,0x07,0x18,0x20,0x20,0x22,0x1E,0x02,0x00,//G39
//  311   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x20,0x3F,0x21,0x01,0x01,0x21,0x3F,0x20,//H40
//  312   0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//I41
//  313   0x00,0x00,0x08,0x08,0xF8,0x08,0x08,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,0x00,//J42
//  314   0x08,0xF8,0x88,0xC0,0x28,0x18,0x08,0x00,0x20,0x3F,0x20,0x01,0x26,0x38,0x20,0x00,//K43
//  315   0x08,0xF8,0x08,0x00,0x00,0x00,0x00,0x00,0x20,0x3F,0x20,0x20,0x20,0x20,0x30,0x00,//L44
//  316   0x08,0xF8,0xF8,0x00,0xF8,0xF8,0x08,0x00,0x20,0x3F,0x00,0x3F,0x00,0x3F,0x20,0x00,//M45
//  317   0x08,0xF8,0x30,0xC0,0x00,0x08,0xF8,0x08,0x20,0x3F,0x20,0x00,0x07,0x18,0x3F,0x00,//N46
//  318   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x10,0x20,0x20,0x20,0x10,0x0F,0x00,//O47
//  319   0x08,0xF8,0x08,0x08,0x08,0x08,0xF0,0x00,0x20,0x3F,0x21,0x01,0x01,0x01,0x00,0x00,//P48
//  320   0xE0,0x10,0x08,0x08,0x08,0x10,0xE0,0x00,0x0F,0x18,0x24,0x24,0x38,0x50,0x4F,0x00,//Q49
//  321   0x08,0xF8,0x88,0x88,0x88,0x88,0x70,0x00,0x20,0x3F,0x20,0x00,0x03,0x0C,0x30,0x20,//R50
//  322   0x00,0x70,0x88,0x08,0x08,0x08,0x38,0x00,0x00,0x38,0x20,0x21,0x21,0x22,0x1C,0x00,//S51
//  323   0x18,0x08,0x08,0xF8,0x08,0x08,0x18,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//T52
//  324   0x08,0xF8,0x08,0x00,0x00,0x08,0xF8,0x08,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//U53
//  325   0x08,0x78,0x88,0x00,0x00,0xC8,0x38,0x08,0x00,0x00,0x07,0x38,0x0E,0x01,0x00,0x00,//V54
//  326   0xF8,0x08,0x00,0xF8,0x00,0x08,0xF8,0x00,0x03,0x3C,0x07,0x00,0x07,0x3C,0x03,0x00,//W55
//  327   0x08,0x18,0x68,0x80,0x80,0x68,0x18,0x08,0x20,0x30,0x2C,0x03,0x03,0x2C,0x30,0x20,//X56
//  328   0x08,0x38,0xC8,0x00,0xC8,0x38,0x08,0x00,0x00,0x00,0x20,0x3F,0x20,0x00,0x00,0x00,//Y57
//  329   0x10,0x08,0x08,0x08,0xC8,0x38,0x08,0x00,0x20,0x38,0x26,0x21,0x20,0x20,0x18,0x00,//Z58
//  330   0x00,0x00,0x00,0xFE,0x02,0x02,0x02,0x00,0x00,0x00,0x00,0x7F,0x40,0x40,0x40,0x00,//[59
//  331   0x00,0x0C,0x30,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x01,0x06,0x38,0xC0,0x00,//\60
//  332   0x00,0x02,0x02,0x02,0xFE,0x00,0x00,0x00,0x00,0x40,0x40,0x40,0x7F,0x00,0x00,0x00,//]61
//  333   0x00,0x00,0x04,0x02,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//^62
//  334   0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x80,//_63
//  335   0x00,0x02,0x02,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//`64
//  336   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x19,0x24,0x22,0x22,0x22,0x3F,0x20,//a65
//  337   0x08,0xF8,0x00,0x80,0x80,0x00,0x00,0x00,0x00,0x3F,0x11,0x20,0x20,0x11,0x0E,0x00,//b66
//  338   0x00,0x00,0x00,0x80,0x80,0x80,0x00,0x00,0x00,0x0E,0x11,0x20,0x20,0x20,0x11,0x00,//c67
//  339   0x00,0x00,0x00,0x80,0x80,0x88,0xF8,0x00,0x00,0x0E,0x11,0x20,0x20,0x10,0x3F,0x20,//d68
//  340   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x22,0x22,0x22,0x22,0x13,0x00,//e69
//  341   0x00,0x80,0x80,0xF0,0x88,0x88,0x88,0x18,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//f70
//  342   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x6B,0x94,0x94,0x94,0x93,0x60,0x00,//g71
//  343   0x08,0xF8,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//h72
//  344   0x00,0x80,0x98,0x98,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//i73
//  345   0x00,0x00,0x00,0x80,0x98,0x98,0x00,0x00,0x00,0xC0,0x80,0x80,0x80,0x7F,0x00,0x00,//j74
//  346   0x08,0xF8,0x00,0x00,0x80,0x80,0x80,0x00,0x20,0x3F,0x24,0x02,0x2D,0x30,0x20,0x00,//k75
//  347   0x00,0x08,0x08,0xF8,0x00,0x00,0x00,0x00,0x00,0x20,0x20,0x3F,0x20,0x20,0x00,0x00,//l76
//  348   0x80,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x20,0x3F,0x20,0x00,0x3F,0x20,0x00,0x3F,//m77
//  349   0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x3F,0x21,0x00,0x00,0x20,0x3F,0x20,//n78
//  350   0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x00,0x1F,0x20,0x20,0x20,0x20,0x1F,0x00,//o79
//  351   0x80,0x80,0x00,0x80,0x80,0x00,0x00,0x00,0x80,0xFF,0xA1,0x20,0x20,0x11,0x0E,0x00,//p80
//  352   0x00,0x00,0x00,0x80,0x80,0x80,0x80,0x00,0x00,0x0E,0x11,0x20,0x20,0xA0,0xFF,0x80,//q81
//  353   0x80,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x20,0x20,0x3F,0x21,0x20,0x00,0x01,0x00,//r82
//  354   0x00,0x00,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x33,0x24,0x24,0x24,0x24,0x19,0x00,//s83
//  355   0x00,0x80,0x80,0xE0,0x80,0x80,0x00,0x00,0x00,0x00,0x00,0x1F,0x20,0x20,0x00,0x00,//t84
//  356   0x80,0x80,0x00,0x00,0x00,0x80,0x80,0x00,0x00,0x1F,0x20,0x20,0x20,0x10,0x3F,0x20,//u85
//  357   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x00,0x01,0x0E,0x30,0x08,0x06,0x01,0x00,//v86
//  358   0x80,0x80,0x00,0x80,0x00,0x80,0x80,0x80,0x0F,0x30,0x0C,0x03,0x0C,0x30,0x0F,0x00,//w87
//  359   0x00,0x80,0x80,0x00,0x80,0x80,0x80,0x00,0x00,0x20,0x31,0x2E,0x0E,0x31,0x20,0x00,//x88
//  360   0x80,0x80,0x80,0x00,0x00,0x80,0x80,0x80,0x80,0x81,0x8E,0x70,0x18,0x06,0x01,0x00,//y89
//  361   0x00,0x80,0x80,0x80,0x80,0x80,0x80,0x00,0x00,0x21,0x30,0x2C,0x22,0x21,0x30,0x00,//z90
//  362   0x00,0x00,0x00,0x00,0x80,0x7C,0x02,0x02,0x00,0x00,0x00,0x00,0x00,0x3F,0x40,0x40,//{91
//  363   0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xFF,0x00,0x00,0x00,//|92
//  364   0x00,0x02,0x02,0x7C,0x80,0x00,0x00,0x00,0x00,0x40,0x40,0x3F,0x00,0x00,0x00,0x00,//}93
//  365   0x00,0x06,0x01,0x01,0x02,0x02,0x04,0x04,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,//~94
//  366   
//  367 };

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  368 void LCD_WrDat(byte data)
//  369 {
//  370   byte i=8;
LCD_WrDat:
        MOVS     R1,#+8
//  371   PTA12_O=1;
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_10  ;; 0x43fe0030
        STR      R2,[R3, #+0]
//  372   asm("nop"); 
        nop
//  373   PTA15_O=0;
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
//  374   asm("nop");    
        nop
        B.N      ??LCD_WrDat_0
//  375   while(i--)
//  376   {
//  377     if(data&0x80){PTA16_O=1;}
//  378     else{PTA16_O=0;}
??LCD_WrDat_1:
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_11  ;; 0x43fe0040
        STR      R2,[R3, #+0]
//  379     PTA15_O=1;
??LCD_WrDat_2:
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
//  380     asm("nop");;;;          
        nop
//  381     PTA15_O=0;
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
//  382     data<<=1;    
        LSLS     R0,R0,#+1
??LCD_WrDat_0:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??LCD_WrDat_3
        LSLS     R2,R0,#+24
        BPL.N    ??LCD_WrDat_1
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_11  ;; 0x43fe0040
        STR      R2,[R3, #+0]
        B.N      ??LCD_WrDat_2
//  383   }
//  384   
//  385 }
??LCD_WrDat_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
//  386 void LCD_WrCmd(byte cmd)
//  387 {
//  388   byte i=8;
LCD_WrCmd:
        MOVS     R1,#+8
//  389   PTA12_O=0;
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_10  ;; 0x43fe0030
        STR      R2,[R3, #+0]
//  390   PTA15_O=0; 
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
        B.N      ??LCD_WrCmd_0
//  391   while(i--)
//  392   {
//  393     if(cmd&0x80){PTA16_O=1;}
//  394     else{PTA16_O=0;}
??LCD_WrCmd_1:
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_11  ;; 0x43fe0040
        STR      R2,[R3, #+0]
//  395     PTA15_O=1;
??LCD_WrCmd_2:
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
//  396     asm("nop");;;;            
        nop
//  397     PTA15_O=0; 
        MOVS     R2,#+0
        LDR.W    R3,??DataTable10_8  ;; 0x43fe003c
        STR      R2,[R3, #+0]
//  398     cmd<<=1;;;;;   
        LSLS     R0,R0,#+1
??LCD_WrCmd_0:
        MOVS     R2,R1
        SUBS     R1,R2,#+1
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??LCD_WrCmd_3
        LSLS     R2,R0,#+24
        BPL.N    ??LCD_WrCmd_1
        MOVS     R2,#+1
        LDR.W    R3,??DataTable10_11  ;; 0x43fe0040
        STR      R2,[R3, #+0]
        B.N      ??LCD_WrCmd_2
//  399   } 	
//  400   
//  401 }
??LCD_WrCmd_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  402 void LCD_Set_Pos(byte x, byte y)
//  403 { 
LCD_Set_Pos:
        PUSH     {R4,LR}
        MOVS     R4,R0
//  404   LCD_WrCmd(0xb0+y);
        SUBS     R0,R1,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
//  405   LCD_WrCmd(((x&0xf0)>>4)|0x10);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
        ORRS     R0,R0,#0x10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
//  406   LCD_WrCmd((x&0x0f)|0x01); 
        ANDS     R0,R4,#0xF
        ORRS     R0,R0,#0x1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
//  407 } 
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  408 void LCD_Fill(byte bmp_data)
//  409 {
LCD_Fill:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
//  410   byte y,x;
//  411   
//  412   for(y=0;y<8;y++)
        MOVS     R5,#+0
        B.N      ??LCD_Fill_0
//  413   {
//  414     LCD_WrCmd(0xb0+y);
//  415     LCD_WrCmd(0x01);
//  416     LCD_WrCmd(0x10);
//  417     for(x=0;x<X_WIDTH;x++)
//  418       LCD_WrDat(bmp_data);
??LCD_Fill_1:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrDat
        ADDS     R6,R6,#+1
??LCD_Fill_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+128
        BLT.N    ??LCD_Fill_1
        ADDS     R5,R5,#+1
??LCD_Fill_0:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??LCD_Fill_3
        SUBS     R0,R5,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
        MOVS     R0,#+1
        BL       LCD_WrCmd
        MOVS     R0,#+16
        BL       LCD_WrCmd
        MOVS     R6,#+0
        B.N      ??LCD_Fill_2
//  419   }
//  420 }
??LCD_Fill_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  421 void LCD_CLS(void)
//  422 {
LCD_CLS:
        PUSH     {R3-R5,LR}
//  423   byte y,x;	
//  424   for(y=0;y<8;y++)
        MOVS     R4,#+0
        B.N      ??LCD_CLS_0
//  425   {
//  426     LCD_WrCmd(0xb0+y);
//  427     LCD_WrCmd(0x01);
//  428     LCD_WrCmd(0x10); 
//  429     for(x=0;x<X_WIDTH;x++)
//  430       LCD_WrDat(0);
??LCD_CLS_1:
        MOVS     R0,#+0
        BL       LCD_WrDat
        ADDS     R5,R5,#+1
??LCD_CLS_2:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+128
        BLT.N    ??LCD_CLS_1
        ADDS     R4,R4,#+1
??LCD_CLS_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+8
        BGE.N    ??LCD_CLS_3
        SUBS     R0,R4,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
        MOVS     R0,#+1
        BL       LCD_WrCmd
        MOVS     R0,#+16
        BL       LCD_WrCmd
        MOVS     R5,#+0
        B.N      ??LCD_CLS_2
//  431   }
//  432 }
??LCD_CLS_3:
        POP      {R0,R4,R5,PC}    ;; return
//  433 //==============================================================
//  434 //函数名： void LCD_PutPixel(byte x,byte y)
//  435 //功能描述：绘制一个点（x,y）
//  436 //参数：真实坐标值(x,y),x的范围0～127，y的范围0～64
//  437 //返回：无
//  438 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  439 void LCD_PutPixel(byte x,byte y)
//  440 {
LCD_PutPixel:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
//  441   byte data1;  //data1当前点的数据  
//  442   LCD_Set_Pos(x,y); 
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
//  443   data1 = 0x01<<(y%8); 	
        MOVS     R0,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R5,R1
        MLS      R2,R2,R1,R5
        LSLS     R6,R0,R2
//  444   LCD_WrCmd(0xb0+(y>>3));
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LSRS     R0,R5,#+3
        SUBS     R0,R0,#+80
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
//  445   LCD_WrCmd(((x&0xf0)>>4)|0x10);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSRS     R0,R4,#+4
        ORRS     R0,R0,#0x10
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrCmd
//  446   LCD_WrCmd((x&0x0f)|0x00);
        ANDS     R0,R4,#0xF
        BL       LCD_WrCmd
//  447   LCD_WrDat(data1); 	 	
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrDat
//  448 }
        POP      {R4-R6,PC}       ;; return
//  449 //==============================================================
//  450 //函数名： void LCD_Rectangle(byte x1,byte y1,
//  451 //                   byte x2,byte y2,byte color,byte gif)
//  452 //功能描述：绘制一个实心矩形
//  453 //参数：左上角坐标（x1,y1）,右下角坐标（x2，y2）
//  454 //      其中x1、x2的范围0～127，y1，y2的范围0～63，即真实坐标值
//  455 //返回：无
//  456 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  457 void LCD_Rectangle(byte x1,byte y1,byte x2,byte y2,byte gif)
//  458 {
LCD_Rectangle:
        PUSH     {R3-R9,LR}
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
//  459   byte n; 	
//  460   LCD_Set_Pos(x1,y1>>3);
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSRS     R1,R6,#+3
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
//  461   for(n=x1;n<=x2;n++)
        MOV      R9,R5
        LDR      R4,[SP, #+32]
        B.N      ??LCD_Rectangle_0
//  462   {
//  463     LCD_WrDat(0x01<<(y1%8)); 			
??LCD_Rectangle_1:
        MOVS     R0,#+1
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R6,R1
        MLS      R2,R2,R1,R6
        LSLS     R0,R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrDat
//  464     if(gif == 1) LCD_DLY_ms(50);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LCD_Rectangle_2
        MOVS     R0,#+50
        BL       LCD_DLY_ms
//  465   }  
??LCD_Rectangle_2:
        ADDS     R9,R9,#+1
??LCD_Rectangle_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCS.N    ??LCD_Rectangle_1
//  466   LCD_Set_Pos(x1,y2>>3);
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LSRS     R1,R8,#+3
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
//  467   for(n=x1;n<=x2;n++)
        MOV      R9,R5
        B.N      ??LCD_Rectangle_3
//  468   {
//  469     LCD_WrDat(0x01<<(y2%8)); 			
??LCD_Rectangle_4:
        MOVS     R0,#+1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        MOVS     R1,#+8
        SDIV     R2,R8,R1
        MLS      R2,R2,R1,R8
        LSLS     R0,R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_WrDat
//  470     if(gif == 1) LCD_DLY_ms(5);
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+1
        BNE.N    ??LCD_Rectangle_5
        MOVS     R0,#+5
        BL       LCD_DLY_ms
//  471   }
??LCD_Rectangle_5:
        ADDS     R9,R9,#+1
??LCD_Rectangle_3:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R7,R9
        BCS.N    ??LCD_Rectangle_4
//  472   
//  473 }  
        POP      {R0,R4-R9,PC}    ;; return
//  474 //==============================================================
//  475 //函数名：LCD_P6x8Str(byte x,byte y,byte *p)
//  476 //功能描述：写入一组标准ASCII字符串
//  477 //参数：显示的位置（x,y），y为页范围0～7，要显示的字符串
//  478 //返回：无
//  479 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  480 void LCD_P6x8char(byte x,byte y,byte ch)
//  481 {
LCD_P6x8char:
        PUSH     {R3-R5,LR}
//  482   byte c=0,i=0;      
        MOVS     R4,#+0
        MOVS     R5,#+0
//  483      
//  484     c =ch-32;
        SUBS     R2,R2,#+32
        MOVS     R4,R2
//  485     if(x>126){x=0;y++;}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+127
        BLT.N    ??LCD_P6x8char_0
        MOVS     R0,#+0
        ADDS     R1,R1,#+1
//  486     LCD_Set_Pos(x,y);    
??LCD_P6x8char_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
//  487   	for(i=0;i<6;i++)     
        MOVS     R5,#+0
        B.N      ??LCD_P6x8char_1
//  488   	  LCD_WrDat(F6x8[c][i]);  
??LCD_P6x8char_2:
        LDR.W    R0,??DataTable10_12
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,#+6
        MLA      R0,R1,R4,R0
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        LDRB     R0,[R5, R0]
        BL       LCD_WrDat
        ADDS     R5,R5,#+1
??LCD_P6x8char_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+6
        BLT.N    ??LCD_P6x8char_2
//  489 }
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  490 void LCD_P6x8Str(byte x,byte y,byte ch[])
//  491 {
LCD_P6x8Str:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  492   byte c=0,i=0,j=0;      
        MOVS     R7,#+0
        MOVS     R8,#+0
        MOVS     R9,#+0
        B.N      ??LCD_P6x8Str_0
//  493   while (ch[j]!='\0')
//  494   {    
//  495     c =ch[j]-32;
//  496     if(x>126){x=0;y++;}
//  497     LCD_Set_Pos(x,y);    
//  498     for(i=0;i<6;i++)     
//  499       LCD_WrDat(F6x8[c][i]);  
??LCD_P6x8Str_1:
        LDR.W    R0,??DataTable10_12
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R1,#+6
        MLA      R0,R1,R7,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R0]
        BL       LCD_WrDat
        ADDS     R8,R8,#+1
??LCD_P6x8Str_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+6
        BLT.N    ??LCD_P6x8Str_1
//  500     x+=6;
        ADDS     R4,R4,#+6
//  501     j++;
        ADDS     R9,R9,#+1
??LCD_P6x8Str_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        CMP      R0,#+0
        BEQ.N    ??LCD_P6x8Str_3
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        SUBS     R7,R0,#+32
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+127
        BLT.N    ??LCD_P6x8Str_4
        MOVS     R4,#+0
        ADDS     R5,R5,#+1
??LCD_P6x8Str_4:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R8,#+0
        B.N      ??LCD_P6x8Str_2
//  502   }
//  503 }
??LCD_P6x8Str_3:
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  504 void LCD_P6x8s(byte x,byte y,int32 number)
//  505 {
LCD_P6x8s:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R1,R2
//  506   byte c=0,i=0,j=0;
        MOVS     R7,#+0
        MOVS     R8,#+0
        MOVS     R6,#+0
//  507   uint8 string[10];
//  508   Num2Str(string,number);
        ADD      R0,SP,#+0
        BL       Num2Str
        B.N      ??LCD_P6x8s_0
//  509   while(string[j]!='\0')
//  510   {
//  511     c = string[j] - 32;
//  512     if(x>126)
//  513     {
//  514       x=0;y++;
//  515     }
//  516     LCD_Set_Pos(x,y);
//  517     for(i=0;i<6;i++)
//  518     {
//  519       LCD_WrDat(F6x8[c][i]);
??LCD_P6x8s_1:
        LDR.N    R0,??DataTable10_12
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        MOVS     R1,#+6
        MLA      R0,R1,R7,R0
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R0]
        BL       LCD_WrDat
//  520     }
        ADDS     R8,R8,#+1
??LCD_P6x8s_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+6
        BLT.N    ??LCD_P6x8s_1
//  521     x += 6;
        ADDS     R5,R5,#+6
//  522     j++;
        ADDS     R6,R6,#+1
??LCD_P6x8s_0:
        ADD      R0,SP,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRB     R0,[R6, R0]
        CMP      R0,#+0
        BEQ.N    ??LCD_P6x8s_3
        ADD      R0,SP,#+0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LDRB     R0,[R6, R0]
        SUBS     R7,R0,#+32
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+127
        BLT.N    ??LCD_P6x8s_4
        MOVS     R5,#+0
        ADDS     R4,R4,#+1
??LCD_P6x8s_4:
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R8,#+0
        B.N      ??LCD_P6x8s_2
//  523   }
//  524 }
??LCD_P6x8s_3:
        POP      {R0-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  525 void LCD_P8x16s(byte x,byte y,int32 number)
//  526 {
LCD_P8x16s:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R1,R2
//  527   byte c=0,i=0,j=0;
        MOVS     R6,#+0
        MOVS     R7,#+0
        MOVS     R8,#+0
//  528   static uint8 string[10];
//  529   Num2Str(string,number);
        LDR.N    R0,??DataTable10_13
        BL       Num2Str
        B.N      ??LCD_P8x16s_0
//  530   while(string[j]!='\0')
//  531   {
//  532     c = string[j] - 32;
//  533     if(x>120)
//  534     {
//  535       x=0;y++;
//  536     }
//  537     LCD_Set_Pos(x,y);    
//  538     for(i=0;i<8;i++)     
//  539     {
//  540       LCD_WrDat(F8X16[c*16+i]);
//  541     }
//  542     LCD_Set_Pos(x,y+1);    
//  543     for(i=0;i<8;i++)     
//  544     {
//  545       LCD_WrDat(F8X16[c*16+i+8]); 
??LCD_P8x16s_1:
        LDR.N    R0,??DataTable10_14
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R1,R6,#+4
        UXTAB    R1,R1,R7
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+8]
        BL       LCD_WrDat
//  546     } 
        ADDS     R7,R7,#+1
??LCD_P8x16s_2:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+8
        BLT.N    ??LCD_P8x16s_1
//  547     x+=8;
        ADDS     R4,R4,#+8
//  548     j++;
        ADDS     R8,R8,#+1
??LCD_P8x16s_0:
        LDR.N    R0,??DataTable10_13
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R0]
        CMP      R0,#+0
        BEQ.N    ??LCD_P8x16s_3
        LDR.N    R0,??DataTable10_13
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        LDRB     R0,[R8, R0]
        SUBS     R6,R0,#+32
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+121
        BLT.N    ??LCD_P8x16s_4
        MOVS     R4,#+0
        ADDS     R5,R5,#+1
??LCD_P8x16s_4:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R7,#+0
        B.N      ??LCD_P8x16s_5
??LCD_P8x16s_6:
        LDR.N    R0,??DataTable10_14
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R1,R6,#+4
        UXTAB    R1,R1,R7
        LDRB     R0,[R1, R0]
        BL       LCD_WrDat
        ADDS     R7,R7,#+1
??LCD_P8x16s_5:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+8
        BLT.N    ??LCD_P8x16s_6
        ADDS     R1,R5,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R7,#+0
        B.N      ??LCD_P8x16s_2
//  549   }
//  550 }
??LCD_P8x16s_3:
        POP      {R4-R8,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
??string:
        DS8 12
//  551 //==============================================================
//  552 //函数名：LCD_P8x16Str(byte x,byte y,byte *p)
//  553 //功能描述：写入一组标准ASCII字符串
//  554 //参数：显示的位置（x,y），y为页范围0～7，要显示的字符串
//  555 //返回：无
//  556 //==============================================================  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  557 void LCD_P8x16Str(byte x,byte y,byte ch[])
//  558 {
LCD_P8x16Str:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  559   byte c=0,i=0,j=0;
        MOVS     R7,#+0
        MOVS     R8,#+0
        MOVS     R9,#+0
        B.N      ??LCD_P8x16Str_0
//  560   
//  561   while (ch[j]!='\0')
//  562   {    
//  563     c =ch[j]-32;
//  564     if(x>120){x=0;y++;}
//  565     LCD_Set_Pos(x,y);    
//  566     for(i=0;i<8;i++)     
//  567       LCD_WrDat(F8X16[c*16+i]);
//  568     LCD_Set_Pos(x,y+1);    
//  569     for(i=0;i<8;i++)     
//  570       LCD_WrDat(F8X16[c*16+i+8]);  
??LCD_P8x16Str_1:
        LDR.N    R0,??DataTable10_14
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R1,R7,#+4
        UXTAB    R1,R1,R8
        ADDS     R0,R1,R0
        LDRB     R0,[R0, #+8]
        BL       LCD_WrDat
        ADDS     R8,R8,#+1
??LCD_P8x16Str_2:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+8
        BLT.N    ??LCD_P8x16Str_1
//  571     x+=8;
        ADDS     R4,R4,#+8
//  572     j++;
        ADDS     R9,R9,#+1
??LCD_P8x16Str_0:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        CMP      R0,#+0
        BEQ.N    ??LCD_P8x16Str_3
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R6]
        SUBS     R7,R0,#+32
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+121
        BLT.N    ??LCD_P8x16Str_4
        MOVS     R4,#+0
        ADDS     R5,R5,#+1
??LCD_P8x16Str_4:
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R8,#+0
        B.N      ??LCD_P8x16Str_5
??LCD_P8x16Str_6:
        LDR.N    R0,??DataTable10_14
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LSLS     R1,R7,#+4
        UXTAB    R1,R1,R8
        LDRB     R0,[R1, R0]
        BL       LCD_WrDat
        ADDS     R8,R8,#+1
??LCD_P8x16Str_5:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+8
        BLT.N    ??LCD_P8x16Str_6
        ADDS     R1,R5,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R8,#+0
        B.N      ??LCD_P8x16Str_2
//  573   }
//  574 }
??LCD_P8x16Str_3:
        POP      {R0,R4-R9,PC}    ;; return
//  575 //输出汉字字符串

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  576 void LCD_P16x16Str(byte x,byte y,byte ch[])
//  577 {
LCD_P16x16Str:
        PUSH     {R3-R9,LR}
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R5,R2
//  578   byte wm=0,ii = 0;
        MOVS     R9,#+0
        MOVS     R7,#+0
//  579   word adder=1; 
        MOVS     R8,#+1
        B.N      ??LCD_P16x16Str_0
//  580   while(ch[ii] != '\0')
//  581   {
//  582     wm = 0;
//  583     adder = 1;
//  584     while(F16x16_Idx[wm] > 127)
//  585     {
//  586       if(F16x16_Idx[wm] == ch[ii])
//  587       {
//  588         if(F16x16_Idx[wm + 1] == ch[ii + 1])
//  589         {
//  590           adder = wm * 16;
//  591           break;
//  592         }
//  593       }
//  594       wm += 2;			
//  595     }
//  596     if(x>128){x=0;y++;}
//  597     LCD_Set_Pos(x , y); 
//  598     if(adder != 1)// 显示汉字					
//  599     {
//  600       LCD_Set_Pos(x , y);
//  601       for(wm = 0;wm < 16;wm++)               
//  602       {
//  603         LCD_WrDat(F16x16[adder]);	
//  604         adder += 1;
//  605       }      
//  606       LCD_Set_Pos(x,y + 1); 
//  607       for(wm = 0;wm < 16;wm++)          
//  608       {
//  609         LCD_WrDat(F16x16[adder]);
//  610         adder += 1;
//  611       }   		
//  612     }
//  613     else			  //显示空白字符			
//  614     {
//  615       ii += 1;
//  616       LCD_Set_Pos(x,y);
//  617       for(wm = 0;wm < 16;wm++)
//  618       {
//  619         LCD_WrDat(0);
//  620       }
//  621       LCD_Set_Pos(x,y + 1);
//  622       for(wm = 0;wm < 16;wm++)
//  623       {   		
//  624         LCD_WrDat(0);	
??LCD_P16x16Str_1:
        MOVS     R0,#+0
        BL       LCD_WrDat
//  625       }
        ADDS     R9,R9,#+1
??LCD_P16x16Str_2:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+16
        BLT.N    ??LCD_P16x16Str_1
//  626     }
//  627     x +=16;
??LCD_P16x16Str_3:
        ADDS     R6,R6,#+16
//  628     ii += 2;
        ADDS     R7,R7,#+2
??LCD_P16x16Str_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R5]
        CMP      R0,#+0
        BEQ.W    ??LCD_P16x16Str_4
        MOVS     R9,#+0
        MOVS     R8,#+1
        B.N      ??LCD_P16x16Str_5
??LCD_P16x16Str_6:
        ADDS     R9,R9,#+2
??LCD_P16x16Str_5:
        LDR.N    R0,??DataTable10_15
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R0]
        CMP      R0,#+128
        BLT.N    ??LCD_P16x16Str_7
        LDR.N    R0,??DataTable10_15
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        LDRB     R0,[R9, R0]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R1,[R7, R5]
        CMP      R0,R1
        BNE.N    ??LCD_P16x16Str_6
        LDR.N    R0,??DataTable10_15
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        ADDS     R0,R9,R0
        LDRB     R0,[R0, #+1]
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R1,R7,R5
        LDRB     R1,[R1, #+1]
        CMP      R0,R1
        BNE.N    ??LCD_P16x16Str_6
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LSLS     R8,R9,#+4
??LCD_P16x16Str_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+129
        BLT.N    ??LCD_P16x16Str_8
        MOVS     R6,#+0
        ADDS     R4,R4,#+1
??LCD_P16x16Str_8:
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+1
        BEQ.N    ??LCD_P16x16Str_9
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R9,#+0
        B.N      ??LCD_P16x16Str_10
??LCD_P16x16Str_11:
        LDR.N    R0,??DataTable10_16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R0]
        BL       LCD_WrDat
        ADDS     R8,R8,#+1
        ADDS     R9,R9,#+1
??LCD_P16x16Str_10:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+16
        BLT.N    ??LCD_P16x16Str_11
        ADDS     R1,R4,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R9,#+0
??LCD_P16x16Str_12:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+16
        BGE.N    ??LCD_P16x16Str_3
        LDR.N    R0,??DataTable10_16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        LDRB     R0,[R8, R0]
        BL       LCD_WrDat
        ADDS     R8,R8,#+1
        ADDS     R9,R9,#+1
        B.N      ??LCD_P16x16Str_12
??LCD_P16x16Str_9:
        ADDS     R7,R7,#+1
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R9,#+0
        B.N      ??LCD_P16x16Str_13
??LCD_P16x16Str_14:
        MOVS     R0,#+0
        BL       LCD_WrDat
        ADDS     R9,R9,#+1
??LCD_P16x16Str_13:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+16
        BLT.N    ??LCD_P16x16Str_14
        ADDS     R1,R4,#+1
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOVS     R9,#+0
        B.N      ??LCD_P16x16Str_2
//  629   }
//  630 }
??LCD_P16x16Str_4:
        POP      {R0,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x400ff000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     gpio_init_struct0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     ??j

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_3:
        DC32     ??temp

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_4:
        DC32     ??number_sign

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_5:
        DC32     ??Num_Wide

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_6:
        DC32     ??i

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_7:
        DC32     table

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_8:
        DC32     0x43fe003c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_9:
        DC32     0x43fe0034

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_10:
        DC32     0x43fe0030

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_11:
        DC32     0x43fe0040

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_12:
        DC32     F6x8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_13:
        DC32     ??string

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_14:
        DC32     F8X16

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_15:
        DC32     F16x16_Idx

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_16:
        DC32     F16x16
//  631 //输出汉字和字符混合字符串

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  632 void LCD_Print(byte x, byte y, uint8 ch[])
//  633 {
LCD_Print:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  634   uint8 ch2[3];
//  635   uint8 ii=0;        
        MOVS     R7,#+0
        B.N      ??LCD_Print_0
//  636   while(ch[ii] != '\0')
//  637   {
//  638     if(ch[ii] > 127)
//  639     {
//  640       ch2[0] = ch[ii];
??LCD_Print_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R6]
        STRB     R0,[SP, #+0]
//  641       ch2[1] = ch[ii + 1];
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R7,R6
        LDRB     R0,[R0, #+1]
        STRB     R0,[SP, #+1]
//  642       ch2[2] = '\0';			//汉字为两个字节
        MOVS     R0,#+0
        STRB     R0,[SP, #+2]
//  643       LCD_P16x16Str(x , y, ch2);	//显示汉字
        ADD      R2,SP,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P16x16Str
//  644       x += 16;
        ADDS     R4,R4,#+16
//  645       ii += 2;
        ADDS     R7,R7,#+2
//  646     }
??LCD_Print_0:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R6]
        CMP      R0,#+0
        BEQ.N    ??LCD_Print_2
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R6]
        CMP      R0,#+128
        BGE.N    ??LCD_Print_1
//  647     else
//  648     {
//  649       ch2[0] = ch[ii];	
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        LDRB     R0,[R7, R6]
        STRB     R0,[SP, #+0]
//  650       ch2[1] = '\0';			//字母占一个字节
        MOVS     R0,#+0
        STRB     R0,[SP, #+1]
//  651       LCD_P8x16Str(x , y , ch2);	//显示字母
        ADD      R2,SP,#+0
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P8x16Str
//  652       x += 8;
        ADDS     R4,R4,#+8
//  653       ii+= 1;
        ADDS     R7,R7,#+1
        B.N      ??LCD_Print_0
//  654     }
//  655   }
//  656 } 
??LCD_Print_2:
        POP      {R0,R4-R7,PC}    ;; return
//  657 
//  658 //==============================================================
//  659 //函数名： void Draw_BMP(byte x,byte y)
//  660 //功能描述：显示BMP图片128×64
//  661 //参数：起始点坐标(x,y),x的范围0～127，y为页的范围0～7
//  662 //返回：无
//  663 //==============================================================

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  664 void Draw_BMP(byte x0,byte y0,byte x1,byte y1,byte bmp[])
//  665 { 	
Draw_BMP:
        PUSH     {R4-R10,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
//  666   word ii=0;
        MOVS     R7,#+0
//  667   byte x,y;
//  668   
//  669   if(y1%8==0) y=y1/8;      
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+8
        SDIV     R2,R6,R0
        MLS      R2,R2,R0,R6
        CMP      R2,#+0
        BNE.N    ??Draw_BMP_0
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+8
        SDIV     R10,R6,R0
        B.N      ??Draw_BMP_1
//  670   else y=y1/8+1;
??Draw_BMP_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        MOVS     R0,#+8
        SDIV     R0,R6,R0
        ADDS     R10,R0,#+1
//  671   for(y=y0;y<=y1;y++)
??Draw_BMP_1:
        MOV      R10,R1
        LDR      R8,[SP, #+32]
        B.N      ??Draw_BMP_2
//  672   {
//  673     LCD_Set_Pos(x0,y);				
//  674     for(x=x0;x<x1;x++)
//  675     {      
//  676       LCD_WrDat(bmp[ii++]);	    	
??Draw_BMP_3:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRB     R0,[R7, R8]
        BL       LCD_WrDat
        ADDS     R7,R7,#+1
//  677     }
        ADDS     R9,R9,#+1
??Draw_BMP_4:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R9,R5
        BCC.N    ??Draw_BMP_3
        ADDS     R10,R10,#+1
??Draw_BMP_2:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R6,R10
        BCC.N    ??Draw_BMP_5
        MOV      R1,R10
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_Set_Pos
        MOV      R9,R4
        B.N      ??Draw_BMP_4
//  678   }
//  679 }
??Draw_BMP_5:
        POP      {R4-R10,PC}      ;; return
//  680 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//  681 void Show_Number(uint8 X,uint8 Y,int32 number)
//  682 {
Show_Number:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
//  683   if(number<0)
        CMP      R6,#+0
        BPL.N    ??Show_Number_0
//  684   {
//  685     number = - number;
        RSBS     R6,R6,#+0
//  686     LCD_P6x8char(X,Y, '-');
        MOVS     R2,#+45
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
        B.N      ??Show_Number_1
//  687   }
//  688   else
//  689   {
//  690     LCD_P6x8char(X,Y,' ');
??Show_Number_0:
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  691   }
//  692 
//  693   if(number/1000 > 0)
??Show_Number_1:
        MOV      R0,#+1000
        SDIV     R0,R6,R0
        CMP      R0,#+1
        BLT.N    ??Show_Number_2
//  694   {
//  695     LCD_P6x8char(X+6,Y, number%10000/1000+48);
        MOVW     R0,#+10000
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  696     LCD_P6x8char(X+12,Y,number%1000/100+48);
        MOV      R0,#+1000
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  697     LCD_P6x8char(X+18,Y,number%100/10+48);
        MOVS     R0,#+100
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  698     LCD_P6x8char(X+24,Y,number%10+48); 
        MOVS     R0,#+10
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
        B.N      ??Show_Number_3
//  699   }
//  700   else if(number/100 > 0)
??Show_Number_2:
        MOVS     R0,#+100
        SDIV     R0,R6,R0
        CMP      R0,#+1
        BLT.N    ??Show_Number_4
//  701   {
//  702     LCD_P6x8char(X+6,Y, ' ');
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  703     LCD_P6x8char(X+12,Y,number%1000/100+48);
        MOV      R0,#+1000
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+100
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  704     LCD_P6x8char(X+18,Y,number%100/10+48);
        MOVS     R0,#+100
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  705     LCD_P6x8char(X+24,Y,number%10+48); 
        MOVS     R0,#+10
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
        B.N      ??Show_Number_3
//  706   }
//  707   else if(number/10 > 0)
??Show_Number_4:
        MOVS     R0,#+10
        SDIV     R0,R6,R0
        CMP      R0,#+1
        BLT.N    ??Show_Number_5
//  708   {
//  709     LCD_P6x8char(X+6,Y, ' ');
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  710     LCD_P6x8char(X+12,Y,' ');
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  711     LCD_P6x8char(X+18,Y,number%100/10+48);
        MOVS     R0,#+100
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        MOVS     R1,#+10
        SDIV     R0,R0,R1
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  712     LCD_P6x8char(X+24,Y,number%10+48); 
        MOVS     R0,#+10
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
        B.N      ??Show_Number_3
//  713   }
//  714   else
//  715   {
//  716     LCD_P6x8char(X+6,Y, ' ');
??Show_Number_5:
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+6
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  717     LCD_P6x8char(X+12,Y,' ');
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  718     LCD_P6x8char(X+18,Y,' ');
        MOVS     R2,#+32
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+18
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  719     LCD_P6x8char(X+24,Y,number%10+48); 
        MOVS     R0,#+10
        SDIV     R1,R6,R0
        MLS      R0,R0,R1,R6
        ADDS     R2,R0,#+48
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        MOVS     R1,R5
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R4,#+24
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       LCD_P6x8char
//  720   }
//  721   
//  722 }
??Show_Number_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//  723 
// 
//    43 bytes in section .bss
// 2 296 bytes in section .rodata
// 2 880 bytes in section .text
// 
// 2 880 bytes of CODE  memory
// 2 296 bytes of CONST memory
//    43 bytes of DATA  memory
//
//Errors: none
//Warnings: none
