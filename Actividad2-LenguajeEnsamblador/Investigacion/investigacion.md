# INVESTIGACIÓN

## ACTIVIDAD 1

### ¿Qué es la entrada-salida mapeada a memoria?
La entrada-salida mapeada a memoria se utiliza para que dispositivos perifericos como el teclado(KBD), pantalla(SCREEN) 
puedan conectarse al sistema a través de direcciones especificas en la memoria. De esta manera, la
interacción con los dispositivos conectados se realizan con operaciones de lectura y escritura en las direcciones
de memoria como si fueran parte de la memoria principal.

### ¿Cómo se implementa en la plataforma Hack?
Se implementa mediante mapas de memoria especificos para cada dispositivo, por ejemplo la pantalla esta mapeada
en el rango de la ram a partir de la dirección 16384, pantalla en blanco y negro de 256 filas y 512 pixeles por fila,
donde cada fila se representa mediante 32 palabras consecutivas de 16 bits. El teclado esta mapeado en la dirección
24576 donde para leer la entrada del teclado, el sistema lee en esa dirección de memoria donde su valor avisa si hay una
tecla presionada.

### Inventa un programa que haga uso de la entrada-salida mapeada a memoria.
Este programa es una version menor de lo del dibujo del ejercicio pasado, lo que esto hace es que pinta los primeros 16 pixeles de la pantalla cuando se presiona una tecla
y cuando lo suelto se borra. Es simple y parecido a lo que nos va a tocar hacer en los siguientes puntos, pero considero que esta bien.
````
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
````    

### Investiga el funcionamiento del programa con el simulador.
Aca hay un breve video viendo como funciona el codigo, efectivamente, presiono le tecla D y se dibujan los primeros 16 pixeles, aunque son muy pequeños me toco hacer zoom para que se
viera mejor.
<video controls src="VID_20250811_154305.mp4" title="Title"></video>

## ACTIVIDAD 2

LISTO :/

## ACTIVIDAD 3
Para que esta actividad me funcione, decidi quitar la etiqueta LOOP para cambiarlo por un WAITD, con esto le digo a la maquina que en vez de que me genera un bucle
espere la tecla D, para que haga lo que quiero, cuando presione dibuje, cuando la suelte borre, tambien me toco cambiar el codigo como lo tenia en un inicio para poder que funcionara, uno de estos cambios fue declarar @CLEAR para que el dibujo pudiera ser borrado. Aparte de todo esto, toco agregarle etiquetas como CLEAR y CLEAR_LOOP
para que el dibujo pudiera "borrarse", ya que en realidad volvemos a los valores que muestran una pantalla en blanco.

## ACTIVIDAD 4
En el caso de la actividad 4, toco hacerle un cambio drastico al WAITD, en vez de tratar de hacer un bucle, guardamos el valor de la tecla en R3 para poder determinar
que dibuje con la D y borre con la E, de resto, toco acomodar el codigo restante que es el que hice en el punto pasado para poder que se borre con la E y no cuando lo suelte.


