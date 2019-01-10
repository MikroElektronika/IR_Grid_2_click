/*
    __irgrid2_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __irgrid2_driver.h
@brief    IR_Grid2 Driver
@mainpage IR_Grid2 Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   IRGRID2
@brief      IR_Grid2 Click Driver
@{

| Global Library Prefix | **IRGRID2** |
|:---------------------:|:-----------------:|
| Version               | **1.0.0**    |
| Date                  | **avg 2018.**      |
| Developer             | **Katarina Perendic**     |

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _IRGRID2_H_
#define _IRGRID2_H_

/** 
 * @macro T_IRGRID2_P
 * @brief Driver Abstract type 
 */
#define T_IRGRID2_P    const uint8_t*

/** @defgroup IRGRID2_COMPILE Compilation Config */              /** @{ */

//  #define   __IRGRID2_DRV_SPI__                            /**<     @macro __IRGRID2_DRV_SPI__  @brief SPI driver selector */
   #define   __IRGRID2_DRV_I2C__                            /**<     @macro __IRGRID2_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __IRGRID2_DRV_UART__                           /**<     @macro __IRGRID2_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup IRGRID2_VAR Variables */                           /** @{ */



                                                                       /** @} */
/** @defgroup IRGRID2_TYPES Types */                             /** @{ */

typedef struct
{
    int16_t kVdd;
    int16_t vdd25;
    float KvPTAT;
    float KtPTAT;
    uint16_t vPTAT25;
    float alphaPTAT;
    int16_t gainEE;
    float tgc;
    float cpKv;
    float cpKta;
    uint8_t resolutionEE;
    uint8_t calibrationModeEE;
    float KsTa;
    float ksTo[4];
    int16_t ct[4];
    float alpha[768];
    int16_t offset[768];
    float kta[768];
    float kv[768];
    float cpAlpha[2];
    int16_t cpOffset[2];
    float ilChessC[3];
    uint16_t brokenPixels[5];
    uint16_t outlierPixels[5];
} paramsMLX90640;

                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup IRGRID2_INIT Driver Initialization */              /** @{ */

