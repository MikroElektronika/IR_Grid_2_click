
_systemInit:

;Click_IR_Grid2_DSPIC.c,38 :: 		void systemInit()
;Click_IR_Grid2_DSPIC.c,40 :: 		Delay_80us();
	PUSH	W10
	PUSH	W11
	PUSH	W12
	CALL	_Delay_80us
;Click_IR_Grid2_DSPIC.c,41 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
	MOV	#lo_addr(__IRGRID2_I2C_CFG), W0
	MOV	W0, W11
	CLR	W10
	CALL	_mikrobus_i2cInit
;Click_IR_Grid2_DSPIC.c,42 :: 		mikrobus_logInit( _LOG_USBUART_A, 9600 );
	MOV	#9600, W11
	MOV	#0, W12
	MOV.B	#32, W10
	CALL	_mikrobus_logInit
;Click_IR_Grid2_DSPIC.c,43 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr1_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,44 :: 		Delay_ms( 100 );
	MOV	#3, W8
	MOV	#2261, W7
L_systemInit0:
	DEC	W7
	BRA NZ	L_systemInit0
	DEC	W8
	BRA NZ	L_systemInit0
;Click_IR_Grid2_DSPIC.c,45 :: 		}
L_end_systemInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _systemInit

_applicationInit:

;Click_IR_Grid2_DSPIC.c,47 :: 		void applicationInit()
;Click_IR_Grid2_DSPIC.c,49 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV.B	#51, W12
	MOV	#lo_addr(__MIKROBUS1_I2C), W11
	MOV	#lo_addr(__MIKROBUS1_GPIO), W10
	CALL	_irgrid2_i2cDriverInit
;Click_IR_Grid2_DSPIC.c,50 :: 		irgrid2_init();
	CALL	_irgrid2_init
;Click_IR_Grid2_DSPIC.c,51 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr2_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,52 :: 		Delay_100ms();
	CALL	_Delay_100ms
;Click_IR_Grid2_DSPIC.c,53 :: 		}
L_end_applicationInit:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _applicationInit

_applicationTask:

;Click_IR_Grid2_DSPIC.c,55 :: 		void applicationTask()
;Click_IR_Grid2_DSPIC.c,57 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
	PUSH	W10
	PUSH	W11
	PUSH	W12
	MOV	#lo_addr(_pixelTemp), W11
	MOV	#lo_addr(_Ta), W10
	CALL	_irgrid2_getPixelTemperature
;Click_IR_Grid2_DSPIC.c,59 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr3_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,60 :: 		FloatToStr(Ta,demoText);
	MOV	#lo_addr(_demoText), W12
	MOV	_Ta, W10
	MOV	_Ta+2, W11
	CALL	_FloatToStr
;Click_IR_Grid2_DSPIC.c,61 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(_demoText), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,62 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr4_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,63 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr5_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	CLR	W0
	MOV	W0, _cnt
L_applicationTask2:
	MOV	_cnt, W1
	MOV	#768, W0
	CP	W1, W0
	BRA LTU	L__applicationTask18
	GOTO	L_applicationTask3
L__applicationTask18:
;Click_IR_Grid2_DSPIC.c,67 :: 		FloatToStr(pixelTemp[cnt],demoText);
	MOV	_cnt, W0
	SL	W0, #2, W1
	MOV	#lo_addr(_pixelTemp), W0
	ADD	W0, W1, W0
	MOV	#lo_addr(_demoText), W12
	MOV.D	[W0], W10
	CALL	_FloatToStr
;Click_IR_Grid2_DSPIC.c,68 :: 		demoText[ 5 ] = 0 ;
	MOV	#lo_addr(_demoText+5), W1
	CLR	W0
	MOV.B	W0, [W1]
;Click_IR_Grid2_DSPIC.c,69 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(_demoText), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,70 :: 		mikrobus_logWrite("|", _LOG_TEXT);
	MOV.B	#1, W11
	MOV	#lo_addr(?lstr6_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,71 :: 		Delay_1ms();
	CALL	_Delay_1ms
;Click_IR_Grid2_DSPIC.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
	MOV	_cnt, W0
	AND	W0, #31, W0
	CP	W0, #0
	BRA Z	L__applicationTask19
	GOTO	L__applicationTask14
L__applicationTask19:
	MOV	_cnt, W0
	CP	W0, #0
	BRA GTU	L__applicationTask20
	GOTO	L__applicationTask13
L__applicationTask20:
L__applicationTask12:
;Click_IR_Grid2_DSPIC.c,74 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr7_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_DSPIC.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	MOV	#1, W1
	MOV	#lo_addr(_cnt), W0
	ADD	W1, [W0], [W0]
;Click_IR_Grid2_DSPIC.c,76 :: 		}
	GOTO	L_applicationTask2
L_applicationTask3:
;Click_IR_Grid2_DSPIC.c,77 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	MOV.B	#2, W11
	MOV	#lo_addr(?lstr8_Click_IR_Grid2_DSPIC), W10
	CALL	_mikrobus_logWrite
;Click_IR_Grid2_DSPIC.c,78 :: 		Delay_ms( 500 );
	MOV	#11, W8
	MOV	#11309, W7
L_applicationTask8:
	DEC	W7
	BRA NZ	L_applicationTask8
	DEC	W8
	BRA NZ	L_applicationTask8
;Click_IR_Grid2_DSPIC.c,79 :: 		}
L_end_applicationTask:
	POP	W12
	POP	W11
	POP	W10
	RETURN
; end of _applicationTask

_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68

;Click_IR_Grid2_DSPIC.c,81 :: 		void main()
;Click_IR_Grid2_DSPIC.c,83 :: 		systemInit();
	CALL	_systemInit
;Click_IR_Grid2_DSPIC.c,84 :: 		applicationInit();
	CALL	_applicationInit
;Click_IR_Grid2_DSPIC.c,86 :: 		while (1)
L_main10:
;Click_IR_Grid2_DSPIC.c,88 :: 		applicationTask();
	CALL	_applicationTask
;Click_IR_Grid2_DSPIC.c,89 :: 		}
	GOTO	L_main10
;Click_IR_Grid2_DSPIC.c,90 :: 		}
L_end_main:
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main
