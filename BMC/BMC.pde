//===========================================================================
// Reverb -> [reverbSend] -> {time, density, preDelay}
// Delay -> [delaySend] -> {time, feedback}
// Distrosion -> [amount] -> {lowCut}
//===========================================================================
import netP5.*;
import oscP5.*;
import controlP5.*;

ControlP5 gui;
OscP5 osc;
NetAddress max;

//===========================================================================

Knob[] zoneKnob = new Knob[4];

//===========================================================================

Group[] zoneGroup = new Group[4];
ScrollableList[] zoneList = new ScrollableList[4];
ControllerList[] zoneParams = new ControllerList[4];


//===========================================================================

Slider volSlider;
Toggle muteToggle;
Toggle transPlay;
Button transStop;

ControllerList linkedParamList;

void setup() {
  size (640, 480);
  noStroke();
  gui = new ControlP5(this);
  osc = new OscP5(this, 7400);
  max = new NetAddress("127.0.0.1", 12000);

  linkedParamList = new ControllerList();
  for (int i = 0; i < 4; i++) {
    zoneParams[i] = new ControllerList();
  }
  initializeGui();
}

void draw() {
  background(0);
  text(str(mouseX) + ", " + str(mouseY), width/4, height - 20);
  stroke(255);
  line(0, 0, width, height);
  line(width, 0, 0, height);
}

void controlEvent(ControlEvent newEvent) {

  if (newEvent.isController()) {
    println("Controller used: " + newEvent.getController().getName());
    for (int i = 0; i < linkedParamList.size(); i++) {
      if (newEvent.getController().getName().equals(linkedParamList.get(i).getName())) {
        //send OSC Messages;
        OscMessage msg = new OscMessage("/" + newEvent.getController().getName());
        msg.add(newEvent.getController().getValue());
        osc.send(msg, max);
      }
    }
    for (int i = 0; i < 4; i++)
    {
      if (newEvent.isFrom(zoneList[i])) {
        zoneListChange(i, (int)newEvent.getValue()); 
        //newEvent.getController().bringToFront(); /// ???? makes array out of Bounds
      }
    }
  } else if (newEvent.isGroup()) {
    println("Group used: " + newEvent.getGroup().getName());
    if (newEvent.getGroup().isOpen())
    {
      zoneKnob[newEvent.getGroup().getId()].hide();
    } else {
      zoneKnob[newEvent.getGroup().getId()].show();
    }
  }
}

void oscEvent(OscMessage msg) {
  for (int i = 0; i < linkedParamList.size(); i++)
  {
    if (msg.checkAddrPattern("/" + linkedParamList.get(i).getName())) {
      if (msg.checkTypetag("f")) {
        gui.getController(linkedParamList.get(i).getName()).changeValue(msg.get(0).floatValue());
      }
      if (msg.checkTypetag("i")) {
        gui.getController(linkedParamList.get(i).getName()).changeValue(msg.get(0).intValue());
      }
    }
  }
}