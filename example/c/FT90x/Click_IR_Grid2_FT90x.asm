_systemInit:
;Click_IR_Grid2_FT90x.c,38 :: 		void systemInit()
;Click_IR_Grid2_FT90x.c,40 :: 		Delay_80us();
CALL	_Delay_80us+0
;Click_IR_Grid2_FT90x.c,41 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
LDK.L	R1, #__IRGRID2_I2C_CFG+0
LDK.L	R0, #0
CALL	_mikrobus_i2cInit+0
;Click_IR_Grid2_FT90x.c,42 :: 		mikrobus_logInit( _LOG_USBUART, 115200 );
LDK.L	R1, #115200
LDK.L	R0, #16
CALL	_mikrobus_logInit+0
;Click_IR_Grid2_FT90x.c,43 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
LDK.L	R0, #?lstr1_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,44 :: 		Delay_ms( 100 );
LPM.L	R28, #3333331
NOP	
L_systemInit0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_systemInit0
JMP	$+8
	#3333331
NOP	
NOP	
;Click_IR_Grid2_FT90x.c,45 :: 		}
L_end_systemInit:
RETURN	
; end of _systemInit
_applicationInit:
;Click_IR_Grid2_FT90x.c,47 :: 		void applicationInit()
;Click_IR_Grid2_FT90x.c,49 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
LDK.L	R2, #51
LDK.L	R1, #__MIKROBUS1_I2C+0
LDK.L	R0, #__MIKROBUS1_GPIO+0
CALL	_irgrid2_i2cDriverInit+0
;Click_IR_Grid2_FT90x.c,50 :: 		irgrid2_init();
CALL	_irgrid2_init+0
;Click_IR_Grid2_FT90x.c,51 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
LDK.L	R0, #?lstr2_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,52 :: 		Delay_100ms();
CALL	_Delay_100ms+0
;Click_IR_Grid2_FT90x.c,53 :: 		}
L_end_applicationInit:
RETURN	
; end of _applicationInit
_applicationTask:
;Click_IR_Grid2_FT90x.c,55 :: 		void applicationTask()
;Click_IR_Grid2_FT90x.c,57 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
LDK.L	R1, #_pixelTemp+0
LDK.L	R0, #_Ta+0
CALL	_irgrid2_getPixelTemperature+0
;Click_IR_Grid2_FT90x.c,58 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
LDK.L	R0, #?lstr3_Click_IR_Grid2_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,59 :: 		FloatToStr(Ta,demoText);
LDA.L	R0, _Ta+0
LDK.L	R1, #_demoText+0
CALL	_FloatToStr+0
;Click_IR_Grid2_FT90x.c,60 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
LDK.L	R1, #2
LDK.L	R0, #_demoText+0
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,61 :: 		mikrobus_logWrite(" ", _LOG_LINE);
LDK.L	R0, #?lstr4_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,63 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
LDK.L	R0, #?lstr5_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
LDK.L	R0, #0
STA.S	_cnt+0, R0
L_applicationTask2:
LDA.S	R1, _cnt+0
LDK.L	R0, #768
CMP.S	R1, R0
JMPC	R30, C, #0, L_applicationTask3
;Click_IR_Grid2_FT90x.c,67 :: 		FloatToStr(pixelTemp[cnt],demoText);
LDA.S	R0, _cnt+0
ASHL.L	R0, R0, #2
LDK.L	R1, #_pixelTemp+0
ADD.L	R0, R1, R0
LDI.L	R0, R0, #0
LDK.L	R1, #_demoText+0
CALL	_FloatToStr+0
;Click_IR_Grid2_FT90x.c,68 :: 		demoText[ 5 ] = 0 ;
LDK.L	R0, #0
STA.B	_demoText+5, R0
;Click_IR_Grid2_FT90x.c,69 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
LDK.L	R1, #1
LDK.L	R0, #_demoText+0
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,70 :: 		mikrobus_logWrite("|", _LOG_TEXT);
LDK.L	R0, #?lstr6_Click_IR_Grid2_FT90x+0
LDK.L	R1, #1
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,71 :: 		Delay_1ms();
CALL	_Delay_1ms+0
;Click_IR_Grid2_FT90x.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
LDA.S	R0, _cnt+0
AND.L	R0, R0, #31
CMP.S	R0, #0
JMPC	R30, Z, #0, L__applicationTask14
LDA.S	R0, _cnt+0
CMP.S	R0, #0
JMPC	R30, A, #0, L__applicationTask13
L__applicationTask12:
;Click_IR_Grid2_FT90x.c,74 :: 		mikrobus_logWrite(" ", _LOG_LINE);
LDK.L	R0, #?lstr7_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_FT90x.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
LDA.S	R0, _cnt+0
ADD.L	R0, R0, #1
STA.S	_cnt+0, R0
;Click_IR_Grid2_FT90x.c,76 :: 		}
JMP	L_applicationTask2
L_applicationTask3:
;Click_IR_Grid2_FT90x.c,77 :: 		mikrobus_logWrite(" ", _LOG_LINE);
LDK.L	R0, #?lstr8_Click_IR_Grid2_FT90x+0
LDK.L	R1, #2
CALL	_mikrobus_logWrite+0
;Click_IR_Grid2_FT90x.c,78 :: 		Delay_ms( 500 );
LPM.L	R28, #16666665
NOP	
L_applicationTask8:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_applicationTask8
JMP	$+8
	#16666665
;Click_IR_Grid2_FT90x.c,79 :: 		}
L_end_applicationTask:
RETURN	
; end of _applicationTask
_main:
;Click_IR_Grid2_FT90x.c,81 :: 		void main()
LDK.L	SP, #43605
;Click_IR_Grid2_FT90x.c,83 :: 		systemInit();
CALL	_systemInit+0
;Click_IR_Grid2_FT90x.c,84 :: 		applicationInit();
CALL	_applicationInit+0
;Click_IR_Grid2_FT90x.c,86 :: 		while (1)
L_main10:
;Click_IR_Grid2_FT90x.c,88 :: 		applicationTask();
CALL	_applicationTask+0
;Click_IR_Grid2_FT90x.c,89 :: 		}
JMP	L_main10
;Click_IR_Grid2_FT90x.c,90 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
