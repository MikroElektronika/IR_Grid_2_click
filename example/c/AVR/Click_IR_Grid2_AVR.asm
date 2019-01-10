
_systemInit:

;Click_IR_Grid2_AVR.c,38 :: 		void systemInit()
;Click_IR_Grid2_AVR.c,40 :: 		Delay_80us();
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	CALL       _Delay_80us+0
;Click_IR_Grid2_AVR.c,41 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
	LDI        R16, #lo_addr(__IRGRID2_I2C_CFG+0)
	LDI        R17, hi_addr(__IRGRID2_I2C_CFG+0)
	MOV        R3, R16
	MOV        R4, R17
	CLR        R2
	CALL       _mikrobus_i2cInit+0
;Click_IR_Grid2_AVR.c,42 :: 		mikrobus_logInit( _LOG_USBUART, 115200 );
	LDI        R27, 0
	MOV        R3, R27
	LDI        R27, 194
	MOV        R4, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 0
	MOV        R6, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _mikrobus_logInit+0
;Click_IR_Grid2_AVR.c,43 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,44 :: 		Delay_ms( 100 );
	LDI        R18, 5
	LDI        R17, 15
	LDI        R16, 242
L_systemInit0:
	DEC        R16
	BRNE       L_systemInit0
	DEC        R17
	BRNE       L_systemInit0
	DEC        R18
	BRNE       L_systemInit0
;Click_IR_Grid2_AVR.c,45 :: 		}
L_end_systemInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _systemInit

_applicationInit:

;Click_IR_Grid2_AVR.c,47 :: 		void applicationInit()
;Click_IR_Grid2_AVR.c,49 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	LDI        R27, 51
	MOV        R6, R27
	LDI        R27, #lo_addr(__MIKROBUS1_I2C+0)
	MOV        R4, R27
	LDI        R27, hi_addr(__MIKROBUS1_I2C+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(__MIKROBUS1_GPIO+0)
	MOV        R2, R27
	LDI        R27, hi_addr(__MIKROBUS1_GPIO+0)
	MOV        R3, R27
	CALL       _irgrid2_i2cDriverInit+0
;Click_IR_Grid2_AVR.c,50 :: 		irgrid2_init();
	CALL       _irgrid2_init+0
;Click_IR_Grid2_AVR.c,51 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,52 :: 		Delay_100ms();
	CALL       _Delay_100ms+0
;Click_IR_Grid2_AVR.c,53 :: 		}
L_end_applicationInit:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationInit

_applicationTask:

;Click_IR_Grid2_AVR.c,55 :: 		void applicationTask()
;Click_IR_Grid2_AVR.c,57 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	LDI        R27, #lo_addr(_pixelTemp+0)
	MOV        R4, R27
	LDI        R27, hi_addr(_pixelTemp+0)
	MOV        R5, R27
	LDI        R27, #lo_addr(_Ta+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_Ta+0)
	MOV        R3, R27
	CALL       _irgrid2_getPixelTemperature+0
;Click_IR_Grid2_AVR.c,59 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr3_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr3_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,60 :: 		FloatToStr(Ta,demoText);
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R7, R27
	LDS        R2, _Ta+0
	LDS        R3, _Ta+1
	LDS        R4, _Ta+2
	LDS        R5, _Ta+3
	CALL       _FloatToStr+0
;Click_IR_Grid2_AVR.c,61 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,62 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr4_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr4_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,64 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr5_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr5_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,66 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	LDI        R27, 0
	STS        _cnt+0, R27
	STS        _cnt+1, R27
L_applicationTask2:
	LDS        R16, _cnt+0
	LDS        R17, _cnt+1
	CPI        R17, 3
	BRNE       L__applicationTask18
	CPI        R16, 0
L__applicationTask18:
	BRLO       L__applicationTask19
	JMP        L_applicationTask3
