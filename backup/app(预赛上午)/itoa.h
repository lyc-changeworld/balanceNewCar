#define _ITOA_H 
uint8 *myitoa(int num,uint8 *str,int radix)   
{    
    /* ������ */   
    char index[]="0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";   
    unsigned unum; /* �м���� */   
    int i=0,j,k;   
    /* ȷ��unum��ֵ */   
    if(radix==10&&num<0) /* ʮ���Ƹ��� */   
    {   
        unum=(unsigned)-num;   
        str[i++]='-';   
    }   
    else unum=(unsigned)num; /* ������� */   
    /* ���� */   
    do    
    {   
        str[i++]=index[unum%(unsigned)radix];   
        unum/=radix;   
    }while(unum);   
    str[i]='\0';   
    /* ת�� */   
    if(str[0]=='-') k=1; /* ʮ���Ƹ��� */   
    else k=0;   
    /* ��ԭ���ġ�/2����Ϊ��/2.0������֤��num��16~255֮�䣬radix����16ʱ��Ҳ�ܵõ���ȷ��� */   
    char temp;   
    for(j=k;j<=(i-k-1)/2.0;j++)   
    {   
        temp=str[j];   
        str[j]=str[i-j-1];   
        str[i-j-1]=temp;   
    }   
    return str;   
}   