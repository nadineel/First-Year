;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; start address for pseudo-random sequence
	LDR	R1, =64		; number of pseudo-random values to generate
	
	LDR 	R2,=0xFFFFFFFF	; used for the mask later
	LDR 	R3,=0X10304050	;mask1
	LDR 	R4,=0x12345	;mask2

while	CMP R1,#0
	BEQ endwhilee
	
	AND R2,R2,R3
	MOV R2,R2,LSL #8
	ADD R2,R2,R4
	STRB R2,[R0]
	ADD R0,R0,#1
	SUB R1,R1,#1
	ADD R4,R4,#2
	
	ORR R2,R2,R3
	MOV R2,R2,LSR #2
	STRB R2,[R0]
	ADD R0,R0,#1
	SUB R1,R1,#1
	
	MVN R2,R2
	MOV R2,R2, ASR #7	;copies the sign of msb and shifts right 1100 >>1110
	STRB R2,[R0]
	ADD R0,R0,#1
	SUB R1,R1,#1
	
	ADD R2,R2,R3
	MOV R2,R2,ROR #3
	STRB R2,[R0]
	ADD R0,R0,#1
	SUB R1,R1,#1
	
	ADD R3,R3, #70
	
	B while
endwhilee

STOP	B	STOP

	END
