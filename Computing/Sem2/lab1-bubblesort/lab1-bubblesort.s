;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]		;take elements from unsort to sort
	STR	R7, [R4, R6, LSL #2]		;still not sorted
	ADD	R6, R6, #1
	B	whInit
eWhInit

	LDR	R4, =SORTED
	LDR	R5, =UNSORT

	;
	; your sort subroutine goes here

	
	LDR R8,=1			;i = 1 
	LDR R9,=0
whl	CMP R8,#N			; i < N;
	BHS endd
	LDR R10,[R4,R9,LSL#2]		;GET THE ELEMENT to r10
	
	LDR R11,[R4,R8,LSL#2]		;get the element before it
ifgrt	CMP R10,R11			;compare if element(i)>element(i-1)
	BLS notgrt			;if not less than, we swap
	LDR R12,[R4,R9,LSL#2]		; CANT USE LDR R12,[R10] tmpswap = a r r a y [ i -1]element
	STR R11,[R4,R9,LSL#2]		;a r r a y [ i -1] = a r r a y [ i ] ;
	STR R12,[R4,R8,LSL#2];		;a r r a y [ i ] = tmpswap ;
notgrt	
	ADD R9,R9,#1			;next
	ADD R8,R8,#1
	B whl	
endd

	
	
	
	
	


UNSORT	DCD	10,13,0,1,6,2,4,7,8,5

	END
