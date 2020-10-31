;
; CSU11021 Introduction to Computing I 2019/2020
; Proper Case
;
;if its the first lettr after space, check if upper case.
;if not first letter must be lowercase
;if space, add 1 to ignore it and make a while loop so that it wil stop when it has entered the null value.

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

	
	LDRB R2,[R0]	; LOAD HELLO world TO R1 BYTE BY BYTE
	
	
iff	CMP R2,#'a'	;if (char>=a
	BLT enn		;&&
	CMP R2, #'z'	;char<=z
	BGT enn		;
	SUB R2, R2,#0x20	;TO MAKE IT UPPER CASE
enn
	STRB R2,[R1]	;STORE THE FIRST UPPERCASE TO R1 
	ADD R0,R0,#1	;ADDRESS TSTSTR++
	ADD R1,R1,#1	;ADRESS NEW++
	
	LDRB R2,[R0]	;LOAD R0 TO R2 AGAIN FOR THE REST OF THE LETTERS
while 	CMP R2,#0x20	;COMPARING if the char is a space. if ti is, got to the outerloop as it needs to be uppercase.
	BEQ enwhile	;TO 
	cmp r2,#0
	beq end
if2	CMP R2,#'A'	;SEE
	BLT en2		;IF
	CMP R2,#'Z'	;THEY ARE LOWERCASE. IF THEY ARE IGNORE THIS STEP.if not convert ot to lower case
	BGT en2		;
	ADD R2,R2,#0x20	;
en2
	STRB R2,[R1]	;STORE TO R1 
	ADD R0,R0,#1	;ADDRESS TSTSTR++
	ADD R1,R1,#1	;ADRESS NEW++
	LDRB R2,[R0]
	B while
enwhile
;
	STRB R2,[R1]	;STORE TO R1 
	ADD R0,R0,#1	;ADDRESS TSTSTR++
	ADD R1,R1,#1	;ADRESS NEW++
	LDRB R2,[R0]
;
	LDRB R2,[R0]
	B iff

end

STOP	B	STOP

tststr	DCB	"HELLO world",0

	END
