import netP5.*;
import oscP5.*;
import controlP5.*;

ControlP5 gui;
OscP5 osc;
NetAddress max;

boolean isUpZoneTagOpen = true;
boolean isDownZoneTagOpen = false;
boolean isLeftZoneTagOpen = false;
boolean isRightZoneTagOpen = false;

/////////////////////////////////
Button upZone;
Button downZone;
Button leftZone;
Button rightZone;

/////////////////////////////////
Button upZoneTag;
Button downZoneTag;
Button leftZoneTag;
Button rightZoneTag;

/////////////////////////////////
Slider volSlider;
Toggle muteToggle;
Toggle transPlay;
Button transStop;

ControllerList paramList;

void setup() {
  size (640, 480);
  noStroke();
  gui = new ControlP5(this);
  osc = new OscP5(this, 12001);
  max = new NetAddress("127.0.0.1", 12000);

  paramList = new ControllerList();
  initializeGui();
}

void draw() {
  background(0);
  text(str(mouseX) + ", " + str(mouseY), width/4, height - 20);
  stroke(255);
  line(0, 0, width, height);
  line(width, 0, 0, height);
  
  float x = upZoneTag.x(upZoneTag.getPosition());
  x += ((isUpZoneTagOpen==true ? 0:-200) - x) * 0.2;;
  float y = upZoneTag.y(upZoneTag.getPosition());
  upZoneTag.setPosition(x,y);
}

void controlEvent(ControlEvent newEvent) {
  OscMessage msg = new OscMessage("/" + newEvent.getController().getName());
  msg.add(newEvent.getController().getValue());
  osc.send(msg, max);
  println("Controller used: " + newEvent.getController().getName());
}

void oscEvent(OscMessage msg) {
  for (int i = 0; i < paramList.size(); i++)
  {
    if (msg.checkAddrPattern("/" + paramList.get(i).getName())) {
      if (msg.checkTypetag("f")) {
        gui.getController(paramList.get(i).getName()).changeValue(msg.get(0).floatValue());
      }
      if (msg.checkTypetag("i")) {
        gui.getController(paramList.get(i).getName()).changeValue(msg.get(0).intValue());
      }
    }
  }
}

void upZoneTag () {
  isUpZoneTagOpen = !isUpZoneTagOpen;
}

void downZoneTag () {
  isDownZoneTagOpen = !isDownZoneTagOpen;
}

void leftZoneTag () {
  isLeftZoneTagOpen = !isLeftZoneTagOpen;
}

void rightZoneTag () {
  isRightZoneTagOpen = !isRightZoneTagOpen;
}