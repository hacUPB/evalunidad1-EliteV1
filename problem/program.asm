// Emanuel Perez Olivero
// 000377811
// emanuel.perez@.edu.co

(MAIN_LOOP)

	@SCREEN
	D = A
	@address
	M = D			

	@i			
	M = 0
	@8192
	D = A           
	@screen_buffer_end
	M = D

	@color			
	M = 0			
    @84
     
    
	@KBD
    
	D = M			
   
    
   
	@GET
	D;JEQ			

	
	@color
	M = -1

	

	(GET)
		
	  	@i
  		D = M
 	 	@screen_buffer_end
	  	D = D - M
	  	@MAIN_LOOP
  		D;JEQ

	  	
  		@color
  		D = M
	    @address
	    A = M		
	    M = D		
 
	    @i
	    M = M + 1	
	    @address
	    M = M + 1	
		@GET 	
		0;JMP		