# RETO: PROGRAMA DE LAS ESFERAS

## Código fuente de la aplicación.

### OFAPP.h

```cpp
#pragma once

#include "ofMain.h"

class ofApp : public ofBaseApp {
public:
	void setup();
	void draw();

	void keyPressed(int key);
	;
	void mousePressed(int x, int y, int button);

	void convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd);
	bool rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint);
	void generateSpheres();

	vector<glm::vec3> spherePositions;
	ofEasyCam cam;

	int xStep = 50;
	int yStep = 50;
	float distDiv = 100.0;
	float amplitud = 100.0;

	int gridWidth, gridHeight;
	glm::vec3 selectedSpherePos;
	bool sphereSelected = false;
};
```
### OFAPP.cpp

```cpp
#include "ofApp.h"

void
ofApp::setup() {
	ofBackground(0);
	cam.setDistance(600);

	gridWidth = ofGetWidth();
	gridHeight = ofGetHeight();

	generateSpheres();
}

void ofApp::generateSpheres() {
	spherePositions.clear();
	for (int x = -gridWidth / 2; x < gridWidth / 2; x += xStep) {
		for (int y = -gridHeight / 2; y < gridHeight / 2; y += yStep) {
			float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
			spherePositions.push_back(glm::vec3(x, y, z));
		}
	}
}

void ofApp::draw() {
	cam.begin();

	for (auto& pos : spherePositions) {
		if (sphereSelected && pos == selectedSpherePos) {
			ofSetColor(255, 0, 0);
		}
		else {
			ofSetColor(255);
		}
		ofDrawSphere(pos, 5.0);
	}

	cam.end();

	ofSetColor(255);
	ofDrawBitmapString("Step (x,y): " + ofToString(xStep) + ", " + ofToString(yStep), 20, 40);
	ofDrawBitmapString("distDiv: " + ofToString(distDiv), 20, 60);
	ofDrawBitmapString("Amplitud: " + ofToString(amplitud), 20, 80);

	if (sphereSelected) {
		ofDrawBitmapString("Esfera seleccionada: ("
			+ ofToString(selectedSpherePos.x) + ", "
			+ ofToString(selectedSpherePos.y) + ", "
			+ ofToString(selectedSpherePos.z) + ")", 20, 100);
	}
}


void ofApp::mousePressed(int x, int y, int button) {
	glm::vec3 rayStart, rayEnd;
	convertMouseToRay(x, y, rayStart, rayEnd);

	sphereSelected = false;
	for (auto& pos : spherePositions) {
		glm::vec3 intersectionPoint;
		if (rayIntersectsSphere(rayStart, rayEnd - rayStart, pos, 5.0, intersectionPoint)) {
			selectedSpherePos = pos;
			sphereSelected = true;
			break;
		}
	}
}

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
	glm::mat4 modelview = cam.getModelViewMatrix();
	glm::mat4 projection = cam.getProjectionMatrix();
	ofRectangle viewport = ofGetCurrentViewport();

	float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
	float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

	glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f);
	glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);

	glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
	glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

	rayStartWorld /= rayStartWorld.w;
	rayEndWorld /= rayEndWorld.w;

	rayStart = glm::vec3(rayStartWorld);
	rayEnd = glm::vec3(rayEndWorld);
}

bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
	glm::vec3 oc = rayStart - sphereCenter;

	float a = glm::dot(rayDir, rayDir);
	float b = 2.0f * glm::dot(oc, rayDir);
	float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

	float discriminant = b * b - 4 * a * c;

	if (discriminant < 0) {
		return false;
	}
	else {
		float t = (-b - sqrt(discriminant)) / (2.0f * a);
		intersectionPoint = rayStart + t * rayDir;
		return true;
	}
}

void ofApp::keyPressed(int key) {
	switch (key) {
	case OF_KEY_UP:
		amplitud += 10;
		break;
	case OF_KEY_DOWN:
		amplitud -= 10;
		break;
	case OF_KEY_RIGHT:
		distDiv += 10;
		break;
	case OF_KEY_LEFT:
		distDiv -= 10;
		break;
	case '+':
		xStep += 5;
		yStep += 5;
		break;
	case '-':
		xStep = max(5, xStep - 5);
		yStep = max(5, yStep - 5);
		break;
	}

	generateSpheres();
}

```

## Informe de memoria de la aplicación

Lo voy a explicar por cada tipo de memoria que hay.

### Global

En la memoria global se guardan las variables que existen durante todo el ciclo de vida del programa, es decir desde que se instancia la aplicación hasta que se cierra, por eso, las siguientes variables fueron guardadas en la memoria global.

- xstep
- ystep
- distDiv
- amplitud
- sphereSelected
- glm::vec3 selectedSpherePos
- ofEasyCam cam

Estas son variables que se ven presentes durante el uso de toda la aplicación, en el caso de las primeras cuatro siempre se ven arriba a la derecha, la camara que aunque usa recursos graficos de la computadora siempre esta funcional, el sphereSelected y el vector que aparecen cuando se selecciona una esfera. Siempre estan, unos activos y otros que requieren de una acción para activarse.

### Stack

Aqui se guardan variables locales y parametros de funciones, donde se crean al usar o entrar en una función y se destruyen al salir de ella. Por ejemplo estan las siguientes funciones / metodos:

- generateSpheres()
- rayIntersectsSphere()
- mousePressed()
- convertMouseToRay()

Y en donde cada uno de estos tienen estos parametros guardados tambien:

- X,Y,Z
- a, b, c, discriminant, t; glm::vec3 oc
- glm::vec3 rayStart, rayEnd, intersectionPoint
- x, y, glm::vec4 rayStartNDC, rayEndNDC

Basicamente aca se automatizan los procesos para que no toque hacer un uso manual de new o delete en el heap.

### Heap