class Pointer {
  PVector pos = new PVector ();
  Pointer (int init_x, int init_y) {
    pos.x = init_x;
    pos.y = init_y;
  }
  
  void animate () {
    pos.x = mouseX;
    pos.y = mouseY;
    
    noStroke();
    color(255, 0, 0);
    ellipse(pos.x, pos.y, 25, 25);
  }
}
  
  