;
; CSU11021 Introduction to Computing I 2019/2020
; Flow Control
;

	AREA	RESET, CODE, READONLY
	ENTRY

; (i)
; if (h >= 13) {
; 	h = h - 12;
; }
	LDR R1, =15
	LDR R2, =13
	CMP R1,R2
	BLT endIf
	SUB R0,R1,#12
endIf	

; (ii)
; if (a > b) {
;	i = i + 1;
; } else {
;	i = i - 1;
; }
	LDR R1, =1 	; STORE A IN R1
	LDR R2, =2	; STORE B IN R2
	LDR R3, =1	; STORE COUNTER I IN R3
	CMP R1,R2	; COMPARE A & B
	BLS elsee	; BRANCH TO ELSE IF IT SATISFIES THE OPPOSITE CONDITION
	ADD R3,R3,#1	; I=I+1
	B end		;BRANCH TO end
elsee	
	SUB R3,R3,#1	; I=I-1
end	

; (iii)
	LDR R1, = 15
	CMP R1,#10; if (v < 10)
	BGE else100;{
	ADD R0,R0,#1; 	a = 1;
	B endif
else100	; }
	CMP R1,#100; else if (v < 100) {
	BGE else1000; 	a = 10;
	ADD R0,R0,#10
	B endif
else1000	; }
	CMP R1,#1000; else if (v < 1000) 
	BGE else0;{
	ADD R0,R0,#100; 	a = 100;
	B endif
else0; }
	ADD R0,R0,#0; else {
; 	a = 0;
endif; }
	
; (iv)
	LDR R1, =3; i = 3;
whiless CMP R1, #1000; while (i < 1000) 
	BGE endwhiless;{
	ADD R0,R0,R1; 	a = a + i;
	ADD R1,R1,#3; 	i = i + 3;
	B whiless; }
endwhiless


; (v) 
	LDR R1, =3 ; for (int i = 3;
for	CMP R1,#1000; i < 1000
	BGE endfor
	ADD R0,R0,R1; 	a = a + i;
	ADD R1,R1,#3; i = i + 3) {
	B for
endfor; }


; (vi)
; p = 1;
; do {
; 	p = p * 10;
; } while (v < p);


; (vii)
	LDR R1, ='C'; if (ch >= 'A' 
	CMP R1,#'A'
	BLT endloop;&&
	CMP R1,#'Z'; ch <= 'Z') 
	BGT endloop;{
	ADD R0,R0,#1; 	upper = upper + 1;
endloop; }


; (viii)
; if (ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u')
; {
; 	v = v + 1;
; }


STOP	B	STOP

	END