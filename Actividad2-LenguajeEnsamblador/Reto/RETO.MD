## RETO 1
### RAE1
````
int i = 1;
int sum = 0;
While (i <= 100){
   sum += i;
   i++;
}
````
### ¿Cómo están implementadas las variables i y sum?
Como variables enteras (int), esto quiere decir que oueden almacenar numeros enteros y estos mismos se almacenan en la ram cuando el programa se ejecute

### ¿En qué direcciones de memoria están estas variables?
Al estar ubicadas en la memoria ram, y no parecen tener una dirección ya establecida, podriamos decir que las variables i y sum estan ubicados en la RAM[16] y en
la RAM[17].

### ¿Cómo está implementado el ciclo while?
El ciclo while, esta implementado como un ensamblador que evaluan si i <= 1000, si es verdadera, ejecutan { sum += i; i++; } donde luego saltan a reevaluar la condición y si es falsa
el ciclo termina para continuar con el resto del programa.

### ¿Cómo se implementa la variable i?
Esta variable se implementa o ejecuta a traves de su direccion de memoria para que el compilador pueda gestionar este espacio cuando se ejecuta la función que contiene a i.

###  ¿En qué parte de la memoria se almacena la variable i?
Al estar dentro de una funcion como main() esta variable se guarda en el stack.

### Después de todo lo que has hecho, ¿Qué es entonces una variable?
Es un nombre simbolico que se usa para referirse a una ubicación de la memoria donde se almacena un dato durante la ejecución del programa-

### ¿Qué es la dirección de una variable?
Es La posición en memoria RAM donde se encuentra almacenado el valor de la variable.

### ¿Qué es el contenido de una variable?
Es el valor almacenado en la dirección de memoria de la variable.

### RAE2
Este codigo con toda sinceridad lo probe en varios editores de c++ en los cuales siempre daba error, pero esto se debe a que no tiene un print en el cual muestre el resultado de este
codigo, ya que este mismo busca mediante un ciclo sumar los numeros del 1 al 100, al meterlo en Chatgpt, este hizo el print y mostro el resultado de esta suma que es 5050. En este caso
no fue necesario probar el codigo por partes, ya que al ser tan corto podriamos probarlo completo de una vez.

## RETO 2
### RAE1
Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.
````
int sum = 0;
for (int i = 1; i <= 100; i++)
{
    sum += i;
}
````
### RAE2
Este codigo es el mismo que el anterior, solo cambiamos el ciclo while por un for, por lo que tienen el mismo funcionamiento y la misma 
respuesta

## RETO 3
### RAE1
Escribe un programa en lenguaje ensamblador que implemente el programa anterior.
````
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
    D;JGT   // Si i > 100, saltar a END

    // sum = sum + i
    @R0
    D=M
    @R1
    M=D+M

    // i++
    @R0
    M=M+1

    @LOOP
    0;JMP

(END)
    @END
    0;JMP   // Bucle infinito para detener
````
### RAE2
El codigo suma los numeros del 1 al 100, este mismo se ejecuta en la ROM para que el resultado sea guardado en la RAM[1], donde en RAM[0] se muestran los numeros del 1 hacia adelante
y en la RAM[2] se pone el numero limite que es el 100. Este codigo fue probado en el CPU emulator de nand2tetris, y puedo afirmar que funciona correctamente, al llegar al resultado 5050
el programa se detiene.

## RETO 4










## RETO 5
### RAE1
Traducir a lenguaje ensamblador
````
int a = 10;
int *p;
p = &a;
*p = 20;
````
TRADUCIDO
````
@10
D=A
@var1
M=D

@var
D=A
@punt
M=D

@20
D=A
@punt
A=M
M=D
````


## RETO 6

## RETO 7
Traducir esto a lenguaje ensamblador
````
int var = 10;
int bis = 5;
int *p_var;
p_var = &var;
bis = *p_var;
````
Traducido
````
@10
D=A
@R13
M=D

@5
D=A
@R14
M=D

// p_var = &var;     (dirección de var = R13)
@R13
D=A
@R15
M=D

@R15
A=M    // A = contenido de R15, o sea, dirección de var
D=M    // D = *p_var
@R14
M=D    // bis = *p_var
````



