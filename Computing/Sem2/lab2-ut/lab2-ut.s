;initial submission
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Upper Triangular
;

N	EQU	4
TRUE	EQU 	1
FALSE	EQU	0	

	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	LDR R0,=FALSE	;result.
	LDR R1,=ARR_A
	LDR R2,=N	;MATRIX DIMENSION
	BL uptr
	

	;
	; write your program here to determine whether ARR_A
	;   (below) is a matrix in Upper Triangular form.
	;
	; Store 1 in R0 if the matrix is in Upper Triangular form
	;   and zero otherwise.
	;


STOP	B	STOP
	
;SUBROUTINE uptr checks if the bottom of the diagonal across the matrix is 0
;parameters
;	R1,=ARR_A
;	R2,=N	;MATRIX DIMENSION
;returns R0 result
uptr 
	STMFD SP!, {R3-R5 ,LR};push
	LDR R3,=0	; i=row
uptr1
	CMP R3,R2	;for(int i=0; i<N ;i++){	
	BHS uptr2
	LDR R4,=0	;j=column	
uptr3			
	CMP R4,R3	;	for(int j=0;j<i; j++ ){	
	BHS uptr4
	
	MUL R5,R3,R2	
	ADD R5,R5,R4
	LDR R5,[R1,R5,LSL#2];R5=A[i,j]
if1
	CMP R5,#0	;			if (A[i,j]==0){	
	LDR R0,=FALSE
	BNE uptr2;END EVERYTHING as it is not in upper triangular form
	LDR R0,=TRUE	;			R0=1	}				
uptr6	
	ADD R4,R4,#1
	B uptr3
uptr4			;	}	
	ADD R3,R3,#1
	B uptr1
uptr2			;}
	LDMFD SP!, {R3-R5 ,PC};POP


		


	


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 0,  6,  7,  8
	DCD	 0,  0, 11, 12
	DCD	 0,  0,  0, 16

	END
