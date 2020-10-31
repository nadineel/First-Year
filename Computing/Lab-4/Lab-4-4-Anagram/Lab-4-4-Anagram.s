;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string
	
;	LDR R4,=0
;	LDR R2,=0X40000000
;	
;while	LDR R3,[R0]
;	CMP R3, #0
;	BEQ endcopy
;	STRB R3,[R2]
;	ADD R2,R2,#1
;	ADD R0,R0,#1
;	B while
;endcopy
;	STRB R4,[R2]
;	
;	LDR R2,=0X40000000

while 	LDRB R2,[R0]
	LDRB R3,[R1]
	CMP R2,#0
	BEQ end1
ifeq	CMP R2,R3
	BNE notsame
	ADD R0,R0,#1
	ADD R1,R1,#1
	
	B while
end1	
	CMP R2,R3
	BNE notsame
	MOV R5,#1
	B end2
notsame
	MOV R5,#0
end2
	
	














	
;	LDR R7,=tststr1
;	LDR R8,=tststr2
;	MOV 	R6, R1 ;COPY OF SECOND STRING 
;	
;	;LDR R3,=0X40000000 				
;	;LDR R2,=0X40000020	
;	;STRB R0,[R3]
;	;STRB R1,[R2]
;	LDRB R9,[R7]
;	LDR R10, =0			;COUNT FOR NUMBER OF CHARAC IN THE FIRST STRING
;	
;WHILE1 	CMP R9,#0
;	BEQ ENDWHLE1
;	ADD R10,R10,#1
;	ADD R7,R7,#1
;	LDRB R9,[R7]
;	B WHILE1
;ENDWHLE1

;	LDRB R11,[R8]
;	LDR R12, =0			;COUNT FOR NUMBER OF CHARAC IN THE second STRING
;	
;WHILE2 	CMP R11,#0
;	BEQ ENDWHLE2
;	ADD R12,R12,#1
;	ADD R8,R8,#1
;	LDRB R11,[R8]
;	B WHILE2
;ENDWHLE2

;if2     CMP R12,R10
;	BNE endd
;	
;	
;	

;	
;	LDR R2,=0 ;COUNT=0
;	
;	LDRB R4,[R0] ; GET THE FIRST CHARAC1
;	
;	LDRB R5,[R1] ; CHARAC2
;whilee 	CMP R4,#0
;	BEQ endwhile
;iff	CMP R4,R5
;	BEQ elsee
;	ADD R0,R0,#1
;	LDRB R4,[R0]; GET NEXT CHAR1
;	LDRB R5,[R6]
;	ADD R2,R2,#1
;	B whilee

;elsee 	ADD R1,R1,#1
;	
;	LDRB R5,[R1]
;	CMP R5,#0
;	BNE dothis	
;	ADD R0,R0,#1
;	LDRB R4,[R0]; GET NEXT CHAR1
;	LDR R1,[R8]
;	LDRB R5,[R1]
;	
;dothis
;	B whilee
;endwhile
;	
;	CMP R2,R10
;	BNE notanagram
;	MOV R0,#1
;	B endd1
;	
;notanagram
;endd
;	MOV R0,#0	
;endd1	
;	
	

	
	



STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0

	END
