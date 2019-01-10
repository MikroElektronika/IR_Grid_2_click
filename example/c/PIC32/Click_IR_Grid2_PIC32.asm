_systemInit:
;Click_IR_Grid2_PIC32.c,38 :: 		void systemInit()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_IR_Grid2_PIC32.c,40 :: 		Delay_80us();
SW	R25, 4(SP)
SW	R26, 8(SP)
JAL	_Delay_80us+0
NOP	
;Click_IR_Grid2_PIC32.c,41 :: 		mikrobus_i2cInit( _MIKROBUS1, &_IRGRID2_I2C_CFG[0] );
LUI	R2, hi_addr(__IRGRID2_I2C_CFG+0)
ORI	R2, R2, lo_addr(__IRGRID2_I2C_CFG+0)
MOVZ	R26, R2, R0
MOVZ	R25, R0, R0
JAL	_mikrobus_i2cInit+0
NOP	
;Click_IR_Grid2_PIC32.c,42 :: 		mikrobus_logInit( _LOG_USBUART_A, 115200 );
LUI	R26, 1
ORI	R26, R26, 49664
ORI	R25, R0, 32
JAL	_mikrobus_logInit+0
NOP	
;Click_IR_Grid2_PIC32.c,43 :: 		mikrobus_logWrite(" --- System Init --- ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr1_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr1_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,44 :: 		Delay_ms( 100 );
LUI	R24, 40
ORI	R24, R24, 45226
L_systemInit0:
ADDIU	R24, R24, -1
BNE	R24, R0, L_systemInit0
NOP	
;Click_IR_Grid2_PIC32.c,45 :: 		}
L_end_systemInit:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _systemInit
_applicationInit:
;Click_IR_Grid2_PIC32.c,47 :: 		void applicationInit()
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;Click_IR_Grid2_PIC32.c,49 :: 		irgrid2_i2cDriverInit( (T_IRGRID2_P)&_MIKROBUS1_GPIO, (T_IRGRID2_P)&_MIKROBUS1_I2C, 0x33 );
SW	R25, 4(SP)
SW	R26, 8(SP)
SW	R27, 12(SP)
ORI	R27, R0, 51
LUI	R26, hi_addr(__MIKROBUS1_I2C+0)
ORI	R26, R26, lo_addr(__MIKROBUS1_I2C+0)
LUI	R25, hi_addr(__MIKROBUS1_GPIO+0)
ORI	R25, R25, lo_addr(__MIKROBUS1_GPIO+0)
JAL	_irgrid2_i2cDriverInit+0
NOP	
;Click_IR_Grid2_PIC32.c,50 :: 		irgrid2_init();
JAL	_irgrid2_init+0
NOP	
;Click_IR_Grid2_PIC32.c,51 :: 		mikrobus_logWrite("--- Start measurement ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr2_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr2_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,52 :: 		Delay_100ms();
JAL	_Delay_100ms+0
NOP	
;Click_IR_Grid2_PIC32.c,53 :: 		}
L_end_applicationInit:
LW	R27, 12(SP)
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _applicationInit
_applicationTask:
;Click_IR_Grid2_PIC32.c,55 :: 		void applicationTask()
ADDIU	SP, SP, -12
SW	RA, 0(SP)
;Click_IR_Grid2_PIC32.c,57 :: 		irgrid2_getPixelTemperature(&Ta,&pixelTemp[0]);
SW	R25, 4(SP)
SW	R26, 8(SP)
LUI	R26, hi_addr(_pixelTemp+0)
ORI	R26, R26, lo_addr(_pixelTemp+0)
LUI	R25, hi_addr(_Ta+0)
ORI	R25, R25, lo_addr(_Ta+0)
JAL	_irgrid2_getPixelTemperature+0
NOP	
;Click_IR_Grid2_PIC32.c,59 :: 		mikrobus_logWrite("Ambient temperature:  ",_LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr3_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr3_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,60 :: 		FloatToStr(Ta,demoText);
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
LW	R25, Offset(_Ta+0)(GP)
JAL	_FloatToStr+0
NOP	
;Click_IR_Grid2_PIC32.c,61 :: 		mikrobus_logWrite(demoText,_LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,62 :: 		mikrobus_logWrite(" ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr4_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr4_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,63 :: 		mikrobus_logWrite("--- Pixel temperature matrix 32x24 ---", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr5_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr5_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
SH	R0, Offset(_cnt+0)(GP)
L_applicationTask2:
LHU	R2, Offset(_cnt+0)(GP)
SLTIU	R2, R2, 768
BNE	R2, R0, L__applicationTask18
NOP	
J	L_applicationTask3
NOP	
L__applicationTask18:
;Click_IR_Grid2_PIC32.c,67 :: 		FloatToStr(pixelTemp[cnt],demoText);
LHU	R2, Offset(_cnt+0)(GP)
SLL	R3, R2, 2
LUI	R2, hi_addr(_pixelTemp+0)
ORI	R2, R2, lo_addr(_pixelTemp+0)
ADDU	R2, R2, R3
LW	R2, 0(R2)
LUI	R26, hi_addr(_demoText+0)
ORI	R26, R26, lo_addr(_demoText+0)
MOVZ	R25, R2, R0
JAL	_FloatToStr+0
NOP	
;Click_IR_Grid2_PIC32.c,68 :: 		demoText[ 5 ] = 0 ;
SB	R0, Offset(_demoText+5)(GP)
;Click_IR_Grid2_PIC32.c,69 :: 		mikrobus_logWrite(demoText, _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(_demoText+0)
ORI	R25, R25, lo_addr(_demoText+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,70 :: 		mikrobus_logWrite("|", _LOG_TEXT);
ORI	R26, R0, 1
LUI	R25, hi_addr(?lstr6_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr6_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,71 :: 		Delay_1ms();
JAL	_Delay_1ms+0
NOP	
;Click_IR_Grid2_PIC32.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
LHU	R2, Offset(_cnt+0)(GP)
ANDI	R2, R2, 31
ANDI	R2, R2, 65535
BEQ	R2, R0, L__applicationTask19
NOP	
J	L__applicationTask14
NOP	
L__applicationTask19:
LHU	R2, Offset(_cnt+0)(GP)
SLTIU	R2, R2, 1
BEQ	R2, R0, L__applicationTask20
NOP	
J	L__applicationTask13
NOP	
L__applicationTask20:
L__applicationTask12:
;Click_IR_Grid2_PIC32.c,74 :: 		mikrobus_logWrite(" ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr7_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr7_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,72 :: 		if(((cnt % 32) == 0) && (cnt > 0))
L__applicationTask14:
L__applicationTask13:
;Click_IR_Grid2_PIC32.c,65 :: 		for ( cnt = 0 ; cnt < 768 ; cnt++)
LHU	R2, Offset(_cnt+0)(GP)
ADDIU	R2, R2, 1
SH	R2, Offset(_cnt+0)(GP)
;Click_IR_Grid2_PIC32.c,76 :: 		}
J	L_applicationTask2
NOP	
L_applicationTask3:
;Click_IR_Grid2_PIC32.c,77 :: 		mikrobus_logWrite(" ", _LOG_LINE);
ORI	R26, R0, 2
LUI	R25, hi_addr(?lstr8_Click_IR_Grid2_PIC32+0)
ORI	R25, R25, lo_addr(?lstr8_Click_IR_Grid2_PIC32+0)
JAL	_mikrobus_logWrite+0
NOP	
;Click_IR_Grid2_PIC32.c,78 :: 		Delay_ms( 500 );
LUI	R24, 203
ORI	R24, R24, 29524
L_applicationTask8:
ADDIU	R24, R24, -1
BNE	R24, R0, L_applicationTask8
NOP	
NOP	
NOP	
;Click_IR_Grid2_PIC32.c,79 :: 		}
L_end_applicationTask:
LW	R26, 8(SP)
LW	R25, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 12
JR	RA
NOP	
; end of _applicationTask
_main:
;Click_IR_Grid2_PIC32.c,81 :: 		void main()
;Click_IR_Grid2_PIC32.c,83 :: 		systemInit();
JAL	_systemInit+0
NOP	
;Click_IR_Grid2_PIC32.c,84 :: 		applicationInit();
JAL	_applicationInit+0
NOP	
;Click_IR_Grid2_PIC32.c,86 :: 		while (1)
L_main10:
;Click_IR_Grid2_PIC32.c,88 :: 		applicationTask();
JAL	_applicationTask+0
NOP	
;Click_IR_Grid2_PIC32.c,89 :: 		}
J	L_main10
NOP	
;Click_IR_Grid2_PIC32.c,90 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
