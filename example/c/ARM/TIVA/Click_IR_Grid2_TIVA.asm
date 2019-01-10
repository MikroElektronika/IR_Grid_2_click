_systemInit:
;Click_IR_Grid2_TIVA.c,35 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_TIVA.c,37 :: 		Delay_80us();
BL	_Delay_80us+0
;Click_IR_Grid2_TIVA.c,38 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRGRID2_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRGRID2_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_IR_Grid2_TIVA.c,39 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
MOV	R1, #115200
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_IR_Grid2_TIVA.c,40 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr1_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,41 :: 		Delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_IR_Grid2_TIVA.c,42 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_IR_Grid2_TIVA.c,44 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_TIVA.c,46 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
MOVS	R2, #51
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_irgrid2_i2cDriverInit+0
;Click_IR_Grid2_TIVA.c,47 :: 		irgrid2_init();
BL	_irgrid2_init+0
;Click_IR_Grid2_TIVA.c,48 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr2_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,49 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_IR_Grid2_TIVA.c,50 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_IR_Grid2_TIVA.c,52 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_TIVA.c,54 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
MOVW	R1, #lo_addr(_pixelTemp+0)
MOVT	R1, #hi_addr(_pixelTemp+0)
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
BL	_irgrid2_getPixelTemperature+0
;Click_IR_Grid2_TIVA.c,55 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
MOVW	R0, #lo_addr(?lstr3_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr3_Click_IR_Grid2_TIVA+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,56 :: 		FloatToStr(Ta,demoText);
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IR_Grid2_TIVA.c,57 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,58 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr4_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr4_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,60 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr5_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr5_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,62 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
MOVS	R1, #0
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
STRH	R1, [R0, #0]
L_applicationTask2:
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #768
IT	CS
BCS	L_applicationTask3
;Click_IR_Grid2_TIVA.c,64 :: 		FloatToStr(pixelTemp[cnt],demoText);
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_pixelTemp+0)
MOVT	R0, #hi_addr(_pixelTemp+0)
ADDS	R0, R0, R1
VLDR	#1, S0, [R0, #0]
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IR_Grid2_TIVA.c,65 :: 		demoText[ 5 ] = 0 ;
MOVS	R1, #0
MOVW	R0, #lo_addr(_demoText+5)
MOVT	R0, #hi_addr(_demoText+5)
STRB	R1, [R0, #0]
;Click_IR_Grid2_TIVA.c,66 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
MOVS	R1, #1
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,67 :: 		mikrobus_logWrite("|", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr6_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr6_Click_IR_Grid2_TIVA+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,68 :: 		Delay_1ms();
BL	_Delay_1ms+0
;Click_IR_Grid2_TIVA.c,69 :: 		if(((cnt % 32) == 0) && (cnt > 0))
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRH	R0, [R0, #0]
AND	R0, R0, #31
UXTH	R0, R0
CMP	R0, #0
IT	NE
BNE	L__applicationTask14
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRH	R0, [R0, #0]
CMP	R0, #0
IT	LS
BLS	L__applicationTask13
L__applicationTask12:
;Click_IR_Grid2_TIVA.c,71 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr7_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr7_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,69 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_TIVA.c,62 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
MOVW	R1, #lo_addr(_cnt+0)
MOVT	R1, #hi_addr(_cnt+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Click_IR_Grid2_TIVA.c,73 :: 		}
IT	AL
BAL	L_applicationTask2
L_applicationTask3:
;Click_IR_Grid2_TIVA.c,74 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr8_Click_IR_Grid2_TIVA+0)
MOVT	R0, #hi_addr(?lstr8_Click_IR_Grid2_TIVA+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_TIVA.c,75 :: 		Delay_ms( 500 );
MOVW	R7, #11518
MOVT	R7, #305
NOP
NOP
L_applicationTask8:
SUBS	R7, R7, #1
BNE	L_applicationTask8
NOP
NOP
NOP
;Click_IR_Grid2_TIVA.c,76 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_IR_Grid2_TIVA.c,78 :: 		void main()
;Click_IR_Grid2_TIVA.c,80 :: 		systemInit();
BL	_systemInit+0
;Click_IR_Grid2_TIVA.c,81 :: 		applicationInit();
BL	_applicationInit+0
;Click_IR_Grid2_TIVA.c,83 :: 		while (1)
L_main10:
;Click_IR_Grid2_TIVA.c,85 :: 		applicationTask();
BL	_applicationTask+0
;Click_IR_Grid2_TIVA.c,86 :: 		}
IT	AL
BAL	L_main10
;Click_IR_Grid2_TIVA.c,87 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
