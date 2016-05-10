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
  rotateLeft, 
  rotateRight, 
  rotateClockwise, 
  rotateCounterClockwise, 
  rotateForward, 
  rotateReverse, 
  disappear;

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

  gui.addToggle("Position")
    .setSize(20, 20)
    .setPosition(20, 20);

  gui.addToggle("Rotation")
    .setSize(20, 20)
    .setPosition(20, 60);

  gui.addToggle("Disappear")
    .setSize(20, 20)
    .setPosition(20, 100);

  gui.addToggle("OSC")
    .setSize(20, 20)
    .setPosition(20, 140);
}

void draw() {
  background(200);
  if (useLeap) {
    leapAnalisis ();
  }
  
  pushMatrix();
  translate(width/2, height/2);
  translate(push+pull, left+right, lift+drop);
  rotateX(rotateClockwise + rotateCounterClockwise);
  rotateY(rotateForward + rotateReverse);
  rotateZ(rotateLeft+rotateRight);
  noFill();
  stroke(disappear);
  box(10, 20, 30);
  popMatrix();
  
  text("Push: " + str(push) + 
      "\nPull: " + str(pull) + 
      "\nLeft: " + str(left) + 
      "\nRight: " + str(right) + 
      "\nLift: " + str(lift) + 
      "\nDrop: " + str(drop) + 
      "\nRotateLeft: " + str(rotateLeft) + 
      "\nRotateRight: " + str(rotateRight) + 
      "\nRotateClocwise: " + str(rotateClockwise) + 
      "\nRotateCounterClockwise: " + str(rotateCounterClockwise) + 
      "\nRotateForward: " + str(rotateForward) + 
      "\nRotateReverse: " + str(rotateReverse) +
      "\nDisappear: " + str(disappear), 40, height/2);
  
  if (1 == gui.getController("OSC").getValue()) {
      oscRoutine();    
  }
}


void leapAnalisis () {
  for (Hand hand : leap.getHands()) {
    push = (hand.getPosition().y >= 0 ? hand.getPosition().y : 0);
    pull = (hand.getPosition().y <= 0 ? hand.getPosition().y : 0);
    lift = (hand.getPosition().z >= 0 ? hand.getPosition().z : 0);
    drop = (hand.getPosition().z <= 0 ? hand.getPosition().z : 0);
    right = (hand.getPosition().x >= 0 ? hand.getPosition().x : 0);
    left = (hand.getPosition().x <= 0 ? hand.getPosition().x : 0);
    rotateLeft = (hand.getYaw() <= 0 ? hand.getYaw() * PI /180 : 0);  
    rotateRight = (hand.getYaw() >= 0 ? hand.getYaw() * PI /180 : 0);
    rotateClockwise = (hand.getRoll() >= 0 ? hand.getRoll() * PI /180 : 0);
    rotateCounterClockwise = (hand.getRoll() <= 0 ? hand.getRoll() * PI /180 : 0);
    rotateForward = (hand.getPitch() <= 0 ? hand.getPitch() * PI /180 : 0);
    rotateReverse = (hand.getPitch() <= 0 ? hand.getPitch() * PI /180 : 0); 
    disappear = hand.getGrabStrength();
    hand.draw();
  }
}

void oscRoutine() {

  OscBundle bndle = new OscBundle();

  //========================================================

  OscMessage neutralMsg = new OscMessage("/COG/NEUTRAL");
  neutralMsg.add(neutral);

  //========================================================
  if (1 == gui.getController("Position").getValue()) {
    OscMessage pushMsg = new OscMessage("/COG/PUSH");
    pushMsg.add(push);
    bndle.add(pushMsg);

    OscMessage pullMsg = new OscMessage("/COG/PULL");
    pullMsg.add(pull);
    bndle.add(pullMsg);

    OscMessage liftMsg = new OscMessage("/COG/LIFT");
    liftMsg.add(lift);
    bndle.add(liftMsg);

    OscMessage dropMsg = new OscMessage("/COG/DROP");
    dropMsg.add(drop);
    bndle.add(dropMsg);

    OscMessage leftMsg = new OscMessage("/COG/LEFT");
    leftMsg.add(left);
    bndle.add(leftMsg);

    OscMessage rightMsg = new OscMessage("/COG/RIGHT");
    rightMsg.add(right);
    bndle.add(rightMsg);
  }
  //========================================================

  if (1 == gui.getController("Rotation").getValue()) {
    OscMessage rotateLeftMsg = new OscMessage("/COG/ROTATE_LEFT");
    rotateLeftMsg.add(rotateLeft);
    bndle.add(rotateLeftMsg);

    OscMessage rotateRightMsg = new OscMessage("/COG/ROTATE_RIGHT");
    rotateRightMsg.add(rotateRight);
    bndle.add(rotateRightMsg);

    OscMessage rotateClockwiseMsg = new OscMessage("/COG/ROTATE_CLOCKWISE");
    rotateClockwiseMsg.add(rotateClockwise);
    bndle.add(rotateClockwiseMsg);

    OscMessage rotateCounterClockwiseMsg = new OscMessage("/COG/ROTATE_COUNTERCLOCKWISE");
    rotateCounterClockwiseMsg.add(rotateCounterClockwise);
    bndle.add(rotateCounterClockwiseMsg);

    OscMessage rotateForwardMsg = new OscMessage("/COG/ROTATE_FORWARD");
    rotateForwardMsg.add(rotateForward);
    bndle.add(rotateForwardMsg);

    OscMessage rotateReverseMsg = new OscMessage("/COG/ROTATE_REVERSE");
    rotateReverseMsg.add(rotateReverse);
    bndle.add(rotateReverseMsg);
  }
  //========================================================
  if (1 == gui.getController("Disappear").getValue()) {
    OscMessage disappearMsg = new OscMessage("/COG/DISAPPEAR");
    disappearMsg.add(disappear);
    bndle.add(disappearMsg);
  }
  osc.send(bndle, txDir);
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