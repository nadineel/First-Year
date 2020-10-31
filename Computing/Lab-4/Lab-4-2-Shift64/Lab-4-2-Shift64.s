;
; CSU11021 Introduction to Computing I 2019/2020
; 64-bit Shift
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =0xABABABAB		; most significaint 32 bits (63 ... 32)
	LDR	R0, =0x12121212	; least significant 32 bits (31 ... 0)
	LDR	R2, =4			; shift count (if negative shift left)
	
	LDR R4,=0; 
	;MOV R3,R1;STORE ADDRESS
	LDR R5,=0
	
iffpos	CMP R2,#0
	BGE gotopositive
	
whileneg 	CMP R2,#0	;if its neg.
	BGE endwhileneg

	MOV R0,R0,LSL #1	;SHIFT LEFT FIRST 32BITS	
	MOV R1,R1,LSL #1; SHIFT LETLAST 32 BITS

	BCC skip				;IF CARRY IS 0 SKIP
	ORR R1,R1,#1;	STORE THE NUMBERR OF SHIFTS
skip
	
	ADD R2,R2,#1	;SHIFTCOUNT+1
	
	B whileneg
	
endwhileneg
	B endd
	

gotopositive

whilepos CMP R2,#0
	BEQ endwhilepos
	
	MOV R0,R0,LSR #1	;SHIFT LEFT FIRST 32BITS	
	MOV R1,R1,LSR #1; SHIFT LETLAST 32 BITS

	BCC skip1				;IF CARRY IS 0 SKIP
	ORR R1,R1,#8000;	STORE THE NUMBERR OF SHIFTS
skip1
	
	SUB R2,R2,#1	;SHIFTCOUNT+1
		
	B whilepos
	
endwhilepos
endd
	
	RSB R5,R4,#32; FOR SHIFTING
	MOV R4,R4, LSL R5; want to shift r4 or 8 in the example by 30 bits
	ADD R0,R0,R4	; to go to the msbits of r5 to be added to the vacant spot in r0.
	
	;shift to the right the number in the counter

STOP	B	STOP

	END
