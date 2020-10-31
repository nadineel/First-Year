;
; CSU11021 Introduction to Computing I 2019/2020
; Intersection
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; address of sizeC
	LDR	R1, =0x40000004	; address of elemsC
	
	LDR	R6, =sizeA	; address of sizeA
	LDR	R2, [R6]	; load sizeA
	LDR	R3, =elemsA	; address of elemsA
	
	LDR	R6, =sizeB	; address of sizeB
	LDR	R4, [R6]	; load sizeB
	LDR	R5, =elemsB	; address of elemsB
	LDR 	R10,=elemsB	;duplicate of r5
	


	LDR R7,[R3]	;load elemsA
	LDR R8,[R5]	;load elemsB
	LDR R9,[R0]	;load sizec
	
		
whilee  CMP R2,#1	;while sizeA not equal to 1
	BEQ enwhl
	
	
iff	CMP R7,R8	;if char1==char2{
	BNE elsee
	
	STR R7,[R1]	;	store the char 1 to elemC address
	ADD R1,R1,#4	;	elemC address+4 to go to next add}
	LDR R8,[R10]			;	copied elem B it goes to the very beginning again ??????
	ADD R3,R3,#4	;	next char. load to the register again
	LDR R7,[R3]	
	ADD R9,R9,#1	;	sizeC +1
	STR R9,[R0]
	;	load to the same register where it was previously
	SUB R2,R2,#1
	LDR R11, [R6]	; load sizeB
	MOV R4,R11
	
	MOV R5,R10;
	
	LDR R8,[R10]
	
	
	B whilee
	
	;;
elsee	;else{
	SUB R4,R4,#1
	CMP R4,#0;if elemB not equal to 0,
	BEQ elsebranch;then go to the next elemA
	 
	ADD R5,R5,#4;	char2 address+4
	LDR R8,[R5];	load to the register to be used}	
	
	B whilee
	
elsebranch
	SUB R2,R2,#1
	ADD R3,R3,#4	;;;	next char. load to the register again?!!!!!!!!!!!
	LDR R7,[R3];;;;;!!!!;
	
	B whilee
enwhl
	
STOP	B	STOP

sizeA	DCD	4
elemsA	DCD	7, 14, 6, 3

sizeB	DCD	9
elemsB	DCD	20, 11, 14, 5, 7, 2, 9, 12, 17

	END
