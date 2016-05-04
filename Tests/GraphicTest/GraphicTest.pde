void setup(){
  size (640, 480);
}

void draw(){
  background (0);
  
  triangle();
  
  int r = 100;
  int d = 150;
  
  pushMatrix();
  translate(width/2, height/2);
  fill (255);
  ellipse(d, 0, r, r);
  ellipse(0, d, r, r);
  ellipse(-d, 0, r, r);
  ellipse(0, -d, r, r);
  popMatrix();
  
}