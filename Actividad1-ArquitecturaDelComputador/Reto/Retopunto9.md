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
#### ¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?
#### Optimiza esta parte del código para que use solo dos instrucciones:
```
// i = i + 1
@i
D=M+1
@i
M=D
```

