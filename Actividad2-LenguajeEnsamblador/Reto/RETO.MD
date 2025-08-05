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
Como variables enteras (int)





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



