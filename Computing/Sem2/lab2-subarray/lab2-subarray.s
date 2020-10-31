;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Subarray
;

N	EQU	7
M	EQU	3		

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	LDR R0,=0		; RESULT IF A SUBARRAY
	LDR R1,=LARGE_A
	LDR R2,=SMALL_A
	LDR R3,=N
	LDR R4,=M
	
iff	
	CMP R3,R4
	BLT endiff
	BL subar;
endiff
	;b goes through 0-2(across 3 colums from large and small array)
	;then increment a(next row and then b is back to zero again). once a>=3 checks if the result has changed or not.  
	;if result =1, exit everything and end as we have found the subarray. else j++
	; j++ means that we check the 3x3 matrix shifting by 1 to the right to check if it could be the subarray. repeat everything.
	;once j reaches its limit, we increment i++ which checks for similar 3x3 matrix from the row below or the next row.

STOP	B	STOP

;subroutine subar checks if small_a is a sub array of the large_a
;subar compares 3x3 small matrix to every 3x3 submatrix in the larger matrix

;  R0,=0		; RESULT=1 IF A SUBARRAY else r0=0
;  R1,=LARGE_A
;  R2,=SMALL_A
;  LDR R3,=N
;  LDR R4,=M
;   Initially, I assumed small_a is an subarray. ie r0=1
subar 
	STMFD SP! ,{R5-R12,LR}
	LDR R5,=0;i=0
	SUB R6, R3,R4	;(N-M)
subar1  
	CMP R5,R6		;for(int i=0; i<(N-M); i++){
	BHS subar2
	LDR R7,=0 ;j=0
subar3
	CMP R7,R6		;	for(j=0; j<(N-M); j++){
	BHS subar4
	LDR R0,=1		;	result=1
	LDR R8,=0 ; a=0	
subar5	
	CMP R8,R4		;		for(a=0; a<M;a++){
	BHS subar6
	LDR R9,=0 ;b=0
subar7
	CMP R9,R4		;			for (b=0; b<M; b++){
	BHS subar8

	MUL R10,R8,R4
	ADD R10,R10,R9
	LDR R10,[R2,R10,LSL#2];R10=small[a][b]
	
	ADD R11,R5,R8
	MUL R11,R3,R11
	ADD R12,R7,R9
	ADD R11,R11,R12
	LDR R11,[R1,R11,LSL#2];R11=large[i+a][j+b]
if1
	CMP R10,R11		;				if(large[i+a][j+b]!=small[a][b]){
	BEQ endif1
	LDR R0,=0		;				result=0;
	
endif1				;				}
	ADD R9,R9,#1
	B subar7
	
subar8				;			}
	ADD R8,R8,#1
	B subar5
	
subar6				;		}
	CMP R0,#1								;after goingthrough a 3x3 subarray from large, checks if it is a subarray
	BEQ subar2		;if R0==1 end everything
	
	ADD R7,R7,#1
	B subar3
	
subar4				;	}
	ADD R5,R5,#1
	B subar1
subar2				;}
	LDMFD SP!, {R5-R12, PC}		
				
				
				
				


;
; test data
;

LARGE_A	DCD	 48, 37, 15, 44,  3, 17, 26
	DCD	  2,  9, 12, 18, 14, 33, 16
	DCD	 13, 20,  1, 22,  7, 48, 21
	DCD	 27, 19, 44, 49, 44, 18, 10
	DCD	 29, 17, 22,  4, 46, 43, 41
	DCD	 37, 35, 38, 34, 16, 25,  0
	DCD	 17,  0, 48, 15, 27, 35, 11

SMALL_A	DCD	 49, 44, 18
	DCD	  4, 46, 100
	DCD	 34, 16, 25

	END
