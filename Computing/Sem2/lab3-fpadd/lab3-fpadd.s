;DEAL WITH SUBTRACTION! AND -VE ADDITION!!!!!

; Lab 3 - Floating-Point
;

	AREA	RESET, CODE, READONLY
	ENTRY

;
; Test Data
;
FP_A	EQU	0x41C40000
FP_B	EQU	0x41960000
;0x422d0000

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
;	LDR R0,=0xC0700000
;	BL fpexp
;	MOV R1,R0
;	LDR R0,=0xC0700000
;	BL fpfrac
;	BL fpencode
;	

	;;;;;;;;;;;;;used for the tutorial question
	LDR R0,=FP_A;0X40A00000
	LDR R1,=FP_B;0X40A00000
;40A
	BL fpadd
;;	
	;
	; test your subroutines here
	;

stop	B	stop


;
; fpfrac
; decodes an IEEE 754 floating point value to the signed (2's complement)
; fraction
; parameters:
;	r0 - ieee 754 float
; return:
;	r0 - fraction (signed 2's complement word)
;
fpfrac
	PUSH{R4-R7,lr}
	LDR R5,=0
	MOVS R4,R0,LSL#1
	ADC R5,R5,#0		;IF NEGATIVE
	MOV R6,R4,LSL#8		;REMOVE HIDDEN BIT
	MOV R6,R6,LSR#9
	ADD R0,R6,#0x00800000	;WITH HIDDEN BIT
	CMP R5,#0
	BEQ  positive
	LDR R7,=0X00FFFFFF			;CHANGED FOR NEGATIVE
	EOR R0,R0,R7
	ADD R0,R0,#1
positive	
				;WITH HIDDEN BIT!
	POP{R4-R7,PC}
	;
	; your decode subroutine goes here
	;



;
; fpexp
; decodes an IEEE 754 floating point value to the signed (2's complement)
; exponent
; parameters:
;	r0 - ieee 754 float
; return:
;	r0 - exponent (signed 2's complement word)
;
fpexp
	PUSH{R4,lr}
	MOV R4,R0,LSL#1		;removes s
	MOV R4,R4,LSR#24		
	SUB R0,R4,#127
	POP{R4,PC}
	;
	; your decode subroutine goes here
	;
;fpencode 
;takes in fraction and exponent  
;		R0-fraction
;		R1-exponent
;returns the IEEE754 floating point value in R0


fpencode
	PUSH{R4-R8,lr}
	LDR R7,=0;
;	LDR R8,=0
	
	MOV R4,R0		;fraction  WITH HIDDENBIT
	MOV R5,R1		;EXPONENT
	ADD R5,R5,#127
;	MOVS R5,R5,LSL#1
;	ADC R8,R8,#0;
	MOV R5,R5,LSL#23
;	MOV R8,R8,LSL#31
;	ADD R5,R5,R8
	
	MOVS R6,R4,LSL#9 ;CHECK THE HIDDENBIT REMOVED
	ADC R7,R7,#0
	MOV R6,R6,LSR#9
	CMP R7,#0
	BEQ negative
	
	B endd
negative

	LDR R7,=0X00FFFFFF			;CHANGED FOR NEGATIVE
	EOR R6,R6,R7
	ADD R6,R6,#1
	ADD R6,R6,#0x80000000
	BIC R6,R6,#0x00800000
endd
	
	ADD R0,R5,R6
	
	
	


	POP{R4-R8,PC}


	
	;
	; your encode subroutine goes here
	;

;fpadd
;takes in two IEE-754 values in R0 & R1 and adds the values
;parameters: R0-first value FP_A
;	     R1- second value FP_B
;returns the sum of values from r0,r1 
;	R0-sum

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;check negative
fpadd
	PUSH{R4-R9,lr}
	
	LDR R10,=0x80000000;
	BIC R10,R0,R10			;CHECK IF NEGATIVE A
	CMP R0,R10
	BEQ pos
	LDR R10,=1
	B signA
pos
	LDR R10,=0
signA
	
	LDR R11,=0x80000000;
	BIC R11,R1,R11			;CHECK IF NEGATIVE B
	CMP R1,R11
	BEQ posB
	LDR R11,=1
	B signB
posB
	LDR R11,=0
signB	
	
	
	
	
	
	MOV R4,R0
	BL fpexp
	MOV R6,R0	;expA
	MOV R0,R4
	BL fpfrac
	MOV R5,R0	;fracA
	
	MOV R4,R1
	MOV R0,R4
	BL fpexp
	MOV R8,R0	;expB
	MOV R0,R4
	BL fpfrac
	MOV R7,R0	;fracB
	
	;;SIGNS
	CMP R10,R11
	BNE notSame
	CMP R10,#1
	BEQ negative1
	LDR R10,=0
	B endSign	
notSame
	CMP R10,R11
	BGT aNeg
	CMP R5,R7
	BGE grt1
	LDR R10,=1
	B endSign
grt1
	LDR R10,=0
	B endSign
aNeg
	CMP R5,R7
	BGE grt2
	LDR R10,=0
	B endSign
grt2
	LDR R10,=1
	B endSign
	

negative1
	LDR R10,=1;
endSign

	
check	
	CMP R6,R8
	BGE greaterEq
	MOV R5,R5,LSR#1
	ADD R6,R6,#1
	B check
greaterEq
	CMP R6,R8
	BEQ equal
	MOV R7,R7,LSR#1
	ADD R8,R8,#1
	B check
equal
	ADD R5,R5,R7	;ADDITION WITH HIDDEN BIT. total	REUSE R5
	LDR R6,=0x01000000	;CHECKS IF NORMAL 	reuse r6		!!!HAVE TO LSL LATER
	
normal
	CMP R5,R6
	BLT maybeNormal
	MOV R5,R5,LSR#1
	ADD R8,R8,#1		;EDITS EXPONENT
	B normal
maybeNormal
	LDR R9,=0x00400000
	CMP R5,R9
	BGT endNml
	MOV R5,R5,LSL#1
	SUB R8,R8,#1
endNml
	MOV R10,R10,LSL#31
;	ADD R8,R8,R10
	MOV R0,R5
	MOV R1,R8
	BL fpencode
	ADD R0,R0,R10


	
	POP{R4-R9,PC}	
;;;;;;;;;;;

	END
