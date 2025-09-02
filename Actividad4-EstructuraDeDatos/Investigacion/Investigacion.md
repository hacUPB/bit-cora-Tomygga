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