L__applicationTask19:
;Click_IR_Grid2_AVR.c,68 :: 		FloatToStr(pixelTemp[cnt],demoText);
	LDS        R16, _cnt+0
	LDS        R17, _cnt+1
	MOVW       R18, R16
	LSL        R18
	ROL        R19
	LSL        R18
	ROL        R19
	LDI        R16, #lo_addr(_pixelTemp+0)
	LDI        R17, hi_addr(_pixelTemp+0)
	MOVW       R30, R18
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z+
	LD         R17, Z+
	LD         R18, Z+
	LD         R19, Z+
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R6, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R7, R27
	MOVW       R2, R16
	MOVW       R4, R18
	CALL       _FloatToStr+0
;Click_IR_Grid2_AVR.c,69 :: 		demoText[ 5 ] = 0 ;
	LDI        R27, 0
	STS        _demoText+5, R27
;Click_IR_Grid2_AVR.c,70 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(_demoText+0)
	MOV        R2, R27
	LDI        R27, hi_addr(_demoText+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,71 :: 		mikrobus_logWrite("|", _LOG_TEXT);
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr6_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr6_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,72 :: 		Delay_1ms();
	CALL       _Delay_1ms+0
;Click_IR_Grid2_AVR.c,73 :: 		if(((cnt % 32) == 0) && (cnt > 0))
	LDS        R16, _cnt+0
	LDS        R17, _cnt+1
	ANDI       R16, 31
	ANDI       R17, 0
	CPI        R17, 0
	BRNE       L__applicationTask20
	CPI        R16, 0
L__applicationTask20:
	BREQ       L__applicationTask21
	JMP        L__applicationTask14
L__applicationTask21:
	LDS        R18, _cnt+0
	LDS        R19, _cnt+1
	LDI        R16, 0
	LDI        R17, 0
	CP         R16, R18
	CPC        R17, R19
	BRLO       L__applicationTask22
	JMP        L__applicationTask13
L__applicationTask22:
L__applicationTask12:
;Click_IR_Grid2_AVR.c,75 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr7_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr7_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,73 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_AVR.c,66 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
	LDS        R16, _cnt+0
	LDS        R17, _cnt+1
	SUBI       R16, 255
	SBCI       R17, 255
	STS        _cnt+0, R16
	STS        _cnt+1, R17
;Click_IR_Grid2_AVR.c,77 :: 		}
	JMP        L_applicationTask2
L_applicationTask3:
;Click_IR_Grid2_AVR.c,78 :: 		mikrobus_logWrite(" ", _LOG_LINE);
	LDI        R27, 2
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr8_Click_IR_Grid2_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr8_Click_IR_Grid2_AVR+0)
	MOV        R3, R27
	CALL       _mikrobus_logWrite+0
;Click_IR_Grid2_AVR.c,79 :: 		Delay_ms( 500 );
	LDI        R18, 21
	LDI        R17, 75
	LDI        R16, 191
L_applicationTask8:
	DEC        R16
	BRNE       L_applicationTask8
	DEC        R17
	BRNE       L_applicationTask8
	DEC        R18
	BRNE       L_applicationTask8
	NOP
;Click_IR_Grid2_AVR.c,80 :: 		}
L_end_applicationTask:
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	RET
; end of _applicationTask

_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;Click_IR_Grid2_AVR.c,82 :: 		void main()
;Click_IR_Grid2_AVR.c,84 :: 		systemInit();
	CALL       _systemInit+0
;Click_IR_Grid2_AVR.c,85 :: 		applicationInit();
	CALL       _applicationInit+0
;Click_IR_Grid2_AVR.c,87 :: 		while (1)
L_main10:
;Click_IR_Grid2_AVR.c,89 :: 		applicationTask();
	CALL       _applicationTask+0
;Click_IR_Grid2_AVR.c,90 :: 		}
	JMP        L_main10
;Click_IR_Grid2_AVR.c,91 :: 		}
L_end_main:
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main
