///================== Importar librerias =============////
//
import saito.objloader.*;
import netP5.*;
import oscP5.*;
import controlP5.*;
////===============Crear Objetos=====================////

ControlP5 gui;
OscP5 osc;
NetAddress maxDir;
Slider vol;
Toggle mute;

OBJModel brain;

////==================================================////
PVector[] curPos = new PVector[4];
PVector[] curAng = new PVector[6];
PVector[] newPos = new PVector[4];
PVector[] newAng = new PVector[6];

PVector[][] elmPos = new PVector[4][4];
PVector[][] elmAng = new PVector[4][6];
float[] coef = new float[4];


PVector nPos = new PVector(0, 0);
PVector pos = new PVector(0, 0);
PVector pos_ = new PVector(0, 0);

//int state;


////==================================================////
float azimu;
float eleva;

float col = 200;
float alpha = 40;
////==================================================////
void setup()
{
  size(700, 700, P3D);
  gui = new ControlP5(this);
  osc = new OscP5(this, 12001);
  maxDir = new NetAddress("127.0.0.1", 12000);
  brain = new OBJModel(this, "brain-simple-mesh.obj", "relative", LINES);
  brain.scale(80);
  initElements();
  initGui();
  
  strokeCap(ROUND);
  strokeJoin(ROUND);
}

void draw() {
  //nPos = new PVector(mouseX, mouseY);
  ///Continuous Calculus Stufff
  background(0);
  calculations();
  drawBrain();
  drawCursor(); 
}

void controlEvent(ControlEvent newEvent) {
  if (newEvent.isController()) {
    oscRoutine();
  }
}




void mouseDragged()
{
  azimu += (mouseX - pmouseX) * 0.01;
  eleva -= (mouseY - pmouseY) * 0.01;
}