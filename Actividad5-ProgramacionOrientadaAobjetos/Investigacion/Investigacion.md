# INVESTIGACION

## SESION 1

### INTRODUCCION A LOS OBJETOS

```cpp
class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};
```

#### ¿Qué representa la clase Particle?

La clase particle define una especie de plantilla para crear objetos de tipo de particula, mejor dicho esto no representa a un objeto. Representa a una definición que describe como sera el objeto que se va a crear, osea, es una particula de tipo particle que tambien cuenta con sus propios atributos y metodos.

#### ¿Cómo interactúan sus atributos y métodos?

La clase particle tiene dos atributos de tipo float x, y. Estos representan coordenadas de un espacio en dos dimensiones.

```cpp
float x, y;
```

Tambien tiene un metodo move que modifica los atributos x e y. Donde buscan desplazar la particula por todo el espacio disponible, pero esto depende de los valores de dx y dy. Mejor dicho, este metodo accede directamente a los atributos del objeto para actualizarlos.

#### SEGUN CHATGPT: Explicación detallada: ¿Qué es un objeto en C++ y cómo se relaciona con una clase?

En C++, una clase es un plano o molde que describe cómo deben construirse los objetos. Contiene:

Atributos: variables que guardan el estado del objeto.

Métodos: funciones que definen su comportamiento.

Un objeto es una instancia concreta de esa clase. Cuando se crea un objeto, se reserva memoria para almacenar sus atributos, y ese objeto puede usar los métodos definidos por su clase.

🧪 Ejemplo usando la clase Particle:

```cpp
Particle p;        // Se crea un objeto de tipo Particle
p.x = 10.0;        // Se asigna un valor al atributo x
p.y = 5.0;         // Se asigna un valor al atributo y

p.move(2.0, 3.0);  // Se llama al método move, que modifica x e y


Después de ejecutar p.move(2.0, 3.0);, los valores serán:

x = 12.0 (10.0 + 2.0)

y = 8.0 (5.0 + 3.0)
```

Esto demuestra cómo un objeto (p) tiene su propio estado (x, y) y cómo los métodos (move) lo modifican.

### EXPLORANDO LA MEMORIA

Considera los siguientes pasos:
Crear instancias:

```cpp
Particle p1;
Particle p2;
​```
Explorar la memoria usando punteros:
```cpp
std::cout << "Dirección de p1: " << &p1 << std::endl;
std::cout << "Dirección de p2: " << &p2 << std::endl;
​```
Determinar el tamaño del objeto:
```cpp
std::cout << "Tamaño de Particle: " << sizeof(Particle) << " bytes" << std::endl;
​```
Imprimir direcciones de atributos:
```cpp
std::cout << "Dirección de p1.x: " << &(p1.x) << std::endl;
std::cout << "Dirección de p1.y: " << &(p1.y) << std::endl;
```
#### ¿Los atributos están almacenados de forma contigua?

En general, los atributos de un objeto en c++ se almacenan de forma contigua en la memoria. Donde estos mismos siguen el orden en el que fueron declarados, es decir, la direccion de de p1.y sera desplazada justo despues de la de p1.x.

#### ¿Qué indica el tamaño del objeto sobre su estructura interna?

El tamaño del objeto dice cuanto espacio de memoria ocupa una instancia de particle, esto incluye los tamañoss de cada una de sus miembros, y el relleno que el compilador puede agregarle para asegurar una alineacion optima de los datos.

Por ejemplo, si se tienen dos float, y cada uno ocupa 4 bytes, el objeto podría medir 8 bytes. Pero si hay algún tipo de padding o alineación adicional, el tamaño podría ser más.

#### SEGUN CHATGPT:  ¿Cómo se almacenan los objetos en memoria en C++? Si tengo dos instancias de Particle, ¿Cómo se relacionan sus direcciones de memoria? ¿Los atributos están contiguos?

En C++, los objetos se almacenan en memoria siguiendo reglas definidas por el estándar del lenguaje y el compilador.

🧠 ¿Cómo se almacenan los objetos en memoria en C++?

Cuando defines una clase o estructura en C++, como esta:
```cpp
class Particle {
public:
    float x, y, z;
    int charge;
};
```
Cada objeto (instancia) de Particle ocupa un bloque de memoria que contiene todos sus atributos (miembros no estáticos). Esos atributos se almacenan de forma contigua dentro del objeto, aunque puede haber espacios (padding) entre ellos debido a requisitos de alineación del sistema.

Ejemplo:
```cpp
Particle p1;
Particle p2;
```
Aquí:

p1 y p2 son dos objetos distintos.

Cada uno contiene una copia de x, y, z y charge.

La disposición en memoria de los atributos dentro de un objeto es contigua con posibles ajustes de padding.

Los objetos p1 y p2 no están garantizados a estar contiguos en memoria, a menos que estén en un arreglo o se asignen consecutivamente.

📌 ¿Los atributos están contiguos en memoria?

Sí, los atributos de una instancia individual sí están almacenados de forma contigua (de nuevo, con posible padding):

```cpp
&x, &y, &z, &charge
```


Están todos dentro de la misma dirección base del objeto (&p1), a un offset fijo determinado por el layout.

📌 ¿Qué pasa con dos instancias? ¿Se almacenan juntas?

No necesariamente.

Ejemplo:
```cpp
Particle p1;
Particle p2;
```
&p1 y &p2 pueden o no ser direcciones contiguas.

