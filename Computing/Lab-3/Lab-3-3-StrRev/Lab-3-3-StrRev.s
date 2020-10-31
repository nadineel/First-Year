;
; CSU11021 Introduction to Computing I 2019/2020
; String Reverse
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =tststr	; address of existing string
	LDR	R0, =0x40000000	; address for new string

	MOV R4,R1
	LDRB R2,[R1]
while1  CMP R2,#0
	BEQ endwh1
	ADD R1,R1,#1
	ADD R0,R0,#1
	LDRB R2,[R1]
	B while1
endwh1
	MOV R2,#0
	STRB R2,[R0]
	SUB R0,R0,#1
	MOV R1,R4
	LDRB R2,[R1]
while2	CMP R2,#0
	BEQ endd
	STRB R2,[R0]
	SUB R0,R0,#1
	ADD R1,R1,#1
	LDRB R2,[R1]
	B while2
endd


	

	

STOP	B	STOP

tststr	DCB	"This is a test!",0

	END
