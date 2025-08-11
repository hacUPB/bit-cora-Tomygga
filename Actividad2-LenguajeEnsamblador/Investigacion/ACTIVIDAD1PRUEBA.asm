// Programa simple: usa KBD (24576) para detectar tecla
// y escribe en SCREEN (16384) para encender/borrar un bloque.

(START)
    // Lee teclado
    @24576     // A = 24576 (dirección KBD)
    D=M        // D = M[24576] (valor del teclado)

    // Si no hay tecla (D == 0) volver a START
    @START
    D;JEQ

    // Si llegamos aquí, D != 0 -> hay tecla presionada
    // Escribe -1 en la primera palabra de la pantalla (llena esos 16 píxeles)
    @16384
    D=-1
    M=D

    // Espera hasta que la tecla sea liberada (D == 0)
(WAIT_RELEASE)
    @24576
    D=M
    @WAIT_RELEASE
    D;JNE     // mientras D != 0, saltar a WAIT_RELEASE

    // Una vez liberada, limpiar la primera palabra de la pantalla
    @16384
    D=0
    M=D

    // Volver a empezar
    @START
    0;JMP
