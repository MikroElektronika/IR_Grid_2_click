/*
Example for IR_Grid2 Click

    Date          : avg 2018.
    Author        : Katarina Perendic

Test configuration AVR :
    
    MCU              : ATMEGA32
    Dev. Board       : EasyAVR v7 
    AVR Compiler ver : v7.0.1.0

---

Description :

The application is composed of three sections :

- System Initialization - Initializes I2C module and USB UART for data logging
- Application Initialization - Initializes driver init and IR Grid 2 module
- Application Task - (code snippet) - Reads the temperature of all pixels and creates a pixel temperature matrix that logs on usbuart every 500ms

- note :
   The sensor needs about 4 minutes for calibration

*/

#include "Click_IR_Grid2_types.h"
#include "Click_IR_Grid2_config.h"

float pixelTemp[768];
float Ta = 0;
uint16_t cnt;
char demoText[ 100 ];

void systemInit()
{
    Delay_80us();
    mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
    mikrobus_logInit( _LOG_USBUART, 9600 );
    mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
    Delay_ms( 100 );
}

void applicationInit()
{
    irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
    irgrid2_init();
    mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
    Delay_100ms();
}

void applicationTask()
{
    irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);

    mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
    FloatToStr(Ta,demoText);
    mikrobus_logWrite(demoText,_LOG_LINE);
    mikrobus_logWrite(" ", _LOG_LINE);
    mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);

    for ( cnt = 0 ; cnt < 768 ; cnt++)
    {
        FloatToStr(pixelTemp[cnt],demoText);
        demoText[ 5 ] = 0 ;
        mikrobus_logWrite(demoText, _LOG_TEXT);
        mikrobus_logWrite("|", _LOG_TEXT);
        Delay_1ms();
        if(((cnt % 32) == 0) && (cnt > 0))
        {
            mikrobus_logWrite(" ", _LOG_LINE);
        }
    }
    mikrobus_logWrite(" ", _LOG_LINE);
    Delay_ms( 500 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
            applicationTask();
    }
}