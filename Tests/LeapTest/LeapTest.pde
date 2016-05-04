import oscP5.*;
import netP5.*;
import de.voidplus.leapmotion.*;
import development.*;
import controlP5.*;
import java.awt.Robot;


ControlP5 gui;
LeapMotion leap;
OscP5 osc;
NetAddress myAddress;
Cursor leftCursor;
Cursor riteCursor;
Robot rbt;

String myIp = NetInfo.lan();

float vol;

PVector leftHandPos = new PVector(0, 0, 0);
PVector leftHandDyn = new PVector(0, 0, 0);
PVector riteHandPos = new PVector(0, 0, 0);
PVector riteHandDyn = new PVector(0, 0, 0);

void setup() {
  size (800, 400, P3D);
  background (255);

  try {
    rbt = new Robot();
  } catch(Exception e) {
    e.printStackTrace();
  }

  gui = new ControlP5(this);
  leap = new LeapMotion (this);
  leftCursor = new Cursor (leftHandPos, leftHandDyn);
  riteCursor = new Cursor (riteHandPos, riteHandDyn);

  guiSetup();
  oscSetup();
}

void draw () {
  background (255);

  leapRoutine();

  leftCursor.setState(leftHandPos, leftHandDyn);
  riteCursor.setState(riteHandPos, riteHandDyn);

  leftCursor.animate();
  riteCursor.animate();

  oscRoutine();
}

void slider(float value) {
  vol = value;
  fill(gui.isMouseOver(gui.getController("volSlider")) ? color(0): color(255));
  OscBundle bundleMsg = new OscBundle();
  OscMessage volMsg = new OscMessage("/Vol");
  volMsg.add(vol);
  osc.send(bundleMsg, myAddress);
}


void guiSetup() {
  gui.addSlider("volSlider")
    .setPosition(width - 20, height - 120)
    .setSize (20, 100)
    .setRange(0, 1)
    .setValue(1);
}

void oscSetup() {

  int myPort = 10002;
  osc = new OscP5(this, myPort);

  println("Your iP and Port: " + myIp + ", " + myPort);

  myAddress = new NetAddress(myIp, myPort);
}

void leapRoutine() {
  for (Hand hand : leap.getHands()) {
    if (hand.isLeft()) {
      leftHandPos = hand.getPosition();
      leftHandDyn = hand.getDynamics();
    }

    if (hand.isRight()) {
      riteHandPos = hand.getPosition();
      riteHandDyn = hand.getDynamics();
    }
  }
}

void oscRoutine()
{
  //Creación y envío de los mensajes OSC
  OscBundle bundleMsg = new OscBundle();

  OscMessage leapLMsg = new OscMessage("/leapL");

  leapLMsg.add(leftHandPos.array());
  leapLMsg.add(leftHandDyn.array());

  OscMessage leapRMsg = new OscMessage("/leapR");
  leapRMsg.add(riteHandPos.array());
  leapRMsg.add(riteHandDyn.array());

  bundleMsg.add(leapLMsg);
  bundleMsg.add(leapRMsg);

  osc.send(bundleMsg, myAddress);
}

//    RECEIVE

void oscEvent(OscMessage dataIn) {
  if (dataIn.checkAddrPattern("Vol") == true) 
  {
    if (dataIn.checkTypetag("f")) {
      println("Your Volume is: " + dataIn.get(0).floatValue());
    }
  }

  if (dataIn.checkAddrPattern("/leapL") == true) 
  {
    if (dataIn.checkTypetag("ffffff")) {
      leftHandPos.x = dataIn.get(0).floatValue();
      leftHandPos.y = dataIn.get(1).floatValue();
      leftHandPos.z = dataIn.get(2).floatValue();
      leftHandDyn.x = dataIn.get(3).floatValue();
      leftHandDyn.y = dataIn.get(4).floatValue();
      leftHandDyn.z = dataIn.get(5).floatValue();
    }
  }

  if (dataIn.checkAddrPattern("/leapR") == true) 
  {
    if (dataIn.checkTypetag("fffffff")) {
      riteHandPos.x = dataIn.get(0).floatValue();
      riteHandPos.y = dataIn.get(1).floatValue();
      riteHandPos.z = dataIn.get(2).floatValue();
      riteHandDyn.x = dataIn.get(3).floatValue();
      riteHandDyn.y = dataIn.get(4).floatValue();
      riteHandDyn.z = dataIn.get(5).floatValue();
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    rbt.mouseMove (width/2, height/2);
  }
}