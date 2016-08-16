///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.20.2.7424/W32 for ARM       16/Aug/2016  13:54:37
// Copyright 1999-2014 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\angle.c
//    Command line =  
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\angle.c -D LPLD_K60
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
//        E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\iar\FLASH\List\angle.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN LPLD_ADC_Get
        EXTERN LPLD_MMA8451_GetResult
        EXTERN __aeabi_cfcmple
        EXTERN __aeabi_cfrcmple
        EXTERN __aeabi_d2f
        EXTERN __aeabi_dadd
        EXTERN __aeabi_ddiv
        EXTERN __aeabi_dmul
        EXTERN __aeabi_f2d
        EXTERN __aeabi_fadd
        EXTERN __aeabi_fdiv
        EXTERN __aeabi_fmul
        EXTERN __aeabi_fsub
        EXTERN __aeabi_i2f
        EXTERN __aeabi_ui2f
        EXTERN asin

        PUBLIC AD_X
        PUBLIC AD_Z
        PUBLIC ZZZ
        PUBLIC accl_angle_Y
        PUBLIC ad_gyro_x
        PUBLIC ad_gyro_y
        PUBLIC ad_x
        PUBLIC ad_z
        PUBLIC angle
        PUBLIC angle_change
        PUBLIC count
        PUBLIC get_0
        PUBLIC get_accl
        PUBLIC get_gyro
        PUBLIC gyro0_AR1
        PUBLIC gyro0_AR2
        PUBLIC gyro_speed_x
        PUBLIC gyro_speed_y
        PUBLIC ji
        PUBLIC lvbo
        PUBLIC one_complementation
        PUBLIC ronghe_angle
        PUBLIC value_X
        PUBLIC value_Z

// E:\LPLD_OSKinetis_V3.1\project\balanceNewCar\app\angle.c
//    1 #include "angle.h"
//    2 
//    3 //-----------变量定义------------//
//    4 /*①普通变量*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    5 int ji=0;//陀螺仪初值计数量
ji:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    6 int   count=0;//AD采样计数变量
count:
        DS8 4
//    7 /*②加速度计的变量*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    8 float   ad_z[10],ad_x[10];//加速度计Z、X轴采样值预存数组
ad_z:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
ad_x:
        DS8 40

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//    9 float   AD_Z=0,AD_X=0;//加速计滤波后的数据
AD_Z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
AD_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   10 float value_Z=0,value_X=0;//实际加速度值
value_Z:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
value_X:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   11 float ZZZ=0;//用来测试加速度计
ZZZ:
        DS8 4
//   12 /*③陀螺仪的变量*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   13 float accl_angle_Y=0;//加速度计计算到的角度值
accl_angle_Y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   14 float gyro0_AR1=0;//陀螺仪Y轴零点AD量 
gyro0_AR1:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   15 float gyro0_AR2=0;//陀螺仪X轴零点AD量
gyro0_AR2:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   16 int ad_gyro_y=0;//陀螺仪Y轴实时AD量
ad_gyro_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   17 int ad_gyro_x=0;//陀螺仪Y轴实时AD量
ad_gyro_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   18 float gyro_speed_y=0,gyro_speed_x=0;//陀螺仪角速度变量
gyro_speed_y:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
gyro_speed_x:
        DS8 4

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   19 float angle_change=0;//用来测试陀螺仪的比例系数
angle_change:
        DS8 4
//   20 /*④最后的角度值*/

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
//   21 float angle=0;                     
angle:
        DS8 4
//   22 
//   23 //=====================互补滤波=================// 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   24 void one_complementation(float gyro_y,float accl_y)
//   25 {
one_complementation:
        PUSH     {R4-R8,LR}
        MOV      R8,R0
        MOVS     R6,R1
//   26   float K1 =0.02; // 对加速度计取值的权重
        LDR.N    R7,??DataTable4  ;; 0x3ca3d70a
