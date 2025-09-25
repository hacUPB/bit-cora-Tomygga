# RETO

## DESCRIPCIÓN DEL RETO: OBRA DE ARTE GENERATIVA

Lo que yo me imagino es como un paisaje espacial etereo, donde se vea como una superficie abajo de montañas y que lo que se vea como "Cielo" sea mas como si fuera el espacio exterior, donde se van a ver planetas que se van a ir moviendo y tambien van a aparecer estrellas fugaces y mas cosas como meteoritos, mas o menos como en estas referencias

![alt text](image.png)

![alt text](image-1.png)

![alt text](image-2.png)

Esta sería la idea inicial del proyecto, aunque puede que cambie si no me va gustando como va quedando.

ACTU: me gustaria agregar que al presionar el click el tiempo avance mas rapido por asi decirlo, y el paisaje avance como si tuviera noche y dia. Y tambien meterle nebulosas.

## ¿Como podria aplicar la herencia?

Quizas pueda tener una clase padre como objetoEspacial, que herede a otras clases que pueden estar en el proyecto como planeta, estrella fugaz, estrellas y meteoritos, donde cada uno hereda los atributos que tenga la clase padre y aparte de esto pueda agregar o modificar los comportamientos, tambien podria definir un comportamiento comun en la clase padre donde podria definir si los objetos tienen transparencia o como se van a mover. Aparte de esto, puedo tratar los objetos mas facil ya que comparten lo mismo que la clase padre, solo con leves modificaciones

## ¿Como podria aplicar el encapsulamiento?

Podria crear clases que representen objetos del mundo, como planeta, estrella, nebulosa, etc. Que aparte de heredar de una clase padre, estas mismas clases van a tener variables privadas o protegidas como lo pueden ser la posición, el tamaño, el color y metodos para actualizarlos. Por lo que al aplicar encapsulamiento puedo proteger las variables propias de cada una de esta clase, y asi poder hacer cambios sin tener que romper todo el sistema. Un ejemplo es que la clase de planeta va a tener una velocidad privada que no va a cambiar, pero puede haber un metodo publico que calcule la nueva posicion de este.

## ¿Como podria aplicar el polimorfismo?

Puedo tener un vector de la clase padre que contenga punteros a las clases heredadas, ya que no importa que sean de clases distintas, si todas heredan de la clase padre, puedo llamar a update y draw para que modifique todas las clases, es decir, tener una lista de todos los elementos del mundo  para actualizarlos o dibujarlos en un solo bucle.

## PRIMERA PRUEBA 



