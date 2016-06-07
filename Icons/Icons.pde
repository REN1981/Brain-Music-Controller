int index = 0;
PVector pos1 = new PVector(0, 0);
PVector pos2 = new PVector(0, 0);
PVector pos0 = new PVector(0, 0);

void setup () {
  size(640, 480);
  strokeCap(ROUND);
  strokeJoin(ROUND);

}
//pos1.x, pos1.y, pos2.x, pos2.y
void draw() {
  background (255);
  strokeWeight(10);
  pushMatrix();
  translate(width/2, height/2);
  switch (index) {
  case 0 :
  //Tierra
    beginShape();
    vertex(-65, 45);
    bezierVertex(-63, 23, -42, -20, -25, -33);
    bezierVertex(87, 60, -86, 77, 41, -61);  
    bezierVertex(66, -27, 82, -5, 93, 44);
    endShape();
    break;
  case 1 :
  //Agua
    beginShape();
    vertex(-51, -11);
    bezierVertex(-41, -36, -25, -60, -3, -88);
    bezierVertex(-3, -88, -3, -88, -3, -88);
    bezierVertex(131, 64, -55, 82, -56, 8);
    endShape();
    break;
  case 2 :
  //Aire
    beginShape();
    vertex(-8, -19);
    bezierVertex(32, 51, 74, -88, 3, -57);
    bezierVertex(-120, 6, 41, 99, 65, 0);
    bezierVertex(76, -64, 98, 3, 115, -26);
    endShape();
    break;
  case 3 :
  //Fuego
    beginShape();
    vertex(-48, -9);
    bezierVertex(-35, -27, -33, -37 , -18, -61);
    bezierVertex(0, -11, -5, -8, 13, -89);
    bezierVertex(123, 85, -55, 85, -51, 9);
    endShape();
    break;
  }
  
  strokeWeight(1);
  stroke(0);
  fill(255, 0, 0);
  ellipse (pos1.x, pos1.y, 15, 15);
  fill(0, 255, 0);
  ellipse (pos2.x, pos2.y, 15, 15);
  fill(0, 0, 255);
  ellipse (pos0.x, pos0.y, 15, 15);
  popMatrix();
  fill(255);
  ellipse (mouseX, mouseY, 15, 15);
  fill(0);
  text("Pos: (" + str(mouseX - width/2) + ", " + str(mouseY - height/2) + ")", 20, 20);
  text("Po0: (" + str(pos0.x) + ", " + str(pos0.y) + ")", 20, 40);
  text("Po1: (" + str(pos1.x) + ", " + str(pos1.y) + ")", 20, 60);
  text("Po2: (" + str(pos2.x) + ", " + str(pos2.y) + ")", 20, 80);
  fill(255);
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    if (!keyPressed) {
      pos1 = new PVector(mouseX - width/2, mouseY - height/2);
    } else {
      pos0 = new PVector(mouseX - width/2, mouseY - height/2);
    }
  } else if (mouseButton == RIGHT) {
    pos2 = new PVector(mouseX - width/2, mouseY - height/2);
  }
}


void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      index++;
      if (index > 3) index = 3;
    } else if (keyCode == DOWN) {
      index--;
      if (index < 0) index = 0;
    }
  }
  println (index);
}