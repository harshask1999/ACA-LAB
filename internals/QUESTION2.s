	AREA PROGRAM, CODE, READONLY
	ENTRY
MAIN
	LDR R0,VALUE	;load value 0X40000004 to R0
	LDR R3,COUNT	;load vlaue 0X40000000 to r3 act as a counter
	LDR R4,[R3]		;load  content of R4 to R3
LOOP LDR R1,[R0]	;load content of R0 to R1
	CMP R1,#0		;compare the value of R1 to check the no equal to 0 if it is 0 it set 0 flag to high
	BMI JUMP		;if the number is negetive move to jump instruction
	ADD R2,R1		;if not equal to 0 add r2 and r1 and store in r5
	ADD R0,#4		;incrementing the address in R0 to get the next element from the array
	ADD R4,#-1		;decrementing r4 which is the counter value
	CMP R4,#0		;again check if R4 is 0 or not if yes set 0 flag to high
	BEQ DONE		;if not 0 jump to done
	B LOOP			;else go to loop
JUMP ADD R0,#4		;incrementing r1
	ADD R4,#-1		;decrementing r4 counter
	B LOOP			;branch to loop
DONE LDR R3,RESULT	;laoding address to store result
	STR R2,[R3]		;storing result
STOP B STOP;
VALUE DCD 0X40000004;
COUNT DCD 0X40000000;
RESULT DCD 0X4000002C;
	END