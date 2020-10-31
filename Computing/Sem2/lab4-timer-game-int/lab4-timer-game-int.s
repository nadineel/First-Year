;
; CS1022 Introduction to Computing II 2018/2019
; Lab 4 - timer-game-int
;

T0IR		EQU	0xE0004000
T0TCR		EQU	0xE0004004
T0TC		EQU	0xE0004008
T0MR0		EQU	0xE0004018
T0MCR		EQU	0xE0004014

PINSEL4		EQU	0xE002C010

FIO2DIR1	EQU	0x3FFFC041
FIO2PIN1	EQU	0x3FFFC055

EXTINT		EQU	0xE01FC140
EXTMODE		EQU	0xE01FC148
EXTPOLAR	EQU	0xE01FC14C

VICIntSelect	EQU	0xFFFFF00C
VICIntEnable	EQU	0xFFFFF010
VICVectAddr0	EQU	0xFFFFF100
VICVectPri0	EQU	0xFFFFF200
VICVectAddr	EQU	0xFFFFFF00

VICVectT0	EQU	4
VICVectEINT0	EQU	14

Irq_Stack_Size	EQU	0x80

Mode_USR        EQU     0x10
Mode_IRQ        EQU     0x12
I_Bit           EQU     0x80            ; when I bit is set, IRQ is disabled
F_Bit           EQU     0x40            ; when F bit is set, FIQ is disabled



	AREA	RESET, CODE, READONLY
	ENTRY

	; Exception Vectors

	B	Reset_Handler	; 0x00000000
	B	Undef_Handler	; 0x00000004
	B	SWI_Handler	; 0x00000008
	B	PAbt_Handler	; 0x0000000C
	B	DAbt_Handler	; 0x00000010
	NOP			; 0x00000014
	B	IRQ_Handler	; 0x00000018
	B	FIQ_Handler	; 0x0000001C

