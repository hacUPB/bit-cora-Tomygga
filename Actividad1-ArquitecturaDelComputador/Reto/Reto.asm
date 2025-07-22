// EJERCICIO 1
@1978       //Valor 1978
D=A         //valor guardado en D

//EJERCICIO 2
@69         //valor que guardaremos
D=A         // D = 69  
@100        //Posición de ram 100
M=D         // Valor guardado en 100

//EJERCICIO 3
@24        //Posicion 24 de la ram
D=M        // D = Contenido de la ram 24
@200       //Direccion 200
M=D        //Valor del contenido de la ram 24 guardado en la poscion 200 de la ram

//EJERCICIO 4
@100       //posicion de la ram
D=M        //D = contenido de la ram 100
@15        // valor que restaremos
D=D-A      // resta entre el contenido de la ram 100 y el 15
@100       //Direccion 100 de la ram
M=D        //Valor de la resta guardado en 100

//EJERCICIO 5
@0           //Posición de ram 0
D=M          //D = contenido de la ram 0
@1           //ram 1
D=D+M        //suma contenido de la ram 1 y la ram 0
@69          //valor que sumaremos
D=D+A        //Suma de la ram 1 y la 0 con el 69
@2           // Posicion de ram 2
M=D          // Resultado de la suma guardado en ram 2

//EJERCICIO 6
@100        //Direccion 109 en el registro A
D;JEQ       //Salta si el valor de D es igual a 0

//EJERCICIO 7
@100        //contenido del valor 100 de la ram
D=M         //D = al contenido del valor de la ram 100
@100        //A es 100
D=D-A       // D es la resta de la ram 100 con el 100
@20         //posicion 20 de la rom
D;JLT       //Salto si D < 0, osea que salta si la ram 100 < 100
