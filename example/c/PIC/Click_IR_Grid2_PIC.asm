
_systemInit:

;Click_IR_Grid2_PIC.c,35 :: 		void systemInit()
;Click_IR_Grid2_PIC.c,37 :: 		Delay_80us();
	CALL        _Delay_80us+0, 0
;Click_IR_Grid2_PIC.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
	CLRF        FARG_mikrobus_i2cInit_bus+0 
	MOVLW       __IRGRID2_I2C_CFG+0
	MOVWF       FARG_mikrobus_i2cInit_cfg+0 
	MOVLW       hi_addr(__IRGRID2_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+1 
	MOVLW       higher_addr(__IRGRID2_I2C_CFG+0)
	MOVWF       FARG_mikrobus_i2cInit_cfg+2 
	CALL        _mikrobus_i2cInit+0, 0
;Click_IR_Grid2_PIC.c,39 :: 		mikrobus_logInit( _LOG_USBUART, 9600 );
	MOVLW       16
	MOVWF       FARG_mikrobus_logInit_port+0 
	MOVLW       128
	MOVWF       FARG_mikrobus_logInit_baud+0 
	MOVLW       37
	MOVWF       FARG_mikrobus_logInit_baud+1 
	MOVLW       0
	MOVWF       FARG_mikrobus_logInit_baud+2 
	MOVWF       FARG_mikrobus_logInit_baud+3 
	CALL        _mikrobus_logInit+0, 0
;Click_IR_Grid2_PIC.c,40 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
	MOVLW       ?lstr1_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr1_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,41 :: 		Delay_ms( 100 );
	MOVLW       9
	MOVWF       R11, 0
	MOVLW       30
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_systemInit0:
	DECFSZ      R13, 1, 1
	BRA         L_systemInit0
	DECFSZ      R12, 1, 1
	BRA         L_systemInit0
	DECFSZ      R11, 1, 1
	BRA         L_systemInit0
	NOP
;Click_IR_Grid2_PIC.c,42 :: 		}
L_end_systemInit:
	RETURN      0
; end of _systemInit

_applicationInit:

;Click_IR_Grid2_PIC.c,44 :: 		void applicationInit()
;Click_IR_Grid2_PIC.c,46 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
	MOVLW       __MIKROBUS1_GPIO+0
	MOVWF       FARG_irgrid2_i2cDriverInit_gpioObj+0 
	MOVLW       hi_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_irgrid2_i2cDriverInit_gpioObj+1 
	MOVLW       higher_addr(__MIKROBUS1_GPIO+0)
	MOVWF       FARG_irgrid2_i2cDriverInit_gpioObj+2 
	MOVLW       __MIKROBUS1_I2C+0
	MOVWF       FARG_irgrid2_i2cDriverInit_i2cObj+0 
	MOVLW       hi_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_irgrid2_i2cDriverInit_i2cObj+1 
	MOVLW       higher_addr(__MIKROBUS1_I2C+0)
	MOVWF       FARG_irgrid2_i2cDriverInit_i2cObj+2 
	MOVLW       51
	MOVWF       FARG_irgrid2_i2cDriverInit_slave+0 
	CALL        _irgrid2_i2cDriverInit+0, 0
;Click_IR_Grid2_PIC.c,47 :: 		irgrid2_init();
	CALL        _irgrid2_init+0, 0
;Click_IR_Grid2_PIC.c,48 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
	MOVLW       ?lstr2_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr2_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,49 :: 		Delay_100ms();
	CALL        _Delay_100ms+0, 0
;Click_IR_Grid2_PIC.c,50 :: 		}
L_end_applicationInit:
	RETURN      0
; end of _applicationInit

_applicationTask:

;Click_IR_Grid2_PIC.c,52 :: 		void applicationTask()
;Click_IR_Grid2_PIC.c,54 :: 		irgrid2_getPixelTemperature(&Ta,pixelTemp);
	MOVLW       _Ta+0
	MOVWF       FARG_irgrid2_getPixelTemperature_Ta+0 
	MOVLW       hi_addr(_Ta+0)
	MOVWF       FARG_irgrid2_getPixelTemperature_Ta+1 
	MOVLW       _pixelTemp+0
	MOVWF       FARG_irgrid2_getPixelTemperature_pixelTemp+0 
	MOVLW       hi_addr(_pixelTemp+0)
	MOVWF       FARG_irgrid2_getPixelTemperature_pixelTemp+1 
	CALL        _irgrid2_getPixelTemperature+0, 0
