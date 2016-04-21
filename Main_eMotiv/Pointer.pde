class Pointer {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();


  //Constructor
  Pointer (PVector initPos, PVector initVel, PVector initAcc) {
    pos = initPos;
    vel = initVel;
    acc = initAcc;
  }

  //Setters and Getters
  PVector getPos() {
    return pos;
  }

  PVector getVel() {
    return vel;
  }

  PVector getAcc() {
    return acc;
  }

  void setPos(PVector setPos) {
    pos = setPos;
  }

  void setVel(PVector setVel) {
    vel = setVel;
  }

  void animate() {
    vel.add(acc);
    pos.add(vel);
  }

  void display() {
    drawPointer(pos);
  }

  void drawPointer(PVector curPos) {
    noStroke();
    fill(255);
    pushMatrix();
    translate(curPos.x, curPos.y);
    ellipse(0, 0, 25, 25);
    popMatrix();
  }
  
  void setVel2get2Pos (PVector setPos, PVector setVel) {
    
  } 
}