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

### Investiga el funcionamiento del programa con el simulador.

## ACTIVIDAD 2

LISTO :/

## ACTIVIDAD 3