//   27   angle=(angle+gyro_y*gyro_time)*(1-K1)+accl_y*K1;//一阶互补滤波
        LDR.N    R0,??DataTable4_1
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R0,R8
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_2  ;; 0x47ae147b
        LDR.N    R3,??DataTable4_3  ;; 0x3f747ae1
        BL       __aeabi_dmul
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+1065353216
        MOVS     R1,R7
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dmul
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,R6
        MOVS     R1,R7
        BL       __aeabi_fmul
        BL       __aeabi_f2d
        MOVS     R2,R4
        MOVS     R3,R5
        BL       __aeabi_dadd
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_1
        STR      R0,[R1, #+0]
//   28 }
        POP      {R4-R8,PC}       ;; return
//   29 //=====================零点取值=================// 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   30 void get_0(void)
//   31 {
get_0:
        PUSH     {R4-R6,LR}
//   32   int i;
//   33   float add0=0,add1=0;
        MOVS     R5,#+0
        MOVS     R6,#+0
//   34   for(i=0;i<1000;i++)
        MOVS     R4,#+0
        B.N      ??get_0_0
//   35   {
//   36     add0=(float)(LPLD_ADC_Get(ADC1,AD6));//Y角速度量
??get_0_1:
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_4  ;; 0x400bb000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        MOVS     R5,R0
//   37     add1=(float)(LPLD_ADC_Get(ADC1,AD7));//X角速度量
        MOVS     R1,#+7
        LDR.N    R0,??DataTable4_4  ;; 0x400bb000
        BL       LPLD_ADC_Get
        BL       __aeabi_ui2f
        MOVS     R6,R0
//   38     gyro0_AR1+=add0;
        LDR.N    R0,??DataTable4_5
        LDR      R1,[R0, #+0]
        MOVS     R0,R5
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable4_5
        STR      R0,[R1, #+0]
//   39     gyro0_AR2+=add1;
        LDR.N    R0,??DataTable4_6
        LDR      R1,[R0, #+0]
        MOVS     R0,R6
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable4_6
        STR      R0,[R1, #+0]
//   40   }
        ADDS     R4,R4,#+1
??get_0_0:
        CMP      R4,#+1000
        BLT.N    ??get_0_1
//   41   gyro0_AR1=gyro0_AR1/1000;
        LDR.N    R0,??DataTable4_5
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_7  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_5
        STR      R0,[R1, #+0]
//   42   gyro0_AR2=gyro0_AR2/1000;
        LDR.N    R0,??DataTable4_6
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_7  ;; 0x447a0000
        BL       __aeabi_fdiv
        LDR.N    R1,??DataTable4_6
        STR      R0,[R1, #+0]
//   43 }
        POP      {R4-R6,PC}       ;; return
//   44 //=========================普通滤波====================//  

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   45 float lvbo(float aa[]) 
//   46 {
lvbo:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
//   47   int i;
//   48   float max,min,sum=0;
        MOVS     R8,#+0
//   49   max=min=aa[0];
        LDR      R7,[R4, #+0]
        MOVS     R6,R7
//   50   for(i=0;i<10;i++) {
        MOVS     R5,#+0
        B.N      ??lvbo_0
//   51     sum+=aa[i];
//   52     if(aa[i]<min)
//   53       min=aa[i];
//   54     else if(aa[i]>max)
??lvbo_1:
        MOVS     R0,R6
        LDR      R1,[R4, R5, LSL #+2]
        BL       __aeabi_cfcmple
        BCS.N    ??lvbo_2
//   55       max=aa[i];
        LDR      R6,[R4, R5, LSL #+2]
??lvbo_2:
        ADDS     R5,R5,#+1
??lvbo_0:
        CMP      R5,#+10
        BGE.N    ??lvbo_3
        LDR      R0,[R4, R5, LSL #+2]
        MOV      R1,R8
        BL       __aeabi_fadd
        MOV      R8,R0
        LDR      R0,[R4, R5, LSL #+2]
        MOVS     R1,R7
        BL       __aeabi_cfcmple
        BCS.N    ??lvbo_1
        LDR      R7,[R4, R5, LSL #+2]
        B.N      ??lvbo_2
//   56   }
//   57   sum=(sum-max-min)/8;
??lvbo_3:
        MOV      R0,R8
        MOVS     R1,R6
        BL       __aeabi_fsub
        MOVS     R1,R7
        BL       __aeabi_fsub
        MOVS     R1,#+1090519040
        BL       __aeabi_fdiv
        MOV      R8,R0
//   58   return sum;
        MOV      R0,R8
        POP      {R4-R8,PC}       ;; return
//   59 }
//   60 //--------------------AD采样-----------------------// 
//   61 /***陀螺仪AD采样***/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   62 void get_gyro()   
//   63 {   
get_gyro:
        PUSH     {R7,LR}
//   64   ad_gyro_y=LPLD_ADC_Get(ADC1,AD6);
        MOVS     R1,#+6
        LDR.N    R0,??DataTable4_4  ;; 0x400bb000
        BL       LPLD_ADC_Get
        LDR.N    R1,??DataTable4_8
        STR      R0,[R1, #+0]
//   65   ad_gyro_x=LPLD_ADC_Get(ADC1,AD7);
        MOVS     R1,#+7
        LDR.N    R0,??DataTable4_4  ;; 0x400bb000
        BL       LPLD_ADC_Get
        LDR.N    R1,??DataTable4_9
        STR      R0,[R1, #+0]
//   66   gyro_speed_y=-(float)((ad_gyro_y-gyro0_AR1)*gyro_value_y);//角速度=-(陀螺仪AD采样值-陀螺仪零点AD值)*陀螺仪比例换算系数
        LDR.N    R0,??DataTable4_8
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable4_5
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_10  ;; 0x9999999a
        LDR.N    R3,??DataTable4_11  ;; 0x40229999
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        EORS     R0,R0,#0x80000000
        LDR.N    R1,??DataTable4_12
        STR      R0,[R1, #+0]
//   67   gyro_speed_x=(float)((ad_gyro_x-gyro0_AR2)*gyro_value_x);
        LDR.N    R0,??DataTable4_9
        LDR      R0,[R0, #+0]
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable4_6
        LDR      R1,[R1, #+0]
        BL       __aeabi_fsub
        BL       __aeabi_f2d
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_13  ;; 0x3ff00000
        BL       __aeabi_dmul
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_14  ;; 0x40100000
        BL       __aeabi_ddiv
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_15
        STR      R0,[R1, #+0]
//   68   //angle_change+=gyro_speed_y*gyro_time;
//   69 }
        POP      {R0,PC}          ;; return
//   70 /***加速度计AD采样***/

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   71 void get_accl() 
//   72 {
get_accl:
        PUSH     {R7,LR}
//   73   if(count==10)   count=0;
        LDR.N    R0,??DataTable4_16
        LDR      R0,[R0, #+0]
        CMP      R0,#+10
        BNE.N    ??get_accl_0
        MOVS     R0,#+0
        LDR.N    R1,??DataTable4_16
        STR      R0,[R1, #+0]
//   74   ad_z[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTZ_MSB);//z轴加速度AD采样
??get_accl_0:
        MOVS     R1,#+5
        MOVS     R0,#+1
        BL       LPLD_MMA8451_GetResult
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        BL       __aeabi_i2f
        LDR.N    R1,??DataTable4_17
        LDR.N    R2,??DataTable4_16
        LDR      R2,[R2, #+0]
        STR      R0,[R1, R2, LSL #+2]
//   75 //  ad_x[count]=LPLD_MMA8451_GetResult(MMA8451_STATUS_X_READY, MMA8451_REG_OUTX_MSB);//x轴加速度AD采样
//   76   count++;//数据采样计数量
        LDR.N    R0,??DataTable4_16
        LDR      R0,[R0, #+0]
        ADDS     R0,R0,#+1
        LDR.N    R1,??DataTable4_16
        STR      R0,[R1, #+0]
//   77 }
        POP      {R0,PC}          ;; return
//   78 //--------------------角度融合-----------------------// 

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
//   79 void ronghe_angle()
//   80 {
ronghe_angle:
        PUSH     {R7,LR}
//   81   AD_Z=lvbo(ad_z);//加速度Z轴取得滤波后的值
        LDR.N    R0,??DataTable4_17
        BL       lvbo
        LDR.N    R1,??DataTable4_18
        STR      R0,[R1, #+0]
//   82 //  AD_X=lvbo(ad_x);//加速度X轴取得滤波后的值
//   83   value_Z=0.00025*AD_Z;
        LDR.N    R0,??DataTable4_18
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        LDR.N    R2,??DataTable4_19  ;; 0xd2f1a9fc
        LDR.N    R3,??DataTable4_20  ;; 0x3f30624d
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_21
        STR      R0,[R1, #+0]
//   84 //  value_X=0.00025*AD_X;
//   85   
//   86   if(value_Z>0.95)  value_Z=0.95;
        LDR.N    R0,??DataTable4_21
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_22  ;; 0x3f733334
        BL       __aeabi_cfrcmple
        BHI.N    ??ronghe_angle_0
        LDR.N    R0,??DataTable4_23  ;; 0x3f733333
        LDR.N    R1,??DataTable4_21
        STR      R0,[R1, #+0]
//   87   if(value_Z<-0.95)  value_Z=-0.95;
??ronghe_angle_0:
        LDR.N    R0,??DataTable4_21
        LDR      R0,[R0, #+0]
        LDR.N    R1,??DataTable4_24  ;; 0xbf733333
        BL       __aeabi_cfcmple
        BCS.N    ??ronghe_angle_1
        LDR.N    R0,??DataTable4_24  ;; 0xbf733333
        LDR.N    R1,??DataTable4_21
        STR      R0,[R1, #+0]
//   88 //  if(value_X>1)  value_X=1;
//   89 //  if(value_X<-1)  value_X=-1;
//   90 //  accl_angle_X=(float)(atan2(value_Z,value_X)/PAI*180.0);
//   91   accl_angle_Y=(float)(asin(value_Z)/PAI*180);//加速度计得到的Y方向角度值
??ronghe_angle_1:
        LDR.N    R0,??DataTable4_21
        LDR      R0,[R0, #+0]
        BL       __aeabi_f2d
        BL       asin
        LDR.N    R2,??DataTable4_25  ;; 0x82c2bd7f
        LDR.N    R3,??DataTable4_26  ;; 0x400921fb
        BL       __aeabi_ddiv
        MOVS     R2,#+0
        LDR.N    R3,??DataTable4_27  ;; 0x40668000
        BL       __aeabi_dmul
        BL       __aeabi_d2f
        LDR.N    R1,??DataTable4_28
        STR      R0,[R1, #+0]
//   92   if(ji==0)  {angle+=accl_angle_Y;ji=1;}//记录第一次的角度为加速度的开始角度        
        LDR.N    R0,??DataTable4_29
        LDR      R0,[R0, #+0]
        CMP      R0,#+0
        BNE.N    ??ronghe_angle_2
        LDR.N    R0,??DataTable4_1
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable4_28
        LDR      R0,[R0, #+0]
        BL       __aeabi_fadd
        LDR.N    R1,??DataTable4_1
        STR      R0,[R1, #+0]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable4_29
        STR      R0,[R1, #+0]
//   93   one_complementation(gyro_speed_y,accl_angle_Y);//互补滤波
??ronghe_angle_2:
        LDR.N    R0,??DataTable4_28
        LDR      R1,[R0, #+0]
        LDR.N    R0,??DataTable4_12
        LDR      R0,[R0, #+0]
        BL       one_complementation
//   94 }
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0x3ca3d70a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     angle

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0x47ae147b

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0x3f747ae1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     0x400bb000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     gyro0_AR1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_6:
        DC32     gyro0_AR2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_7:
        DC32     0x447a0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_8:
        DC32     ad_gyro_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_9:
        DC32     ad_gyro_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_10:
        DC32     0x9999999a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_11:
        DC32     0x40229999

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_12:
        DC32     gyro_speed_y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_13:
        DC32     0x3ff00000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_14:
        DC32     0x40100000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_15:
        DC32     gyro_speed_x

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_16:
        DC32     count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_17:
        DC32     ad_z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_18:
        DC32     AD_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_19:
        DC32     0xd2f1a9fc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_20:
        DC32     0x3f30624d

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_21:
        DC32     value_Z

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_22:
        DC32     0x3f733334

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_23:
        DC32     0x3f733333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_24:
        DC32     0xbf733333

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_25:
        DC32     0x82c2bd7f

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_26:
        DC32     0x400921fb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_27:
        DC32     0x40668000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_28:
        DC32     accl_angle_Y

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_29:
        DC32     ji

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
//   95 //=====================清华方案=================// 
//   96 /*void QingHua_AngleCalaulate()
//   97 {
//   98 float fDeltaValue=0;
//   99 angle=gyro_angle;                            //最终融合角度
//  100 fDeltaValue=(Z_angle-angle)/GRAVITY_ADJUST_TIME_CONSTANT;   //时间系数矫正
//  101 gyro_angle+=(fDeltaValue+gyro_speed_y)*a_time;          //融合角度
//  102 }*/
// 
// 144 bytes in section .bss
// 746 bytes in section .text
// 
// 746 bytes of CODE memory
// 144 bytes of DATA memory
//
//Errors: none
//Warnings: none
