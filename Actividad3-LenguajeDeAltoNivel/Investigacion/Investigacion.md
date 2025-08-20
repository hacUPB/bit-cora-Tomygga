# INVESTIGACIÓN

## ACTIVIDAD 1

### ¿Cuál es el resultado que se obtiene al ejecutar este programa?

```c++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    ofDrawCircle(ofGetMouseX(), ofGetMouseY(), 20);
}
```

El resultado que se obtiene al ejecutar este programa, es un circulo que sigue el cursor a donde nosotros lo movamos.

<video controls src=" 2025-08-14 09-00-42.mp4" title="Title"></video>

## ACTIVIDAD 2

### OFAPP.h
```c++
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<ofVec2f> particles;
        ofColor particleColor;

};

```

## OFAPP.cpp
```c++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    for(auto &pos: particles){
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, 50);
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```

###  ¿Qué fue lo que incluimos en el archivo .h?
En el archivo.h aparte de declarar las funciones principales del codigo de offApp.cpp (setup, update, draw) también declaramos dos eventos que necesita el mouse para que este codigo funcione.

Aparte de esto, también implementamos dos variables adicionales como el vector que guarda las posiciones de las particulas y el ofColor particleColor que sera el color actual que se usara para dibujar las particulas.

### ¿Cómo funciona la aplicación?
Esta aplicación funciona muy similar a la anterior, genera un circulo que esta vez en vez de ser uno solo, cada vez que muevo el mouse se generan mas circulos que siguen el cursor como si fuera una especie de snake, ahora esto tiene un limite de 100 particulas, pero cuando dejo el cursor quieto, se deja tanto de dibujar como de borrar estas particulas, solo se dibuja y se borra cuando el cursor esta en movimiento.

Otra función que tiene este codigo es que cuando le damos al click cambia de color cambia el color con el que se dibujan las particulas.

### ¿Qué hace la función mouseMoved?
Esto hace que cada vez que movamos el mouse, se guarde una posición (x,y) dentro del vector que esta en offApp.h, tambien detecta que no se pase del limite de 100 particulas, osea, borra la particula mas antigua que se haya generado en ese momento para dibujar otra.

El efecto que tiene esto es que las particulas sigan el cursor, generando como si fuera una estela o cuerpo.

### ¿Qué hace la función mousePressed?
Esta lo que hace es que cada vez que le doy al click, cambia de color las particulas, esto lo hace de manera aleatoria y no hay como un orden de que color te pueda salir.

### ¿Qué hace la función setup?
Establece el fondo en negro y inicializa el color de las particulas en blanco.

### ¿Qué hace la función update?
Este se usa para actualizar las variables o la logica de la app antes de dibujar.

### ¿Qué hace la función draw?
Esta recorre todas las posiciones guardadas en particles. y dibuja un circulo en cada una de ellas.

<video controls src=" 2025-08-14 09-18-47.mp4" title="Title"></video>

## ACTIVIDAD 3

### ¿Qué hace cada función y cada linea de código?

#### OFAPP.h

la parte inicial del OFapp.h es basicamente la declaración de la clase principal que hereda de ofBaseapp, prevenir que el archivo se incluya mas de una vez en la compilación y tambien incluye el encabezado por defecto de openframeworks para usar clases como ofColor.

De resto aqui va la explicación linea por linea:

##### Metodos públicos

