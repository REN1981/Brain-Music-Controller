void zoneListChange (int m, int n)
{
  if (zoneParams[m].size() > 0) {
    for (int i = 0; i < zoneParams[m].size(); i++) {
      zoneParams[m].get(i).remove();
    }
  }
  switch (n) {
  case 0 :
    //Reverb
    Slider reverbTime = gui.addSlider("ReverbTime")
      .setPosition (10, 20)
      .setSize (80, 10)
      .setLabel("Time")
      .setRange(0.1, 3)
      .setGroup(zoneGroup[m]);


    Slider reverbPreDelay = gui.addSlider("ReverbPreDelay")
      .setPosition (10, 40)
      .setSize (80, 10)
      .setLabel("Pre-Delay")
      .setRange(0, 120 )
      .setGroup(zoneGroup[m]);

    zoneParams[m].add(reverbTime);
    zoneParams[m].add(reverbPreDelay);
    linkedParamList.add(reverbTime);
    linkedParamList.add(reverbPreDelay);
    zoneKnob[m].setLabel("Reverb");
    
    break;
  case 1 :
    //Delay
    Slider delayTime = gui.addSlider("DelayTime")
      .setPosition (10, 20)
      .setSize (80, 10)
      .setLabel("Time")
      .setRange(0.1, 3)
      .setGroup(zoneGroup[m]);

    Slider delayFeedback = gui.addSlider("DelayFeedback")
      .setPosition (10, 40)
      .setSize (80, 10)
      .setLabel("Feedback")
      .setRange(0, 120 )
      .setGroup(zoneGroup[m]);

    zoneParams[m].add(delayTime);
    zoneParams[m].add(delayFeedback);
    linkedParamList.add(delayTime);
    linkedParamList.add(delayFeedback);
    zoneKnob[m].setLabel("Delay");
    break;
  case 2 :
    //Distorsion
    Slider distLowCut = gui.addSlider("LowCut")
      .setPosition (10, 20)
      .setSize (80, 10)
      .setLabel("Low Cut")
      .setRange(0.1, 3)
      .setGroup(zoneGroup[m]);

    Slider distType = gui.addSlider("Type")
      .setPosition (10, 40)
      .setSize (80, 10)
      .setLabel("Distorsion Type")
      .setRange(0, 120 )
      .setGroup(zoneGroup[m]);

    zoneParams[m].add(distLowCut);
    zoneParams[m].add(distType);
    linkedParamList.add(distLowCut);
    linkedParamList.add(distType);
    zoneKnob[m].setLabel("Distorsion");
    break;
  case 3 :
  //Filter
    Slider filterReso = gui.addSlider("Resonance")
      .setPosition (10, 20)
      .setSize (80, 10)
      .setLabel("Resonance")
      .setRange(0.1, 3)
      .setGroup(zoneGroup[m]);

    Slider filterSlope = gui.addSlider("Slope")
      .setPosition (10, 40)
      .setSize (80, 10)
      .setLabel("Slope")
      .setRange(0, 120 )
      .setGroup(zoneGroup[m]);

    zoneParams[m].add(filterReso);
    zoneParams[m].add(filterSlope);
    linkedParamList.add(filterReso);
    linkedParamList.add(filterSlope);
    zoneKnob[m].setLabel("Filter");
    zoneKnob[m].setRange(0,20000);

    break;
  case 4 :
  //Pitcher
    Slider pitchFineTune = gui.addSlider("FineTune")
      .setPosition (10, 20)
      .setSize (80, 10)
      .setLabel("Tune")
      .setRange(0.1, 3)
      .setGroup(zoneGroup[m]);

    Slider pitchMix = gui.addSlider("Mix")
      .setPosition (10, 40)
      .setSize (80, 10)
      .setLabel("Mix")
      .setRange(0, 120 )
      .setGroup(zoneGroup[m]);

    zoneParams[m].add(pitchFineTune);
    zoneParams[m].add(pitchMix);
    linkedParamList.add(pitchFineTune);
    linkedParamList.add(pitchMix);
    zoneKnob[m].setLabel("Pitcher");
    break;
  default:
    break;
  }
}