;
; Reset Exception Handler
;
Reset_Handler

	;
	; Initialize Stack Pointers (SP) for each mode we are using
	;

	; Stack Top
	LDR	R0, =0x40010000

	; Enter undef mode and set initial SP
	MSR     CPSR_c, #Mode_IRQ:OR:I_Bit:OR:F_Bit
	MOV     SP, R0
	SUB     R0, R0, #Irq_Stack_Size

	; Enter user mode and set initial SP
	MSR     CPSR_c, #Mode_USR
	MOV	SP, R0

	;
	; Your program goes here
	;
	LDR R1,=1	;win=TRUE

	LDR R4,=TimerStart
	LDR R5,[R4]
	LDR R5,=0
	STR R5,[R4]	;timerStart=0
	
	LDR R4,=MIN_TIME	;STORES THE 5SEC HERE
	LDR R5,[R4]
	LDR R5,=5000000
	STR R5,[R4]
	
	LDR R4,=MAX_TIME	;STORES 8SEC HERE
	LDR R5,[R4]
	LDR R5,=8000000
	STR R5,[R4]
	
	
	;
	; Configure P2.10 for EINT0
	;

	; Enable P2.10 for EINTO
	LDR	R4, =PINSEL4
	LDR	R5, [R4]		; read current value
	BIC	R5, #(0x03 << 20)	; clear bits 21:20
	ORR	R5, #(0x01 << 20)	; set bits 21:20 to 01
	STR	R5, [R4]		; write new value

	; Set edge-sensitive mode for EINT0
	LDR	R4, =EXTMODE
	LDR	R5, [R4]		; read
	ORR	R5, #1			; modify
	STRB	R5, [R4]		; write

	; Set rising-edge mode for EINT0
	LDR	R4, =EXTPOLAR
	LDR	R5, [R4]		; read
	BIC	R5, #1			; modify
	STRB	R5, [R4]		; write

	; Reset EINT0
	LDR	R4, =EXTINT
	MOV	R5, #1
	STRB	R5, [R4]

	;
	; Configure VIC for EINT0 interrupts
	;

	; Useful VIC vector numbers and masks for following code
	LDR	R4, =VICVectEINT0		; vector 4
	LDR	R5, =(1 << VICVectEINT0) 	; bit mask for vector 14

	; VICIntSelect - Clear bit 4 of VICIntSelect register to cause
	; channel 14 (EINT0) to raise IRQs (not FIQs)
	LDR	R6, =VICIntSelect	; addr = VICVectSelect;
	LDR	R7, [R6]		; tmp = Memory.Word(addr);
	BIC	R7, R7, R5		; Clear bit for Vector 14
	STR	R7, [R6]		; Memory.Word(addr) = tmp;

	; Set Priority for VIC channel 14 (EINT0) to lowest (15) by setting
	; VICVectPri4 to 15. Note: VICVectPri4 is the element at index 14 of an
	; array of 4-byte values that starts at VICVectPri0.
	; i.e. VICVectPri4=VICVectPri0+(4*4)
	LDR	R6, =VICVectPri0	; addr = VICVectPri0;
	MOV	R7, #15			; pri = 15;
	STR	R7, [R6, R4, LSL #2]	; Memory.Word(addr + vector * 4) = pri;

	; Set Handler routine address for VIC channel 4 (TIMER0) to address of
	; our handler routine (TimerHandler). Note: VICVectAddr4 is the element
	; at index 4 of an array of 4-byte values that starts at VICVectAddr0.
	; i.e. VICVectAddr4=VICVectAddr0+(4*4)
	LDR	R6, =VICVectAddr0	; addr = VICVectAddr0;
	LDR	R7, =Button_Handler	; handler = address of TimerHandler;
	STR	R7, [R6, R4, LSL #2]	; Memory.Word(addr + vector * 4) = handler

	; Enable VIC channel 14 (EINT0) by writing a 1 to bit 4 of VICIntEnable
	LDR	R6, =VICIntEnable	; addr = VICIntEnable;
	STR	R5, [R6]		; enable interrupts for vector 14

	

stop	B	stop


;
; TOP LEVEL EXCEPTION HANDLERS
;

;
; Software Interrupt Exception Handler
;
Undef_Handler
	B	Undef_Handler

;
; Software Interrupt Exception Handler
;
SWI_Handler
	B	SWI_Handler

;
; Prefetch Abort Exception Handler
;
PAbt_Handler
	B	PAbt_Handler

;
; Data Abort Exception Handler
;
DAbt_Handler
	B	DAbt_Handler

;
; Interrupt ReQuest (IRQ) Exception Handler (top level - all devices)
;
IRQ_Handler
	SUB	lr, lr, #4	; for IRQs, LR is always 4 more than the
				; real return address
	STMFD	sp!, {r0-r3,lr}	; save r0-r3 and lr

	LDR	r0, =VICVectAddr; address of VIC Vector Address memory-
				; mapped register

	MOV	lr, pc		; can’t use BL here because we are branching
	LDR	pc, [r0]	; to a different subroutine dependant on device
				; raising the IRQ - this is a manual BL !!

	LDMFD	sp!, {r0-r3, pc}^ ; restore r0-r3, lr and CPSR

;
; Fast Interrupt reQuest Exception Handler
;
FIQ_Handler
	B	FIQ_Handler
;
; EINT0 IRQ Handler (device-specific handler called by top-level IRQ_Handler)
;
Button_Handler

	STMFD	sp!, {r4-r5, lr}

	; Reset EINT0 interrupt by writing 1 to EXTINT register
	LDR	R4, =EXTINT
	MOV	R5, #1
	STRB	R5, [R4]
;///////////////////////////////////////
	LDR R4,=T0TC
	LDR R5,[R4]
	LDR R4,=ElapsedTime
	STR R5,[R4]
	
;////////////////////////
	;
	; Reset TIMER0 using Timer Control Register
	;   Set bit 0 of TCR to 0 to stop TIMER
	;   Set bit 1 of TCR to 1 to reset TIMER
	LDR	R5, =T0TCR
	LDR	R6, =0x2
	STRB	R6, [R5]

	; There appears to be a bug in the uVision simulation
	;   of the TIMER peripherals. Setting the RESET bit of
	;   the TCR (above) should reset the TImer Counter (TC)
	;   but does not appear to do so. We can force it back
	;   to zero here.
	LDR	R5, =T0TC
	LDR	R6, =0x0
	STR	R6, [R5]
	
	LDR R4,=TimerStart		;checks if timer started yet if it is, stop if button pressed
	LDR R5,[R4]
	CMP R5,#0
	BNE timerON
	
	; Start TIMER0 using the Timer Control Register
	;   Set bit 0 of TCR to enable the timer
	LDR	R4, =T0TCR
	LDR	R5, =0x01
	STRB	R5, [R4]
	
	LDR R4,=TimerStart		
	LDR R5,[R4]
	LDR R5,=1
	STR R5,[R4]	;timerStart:true
		
	B enif
	
timerON

	LDR R4,=TimerStart		
	LDR R5,[R4]
	LDR R5,=0
	STR R5,[R4]	;timerStart:FALSE

	LDR R4,=ElapsedTime
	LDR R5,[R4]
	
	LDR R6,=MIN_TIME
	LDR R7,[R6]
	LDR R6,=MAX_TIME
	LDR R8,[R6]
	
	CMP R5,R7
	BLT lose
	CMP R5,R8
	BGT lose
	B endiff

lose
	LDR R1,=0	;WIN=FALSE
endiff	
	CMP R1,#0
	BNE win
	
;	LDR R4,=TimerStart		;STOPS FROM RESTARTING
;	LDR R5,[R4]
;	LDR R5,=0
;	STR R5,[R4]
;		; Enable P2.10 for GPIO
	LDR	R5, =PINSEL4	; load address of PINSEL4
	LDR	R6, [R5]	; read current PINSEL4 value
	BIC	R6, #(0x3 << 20); modify bits 20 and 21 to 00
	STR	R6, [R5]	; write new PINSEL4 value

	;Reconfigure P2.10 as a GPIO output ( see blinky example )
	; Set P2.10 for output
	LDR	R5, =FIO2DIR1	; load address of FIO2DIR1
	NOP
	LDRB	R6, [R5]	; read current FIO2DIR1 value
	ORR	R6, #(0x1 << 2)	; modify bit 2 to 1 for output, leaving other bits unmodified
	STRB	R6, [R5]	; write new FIO2DIR1

	; read current P2.10 output value
	;   0 or 1 in bit 2 of FIO2PIN1
	LDR	R4, =0x04		;   setup bit mask for P2.10 bit in FIO2PIN1
	LDR	R5, =FIO2PIN1		;
	LDRB	R6, [R5]		;   read FIO2PIN1

	; modify P2.10 output (leaving other pin outputs controlled by
	;   FIO2PIN1 with their original value)
	TST	R6, R4			;   if (LED off)  TST Ry, Rz
	BNE	elsOff			;   {
	ORR	R6, R6, R4		;     set bit 2 (turn LED on)
	B	endIf			;   }
elsOff					;   else {
	BIC	R6, R6, R4		;     clear bit 2 (turn LED on)
endIf					;   }

	; write new FIO2PIN1 value
	STRB	R6, [R5]
	
	B stop

win	LDR R4,=MIN_TIME	;STORES THE 5SEC HERE
	LDR R5,[R4]
	LDR R6,=3000000
	ADD R5,R5,R6
	STR R5,[R4]
	
	LDR R4,=MAX_TIME	;STORES THE 5SEC HERE
	LDR R5,[R4]
	LDR R6,=3000000
	ADD R5,R5,R6
	STR R5,[R4]
	

enif
endd

;/////////////////////////////////////////
;if(button pressed&timer off){
;	start timer
;	timer=on;		
;}
;else if (button pressed and timer on){
;	stop timer
;	timer=off		
;}
;	if (elapsed time>5 && elapsed time<8){
;		min_time=5+3
;		max_time=8+3
;		win = true (loop again)
;	}
;	else{
;		stop and turn led on signifies you lose
;	}
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

	;
	; Clear source of interrupt
	;
	LDR	R4, =VICVectAddr	; addr = VICVectAddr
	MOV	R5, #0			; tmp = 0;
	STR	R5, [R4]		; Memory.Word(addr) = tmp;

	LDMFD	sp!, {r4-r5, pc}


	AREA	TestData, DATA, READWRITE


MIN_TIME	SPACE	4	;SPACE FOR THE ADDRESS
MAX_TIME	SPACE	4	
TimerStart	SPACE	4
ElapsedTime	SPACE 	4

	END


	END
