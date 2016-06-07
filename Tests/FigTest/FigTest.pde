PVector[][] figs = new PVector[6][6];
PVector coef = new PVector(0, 0);

void setup() {
  size(640, 480);
  initFigs();
}

void draw() {
  background(255);

  coef.x = mouseX/(float)width;
  coef.y = mouseY/(float)height;



  for (int i = 0; i < 6; i++) {
    figs[5][i].x = lerp(figs[0][i].x, figs[2][i].x, coef.x);
    figs[5][i].y = lerp(figs[1][i].y, figs[3][i].y, coef.y);
  }


  pushMatrix();
  translate(mouseX, mouseY);
  beginShape();
  vertex(figs[5][0].array());
  vertex(figs[5][1].array());
  vertex(figs[5][2].array());
  vertex(figs[5][3].array());
  vertex(figs[5][4].array());
  vertex(figs[5][5].array());
  endShape();
  popMatrix();
}

void initFigs() {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 6; j++) {
      figs[i][j] = new PVector (random(200)-100, random(200)-100);
    }
  }
  for (int i = 0; i < 6; i++) {
    figs[4][i] = new PVector (0, 0);
    figs[5][i] = new PVector (0, 0);
  }
}