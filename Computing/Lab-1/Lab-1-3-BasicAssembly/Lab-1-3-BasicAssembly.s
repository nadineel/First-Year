;
; CSU11021 Introduction to Computing I 2019/2020
; Basic ARM Assembly Language
;

	AREA	RESET, CODE, READONLY
	ENTRY

; Write your solution for all parts (i) to (iv) below.

; Tip: Right-click on any instruction and select 'Run to cursor' to
; "fast forward" the processor to that instruction.

; (i) 3x+y

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	MOV    R3, #3		;contant 3 to R3
	MUL    R0, R1, R3	;r0=3x
	ADD    R0, R0,R2	;r0=3x+y


; (ii) 3x^2+5x

	LDR	R1, =2	; x = 2

	MOV   	R2, #3		;constant 2 to r2
	MOV    	R3 , #5		;constant 5 to r3
	MUL    	R0, R1,R2	;r0=3x
	MUL 	R0, R1,R0	;r0=3x^2
	MUL 	R1, R3,R1	;r1=5x
	ADD 	R0, R0,R1	;r0=3x^2+5x
	
	
; (iii) 2x^2+6xy+3y^2

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	MOV 	R3, #2		;constant 2 to r3
	MUL	R0,R1,R3	;r0=2x
	MUL	R0,R1,R0	;r0=2x^2
	MOV	R4, #6		;constant 6 to r4
	MUL	R4,R1,R4	;r4=6x
	MUL	R4,R2,R4	;r4=6xy
	MOV	R5, #3		;constant 3 to r5
	MUL	R5,R2,R5	;r5=3y
	MUL	R5,R2,R5	;r5=3y^2
	ADD	R0,R0,R4	;r0=2x^2 +6xy
	ADD	R0,R0,R5	;r0=2x^2 +6xy +3y^2


; (iv) x^3-4x^2+3x+8

	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

        MUL	R0,R1,R1	;R0=x^2
	LDR	R3, =4
	MUL	R3,R0,R3 	;R3= 4x^2
	MUL	R0,R1,R0	;R0=x^3
	MOV	R4, #3
	MUL	R4,R1,R4	;R4=3x
	SUB	R0,R0,R3	;R0=x^3-4x^2
	ADD	R0,R0,R4	;R0=x^3-4x^2+3x
	ADD	R0,R0,#8	;R0=x^3-4x^2+3x+8
	
STOP	B	STOP

	END
