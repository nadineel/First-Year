;
; CSU11021 Introduction to Computing I 2019/2020
; String Copy
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string
	
	

	
;	LDRB R2,[R0]
;while	CMP R2,#0
;	BEQ endwhile
;if1	CMP R2,#'A'
;	BLT endiff
;	CMP R2,#'Z'
;	BGT endiff
;	ADD R2,R2,#0X20
;endiff
;	STRB R2,[R1]
;	ADD R1,R1,#1
;	ADD R0,R0,#1
;	LDRB R2,[R0]
;	B while
;endwhile
	
	
	
		

	LDRB R3,[R0]
while 	CMP R3,#0
	BEQ en
	STRB R3,[R1]
	ADD R0,R0,#1
	ADD R1,R1,#1
	LDRB R3,[R0]
	B while
en

	LDR R4,=0X40000000
	LDRB R5,[R4]
ifbegin CMP R5, #'a'
	BLT endbgn
	CMP R5, #'z'
	BGT endbgn
	SUB R5,R5,#0X20
endbgn
	STRB R5,[R4]
	ADD R4,R4,#1
	LDRB R5,[R4]
	
while1	CMP R5,#0
	BEQ endd
	
	CMP R5,#' '
	BNE lowercase
	ADD R4,R4,#1
	LDRB R5,[R4]
if2	CMP R5, #'a'
	BLT endbgn2
	CMP R5, #'z'
	BGT endbgn2
	SUB R5,R5,#0X20
endbgn2
	STRB R5,[R4]
	ADD R4,R4,#1
	LDRB R5,[R4]
	
	B while1
lowercase
if3	CMP R5, #'A'
	BLT endbgn3
	CMP R5, #'Z'
	BGT endbgn3
	ADD R5,R5,#0X20
endbgn3
	STRB R5,[R4]
	ADD R4,R4,#1
	LDRB R5,[R4]
	B while1
endd
	

STOP	B	STOP

tststr	DCB	"this is a tEsT!",0

	END
