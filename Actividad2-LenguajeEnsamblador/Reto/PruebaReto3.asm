 @1
    D=A
    @R0     // i = 1
    M=D

    @0
    D=A
    @R1     // sum = 0
    M=D

    @100
    D=A
    @R2     // R2 = 100 (límite)
    M=D

(LOOP)
    // if i > 100, terminar
    @R0
    D=M
    @R2
    D=D-M
    @END
    D;JGT   
    
    @R0
    D=M
    @R1
    M=D+M

    @R0
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP   