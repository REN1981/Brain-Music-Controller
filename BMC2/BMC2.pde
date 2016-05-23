import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress max;

PVector pos = new PVector(0, 0);
PVector pos_ = new PVector(0, 0);

int counter;
float frag;
int steps = 100;

float[] dist = new float[4];
PVector[] elliPos = new PVector[4];

void setup() {
  size(700, 700);

  osc = new OscP5(this, 7400);
  max = new NetAddress("127.0.0.1", 12000);

  for (int i = 0; i < 4; i++) {
    elliPos[i] = new PVector();
    elliPos[i].x = width/2 + 200 * cos(i * PI/2);
    elliPos[i].y = height/2 + 200 * sin(i * PI/2);
  }
}

void draw() {
  background(0);
  if (counter != steps) {
    counter++;
    frag = (float)counter/steps;
  }



  noFill();
  stroke(255);
  for (int i = 0; i < 4; i++) {
    ellipse (elliPos[i].x, elliPos[i].y, 40, 40);
  }

  fill (255);
  pos_.x = lerp(pos_.x, pos.x, frag);
  pos_.y = lerp(pos_.y, pos.y, frag);
  ellipse(pos_.x, pos_.y, 10, 10);

  for (int i = 0; i < dist.length; i++) {
    dist[i] = dist(pos_.x, pos_.y, elliPos[i].x, elliPos[i].y);
  }

  oscRoutine();


  println("Distances are: {" + dist[0] +
    ", " + dist[1] + 
    ", " + dist[2] + 
    ", " + dist[3] + "}");
}

void keyPressed() {
}

void mousePressed() {
  if (mouseButton == LEFT) {
    updatePos();
  }
}

void updatePos() {
  counter = 0;
  pos_ = pos.copy(); 
  pos = new PVector(random(width), random(height));
}

void oscRoutine() {

  OscMessage distMsg = new OscMessage("/distances");
  distMsg.add(dist[0]);
  distMsg.add(dist[1]);
  distMsg.add(dist[2]);
  distMsg.add(dist[3]);
  OscMessage posMsg = new OscMessage("/position");
  posMsg.add(pos_.array());

  osc.send(distMsg, max);
  osc.send(posMsg, max);
}

void oscEvent (OscMessage msg) {
  if(msg.checkAddrPattern("/EMO/Blink")) {
    if (msg.get(0).booleanValue()) updatePos();
  }
  if(msg.checkAddrPattern("/COG/Lift")) {
    if (msg.get(0).floatValue() > 0.5) updatePos();
  }
}