;Click_IR_Grid2_PIC.c,55 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
	MOVLW       ?lstr3_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr3_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,56 :: 		FloatToStr(Ta,demoText);
	MOVF        _Ta+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        _Ta+1, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        _Ta+2, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        _Ta+3, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _demoText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_IR_Grid2_PIC.c,57 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,58 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOVLW       ?lstr4_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr4_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,60 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
	MOVLW       ?lstr5_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr5_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,62 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	CLRF        _cnt+0 
	CLRF        _cnt+1 
L_applicationTask1:
	MOVLW       3
	SUBWF       _cnt+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask14
	MOVLW       0
	SUBWF       _cnt+0, 0 
L__applicationTask14:
	BTFSC       STATUS+0, 0 
	GOTO        L_applicationTask2
;Click_IR_Grid2_PIC.c,64 :: 		FloatToStr(pixelTemp[cnt],demoText);
	MOVF        _cnt+0, 0 
	MOVWF       R0 
	MOVF        _cnt+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       _pixelTemp+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_pixelTemp+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+1 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+2 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_FloatToStr_fnum+3 
	MOVLW       _demoText+0
	MOVWF       FARG_FloatToStr_str+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_FloatToStr_str+1 
	CALL        _FloatToStr+0, 0
;Click_IR_Grid2_PIC.c,65 :: 		demoText[ 5 ] = 0 ;
	CLRF        _demoText+5 
;Click_IR_Grid2_PIC.c,66 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
	MOVLW       _demoText+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(_demoText+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,67 :: 		mikrobus_logWrite("|", _LOG_TEXT);
	MOVLW       ?lstr6_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr6_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       1
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,68 :: 		Delay_1ms();
	CALL        _Delay_1ms+0, 0
;Click_IR_Grid2_PIC.c,69 :: 		if(((cnt % 32) == 0) && (cnt > 0))
	MOVLW       31
	ANDWF       _cnt+0, 0 
	MOVWF       R1 
	MOVF        _cnt+1, 0 
	MOVWF       R2 
	MOVLW       0
	ANDWF       R2, 1 
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask15
	MOVLW       0
	XORWF       R1, 0 
L__applicationTask15:
	BTFSS       STATUS+0, 2 
	GOTO        L_applicationTask6
	MOVLW       0
	MOVWF       R0 
	MOVF        _cnt+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__applicationTask16
	MOVF        _cnt+0, 0 
	SUBLW       0
L__applicationTask16:
	BTFSC       STATUS+0, 0 
	GOTO        L_applicationTask6
L__applicationTask10:
;Click_IR_Grid2_PIC.c,71 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOVLW       ?lstr7_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr7_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,72 :: 		}
L_applicationTask6:
;Click_IR_Grid2_PIC.c,62 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	INFSNZ      _cnt+0, 1 
	INCF        _cnt+1, 1 
;Click_IR_Grid2_PIC.c,73 :: 		}
	GOTO        L_applicationTask1
L_applicationTask2:
;Click_IR_Grid2_PIC.c,74 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOVLW       ?lstr8_Click_IR_Grid2_PIC+0
	MOVWF       FARG_mikrobus_logWrite_data_+0 
	MOVLW       hi_addr(?lstr8_Click_IR_Grid2_PIC+0)
	MOVWF       FARG_mikrobus_logWrite_data_+1 
	MOVLW       2
	MOVWF       FARG_mikrobus_logWrite_format+0 
	CALL        _mikrobus_logWrite+0, 0
;Click_IR_Grid2_PIC.c,75 :: 		Delay_ms( 500 );
	MOVLW       41
	MOVWF       R11, 0
	MOVLW       150
	MOVWF       R12, 0
	MOVLW       127
	MOVWF       R13, 0
L_applicationTask7:
	DECFSZ      R13, 1, 1
	BRA         L_applicationTask7
	DECFSZ      R12, 1, 1
	BRA         L_applicationTask7
	DECFSZ      R11, 1, 1
	BRA         L_applicationTask7
;Click_IR_Grid2_PIC.c,76 :: 		}
L_end_applicationTask:
	RETURN      0
; end of _applicationTask

_main:

;Click_IR_Grid2_PIC.c,78 :: 		void main()
;Click_IR_Grid2_PIC.c,80 :: 		systemInit();
	CALL        _systemInit+0, 0
;Click_IR_Grid2_PIC.c,81 :: 		applicationInit();
	CALL        _applicationInit+0, 0
;Click_IR_Grid2_PIC.c,83 :: 		while (1)
L_main8:
;Click_IR_Grid2_PIC.c,85 :: 		applicationTask();
	CALL        _applicationTask+0, 0
;Click_IR_Grid2_PIC.c,86 :: 		}
	GOTO        L_main8
;Click_IR_Grid2_PIC.c,87 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
