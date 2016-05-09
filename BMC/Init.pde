void initializeGui() {
  int zoneRadi = 70;
  int zoneDist = 150;
  int zoneTagSize = 80;
  int zoneTagDist = 230;

  ///zone 
  ///Buttons

  for (int i = 0; i < 4; i++) {
    zoneKnob[i] = gui.addKnob("zoneKnob" + i)
      .setPosition(width/2 + 150 * cos(-i*PI/2) - 70, height/2 + 150 * sin(-i*PI/2) - 70)
      .setSize(140, 140);
      linkedParamList.add(zoneKnob[i]);

    zoneGroup[i] = gui.addGroup("zoneGroup" + i)
      .setPosition(width/2 + 150 * cos(-i*PI/2) - 90, height/2 + 150 * sin(-i*PI/2) - 70)
      .setId(i)
      .setSize(180, 140)
      .activateEvent(true)
      .setBackgroundColor(80)
      .setLabel("FX")
      .close();
      
    zoneList[i] = gui.addScrollableList("zoneList" + i)
      .setPosition(2, 2)
      .setSize(100, 100)
      .setBarHeight(10)
      .setItemHeight(10)
      .setLabel("Type")
      .close()
      .setGroup(zoneGroup[i])
      .addItem("Reverb", 0)
      .addItem("Delay", 1)
      .addItem("Distorsion", 2)
      .addItem("Filter", 3)
      .addItem("Pitcher", 4)
      ;
  }
  //====================================================================================
  //====================================================================================
  //====================================================================================
  //====================================================================================
  //====================================================================================
  //====================================================================================

  volSlider = gui.addSlider("volSlider")
    .setPosition(width - 40, height - 150)
    .setRange(-70, 6)
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


  linkedParamList.add(volSlider);
  linkedParamList.add(muteToggle);
  linkedParamList.add(transPlay);
  linkedParamList.add(transStop);
}