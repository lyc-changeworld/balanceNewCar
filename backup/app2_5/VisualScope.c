#include "VisualScope.h"

uint16 Send_Data[4] = {0,0,0,0};
uint16 CRC_Check(uint8 *buf, uint8 CRC_CNT)
{
    uint16 CRC_temp;
    uint8 i,j;
    CRC_temp = 0xffff;
    for (i=0;i<CRC_CNT; i++){      
        CRC_temp ^= buf[i];
        for (j=0;j<8;j++) {
            if (CRC_temp & 0x01)
                CRC_temp = (CRC_temp >>1 ) ^ 0xa001;
            else
                CRC_temp = CRC_temp >> 1;
        }
    }
    return(CRC_temp);
}
//发送数据
void OutPut_Data(void)
{
  uint8 databuf[10] = {0};
  uint8 i;
  uint16 CRC16 = 0;
  for(i=0;i<4;i++) 
  {
    databuf[i*2]   = (uint8)(Send_Data[i]%256);
    databuf[i*2+1] = (uint8)(Send_Data[i]/256);
  }
  CRC16 = CRC_Check(databuf,8);
  databuf[8] = CRC16%256;
  databuf[9] = CRC16/256;
  for(i=0;i<10;i++)
     LPLD_UART_PutChar(UART3,databuf[i]);
}
/*只需调用void OutPut_Data(void),就可实现数据的发送。共四个通道，将所要发送的数据放在Send_Data[]里面。
  示例：Send_Data[0] = (uint16)(Set_Speed);
        Send_Data[1] = (uint16)(Get_Speed);
        Send_Data[2] = (uint16)(Recognition_C_Line_1[0]);
        Send_Data[3] = (uint16)(Recognition_C_Line_0[0]);*/