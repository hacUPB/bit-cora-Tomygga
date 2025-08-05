## RETO 1
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

## RETO 2
Transforma el programa en alto nivel anterior para que utilice un ciclo for en vez de un ciclo while.
````
int sum = 0;
for (int i = 1; i <= 100; i++)
{
    sum += i;
}
````

## RETO 3
Escribe un programa en lenguaje ensamblador que implemente el programa anterior.







## RETO 5
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



