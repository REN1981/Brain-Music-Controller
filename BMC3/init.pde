void initGui() {
  vol = gui.addSlider("volume")
  .setSize(10, 150)
  .setPosition(width - 40, height - 190)
  .setRange(-60,6)
  //.setLabelVisible(false)
  ;
  
  mute = gui.addToggle("mute")
  .setSize(10, 10)
  .setPosition(width - 40, height - 25);
}


void initElements () {
  for (int i = 0; i < curPos.length; i++) {
    curPos[i] = new PVector(0, 0);
    newPos[i] = new PVector(0, 0);
  }

  for (int i = 0; i < curAng.length; i++) {
    curAng[i] = new PVector(0, 0);
    newAng[i] = new PVector(0, 0);
  }

  //Agua
  elmPos[0][0] = new PVector(-51, -11);
  elmPos[0][1] = new PVector(-3, -88);
  elmPos[0][2] = new PVector(-3, -88);
  elmPos[0][3] = new PVector(-56, 8);

  elmAng[0][0] = new PVector(-41, -36);
  elmAng[0][1] = new PVector(-25, -60);
  elmAng[0][2] = new PVector(-3, -88);
  elmAng[0][3] = new PVector(-3, -88);
  elmAng[0][4] = new PVector(131, 64);
  elmAng[0][5] = new PVector(-55, 82);


  //Aire
  elmPos[3][0] = new PVector(-8, -19);
  elmPos[3][1] = new PVector(3, -57);
  elmPos[3][2] = new PVector(65, 0);
  elmPos[3][3] = new PVector(115, -26);

  elmAng[3][0] = new PVector(32, 51);
  elmAng[3][1] = new PVector(74, -88);
  elmAng[3][2] = new PVector(-120, 6);
  elmAng[3][3] = new PVector(41, 99);
  elmAng[3][4] = new PVector(76, -64);
  elmAng[3][5] = new PVector(98, 3);


  //Fuego
  elmPos[2][0] = new PVector(-48, -9);
  elmPos[2][1] = new PVector(-18, -61);
  elmPos[2][2] = new PVector(13, -89);
  elmPos[2][3] = new PVector(-51, 9);

  elmAng[2][0] = new PVector(-35, -27);
  elmAng[2][1] = new PVector(-33, -37);
  elmAng[2][2] = new PVector(0, -11);
  elmAng[2][3] = new PVector(-5, -8);
  elmAng[2][4] = new PVector(123, 85);
  elmAng[2][5] = new PVector(-55, 85);

  //Tierra
  elmPos[1][0] = new PVector(-65, 45);
  elmPos[1][1] = new PVector(-25, -33);
  elmPos[1][2] = new PVector(41, -61);
  elmPos[1][3] = new PVector(93, 44);

  elmAng[1][0] = new PVector(-63, 23);
  elmAng[1][1] = new PVector(-42, -20);
  elmAng[1][2] = new PVector(87, 60);
  elmAng[1][3] = new PVector(-86, 77);
  elmAng[1][4] = new PVector(66, -27);
  elmAng[1][5] = new PVector(82, -5);
}


float coefCalc (float x, boolean polarity) {
  float y = 0;
  if (!polarity) {
    y = 1 - 8 * x / 3.0f;
    if (y < 0) y = 0;
  } else {
    y = 8 * x /3.0f - 5/3.0f;
    if (y < 0) y = 0;
  }
  return y;
}