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

Esto depende de los tipos de atributos, como por ejemplo los estaticos que no ocupan un espacio adicional en el objeto, porque este se almacena en una zona de memoria en comun para toda la clase o programa, mientras los atributos normales por asi decirlo, son los que determinan directamente el tamaño del objeto, ya que se almacenan generalmente de forma contigua en la memoria y pueden incluir relleno para respetar la alineacion. Los metodos no afectan al tamño del objeto, el compilador genera las funciones una vez y los objetos saben a que codigo apuntar, aunque si el metodo es virtual este si necesitara un puntero que si aumenta el tamaño del programa.

#### Conclusión: resumir los hallazgos y cómo esto impacta el diseño de clases.

- Cada objeto ocupa espacio en memoria equivalente a la suma de sus atributos, considerando también el posible relleno y punteros.

- Los métodos no incrementan el tamaño de las instancias, salvo si son virtuales.

- Las variables estáticas no ocupan espacio en las instancias, pero pueden afectar el comportamiento compartido.

- El uso de memoria dinámica dentro de una clase permite manejar los recursos externos, pero añade mas complejidad (requiere constructores, destructores, encapsulamientos, manejo de copias, etc).

Comprender cómo se organiza un objeto en memoria es crucial para diseñar clases eficientes, especialmente en aplicaciones con muchos objetos (como simulaciones físicas, videojuegos).

Comprender como organizar un objeto en la parte de la memoria es crucial para diseñar buenas clases que sean eficientes, en especial con aplicaciones con muchos objets.

## Sesión 2: ubicación en memoria de datos y métodos

### ANALISIS DE LA ESTRUCTURA DE UNA CLASE

#### SEGUN CHATGPT: ¿Dónde se almacenan los datos y métodos de una clase en C++ en la memoria? Explica el concepto de vtable y cómo se relaciona con los métodos virtuales.

📦 ¿Dónde se almacenan los datos y métodos de una clase en C++?
✅ Datos (atributos)

Se guardan dentro de cada objeto.

Cada objeto tiene su propia copia.

Se almacenan en el stack o heap, según cómo se cree el objeto.
```cpp
class Persona {
  int edad;
};

Persona p1;  // Sus datos están en el stack
```

✅ Métodos (no virtuales)

El código de los métodos se guarda una sola vez en la memoria del programa.

Todos los objetos lo comparten.

🔁 ¿Qué es la vtable y los métodos virtuales?
🧠 Método virtual = función que puede cambiar según el tipo real del objeto.
```cpp
class Animal {
  virtual void hacerSonido();
};
```

🛠 ¿Cómo funciona?

Cuando usas virtual, el compilador crea una tabla virtual (vtable) por clase.

Cada objeto de esa clase guarda un puntero oculto (vptr) que apunta a su vtable.

Al llamar al método virtual, se usa la vtable para decidir qué versión ejecutar, según el tipo real del objeto.

🔁 Ejemplo:
```cpp
Animal* a = new Perro();
a->hacerSonido();  // Llama Perro::hacerSonido() gracias a la vtable
```

### Exploración de métodos virtuales
1. Crea una jerarquía de clases con métodos virtuales:
```cpp
class Base {
public:
    virtual void display() {
        std::cout << "Base display" << std::endl;
    }
};

class Derived : public Base {
public:
    void display() override {
        std::cout << "Derived display" << std::endl;
    }
};
```

Analiza la vtable.
```cpp
Base b;
Derived d;
std::cout << "Vtable de Base: " << *(void**)&b << std::endl;
std::cout << "Vtable de Derived: " << *(void**)&d << std::endl;
```
#### ¿En qué parte de la memoria se encuentran las vtable de cada objeto?
Las vtable de cada objeto estan como tal en una zona estatica de memoria, no en el objeto. Lo que pasa es que cada objeto tiene un puntero oculto llamado vptr que apunta a la vtable de su clase, como se ven esta parte del codigo:

```cpp
std::cout << "Vtable de Base: " << *(void**)&b << std::endl;
std::cout << "Vtable de Derived: " << *(void**)&d << std::endl;
```
Podemos ver que cada objeto apunta a su propia vtable según su tipo.

#### ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?
Como tal, los metodos normales no aumentan el tamaño del objeto, pero si una clase tiene metodos virtuales, el compilador por asi decirlo agrega el puntero oculto vptr en cada objeto. Este puntero si aumenta el tamaño del objeto, haciendo que los objetos de clases con metodos virtuales sean un poco mas grandes.

#### ¿Qué papel juegan las vtables en el polimorfismo?

Las vtables son clave ya que permiten que cuando usemos punteros o referencias de la clase base, esta misma llame al metodo correcto de la clase que hereda (hija). Sin la vtable no tendriamos una forma de saber que metodo usar en tiempo de ejecución.

#### SEGUN CHATGPT

Métodos virtuales y cómo se implementan en C++

Cuando declaras un método como virtual en una clase base, le estás diciendo al compilador que la función puede ser redefinida (sobrescrita) en las clases derivadas y que la llamada a ese método debe resolverse en tiempo de ejecución, dependiendo del tipo real del objeto.

¿Cómo lo hace el compilador?

Para implementar esto, el compilador crea internamente una estructura llamada vtable (tabla de funciones virtuales):

vtable: es una tabla que contiene punteros a las funciones virtuales que corresponden a cada clase.

Cada clase con métodos virtuales tiene su propia vtable, que apunta a las implementaciones correctas de esos métodos.

Además, cada objeto de esa clase lleva un puntero oculto llamado vptr que apunta a la vtable de su clase.

¿Qué pasa cuando llamas a un método virtual?

Cuando llamas a un método virtual, el programa no llama directamente a la función. En vez de eso, usa el puntero vptr del objeto para acceder a la vtable de la clase real del objeto.

Busca en la vtable el puntero a la función que debe ejecutar (que puede ser la función en la clase base o una función sobreescrita en una clase derivada).

Llama a la función usando ese puntero.

Esto es lo que permite que, aunque tengas un puntero a la clase base, si el objeto real es de una clase derivada, se ejecute el método redefinido en la derivada y no el de la base.

Ejemplo sencillo para entenderlo
```cpp
class Base {
public:
    virtual void saludar() { std::cout << "Hola desde Base\n"; }
};

class Derivado : public Base {
public:
    void saludar() override { std::cout << "Hola desde Derivado\n"; }
};

Base* obj = new Derivado();
obj->saludar();  // Gracias al vtable y vptr, llama a Derivado::saludar()
```
Aunque el puntero es de tipo Base*, la llamada a saludar() se resuelve en tiempo de ejecución y llama a la versión en Derivado, porque el objeto real es de esa clase y su vptr apunta a la vtable de Derivado.

### Uso de punteros y referencias

Objetivo: explorar cómo los punteros y referencias afectan la gestión de la memoria y la llamada a métodos.
Considera estos pasos:
1. Implementar una clase con punteros a funciones:
```cpp
class FunctionPointerExample {
public:
    void (*funcPtr)();
    static void staticFunction() {
        std::cout << "Static function called" << std::endl;
    }
    void assignFunction() {
        funcPtr = staticFunction;
    }
};
```
#### Observar si el tamaño de la instancia cambia al usar punteros a funciones.
En este caso, el tamaño del objeto es el mismo que el del puntero de funcPtr, ya que si agregamos mas punteros a las funciones, el tamaño crece proporcionalmente.

Si no hay datos miembro, y solo hay metodos estaticos, el tamaño puede ser de 1 byte por la regla del lenguaje para que cada objeto tenga una direccion unica. El puntero de la funcion es solo un dato miembro, ya que no afecta la clase en si ni la vtable, por eso en este caso; el tamaño del objeto es el mismo que el del puntero de funcPtr, ya que si agregamos mas punteros a las funciones, el tamaño crece proporcionalmente.

#### ¿Cómo se almacenan estos punteros?
Estos punteros son simplemente direcciones almacenadas en el objeto, y esto depende de donde esta guardado, si en el heap o en el stack.

