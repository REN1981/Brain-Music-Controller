PVector[] curPos = new PVector[4];
PVector[] curAng = new PVector[6];
PVector[] newPos = new PVector[4];
PVector[] newAng = new PVector[6];

PVector[][] elmPos = new PVector[4][4];
PVector[][] elmAng = new PVector[4][6];
float[] coef = new float[4];


PVector nPos = new PVector(0, 0);
PVector pos = new PVector(0, 0);
PVector pos_ = new PVector(0, 0);

int state;

void setup() {
  size (640, 480);

  initElements();
}

void draw() {
  nPos = new PVector(mouseX, mouseY);
  ///Continuous Calculus Stufff
  coef[0] = coefCalc(pos.x/(float)width, true);
  coef[1] = coefCalc(pos.y/(float)height, true);
  coef[2] = coefCalc(pos.x/(float)width, false);
  coef[3] = coefCalc(pos.y/(float)height, false);

  println ("Coefs: " + coef[0] + ", " + coef[1] + ", " + coef[2] + ", " + coef[3] + ")");
  
  for (int i = 0; i < curPos.length; i++) {
    curPos[i] = new PVector (0, 0);
  }
  
  for (int i = 0; i < curAng.length; i++) {
    curAng[i] = new PVector (0, 0);
  }

  
  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curPos.length; i++) {
      curPos[i].x += lerp(0, elmPos[j][i].x, coef[j]);
      curPos[i].y += lerp(0, elmPos[j][i].y, coef[j]);
    }
  }

  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curAng.length; i++) {
      curAng[i].x += lerp(0, elmAng[j][i].x, coef[j]);
      curAng[i].y += lerp(0, elmAng[j][i].y, coef[j]);
    }
  }

  pos_.x = lerp(pos_.x, nPos.x, 0.05);
  pos_.y = lerp(pos_.y, nPos.y, 0.05);
  pos.x = lerp(pos.x, pos_.x, 0.05);
  pos.y = lerp(pos.y, pos_.y, 0.05);

  ///Graphic Stufff
  noStroke();
  fill(255, 20);
  rect(0, 0, width, height);
  //
  stroke(0);
  noFill();
  strokeWeight(13);
  pushMatrix();
  translate(pos.x, pos.y);
  beginShape();
  vertex(curPos[0].x, curPos[0].y);
  bezierVertex(curAng[0].x, curAng[0].y, curAng[1].x, curAng[1].y, curPos[1].x, curPos[1].y);
  bezierVertex(curAng[2].x, curAng[2].y, curAng[3].x, curAng[3].y, curPos[2].x, curPos[2].y);
  bezierVertex(curAng[4].x, curAng[4].y, curAng[5].x, curAng[5].y, curPos[3].x, curPos[3].y);
  endShape();
  popMatrix();
  /*
  stroke(0, 255, 0);
  line(3 * (float)width / 8, 0, 3 * (float)width/8, height);
  line(0, 3 * (float)height/8, width, 3 * (float)height/8);
  line(5 * (float)width / 8, 0, 5 * (float)width/8, height);
  line(0, 5 * (float)height/8, width, 5 * (float)height/8);
  noStroke();
  */
}

void keyPressed () {
  if (keyCode == UP) {
    state++;
    state = state % 4;
    //callElement(state);
  }
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