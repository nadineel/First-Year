;initial submission
; CS1022 Introduction to Computing II 2019/2020
; Lab 2 - Matrix Multiplication
;

N	EQU	4		

	AREA	globals, DATA, READWRITE

; result array
ARR_R	SPACE	N*N*4		; N*N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	;;;;;;;;;;;;;;;;;;;;;;;;;
	LDR R0,=ARR_A
	LDR R1,=ARR_B
	LDR R2,=ARR_R
	LDR R3,=N
	BL matmul		

STOP	B	STOP

		
;Subroutine matmul takes in 2 N-sized matrices and gives their products and adds them
;	 R0,=ARRA_A address of matrix a
;	 R1,=ARR_B  address of matrix b
;	 R2,=ARR_R  address of the result
;	 R3,=N matrix dimensions of thoth arrays
matmul
	STMFD SP!, {R4-R9 ,LR}
	LDR R9,=0 	;i=0	;f o r ( i = 0 ; i < N; i ++) {
matmul0
	CMP R9,#N
	BHS matmul1
	LDR R4,=0 	;j=0  ;f o r ( j = 0 ; j < N; j ++) {
matmul2
	CMP R4,#N
	BHS matmul3
	LDR R5,=0;r = 0 
	LDR R6,=0;k=0	;f o r ( k = 0 ; k < N; k++) {
matmul4
	CMP R6,#N
	BHS matmul5
	
	MUL R7,R9,R3; 			;r = r + ( A[ i , k ] * B[ k , j ] ) ;
	ADD R7,R7,R6 
	LDR R7,[R0,R7,LSL#2] ;R7=A[ i , k ] 
	
	MUL R8,R6,R3
	ADD R8,R8,R4
	LDR R8,[R1,R8,LSL#2] ;R8=B[ k , j ]
		
	MUL R8,R7,R8
	ADD R5,R5,R8
		;}	
	ADD R6, R6,#1
	B matmul4
matmul5
	MUL R7,R9,R3
	ADD R7,R7,R4
	STR R5,[R2,R7,LSL#2]			;R[ i , j ] = r 	
	ADD R4,R4,#1
	B matmul2
matmul3
		;}
	ADD R9,R9,#1
	B matmul0
matmul1
	LDMFD SP!, {R4-R9, PC}
		;}



;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
