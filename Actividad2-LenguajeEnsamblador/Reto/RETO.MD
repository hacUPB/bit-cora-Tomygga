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



