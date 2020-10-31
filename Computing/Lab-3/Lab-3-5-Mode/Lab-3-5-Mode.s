;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN
	LDR	R2, =tstvals	; load address of numbers
	
	LDR 	R3, [R4] ; COPYLENGTH
	LDR R5,=0	;MODE
	LDR R6,=0	;COUNT
	LDR R7,=tstvals	; COPY ADDRESS
	
	LDR R9,[R7] ;VALUE OF COPY CHECK
	LDR R8,[R2] ;VALUE TO BE CHECKED
while	CMP R1,#0
	BEQ endwhile
	
if1	CMP R3,#0
	BEQ endd
	CMP R8,R9
	BNE notequal
	ADD R6,R6,#1
	CMP R6,R5
	BLE notmode
	MOV R0,R8
notmode
notequal
	ADD R7,R7,#4
	LDR R9,[R7]
	SUB R3,R3,#1
	B if1
endd
	
	
	SUB R1,R1,#1
	ADD R2,R2,#4
	LDR R8,[R2]
	B while
endwhile



	










;	
;	MOV R8,#0	;COUNTER FOR SIMILAR
;	MOV R0,#0	;MODE FINAL ANSWER 
;	MOV R9 ,#0	;LARGEST SIMILARITY
;	MOV R10, #0	;LOAD THE ELEMENT TO BE USED
;	
;	MOV R5,#0
;whilee	CMP R1,R5	;COMPARE IF R1 IS LESS THAN 0. as this is the number of elements in the set.
;	BLT endwhl	;
;	LDR R3,[R2]	;LOAD ELEMENT OF R2 TO R3, to be modified
;	ADD R2,R2,#4	;NEXT ELEMENT FOR THE NEXT ITERATION
;	LDR R10,[R2]

;	SUB R1,R1,#1	;??INCREMENT TILL STOPS WHEN ITS LESSTHAN 0
;	
;	MOV R6,#0
;while2  CMP R1,R6	;COMPARE IF R1 IS LESS THAN 0
;	BLT endwhl2
;			;;
;	;ADD R2,R2,#4	; THE NEXT ELEMENT
;	LDR R7,[R2]	;;LOAD ELEMENT OF R2 TO R7
;	
;	
;	
;iff	CMP R3,R7	;CHAR1 == CHAR2
;	BNE endd
;	ADD R8,R8,#1	;INCREASE THE SIMILARITY
;	
;	
;ifin	CMP R8,R9	;if (similar>largest similar){
;	BLT enin
;	MOV R0,R3	;mode = char1	
;	MOV R9,R8;largest similar=similar
;enin			;}
;	
;endd	
;	ADD R2,R2,#4	; THE NEXT ELEMENT??
;	SUB R1,R1,#1	;??TO DECREMENT JUST TILL 8
;	B while2
;	
;endwhl2
;	LDR R2,[R10]
;	B whilee
;endwhl	
	
	
	
	; 
	;

STOP	B	STOP

tstN	DCD	8			; N (number of numbers)
tstvals	DCD	7, 3, 7, 5, 3, 5, 1, 7	; numbers

	END
