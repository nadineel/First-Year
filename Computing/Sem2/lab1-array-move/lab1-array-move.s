;INITIAL SUBMISSION
; CS1022 Introduction to Computing II 2019/2020
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =6			;old index
	LDR	R2, =3			;want to put element here
	LDR	R3, =N
	;
	

	LDR R5,=0 ;tempOldIndex
	LDR R6,=0
	
	LDR R4,[R0,R1,LSL#2]		;hold the element
	
whl 	CMP R1,R2			;while(oldIndex>newIndex){
	BLS enwhl			;
	SUB R5,R1,#1			;tmp=old index-1
	LDR R6,[R0,R5,LSL#2]		;element[tmp]=element[oldIndex]
	STR R6, [R0,R1,LSL#2]
	SUB R1,R1,#1			;oldIndex--;
	
	B whl				;}
	
	B end1
enwhl		
	
	STR R4,[R0,R2,LSL#2]		;element[newIndex]=held element
end1

	
	

STOP	B	STOP

	END
