;
; CSU11021 Introduction to Computing I 2019/2020
; Convert a sequence of ASCII digits to the value they represent
;

	AREA	RESET, CODE, READONLY
	ENTRY

;	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
;	LDR	R2, ='1'	; Load R2 with ASCII code for symbol '0'
;	LDR	R3, ='3'	; Load R3 with ASCII code for symbol '3'
;;	LDR	R4, ='4'	; Load R4 with ASCII code for symbol '4'
;
;	LDR	R5, =0x30
;	SUB	R1,R1,R5	;HEXDECIMAL= 0x2
;	SUB	R2,R2,R5	;HEXDECIMAL= 0x0
;;	SUB	R3,R3,R5	;HEXDECIMAL= 0x3
;	SUB	R4,R4,R5	;HEXDECIMAL= 0x4
;	
;;	
;	LDR	R6, =1000	;for decimal value
;	LDR	R7, =10
;	LDR 	R8, =100
;;	
;	
;	MUL	R1,R6,R1	;r1=2*1000=2000
;	MUL 	R2,R8,R2	;r2=0*100=0
;	MUL	R3,R7,R3	;r3=3*10=30
;	
	
;	ADD	R0,R1,R3	;r0=2000+30=2030
;	ADD	R0,R0,R2	;r0=2030+0=2030
;	ADD	R0,R0,R4	;r0=2030+4=2034
;

	
	
	
	
	
	
STOP	B	STOP

	END
