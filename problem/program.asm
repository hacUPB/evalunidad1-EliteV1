// Emanuel Perez Olivero
// 000377811
// emanuel.perez@.edu.co

(START)			
	@16400
    D=A

    @CordScr  //Scr= screen
	M=D 
	@256
	D=A

	@contV
	M=D

	@32
	D=A
	@contH
	M=D

	@4096
	D=A
	@starting
	M=D

	
	@KBD
	D=M
	@KEY	
	D;JNE
	@START
	0;JMP

(KEY)
	// 84 = T, 67 = c
	@j
	M = D 
	@84  //T
	D = D-A
	@LV
	D;JEQ
	@j
	D = M
	@67 //C
	D = D - A
	@ERASE
	D;JEQ
	@START
	0;JMP

(LV)
	@contV
	D=M
	@LH
	D;JEQ

	@256
	D=A
	@CordScr
	A=M
	M=D
	@contV
	M=M-1
	@32
	D=A
	@CordScr
	M=M+D
	@LV
	0;JMP
	//@LH

(LH)
	@starting
	D=M
	@SCREEN
	A=A+D
	M=-1

	@starting
	M=M+1

	@contH
	M=M-1
	D=M
	@KEY
	D;JEQ
	@LH
	0;JMP

(ERASE)
	@value
	M = 0
	@DRAW
	0;JMP

(DRAW)
	@SCREEN
	D = A
	@i
	M = D

(LOOP)
	@value
	D = M
	@i
	A = M
	M = D
	@i
	M = M + 1
	@24576
	D = A
	@i
	D = M - D
	@LOOP
	D;JNE
	@START
	0;JMP