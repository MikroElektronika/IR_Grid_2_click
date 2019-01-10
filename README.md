![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# IR_Grid2 Click

- **CIC Prefix**  : IRGRID2
- **Author**      : Katarina Perendic
- **Verison**     : 1.0.0
- **Date**        : avg 2018.

---

### Software Support

We provide a library for the IR_Grid2 Click on our [LibStock](https://libstock.mikroe.com/projects/view/2563/ir-grid-2-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

The library contains all the necessary functions for successful work with IR Grid 2 click.

Key functions :

- ``` void irgrid2_init() ``` - Functions for initialization chip
- ``` void irgrid2_getPixelTemperature(float *Ta, float *pixelTemp) ``` - Functions for reads Ambient temperature and pixel temperature

**Examples Description**

The application is composed of three sections :

- System Initialization - Initializes I2C module and USB UART for data logging
- Application Initialization - Initializes driver init and IR Grid 2 module
- Application Task - (code snippet) - Reads the temperature of all pixels and creates a pixel temperature matrix that logs on usbuart every 500ms

- note :
   The sensor needs about 4 minutes for calibration

```.c
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
```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/2563/ir-grid-2-click) page.

Other mikroE Libraries used in the example:

- I2C

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
---
