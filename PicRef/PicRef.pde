PImage photo;

PVector center = new PVector(0, 0);

void setup () {
  size (640, 480);
  photo = loadImage("Elements.jpg");  
}

void draw() {
  background(255);
  image(photo, -20, -10);
  fill(0); 
  
  text("Pos: (" + str(mouseX - center.x) + ", " + str(mouseY - center.y) + ")", 20, 20);
  
  stroke(0);
  fill(255, 0, 0);
  ellipse (center.x, center.y, 15, 15);
  
  fill(255);
  ellipse (mouseX, mouseY, 15, 15);
}

void mousePressed() {
  center = new PVector(mouseX, mouseY);
}