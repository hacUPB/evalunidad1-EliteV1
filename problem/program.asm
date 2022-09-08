// Emanuel Perez Olivero
// 000377811
// emanuel.perez@.edu.co

(START)			
	@KBD
	D=M
	@KEY	
	D;JNE
	@START
	0;JMP

(KEY)
// 84 para la T, 67 para la c
	@j
	M = D // save key
	@84  // press f
	D = D-A
	@FILL
	D;JEQ
	@j
	D = M
	@67
	D = D - A
	@ERASE
	D;JEQ
	@START
	0;JMP

(FILL)
	@value
	M = -1
	@DRAW
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