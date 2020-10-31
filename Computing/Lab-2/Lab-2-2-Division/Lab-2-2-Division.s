;
; CSU11021 Introduction to Computing I 2019/2020
; Division (inefficient!)
;

	AREA	RESET, CODE, READONLY
	ENTRY

	MOV R2, #5; R2 IS A = 5
	MOV R3, #2; R3 IS B = 2 
for	CMP R2,R3 ;IS R2 >=R3?
	BLT endfor ; BRANCH TO ENDFOR IF FALSE
	SUB R2,R2,R3; R2=R2-R3
	ADD R0,R0,#1
	B for
endfor
	MOV R1,R2

STOP	B	STOP

	END
