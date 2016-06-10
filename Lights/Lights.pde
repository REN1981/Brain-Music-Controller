import controlP5.*;
import saito.objloader.*;

OBJModel brain;
ControlP5 gui;
Slider vol;


float azimu = 0, eleva = 0;
float col = 255, alpha = 255;


void setup() {
  size(640, 480, P3D);
  noLights();
  gui = new ControlP5(this);
  vol = gui.addSlider("volume")
  .setSize (15, 150)
  .setPosition (width - 40, height - 200)
  .setColorValue(255);
  
  
  
  
  
  brain = new OBJModel(this, "brain-simple-mesh.obj", "relative", LINES);
  brain.scale(80);
}

void draw() {
  lights();
  background(0);
  float R = map(mouseX, 0, width, 0, 255);
  float G = map(mouseY, 0, height, 0, 255);
  float B = (R + 128) % 255;
  pointLight(R, G, B, mouseX, mouseY, 400);
  

  pushMatrix();
  stroke(0);
  translate(width/2, height/2, - 200);
  rotateY(azimu);
  rotateX(eleva);
  azimu += 0.01;
  eleva = sin(azimu/10);
  strokeWeight(0.5);
  brain.draw();
  popMatrix();

  pushMatrix();
  noStroke();
  translate (width/2, height/2, -2000);
  fill(col, alpha);
  sphere(1450);
  popMatrix();
  noLights();
}

void mouseDragged()
{
  azimu += (mouseX - pmouseX) * 0.01;
  eleva -= (mouseY - pmouseY) * 0.01;
}

void keyPressed() {
  if (keyCode == UP) {
    col = (col > 255 ? 255 : col + 10); 
  }
  if (keyCode == DOWN) {
    col = (col < 0 ? 0 : col - 10);
  }
  if (keyCode == LEFT) {
    alpha = (alpha > 255 ? 255 : alpha + 10);
  }
  if (keyCode == RIGHT) {
    alpha = (alpha < 0 ? 0 : alpha - 10);
  }
}