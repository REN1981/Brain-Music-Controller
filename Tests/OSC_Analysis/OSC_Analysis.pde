import controlP5.*;
import netP5.*;
import oscP5.*;


ControlP5 gui;
OscP5 osc;


void setup() {
  size(50, 50);
  
  gui = new ControlP5(this);
  osc = new OscP5(this, 7400);  
}

void draw() {
}

void oscEvent(OscMessage newMsg) {
  println(newMsg.addrPattern());
  println(newMsg.get(0).floatValue());
}