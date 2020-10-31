;
; CSU11021 Introduction to Computing I 2019/2020
; Adding the values represented by ASCII digit symbols
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='4'	; Load R2 with ASCII code for symbol '4'

	LDR	R3, = '0'	; Load R3 with ASCII code for symbol '0' which has hexadecimal 0x30
	SUB	R1,R1,R3	; subtract 0x32-0x30 = 0x2
	SUB	R2,R2,R3	; subtract 0x34-0x30 = 0x4
	ADD	R0,R1,R2	;add the r1 and r2. it will produce hexadecimal 0x6
	ADD	R0,R0,R3	;hexadecimal 0x6+0x30 = 0x36
	

STOP	B	STOP

	END