- Llaman una vez al inicio, se usan para hacer una configuración inicial del programa.
```c++
void setup();
void update();
```
- Se llama en cada frame antes de draw(), se usa para la lógica de la actualización.
```c++
void draw();
````
- Se llama en cada frame para dibujar en la pantalla
```c++
void mouseMoved(int x, int y);
```
- Se llama cada vez que el mouse se mueve
```c++
void mousePressed(int x, int y, int button);
```
##### Atributos privados
- Guarda las posiciones de los circulos
```c++
vector<ofVec2f> particles;
```
- Color actual de los circulos
```c++
ofColor particleColor;
```
#### OFAPP.cpp

- Fija el fondo de pantalla a negro e inicializa el color de las particulas como blanco
```cpp
void ofApp::setup()
{
    ofBackground(0);                     
    particleColor = ofColor::white;      
}
```
- Repite por cada posicion en el vector particles, establece el color del dibujo actual y dibuja un circulo de radio 50 en esta posición.
```cpp
void ofApp::draw()
{
    for(auto &pos: particles)
    {                   
        ofSetColor(particleColor);              l 
        ofDrawCircle(pos.x, pos.y, 50);          
    }
}
```
- Agrega la posición del mouse al vector de particulas y elimina la particula mas antigua si hay mas de 100
```cpp
void ofApp::mouseMoved(int x, int y )
{
    particles.push_back(ofVec2f(x, y));           
    if (particles.size() > 100) 
    {
        particles.erase(particles.begin());       
    }
}
```
- Cambia el color de las particulas a un color aleatorio (rgb entre 0 y 255)
```cpp
void ofApp::mousePressed(int x, int y, int button){
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```
### Experimento con el codigo modificado
```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {

public:
    void setup();
    void update();
    void draw();

    void mouseMoved(int x, int y);
    void mousePressed(int x, int y, int button);

private:

    vector<ofVec2f> particles;
    ofColor particleColor;

};
```

```cpp
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    ofBackground(0);
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update() {

}

//--------------------------------------------------------------
void ofApp::draw() {
    int total = particles.size();

    for (int i = 0; i < total; ++i) 
    {
        float alpha = ofMap(i, 0, total - 1, 50, 255); 
        float radius = ofMap(i, 0, total - 1, 10, 50); 

        ofSetColor(particleColor.r, particleColor.g, particleColor.b, alpha);
        ofDrawCircle(particles[i].x, particles[i].y, radius);
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
    particles.push_back(ofVec2f(x, y));
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}
```
El cambio que le hice al codigo fue en el draw, para que en vez de que los circulos se vieran estaticos, quize que mientras mas circulos genere, los que estan en la parte trasera vayan disminuyendo. Donde, implemente un ciclo for que se va a ejecutar una vez por particula almacenada, disminuye el tamaño hasta desaparecer.

<video controls src=" 2025-08-19 09-12-24.mp4" title="Title"></video>

## ACTIVIDAD 5

```cpp
#pragma once

#include "ofMain.h"


class Sphere {
public:
    Sphere(float x, float y, float radius);
    void draw();
    void update(float x, float y);
    float getX();
    float getY();
    float getRadius();

private:
    float x, y;
    float radius;
    ofColor color;
};

class ofApp : public ofBaseApp{

    public:
        void setup();
        void update();
        void draw();

        void mouseMoved(int x, int y );
        void mousePressed(int x, int y, int button);

    private:

        vector<Sphere*> spheres;
        Sphere* selectedSphere;
};

```
```cpp
#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void Sphere::update(float x, float y) {
    this->x = x;
    this->y = y;
}

float Sphere::getRadius() {
    return radius;
}

float Sphere::getX() {
    return x;
}

float Sphere::getY() {
    return y;
}

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);

    for (int i = 0; i < 5; i++) {
        float x = ofRandomWidth();
        float y = ofRandomHeight();
        float radius = ofRandom(20, 50);
        spheres.push_back(new Sphere(x, y, radius));
    }
    selectedSphere = nullptr;

}

//--------------------------------------------------------------
void ofApp::update(){
    if (selectedSphere != nullptr) {
        selectedSphere->update(ofGetMouseX(), ofGetMouseY());
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    for (auto sphere : spheres) {
        sphere->draw();
    }
}


//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

    if(button == OF_MOUSE_BUTTON_LEFT){
        for (auto sphere : spheres) {
            float distance = ofDist(x, y, sphere->getX(), sphere->getY());
            if (distance < sphere->getRadius()) {

                selectedSphere = sphere;
                break;
            }
        }
    }
}
```
#### ¿Cuál es la definición de un puntero?
El puntero es una variable que almacena la dirección de memoria de otra variable, en vez de contener directamente un valor, esta contiene la ubicación donde se encuentra este valor. En el caso de este código serian el x, y, Radius de las esferas.

#### ¿Dónde está el puntero?
El puntero mas relevante esta en el OFAPP.h 
```cpp
vector<Sphere*> spheres;
Sphere* selectedSphere;
```
Los cuales son atributos privados y estos mismos son los que se encargan de almacenar los punteros de las cinco esferas que se ven a generar, y en el otro codigo se llamaran para poder usarlos en la selección de la esfera con el MOUSEPRESSED.

#### ¿Cómo se inicializa el puntero?
Los punteros se inicializan en el setup(), donde se crean dinamicamente objetos de tipo sphere y almacenar las direcciones en el vector spheres. aunque tambien esta la parte del nullptr, el cual se encarga de que al iniciar el codigo no se seleccione ningun puntero para poder seleccionarlo al dar click.

#### ¿Para qué se está usando el puntero?
Los punteros (sphere*) se usan para manejar dinamicamente objetos de la clase sphere, es decir, se crean las spheres en el setup y se guardan en el vector. El puntero en vez de guardar copias completas de las esferas, guarda las direcciones a los datos de esta (x, y, radius). Mientras que el puntero selectedSphere sirve para referenciar una esfera cuando le damos clic.

#### ¿Qué es exactamente lo que está almacenado en el puntero?
La dirección de memoria de cada una de las esferas que se generan (x, y, radius), mientras que el selected sphere apunta a uno de estos mismos objetos.

## ACTIVIDAD 6









