_systemInit:
;Click_IR_Grid2_STM.c,39 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_STM.c,41 :: 		Delay_80us();
BL	_Delay_80us+0
;Click_IR_Grid2_STM.c,42 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
MOVW	R0, #lo_addr(__IRGRID2_I2C_CFG+0)
MOVT	R0, #hi_addr(__IRGRID2_I2C_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_i2cInit+0
;Click_IR_Grid2_STM.c,43 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
MOV	R1, #115200
MOVS	R0, #32
BL	_mikrobus_logInit+0
;Click_IR_Grid2_STM.c,44 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr1_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,45 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_IR_Grid2_STM.c,46 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_IR_Grid2_STM.c,48 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_STM.c,50 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
MOVS	R2, #51
MOVW	R1, #lo_addr(__MIKROBUS1_I2C+0)
MOVT	R1, #hi_addr(__MIKROBUS1_I2C+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_irgrid2_i2cDriverInit+0
;Click_IR_Grid2_STM.c,51 :: 		irgrid2_init();
BL	_irgrid2_init+0
;Click_IR_Grid2_STM.c,52 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr2_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,53 :: 		Delay_100ms();
BL	_Delay_100ms+0
;Click_IR_Grid2_STM.c,54 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_IR_Grid2_STM.c,56 :: 		void applicationTask()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_IR_Grid2_STM.c,58 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
MOVW	R1, #lo_addr(_pixelTemp+0)
MOVT	R1, #hi_addr(_pixelTemp+0)
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
BL	_irgrid2_getPixelTemperature+0
;Click_IR_Grid2_STM.c,60 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
MOVW	R0, #lo_addr(?lstr3_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr3_Click_IR_Grid2_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,61 :: 		FloatToStr(Ta,demoText);
MOVW	R0, #lo_addr(_Ta+0)
MOVT	R0, #hi_addr(_Ta+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IR_Grid2_STM.c,62 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
MOVS	R1, #2
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,63 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr4_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr4_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,64 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr5_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr5_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,66 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
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
;Click_IR_Grid2_STM.c,68 :: 		FloatToStr(pixelTemp[cnt],demoText);
MOVW	R0, #lo_addr(_cnt+0)
MOVT	R0, #hi_addr(_cnt+0)
LDRH	R0, [R0, #0]
LSLS	R1, R0, #2
MOVW	R0, #lo_addr(_pixelTemp+0)
MOVT	R0, #hi_addr(_pixelTemp+0)
ADDS	R0, R0, R1
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_demoText+0)
MOVT	R1, #hi_addr(_demoText+0)
BL	_FloatToStr+0
;Click_IR_Grid2_STM.c,69 :: 		demoText[ 5 ] = 0 ;
MOVS	R1, #0
MOVW	R0, #lo_addr(_demoText+5)
MOVT	R0, #hi_addr(_demoText+5)
STRB	R1, [R0, #0]
;Click_IR_Grid2_STM.c,70 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
MOVS	R1, #1
MOVW	R0, #lo_addr(_demoText+0)
MOVT	R0, #hi_addr(_demoText+0)
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,71 :: 		mikrobus_logWrite("|", _LOG_TEXT);
MOVW	R0, #lo_addr(?lstr6_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr6_Click_IR_Grid2_STM+0)
MOVS	R1, #1
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,72 :: 		Delay_1ms();
BL	_Delay_1ms+0
;Click_IR_Grid2_STM.c,73 :: 		if(((cnt % 32) == 0) && (cnt > 0))
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
;Click_IR_Grid2_STM.c,75 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr7_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr7_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,73 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_STM.c,66 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
MOVW	R1, #lo_addr(_cnt+0)
MOVT	R1, #hi_addr(_cnt+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;Click_IR_Grid2_STM.c,77 :: 		}
IT	AL
BAL	L_applicationTask2
L_applicationTask3:
;Click_IR_Grid2_STM.c,78 :: 		mikrobus_logWrite(" ", _LOG_LINE);
MOVW	R0, #lo_addr(?lstr8_Click_IR_Grid2_STM+0)
MOVT	R0, #hi_addr(?lstr8_Click_IR_Grid2_STM+0)
MOVS	R1, #2
BL	_mikrobus_logWrite+0
;Click_IR_Grid2_STM.c,79 :: 		Delay_ms( 500 );
MOVW	R7, #36223
MOVT	R7, #91
NOP
NOP
L_applicationTask8:
SUBS	R7, R7, #1
BNE	L_applicationTask8
NOP
NOP
NOP
;Click_IR_Grid2_STM.c,80 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationTask
_main:
;Click_IR_Grid2_STM.c,82 :: 		void main()
;Click_IR_Grid2_STM.c,84 :: 		systemInit();
BL	_systemInit+0
;Click_IR_Grid2_STM.c,85 :: 		applicationInit();
BL	_applicationInit+0
;Click_IR_Grid2_STM.c,87 :: 		while (1)
L_main10:
;Click_IR_Grid2_STM.c,89 :: 		applicationTask();
BL	_applicationTask+0
;Click_IR_Grid2_STM.c,90 :: 		}
IT	AL
BAL	L_main10
;Click_IR_Grid2_STM.c,91 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
