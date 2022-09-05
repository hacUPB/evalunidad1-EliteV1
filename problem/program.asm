// COLOCA AQUÍ TU NOMBRE COMPLETO
// COLOCA AQUÍ TU ID
// COLOCA AQUÍ TU CORREO ELECTRÓNICO

(MAIN_LOOP)
	// reset screen address
	@SCREEN
	D = A
	@address
	M = D			// address = 16384 (base address of the Hack screen)

	@i				// i = 0
	M = 0
	@8192
	D = A           // i = 0 to 8191 (pixels)
	@screen_buffer_end
	M = D

	@color			
	M = 0			// default color to white
    @84
    D=A 
    
	@KBD
    
	D = M			// read contents of keyboard
   
    
   
	@FILL_SCREEN
	D;JEQ			// if no key pressed, fill screen with white

	// key is pressed, fill screen with black
	@color
	M = -1

	// Fill screen with specified color
	// pixels are at address 0 to 4096
	// (for i = 0; i < 4096; i++) {
	//     SCREEN[i] = color;
	// }

	(FILL_SCREEN)
		// if (i == screen_buffer_end) GOTO MAIN_LOOP
	  	@i
  		D = M
 	 	@screen_buffer_end
	  	D = D - M
	  	@MAIN_LOOP
  		D;JEQ

	  	// Write color to current address on screen
  		// address[i] = color
  		@color
  		D = M
	    @address
	    A = M		// writing to memory using a pointer:
	    M = D		// RAM[address] = color (16 pixels)
 
	    @i
	    M = M + 1	// i = i + 1
	    @address
	    M = M + 1	// address = address + 1
		@FILL_SCREEN 	
		0;JMP		// repeat