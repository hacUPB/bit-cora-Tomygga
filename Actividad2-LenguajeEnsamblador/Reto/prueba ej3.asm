// Bucle principal
(LOOP)
    @KBD        // Leer teclado
    D=M         // D = tecla presionada
    @DRAW
    D;JNE       // Si se presiona alguna tecla, ir a DIBUJAR
    @CLEAR
    0;JMP       // Si no, ir a BORRAR

// Dibuja un píxel (esquina superior izquierda)
(DRAW)
    @SCREEN     // Dirección de la pantalla
    M=1         // Encender el primer bit (esquina superior izquierda)
    @LOOP
    0;JMP       // Volver al bucle

// Borra el píxel
(CLEAR)
    @SCREEN
    M=0         // Apagar todos los bits del primer grupo de 16 píxeles
    @LOOP
    0;JMP       // Volver al bucle