Si están en el stack, depende del orden de declaración y del compilador.

Si los asignas en el heap (por ejemplo con new), sus direcciones pueden estar lejos una de la otra, dependiendo del estado del heap.

✅ Si quieres objetos contiguos:

Entonces necesitas usar un arreglo o contenedor como
```cpp 
std::vector<Particle>:

Particle particles[2];            // contiguos en memoria
std::vector<Particle> v(2);      // también contiguos, salvo realocaciones
```
En estos casos, &particles[0] y &particles[1] estarán contiguos en memoria.

### Análisis de diferencias

Crear clases con diferentes atributos y métodos:
```cpp
class Simple {
public:
    int a;
};

class Complex {
public:
    int a, b, c;
    void method1() {}
    void method2() {}
};
```
Compara los tamaños:
```cpp
std::cout << "Tamaño de Simple: " << sizeof(Simple) << " bytes" << std::endl;
std::cout << "Tamaño de Complex: " << sizeof(Complex) << " bytes" << std::endl;
​```
Agregar datos estáticos y dinámicos:
```cpp
class StaticData {
public:
    static int s;
    int a;
};

int StaticData::s = 0;

class DynamicData {
public:
    int* ptr;
    DynamicData() {
        ptr = new int[10];
    }
    ~DynamicData() {
        delete[] ptr;
    }
};
```

#### ¿Cómo afectan los datos estáticos al tamaño de la instancia?

Las variables estaticas no afectan el tamaño de las instancias de una clase, ya que las variables estaticas pertenecen a la clase, pero no al objeto, esto se usa para variables que nunca se van a modificar ya que se quedan estaticas como dice su nombre.

#### ¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?

Los datos estaticos no pertenecen al objeto mientras que los dinamicos si pertencen parcialmente (gracias al puntero) y digamos que en algun especie de metodo donde se llame a la clase como sizeof(clase), el tipo de dato estatico no se cuenta, mientras que el dinamico si por el puntero, aparte, los datos estaticos se guardan el global mientras que los dinamicos en el heap.

#### Explícame cómo el uso de variables estáticas y dinámicas en una clase afecta el tamaño de sus instancias. ¿Las variables estáticas ocupan espacio en cada objeto?

Excelente pregunta, y muy importante para entender cómo se maneja la memoria en la programación orientada a objetos.

📌 Diferencia entre variables estáticas y dinámicas en una clase

Variables estáticas (o de clase):

Definición: Son compartidas por todas las instancias de la clase.

Ubicación: No se almacenan dentro de cada objeto individual, sino en un área de memoria común asociada a la clase.

Acceso: Se pueden acceder mediante la clase o por una instancia, pero el valor es el mismo para todas las instancias.

Ejemplo en Java:
```cpp
class Persona {
    static int contador = 0; // variable estática
    String nombre;           // variable de instancia
}
```

Variables dinámicas (o de instancia):

Definición: Son propias de cada objeto creado a partir de la clase.

Ubicación: Se almacenan en la memoria junto con el objeto.

Acceso: Solo se puede acceder a ellas a través de una instancia específica.

Ejemplo: En el ejemplo anterior, nombre es una variable de instancia.

🧠 ¿Afectan las variables estáticas al tamaño de las instancias?

No. Las variables estáticas no afectan el tamaño de cada instancia de la clase.

✅ Detalles:

Como las variables estáticas se almacenan una sola vez en una estructura compartida por la clase (por ejemplo, en la metaestructura de la clase en el heap o en el segmento de datos), no ocupan espacio adicional en cada objeto creado.

En cambio, las variables de instancia sí determinan el tamaño de cada objeto, ya que cada una se almacena por separado en cada instancia.

📊 Ejemplo práctico

Supongamos que tienes esta clase en Java:

```cpp
class Alumno {
    static int totalAlumnos;   // variable estática
    String nombre;             // variable de instancia
    int edad;                  // variable de instancia
}
```
Si creas 100 objetos Alumno, en memoria:

Habrá una sola copia de totalAlumnos.

Habrá 100 copias de nombre y edad (una por cada objeto).

🧩 Conclusión
Tipo de variable	¿Ocupa espacio en cada instancia?	¿Es compartida entre instancias?
Estática (de clase)	❌ No	✅ Sí
De instancia (dinámica)	✅ Sí	❌ No

➡️ Entonces, solo las variables de instancia afectan directamente el tamaño de los objetos.

### REFLEXION

#### ¿Qué es un objeto desde la perspectiva de la memoria?
Desde la perspectiva de memoria, un objeto es un bloque de memoria que contiene los datos definidos por su clase. representa en la memoria una instancia concreta: sus atributos que ocupan espacio y los metodos que son funciones compartidas que no se copian dentro de cada objeto. Mejor dicho, cada instancia tiene sus propios atributos que no son estaticos.

#### ¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?

Esto depende de los tipos de atributos, como por ejemplo los estaticos que no ocupan un espacio adicional en el objeto, porque este se almacena en una zona de memoria en comun para toda la clase o programa, mientras los atributos normales por asi decirlo, son los que determinan directamente el tamaño del objeto, ya que se almacenan generalmente de forma contigua en la memoria y pueden incluir relleno para respetar la alineacion. Los metodos no afectan al tamño del objeto, el compilador genera las funciones una vez y los objetos saben a que codigo apuntar.
