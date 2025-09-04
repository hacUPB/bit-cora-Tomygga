# INVESTIGACIÓN

## ofApp.h

```cpp
#pragma once
#include "ofMain.h"

class Node {
public:
	float x, y;
	Node* next;

	Node(float _x, float _y);
	~Node();
};

class LinkedList {
public:
	Node* head;
	Node* tail;
	int size;

	LinkedList();
	~LinkedList();

	void clear();
	void addNode(float x, float y);
	void update(float x, float y);
	void display();
};

class ofApp : public ofBaseApp {
public:
	LinkedList snake;
	void setup();
	void update();
	void draw();
	void keyPressed(int key); // Nueva función para manejar el teclado
};
```

## oFApp.cpp

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
	// Agregar nodos a la serpiente
	ofBackground(255, 255, 255);
	for (int i = 0; i < 10; i++) {
		snake.addNode(ofGetWidth() / 2, ofGetHeight() / 2);
	}
}
//--------------------------------------------------------------
void ofApp::update() {
	// Actualizar la posición de la serpiente
	snake.update(ofGetMouseX(), ofGetMouseY());
}
//--------------------------------------------------------------
void ofApp::draw() {
	ofBackground(220);
	// Dibujar la serpiente
	snake.display();
}
//--------------------------------------------------------------
void ofApp::keyPressed(int key) {
	if (key == 'c') {
		snake.clear(); // Limpiar la lista cuando se presiona la tecla 'c'
	}
}
//--------------------------------------------------------------

LinkedList::LinkedList() {
	head = new Node(ofGetWidth() / 2, ofGetHeight() / 2);
	tail = head;
	size = 1;
}
//--------------------------------------------------------------
LinkedList::~LinkedList() {
	clear();
}
//--------------------------------------------------------------
void LinkedList::clear() {
	Node* current = head;
	while (current != nullptr) {
		Node* nextNode = current->next;
		delete current;
		current = nextNode;
	}
	head = nullptr;
	tail = nullptr;
	size = 0;
}
//--------------------------------------------------------------
void LinkedList::addNode(float x, float y) {
	Node* newNode = new Node(x, y);
	if (tail != nullptr) {
		tail->next = newNode;
		tail = newNode;
	}
	else {
		head = tail = newNode;
	}
	size++;
}
//--------------------------------------------------------------
void LinkedList::update(float x, float y) {
	Node* current = head;
	float prevX = x;
	float prevY = y;

	while (current != nullptr) {
		float tempX = current->x;
		float tempY = current->y;
		current->x = prevX;
		current->y = prevY;
		prevX = tempX;
		prevY = tempY;
		current = current->next;
	}
}
//--------------------------------------------------------------
void LinkedList::display() {
	Node* current = head;
	while (current != nullptr) {
		ofSetColor(ofColor(255, 0, 0));
		ofDrawCircle(current->x, current->y, 10);
		current = current->next;
	}
}
//--------------------------------------------------------------
Node::Node(float _x, float _y) {
	x = _x;
	y = _y;
	next = nullptr;
}
//--------------------------------------------------------------
Node::~Node() {
	// Destructor para Node
}

```

### ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?

Una lista enlazada es una estructura compuesta por una secuencia de nodos, donde cada uno de estos tiene un valor y un puntero al siguiente nodo en la secuencia. Esto sirve para almacenar elementos de manera no consecutiva en la memoria. Ahora, ¿Que lo diferencia de un arreglo?. La forma en la que almacenan los datos en la memoria, mientras que la lista enlazada necesita de punteros debido a que todo esta disperso; en el arreglo, todo esta almacenado de forma consecutiva.

### Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?

Mediante los punteros, ya que cada nodo tiene un puntero llamado next, que apunta al siguiente nodo en la lista, Mientras que el inicial solo esta referenciado en head, y el final apunta a nullptr, para que no siga la ejecución de este.

Ahora la estructura en este codigo que se utiliza para todo esto de los nodos es la del puntero node* next que esta dentro de la clase node, mejor dicho este fragmento:

```cpp
class Node {
public:
    float x, y;
    Node* next;  // Este puntero conecta el nodo con el siguiente nodo en la lista
    Node(float _x, float _y);
    ~Node();
};
```
Esto permite que los nodos se "encadenen" de una forma dinamica en la memoria, sin necesidad de que esten almacenadas consecutivamente.

### ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.

La memoria en una lista enlazada se gestiona manualmente con el opreador NEW para crear nodos dinamicamente en el heap y el operador DELETE liberar esa memoria cuando los nodos ya no son necesarios. Cada vez que se agrega un nodo, se utiliza el new para asignar la memoria y el delete para evitar fugas.

### Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?

Una lista enlazada permite insertar o eliminar elementoss en posiciones intermedias de una manera mas eficiente que un arreglo, ya que este mismo no requiere mover el resto de los elementos, solo necesita los punteros de los nodos que tienen un costo mas constante que los arreglos

### En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?

Con el metodo Clear(), este recorre la lista enlazada y libera la memoria de cada nodo usando delete. El LinkedList llama a este metodo automaticamente cuando un objeto del mismo tipo de esta clase es destruido, Así, el destructor garantiza que toda la memoria dinámica utilizada por los nodos se libere correctamente cuando la lista deje de existir, evitando pérdidas de memoria

```cpp
LinkedList::~LinkedList() {
    clear();  // Libera todos los nodos al destruir la lista
}
-------------------------------

void LinkedList::clear() {
    Node* current = head;
    while (current != nullptr) {
        Node* nextNode = current->next;
        delete current;        // Libera la memoria del nodo actual
        current = nextNode;    // Avanza al siguiente nodo
    }
    head = nullptr;
    tail = nullptr;
    size = 0;
}

```
### ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.

Proceso del medtodo clear en la LinkedList:

- Se crea un puntero temporal current que apunta al primer nodo  de la lista.

- Mientras current no sea nullptr, este mismo guarda en otro puntero nextNode la dirección del siguiente nodo, llama a delete current, Invoca el destructor del nodo actual, Libera la memoria dinámica ocupada por ese nodo en el heap, Se actualiza current para que apunte al nodo siguiente.

- Cuando current llega a nullptr, significa que todos los nodos han sido liberados.

- Se actualizan los punteros head y tail a nullptr, y el tamaño size a 0, indicando que la lista está vacía.

### Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?

Al agregar un nodo al final de la lista, se crea de manera dinamica en la memoria un nuevo nodo y el puntero del nodo final se actualiza para apuntar al nodo recien creado, manteniendo la conexion de la lista. Esto permite que la operacion de insercion se realice a tiempo constante. ya que no es necesario que recorra la lista completa, mejorando asi el rendimiento en comparacion con listas que no mantienen un puntero al ultimo nodo.
    