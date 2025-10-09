

```cpp
#include "ofApp.h"
#include <algorithm>

void Subject::addObserver(Observer* observer) {
    observers.push_back(observer);
}

void Subject::removeObserver(Observer* observer) {
    observers.erase(std::remove(observers.begin(), observers.end(), observer), observers.end());
}

void Subject::notify(const std::string& event) {
    for (auto observer : observers) {
        observer->onNotify(event);
    }
}

ClimaElement* WeatherFactory::createElement(const std::string& type) {
    if (type == "Gota") return new Gota();
    if (type == "Nube") return new Nube(ofRandom(ofGetWidth()), ofRandom(50, 150));
    if (type == "Sol") return new Sol();
    if (type == "Estrella") return new Estrella();
    if (type == "Luna") return new Luna();
    return nullptr;
}


void Sol::draw() {
    ofSetColor(255, 204, 0);
    ofDrawCircle(ofGetWidth() - 100, 100, 50);
}

Gota::Gota() {
    pos = { ofRandom(ofGetWidth()), ofRandom(-200, 0) };
    vel = { 0, ofRandom(4, 10) };
}
void Gota::update() {
    pos += vel;
    if (pos.y > ofGetHeight()) {
        pos.y = ofRandom(-100, 0);
        pos.x = ofRandom(ofGetWidth());
    }
}
void Gota::draw() {
    ofSetColor(255);
    ofDrawLine(pos.x, pos.y, pos.x, pos.y + 10);
}

Nube::Nube(float x, float y) {
    pos.set(x, y);
}
void Nube::update() {
    pos.x += 0.2;
    if (pos.x > ofGetWidth()) pos.x = -100;
}
void Nube::draw() {
    ofSetColor(240);
    ofDrawCircle(pos.x, pos.y, 30);
    ofDrawCircle(pos.x + 30, pos.y + 10, 25);
    ofDrawCircle(pos.x - 30, pos.y + 10, 25);
}

Estrella::Estrella() {
    pos.set(ofRandom(ofGetWidth()), ofRandom(ofGetHeight() / 2));
}
void Estrella::draw() {
    ofSetColor(255);
    ofDrawCircle(pos, 2);
}

void Luna::draw() {
    ofSetColor(230, 230, 255);
    ofDrawCircle(100, 100, 30);
}


void ofApp::cleanupElements() {
    for (auto e : elements) delete e;
    elements.clear();
}

void ofApp::setup() {
    ofSetFrameRate(60);

    solState = new SolState(this);
    lluviaStateObj = new lluviaState(this);
    nocheStateObj = new NocheState(this);

    addObserver(solState);
    addObserver(lluviaStateObj);
    addObserver(nocheStateObj);

    currentState = solState;
    currentState->onEnter(elements);
}

void ofApp::update() {
    if (currentState)
        currentState->update(elements);
}

void ofApp::draw() {
    if (currentState)
        currentState->draw(elements);
}

void ofApp::keyPressed(int key) {
    if (key == '1') {
        notify("state1");
    }
    else if (key == '2') {
        notify("state2");
    }
    else if (key == '3') {
        notify("state3");
    }
}

void ofApp::setCurrentState(ClimaState* newState) {
    if (currentState) {
        currentState->onExit(elements);
        cleanupElements();
    }
    currentState = newState;
    currentState->onEnter(elements);
}

void ofApp::drawMontañas(ofColor baseColor) {
    ofPushStyle();
    ofFill();

    ofSetColor(baseColor);
    ofBeginShape();
    ofVertex(0, ofGetHeight());
    ofVertex(0, ofGetHeight() - 150);
    ofVertex(ofGetWidth() * 0.25, ofGetHeight() - 300);
    ofVertex(ofGetWidth() * 0.5, ofGetHeight() - 150);
    ofVertex(ofGetWidth() * 0.75, ofGetHeight() - 280);
    ofVertex(ofGetWidth(), ofGetHeight() - 100);
    ofVertex(ofGetWidth(), ofGetHeight());
    ofEndShape(true);

    ofSetColor(baseColor.getLerped(ofColor::white, 0.3));
    ofBeginShape();
    ofVertex(0, ofGetHeight());
    ofVertex(0, ofGetHeight() - 100);
    ofVertex(ofGetWidth() * 0.2, ofGetHeight() - 200);
    ofVertex(ofGetWidth() * 0.4, ofGetHeight() - 100);
    ofVertex(ofGetWidth() * 0.6, ofGetHeight() - 180);
    ofVertex(ofGetWidth() * 0.8, ofGetHeight() - 120);
    ofVertex(ofGetWidth(), ofGetHeight() - 150);
    ofVertex(ofGetWidth(), ofGetHeight());
    ofEndShape(true);

    ofPopStyle();
}


SolState::SolState(ofApp* app) : app(app) {}

void SolState::onEnter(std::vector<ClimaElement*>& elements) {
    elements.clear();
    elements.push_back(WeatherFactory::createElement("Sol"));
}
void SolState::update(std::vector<ClimaElement*>&) {}
void SolState::draw(const std::vector<ClimaElement*>& elements) {
    ofBackground(255, 250, 180);
    if (app) app->drawMontañas(ofColor(140, 100, 70));
    for (auto e : elements) e->draw();
}
void SolState::onNotify(const std::string& event) {
    if (!app) return;

    if (event == "state1") {
        if (app->getCurrentState() != this) {
            app->setCurrentState(this);
        }
    }
    else if (event == "state2") {
        app->setCurrentState(app->lluviaStateObj);
    }
    else if (event == "state3") {
        app->setCurrentState(app->nocheStateObj);
    }
}


lluviaState::lluviaState(ofApp* app) : app(app) {}

void lluviaState::onEnter(std::vector<ClimaElement*>& elements) {
    elements.clear();
    for (int i = 0; i < 150; ++i)
        elements.push_back(WeatherFactory::createElement("Gota"));
    for (int i = 0; i < 10; ++i)
        elements.push_back(WeatherFactory::createElement("Nube"));
}
void lluviaState::update(std::vector<ClimaElement*>& elements) {
    for (auto e : elements) e->update();
}
void lluviaState::draw(const std::vector<ClimaElement*>& elements) {
    ofBackground(30, 30, 80);
    if (app) app->drawMontañas(ofColor(60, 60, 60));

    ofPushStyle();
    ofSetColor(255, 255, 255, 40);
    ofDrawRectangle(0, ofGetHeight() - 300, ofGetWidth(), 300);
    ofPopStyle();

    for (auto e : elements) e->draw();
}
void lluviaState::onNotify(const std::string& event) {
    if (!app) return;

    if (event == "state1") {
        app->setCurrentState(app->solState);
    }
    else if (event == "state2") {
        if (app->getCurrentState() != this) {
            app->setCurrentState(this);
        }
    }
    else if (event == "state3") {
        app->setCurrentState(app->nocheStateObj);
    }
}

NocheState::NocheState(ofApp* app) : app(app) {}

void NocheState::onEnter(std::vector<ClimaElement*>& elements) {
    elements.clear();
    for (int i = 0; i < 60; ++i)
        elements.push_back(WeatherFactory::createElement("Estrella"));
    elements.push_back(WeatherFactory::createElement("Luna"));
}
void NocheState::update(std::vector<ClimaElement*>&) {}
void NocheState::draw(const std::vector<ClimaElement*>& elements) {
    ofBackground(40, 0, 70);
    if (app) app->drawMontañas(ofColor(100, 50, 100));

    ofPushStyle();
    ofEnableAlphaBlending();
    ofSetColor(230, 230, 255, 80);
    ofDrawCircle(100, 100, 120);
    ofPopStyle();

    for (auto e : elements) e->draw();
}
void NocheState::onNotify(const std::string& event) {
    if (!app) return;

    if (event == "state1") {
        app->setCurrentState(app->solState);
    }
    else if (event == "state2") {
        app->setCurrentState(app->lluviaStateObj);
    }
    else if (event == "state3") {
        if (app->getCurrentState() != this) {
            app->setCurrentState(this);
        }
    }
}

```
```cpp
#pragma once

#include "ofMain.h"
#include <vector>
#include <string>

class Observer {
public:
    virtual void onNotify(const std::string& event) = 0;
    virtual ~Observer() = default;
};

class Subject {
public:
    void addObserver(Observer* observer);
    void removeObserver(Observer* observer);
protected:
    void notify(const std::string& event);
private:
    std::vector<Observer*> observers;
};

class ClimaState;

class ClimaElement : public Observer {
public:
    virtual void update() = 0;
    virtual void draw() = 0;
    virtual void onNotify(const std::string& event) override {}
    virtual ~ClimaElement() = default;
};

class ClimaState : public Observer {
public:
    virtual void update(std::vector<ClimaElement*>& elements) = 0;
    virtual void draw(const std::vector<ClimaElement*>& elements) = 0;
    virtual void onEnter(std::vector<ClimaElement*>& elements) {}
    virtual void onExit(std::vector<ClimaElement*>& elements) {}
    virtual void onNotify(const std::string& event) override = 0;
    virtual ~ClimaState() = default;
};

class WeatherFactory {
public:
    static ClimaElement* createElement(const std::string& type);
};

class ofApp;

class SolState : public ClimaState {
public:
    SolState(ofApp* app);
    void update(std::vector<ClimaElement*>& elements) override;
    void draw(const std::vector<ClimaElement*>& elements) override;
    void onEnter(std::vector<ClimaElement*>& elements) override;
    void onNotify(const std::string& event) override;
private:
    ofApp* app;
};

class lluviaState : public ClimaState {
public:
    lluviaState(ofApp* app);
    void update(std::vector<ClimaElement*>& elements) override;
    void draw(const std::vector<ClimaElement*>& elements) override;
    void onEnter(std::vector<ClimaElement*>& elements) override;
    void onNotify(const std::string& event) override;
private:
    ofApp* app;
};

class NocheState : public ClimaState {
public:
    NocheState(ofApp* app);
    void update(std::vector<ClimaElement*>& elements) override;
    void draw(const std::vector<ClimaElement*>& elements) override;
    void onEnter(std::vector<ClimaElement*>& elements) override;
    void onNotify(const std::string& event) override;
private:
    ofApp* app;
};

class Sol : public ClimaElement {
public:
    void update() override {}
    void draw() override;
};

class Gota : public ClimaElement {
public:
    Gota();
    void update() override;
    void draw() override;
    ofVec2f pos, vel;
};

class Nube : public ClimaElement {
public:
    Nube(float x, float y);
    void update() override;
    void draw() override;
    ofVec2f pos;
};

class Estrella : public ClimaElement {
public:
    Estrella();
    void update() override {}
    void draw() override;
    ofVec2f pos;
};

class Luna : public ClimaElement {
public:
    void update() override {}
    void draw() override;
};

class ofApp : public ofBaseApp, public Subject {
public:
    void setup();
    void update();
    void draw();
    void keyPressed(int key);

    void setCurrentState(ClimaState* newState);
    void drawMontañas(ofColor baseColor);

    ClimaState* getCurrentState() { return currentState; }

    SolState* solState = nullptr;
    lluviaState* lluviaStateObj = nullptr;
    NocheState* nocheStateObj = nullptr;

private:
    ClimaState* currentState = nullptr;
    std::vector<ClimaElement*> elements;

    void cleanupElements();
};

```