#ifdef   __IRGRID2_DRV_SPI__
void irgrid2_spiDriverInit(T_IRGRID2_P gpioObj, T_IRGRID2_P spiObj);
#endif
#ifdef   __IRGRID2_DRV_I2C__
void irgrid2_i2cDriverInit(T_IRGRID2_P gpioObj, T_IRGRID2_P i2cObj, uint8_t slave);
#endif
#ifdef   __IRGRID2_DRV_UART__
void irgrid2_uartDriverInit(T_IRGRID2_P gpioObj, T_IRGRID2_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void irgrid2_gpioDriverInit(T_IRGRID2_P gpioObj);
                                                                       /** @} */
/** @defgroup IRGRID2_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Functions for write one byte in register
 *
 * @param[in] reg    Register in which the data will be written
 * @param[in] _data  Data which be written in the register
 */
void irgrid2_writeByte(uint16_t reg, uint16_t _data);

/**
 * @brief Functions for reads byte from register
 *
 * @param[in] reg    Register which will be read
 * @retval one data which is read from the register
 */
uint16_t irgrid2_readByte(uint16_t reg);

/**
 * @brief Functions for reads data from register
 *
 * @param[in] startAddr     Address from which it begins to be read
 * @param[in] nBytes        Number of memory addresses to be read
 * @param[out] dataOUT      Buffer in which the data will be stored
 */
void irgrid2_readData(uint16_t startAddr, uint16_t nBytes, uint16_t *dataOUT);

/**
 * @brief Functions for reads Ambient temperature and pixel temperature
 *
 * @param[out] Ta             Ambient temperature
 * @param[out] pixelTemp      Buffer in which the pixels temperature will be stored
 */
void irgrid2_getPixelTemperature(float *Ta, float *pixelTemp);

/**
 * @brief Functions for initialization chip
 */
void irgrid2_init();

/**
 * @brief Functions for reads EEPROM
 *
 * @param[out] eeData         Buffer in which the data will be stored
 */
void irgrid2_readEEPROM(uint16_t *eeData);

/**
 * @brief Parameters storage functions
 *
 * @param[in] eeData         EEPROM buffer
 */
int irgrid2_ExtractParameters(uint16_t *eeData, paramsMLX90640 *mlx90640);

/**
 * @brief Functions for gets frame data
 *
 * @param[in] frameData         Buffer in which the data will be stored
 */
int irgrid2_getFrameData(uint16_t *frameData);

/**
 * @brief Functions for settings resolution
 *
 * @param[in] resolution         the resolution that will be set
 */
void irgrid2_setResolution(uint8_t resolution);

/**
 * @brief Functions for gets current resolution
 *
 * @return current resolution
 */
int irgrid2_getCurResolution();

/**
 * @brief Functions for sets refresh rate
 *
 * @param[in] refreshRate         the refresh Rate data that will be set
 */
void irgrid2_setRefreshRate(uint8_t refreshRate);

/**
 * @brief Functions for gets current refresh Rate
 *
 * @return current refresh Rate
 */
int irgrid2_getRefreshRate();

/**
 * @brief Functions for sets interleaved mode
 */
void irgrid2_setInterleavedMode();

/**
 * @brief Functions for sets chess mode
 */
void irgrid2_setChessMode();

/**
 * @brief Functions for gets current mode
 *
 * @return current mode
 */
int irgrid2_getCurMode();


/**
 * @brief Functions for gets Ambient temperature
 *
 * @param[in] frameData             Frame Data
 * @param[in] params                Structure of parameters
 *
 * @return Ambient temperature
 */
float irgrid2_GetTa(uint16_t *frameData,  paramsMLX90640 *params);

/**
 * @brief Function for calculating temperature objects
 *
 * @param[in] frameData             Frame Data
 * @param[in] params                Structure of parameters
 * @param[in] tr                    Real temperature
 * @param[in] emissivity            Emissivity - 0.95 default
 * @param[in] result                Buffer in which the result of the calculation will be stored
 */
void irgrid2_CalculateTo(uint16_t *frameData,  paramsMLX90640 *params, float emissivity, float tr, float *result);

/**
 * @brief Function for gets Image
 *
 * @param[in] frameData             Frame Data
 * @param[in] params                Structure of parameters
 * @param[in] result                Buffer in which the result of the calculation will be stored
 */
void irgrid_getImage(uint16_t *frameData,  paramsMLX90640 *params, float *result);

/**
 * @brief Function for gets sub page number
 *
 * @param[in] frameData             Frame Data
 *
 * @return  sub page number        
 */
int irgrid2_GetSubPageNumber(uint16_t *frameData);

/**
 * @brief Function for gets Vdd
 *
 * @param[in] frameData             Frame Data
 * @param[in] params                Structure of parameters       
 */
float irgrid2_GetVdd(uint16_t *frameData,  paramsMLX90640 *params);


                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_IR_Grid2_STM.c
    @example Click_IR_Grid2_TIVA.c
    @example Click_IR_Grid2_CEC.c
    @example Click_IR_Grid2_KINETIS.c
    @example Click_IR_Grid2_MSP.c
    @example Click_IR_Grid2_PIC.c
    @example Click_IR_Grid2_PIC32.c
    @example Click_IR_Grid2_DSPIC.c
    @example Click_IR_Grid2_AVR.c
    @example Click_IR_Grid2_FT90x.c
    @example Click_IR_Grid2_STM.mbas
    @example Click_IR_Grid2_TIVA.mbas
    @example Click_IR_Grid2_CEC.mbas
    @example Click_IR_Grid2_KINETIS.mbas
    @example Click_IR_Grid2_MSP.mbas
    @example Click_IR_Grid2_PIC.mbas
    @example Click_IR_Grid2_PIC32.mbas
    @example Click_IR_Grid2_DSPIC.mbas
    @example Click_IR_Grid2_AVR.mbas
    @example Click_IR_Grid2_FT90x.mbas
    @example Click_IR_Grid2_STM.mpas
    @example Click_IR_Grid2_TIVA.mpas
    @example Click_IR_Grid2_CEC.mpas
    @example Click_IR_Grid2_KINETIS.mpas
    @example Click_IR_Grid2_MSP.mpas
    @example Click_IR_Grid2_PIC.mpas
    @example Click_IR_Grid2_PIC32.mpas
    @example Click_IR_Grid2_DSPIC.mpas
    @example Click_IR_Grid2_AVR.mpas
    @example Click_IR_Grid2_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __irgrid2_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */