class Cursor {
  PVector pos;
  PVector dyn;
  int r = 10;
  
  Cursor (PVector initPos, PVector initDyn)
  {
    pos = initPos;
    dyn = initDyn;
  }
  
  void setPos (PVector newPos) {
    pos = newPos;
  }
  
  void setDyn (PVector newDyn) {
    dyn = newDyn;
  }
  
  void setState (PVector newPos, PVector newDyn) {
    pos = newPos;
    dyn = newDyn;
  }
  
  PVector getPos () {
    return pos;
  }
  
  PVector getDyn () {
    return dyn;
  }
  
  void animate() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateX(dyn.x);
    rotateY(dyn.y);
    rotateZ(dyn.z);
    box(r, 2*r, 3*r);
    popMatrix();
  }
}