#### ¿Cuál es la relación entre punteros a métodos y la vtable?
Los vtable son estructuras internas que usan c++ para soportar polimorfismo y metodos virtuales. Los vtable contienen punteros a funciones miembro virtuales, mientras que los punteros o metodos son diferentes, ya que estos a  las funciones estaticas o libres son punteros normales en direccion de funcion. Los punteros a metodos normales apuntan a funciones que requieren de un objeto

Cuando usamos metodos virtuales, el compilador genera una vtable y cada objeto con estos metodos virtuales que hacen uso del puntero oculto vptr, aunque aumenten su tamaño por este mismo. Los punteros a metodos normales son mas complejos internamente ya que pueden tener un tamaño mayor y requieren de una linea de codigo o mecanismo para aplicar el puntero a la instancia.

#### ¿Cómo afectan estos mecanismos al rendimiento del programa?
Los punteros a las funciones estaticas o libres son directos, por lo que no afecta al rendimiento del programa, mientras que los punteros a los metodos requieren pasar el objeto, por lo que no es tan directo como el anterior. Las llamadas virtuales (vtable) implican dirección y una pequeña sobrecarga para acceder al vptr, por eso, el costo de las llamadas virtuales es minimo en la mayoria de sistemas, pero puede impactar muy fuerte en el rendimiento de un codigo con bucles mas cerrados.

#### SEGUN CHATGPT: ¿Qué diferencia hay entre punteros a funciones y punteros a métodos miembro en C++? ¿Cómo afectan al tamaño de los objetos y al rendimiento?

<img width="836" height="454" alt="image" src="https://github.com/user-attachments/assets/371538a4-8c1f-42f6-b7fd-3f821fe53d1e" />

¿Por qué los punteros a métodos miembro son diferentes y a veces más grandes?

- Un puntero a método miembro no solo guarda la dirección de la función, porque un método miembro no puede ejecutarse sin un objeto (un contexto this).

- En clases simples sin herencia virtual, el puntero a método puede almacenarse como una dirección de función más un offset para aplicar al this.

- En clases con herencia múltiple o virtual, el puntero a método puede necesitar almacenar más información para encontrar la función correcta y el puntero this correcto.

- Algunos compiladores implementan punteros a métodos miembro como una estructura con múltiples campos (dirección + ajustes), no como un único puntero plano.

Esto hace que:

- El tamaño de un puntero a método miembro puede ser mayor que un puntero a función.

- Puede haber una ligera sobrecarga en tiempo de llamada porque la invocación debe ajustar el this y hacer el salto correcto, en vez de hacer un salto directo como en un puntero a función normal.

¿Cómo afecta al tamaño de los objetos y al rendimiento?

Tamaño de objetos:
Los punteros a métodos miembro suelen usarse como variables (no suelen estar embebidos en objetos salvo que tú lo hagas explícitamente). Si un objeto contiene punteros a métodos miembro, ese objeto puede crecer más que si usara punteros a función, debido al mayor tamaño del puntero a método.

 Rendimiento:

- La llamada a un puntero a función es una simple llamada indirecta por puntero.

- La llamada a un puntero a método miembro puede involucrar más cálculos internos para ajustar this y resolver la dirección correcta (especialmente en herencia compleja o virtual). Esto implica una ligera penalización en tiempo de ejecución.

- En código muy optimizado y simple, puede que la diferencia sea mínima o inapreciable.

### REFLEXION INDIVIDUAL

#### ¿Dónde residen los datos y métodos de una clase en la memoria?
Datos miembros (variables): en la instancia, que puede estar en stack, heap o segmento de datos estáticos (dependiendo de cómo se cree el objeto).

Métodos (funciones): en el segmento de código (text segment).

Puntero vptr (si hay métodos virtuales): dentro de cada instancia, apunta a vtable en segmento read-only.

vtable: en el segmento de código o read-only, compartida por todas las instancias de la clase.

#### ¿Cómo interactúan las diferentes partes en tiempo de ejecución?

#### Conclusión: cómo esta comprensión afecta el diseño de sistemas.



