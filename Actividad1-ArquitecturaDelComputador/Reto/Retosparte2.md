# RETO PUNTO 12, 13, 14, 15, 16, 17 y 19

## PUNTO 12
IMPLEMENTAR EN ENSAMBLADOR
```
R4 = R1 + R2 + 69
```
LO ANTERIOR EN ENSAMBLADOR
```
@1       // Direccion a R1
D=M      // D es lo mismo que R1
@2       // Dirección a R2
D=D+M    // Suma de R1 y R2
@69      // valor de la constante que se suma
D=D+A    // suma de R1 y R2 con el 69
@4       // Dirección a R4
M=D      // El resultado de lo anterior se guarda en R4
```

## PUNTO 13
IMPLEMENTAR EN ENSAMBLADOR
```
if R0 >= 0 then R1 = 1
else R1 = –1

(LOOP)
goto LOOP
```
LO ANTERIOR EN ENSAMBLADOR
````
//CARGAR VALOR DE R0 EN 0
@0
D=M
// SI D ES MAYOR O IGUAL A 0 SE SALTA A SET_POSITIVE
@SET_POSITIVE
D;JGE
// SI D ES MENOR QUE 0 ENTONCES R1 ES -1
@1
M=-1
//SALTAR EL BUCLE
@LOOP
0;JMP
//POSITIVO R1 ES 1
(SET_POSITIVE)
@1
M=1
//BUCLE
(LOOP)
@LOOP
0,JMP
````

## PUNTO 14
IMPLEMENTAR EN ENSAMBLADOR
````
R4 = RAM[R1]
````
LO ANTERIOR EN ENSAMBLADOR
````
@1       // Direccion R1 de la ram
A=M      // A es igual a lo que hay en R1
D=M      // D contiene el contenido de la direccion de R1
@4       // Direccion de R4
M=D      // Valor de R1 guardado en R4
````

## PUNTO 15
Implementa en ensamblador el siguiente problema. En la posición R0 está almacenada la dirección inicial de una región de memoria. En la posición R1 está almacenado el tamaño de la región de memoria. Almacena un -1 en esa región de memoria.
````
@0
D=M       // DIRECCION INICIAL
@3
M=D       // DIRECCION ACTUAL
@0
D=M
@2
M=0       // R2 = 0 es el contador

(LOOP)
@2
D=M      // 0 = ontador
@1
D=D-M    // D= R2 - R1
@END
D;JEQ    // Si 0 == 0, se acaba
@3
A=M      // A = DIRECCION ACTUAL
M=-1     // -1 en esa direccion
@3
M=M+1    // SUBE EL CONTADOR
@2
M=M+1    // SUBE EL CONTADOR
@LOOP
0;JMP    // VUELTA AL INICIO DEL BUCLE
(END)

@END
0,JMP   // BUCLE INFINITO PARA DETENER EL PROGRAMA
````
## PUNTO 16
````
int[] arr = new int[10];
int sum = 0;
for (int j = 0; j < 10; j++) {
    sum = sum + arr[j];
}
````
IMPLEMENTADO EN ENSAMBLADOR
````
@sum
M=0
@j
M=0

(LOOP)
@j
D=M
@10
D=D-A
@END
D;JEQ
@j
D=M
@arr
A=D+A
D=M
@sum
M=D+M
@j
M=M+1
@LOOP
0;JMP
(END)
````
### ¿Qué hace este programa?
Este programa declara un arreglo de enteros de tamaño 10 llamado arr, pero como no hay un valor asignado todos los elementos son inicializados a 0 por defecto. Despues se declara la variable sum que va a almacenar la suma de los elementos del arreglo, para que en cada repeticion (este codigo tiene un bucle) se sume el valor del elemento actual del arreglo (j) a la variable sum (final del bucle).
### ¿Cuál es la dirección base de arr en la memoria RAM?
Como el arr esta definido implicitamente, el ensamblador lo asigno automaticamente a la direccion de la ram 18, ya que esta es la tercera variable que se menciona en el codigo.
### ¿Cuál es la dirección base de sum en la memoria RAM y por qué?
Igual que lo anterior, en este caso la variable sum estaría ubicada en la ram 16, ya que esta es la primera variable que se menciona en el codigo.
### ¿Cuál es la dirección base de j en la memoria RAM y por qué?
Para terminar, este estaria ubicada en la posicion de ram 17, ya que es la segunda variable mencionada, en resumen ninguna variable tiene una direccion asignada, por lo que el ensamblador se las asigna automaticamente.

## PUNTO 17
````
if ( (D - 7) == 0) goto a la instrucción en ROM[69]
````
EN ENSAMBLADOR
````
@7        // Cargar el número 7
D=D-A     // D = D - 7
@69       // Dirección de destino ROM[69]
D;JEQ     // Si D == 0 entonces pasa a la instrucción 69
````
## PUNTO 19
````
0100000000000000
1110110000010000
0000000000010000
1110001100001000
0110000000000000
1111110000010000
0000000000010011
1110001100000101
0000000000010000
1111110000010000
0100000000000000
1110010011010000
0000000000000100
1110001100000110
0000000000010000
1111110010101000
1110101010001000
0000000000000100
1110101010000111
0000000000010000
1111110000010000
0110000000000000
1110010011010000
0000000000000100
1110001100000011
0000000000010000
1111110000100000
1110111010001000
0000000000010000
1111110111001000
0000000000000100
1110101010000111
````
### ¿QUE HACE ESTE PROGRAMA?
Este programa recorre un arreglo de cuatro elementos almacenados en la memoria, donde la direccion inicial
esta en R0 y el tamaño en R1, y calcula la suma de sus elementos, la cual acumulada se guarda en R2. Este
Programa usa un contador en R3 que repite desde 0 hasta el tamaño del arreglo, sumando los elementos al 
acumulador. El resultado final se guarda en R2, y al finalizar el programa entra en un bucle infinito que
nos dice que la operacion ya ha finalizado.




