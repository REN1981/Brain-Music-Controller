import controlP5.*;

ControlP5 gui;

Slider rSlider;
Slider gSlider;
Slider bSlider;

float r = 0, g = 0, b = 0;

color col = color(0, 0, 0);
color col_ = color(0, 0, 0);

void setup() {
  size (640, 480);
  gui = new ControlP5(this);
  
  rSlider = gui.addSlider("red")
  .setSize(10, 100)
  .setPosition(20, 20)
  .setRange(0, 255);
  
  gSlider = gui.addSlider("green")
  .setSize(10, 100)
  .setPosition(60, 20)
  .setRange(0, 255);
  
  bSlider = gui.addSlider("blue")
  .setSize(10, 100)
  .setPosition(100, 20)
  .setRange(0, 255);
}

void draw() {
  col = color(r, g, b);
  col_ = color(255 - r, 255 -g , 255 - b);
  
  background(0);
  fill(col);
  rect(0, 0, width/2, height);
  fill(col_); 
  rect(width/2, 0, width, height);
}

void controlEvent(ControlEvent newEvent) {
  if (newEvent.getController().getName().equals("red")) {
    r = newEvent.getController().getValue();
    println("Red: " + r);
  }
  if (newEvent.getController().getName().equals("green")) {
    g = newEvent.getController().getValue();
    println("Green: " + g);
  }
  if (newEvent.getController().getName().equals("blue")) {
    b = newEvent.getController().getValue();
    println("Blue: " + b);
  }
}