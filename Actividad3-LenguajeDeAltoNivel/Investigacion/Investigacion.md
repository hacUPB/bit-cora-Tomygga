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
