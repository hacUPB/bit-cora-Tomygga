(START)
    @24576     
    D=M        

    @START
    D;JEQ

    @16384
    D=-1
    M=D

(WAIT_RELEASE)
    @24576
    D=M
    @WAIT_RELEASE
    D;JNE     
    
    @16384
    D=0
    M=D

    @START
    0;JMP
