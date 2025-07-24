### RETO PUNTO 8
```
@var1
D = M
@var2
D = D + M
@var3
M = D
```

## ¿Qué hace este programa?
En resumen este programa suma la var1 y la var2 para guardarlas en var3. En la primera parte del codigo, se lee el valor de var1 para guardarlo en D,
ya en la mitad del codigo, esta misma apunta a la direccion y lee el valor de var2, para despues sumarlo con D (Valor de var1). Para finalizar
la ultima parte del codigo guarda el resultado en la var3.

## ¿En qué posición de la memoria está var1, var2 y var3? ¿Por qué en esas posiciones?
Cuando usamos las variables por primera vez, el ensamblador se encarga de dar la posicion de la memoria a partir del 16 en adelante, es decir, la var1
estaría ubicada en la posición 16 de la ram, la var2 en la 17 y la var3 en la 18.

### RETO PUNTO 9

#### Consdidera el siguiente programa

```
i = 1
sum = 0
sum = sum + i
i = i + 1
```
#### Esta es la traducción del codigo a lenguaje ensamblador

```
// i = 1
@i
M=1
// sum = 0
@sum
M=0
// sum = sum + i
@i
D=M
@sum
M=D+M
// i = i + 1
@i
D=M+1
@i
M=D
````
#### ¿Que hace este programa?
Este programa inicia suma y incrementa el contador una solo vez, en resumen suma el valor de i a sum
una sola vez.
#### ¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?
i y sum estarían ubicadas en la posicion 16 y 17 de la ram, esto porque al tener unas variables declaradas y
no se les especifica alguna direccion explicita, el ensamblador las ubica automaticamente a la posicion 16 de
la ram en adelante.
#### Optimiza esta parte del código para que use solo dos instrucciones:
```
// i = i + 1
@i
D=M+1
@i
M=D
```
Optimizado sería:
````
// i = i + 1
@i
M=M+1
````

### RETO PUNTO 10
Las posiciones de memoria RAM de 0 a 15 tienen los nombres simbólico R0 a R15. Escribe un programa en lenguaje ensamblador que guarde en R1 la operación 2 * R0.
````
@0          //El valor de R0 es igual a D
D=M
D=D+D       //Sumamos D por ella misma para que se cumpla el 2*R0
@1  
M=D         //En estas ultimas 2 lineas se guarda el resultado de la suma anterior en R1
````
