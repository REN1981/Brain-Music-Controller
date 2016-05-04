void initializeGui() {
  int zoneRadi = 70;
  int zoneDist = 150;
  int zoneTagSize = 25;
  int zoneTagDist = 245;
  
  ///zone 
  ///Buttons

  upZone = gui.addButton("upZone")
    .setPosition(width/2 - zoneRadi, height/2 - zoneDist -  zoneRadi)
    .setSize(2*zoneRadi, 2*zoneRadi)
    .setView(new CircularButton());

  downZone = gui.addButton("downZone")
    .setPosition(width/2 - zoneRadi, height/2 + zoneDist - zoneRadi)
    .setSize(2*zoneRadi, 2*zoneRadi)
    .setView(new CircularButton());

  leftZone = gui.addButton("leftZone")
    .setPosition(width/2 - zoneDist - zoneRadi, height/2 - zoneRadi)
    .setSize(2*zoneRadi, 2*zoneRadi)
    .setView(new CircularButton());

  rightZone = gui.addButton("rightZone")
    .setPosition(width/2 + zoneDist - zoneRadi, height/2 - zoneRadi)
    .setSize(2*zoneRadi, 2*zoneRadi)
    .setView(new CircularButton());

  //////////////////////////////////////////////////////////////////////

  upZoneTag = gui.addButton("upZoneTag")
    .setPosition(width/2 - zoneTagSize, height/2 - zoneTagDist)
    .setSize(zoneTagSize * 2, zoneTagSize)
    .setLabelVisible(false);

  downZoneTag = gui.addButton("downZoneTag")
    .setPosition(width/2 - zoneTagSize, height/2 + zoneTagDist - zoneTagSize)
    .setSize(zoneTagSize * 2, zoneTagSize)
    .setLabelVisible(false);

  leftZoneTag = gui.addButton("leftZoneTag")
    .setPosition(width/2 - zoneTagDist - zoneTagSize, height/2 - zoneTagSize/2)
    .setSize(zoneTagSize * 2, zoneTagSize)
    .setLabelVisible(false);

  rightZoneTag = gui.addButton("rightZoneTag")
    .setPosition(width/2 + zoneTagDist - zoneTagSize, height/2 - zoneTagSize/2)
    .setSize(zoneTagSize * 2, zoneTagSize)
    .setLabelVisible(false);

  //////////////////////////////////////////////////////////////////////

  volSlider = gui.addSlider("volSlider")
    .setPosition(width - 40, height - 150)
    .setRange(0, 100)
    .setSize(20, 100)
    .setValue(0)
    .setDecimalPrecision(0)
    .setLabel("Vol");

  muteToggle = gui.addToggle("muteToggle")
    .setPosition(width - 40, height - 35)
    .setSize(20, 20)
    .setValue(false)
    .setLabel("Mute");
    
  //// TRANSPORT

  transPlay = gui.addToggle("transPlay")
    .setPosition(width - 120, height - 40)
    .setSize (20, 20)
    .setLabelVisible (false)
    ;
    
  transStop = gui.addButton("transStop")
    .setPosition(width - 160, height - 40)
    .setSize (20, 20)
    .setLabelVisible (false)
    ;

  paramList.add(volSlider);
  paramList.add(muteToggle);
}