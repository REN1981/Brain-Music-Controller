/*
/COG/NEUTRAL; 
 /COG/PUSH;
 /COG/PULL; 
 /COG/LIFT; 
 /COG/DROP; 
 /COG/LEFT; 
 /COG/RIGHT; 
 /COG/ROTATE_LEFT; 
 /COG/ROTATE_RIGHT; 
 /COG/ROTATE_CLOCKWISE; 
 /COG/ROTATE_COUNTER_CLOCKWISE; 
 /COG/ROTATE_FORWARD; 
 /COG/ROTATE_REVERSE; 
 /COG/DISAPPEAR;
 
 /AFF/Engaged/Bored; 
 /AFF/Excitement; 
 /AFF/Excitement Long Term; 
 /AFF/Meditation; 
 /AFF/Frustration; 
 
 /EXP/WINK_LEFT;  bool
 /EXP/WINK_RIGHT;  bool
 /EXP/BLINK; bool
 /EXP/LEFT_LID; bool
 /EXP/RIGHT_LID; bool
 /EXP/HORIEYE; float
 /EXP/VERTEYE; float
 /EXP/SMILE; float
 /EXP/CLENCH; float
 /EXP/LAUGH; float
 /EXP/SMIRK_LEFT; float 
 /EXP/SMIRK_RIGHT; float
 /EXP/FURROW; float
 /EXP/EYEBROW. float
 
 */


import netP5.*;
import oscP5.*;
import controlP5.*;
import de.voidplus.leapmotion.*;
import development.*;

ControlP5 gui;
OscP5 osc;
LeapMotion leap;
NetAddress txDir;

boolean useLeap = false;
float neutral, 
  push, 
  pull, 
  lift, 
  drop, 
  left, 
  right, 
  rotate_left, 
  rotate_right, 
  rotate_clockwise, 
  rotate_counterclockwise, 
  rotate_foreward, 
  rotate_reverse, 
  disapear;

void setup() {
  size (640, 480, P3D);

  gui = new ControlP5(this);
  osc = new OscP5(this, 12001);
  leap = new LeapMotion(this);
  txDir = new NetAddress("127.0.0.1", 7400);

  initGui();
}

void initGui() {
  gui.addToggle("controlType")
    .setSize(20, 20)
    .setPosition(width - 30, height - 30);
}

void draw() {
  background(0);
  leapAnalisis ();
}


void leapAnalisis () {
  for (Hand hand : leap.getHands()) {
    
    
    push = (hand.getPosition().y >= 0 ? hand.getPosition().y : 0);
    pull = (hand.getPosition().y <= 0 ? hand.getPosition().y : 0);
    lift = (hand.getPosition().z >= 0 ? hand.getPosition().z : 0);
    drop = (hand.getPosition().z <= 0 ? hand.getPosition().z : 0);
    right = (hand.getPosition().x >= 0 ? hand.getPosition().x : 0);
    left = (hand.getPosition().x <= 0 ? hand.getPosition().x : 0);
    rotate_left = (hand.getYaw() <= 0 ? hand.getYaw() : 0);  
    rotate_right = (hand.getYaw() >= 0 ? hand.getYaw() : 0);
    rotate_clockwise = (hand.getRoll() >= 0 ? hand.getRoll() : 0);
    rotate_counterclockwise = (hand.getRoll() <= 0 ? hand.getRoll() : 0);
    rotate_foreward = (hand.getPitch() <= 0 ? hand.getPitch() : 0);
    rotate_reverse = (hand.getPitch() <= 0 ? hand.getPitch() : 0); 
    disapear = hand.getGrabStrength();


    hand.draw();
  }
}

void controlType (boolean value) {
  useLeap = value;
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == UP) {
    }
    if (keyCode == DOWN) {
    }
    if (keyCode == LEFT) {
    }
    if (keyCode == RIGHT) {
    }
  }
}