PVector newPos = new PVector(0, 0);
PVector pos = new PVector(0, 0);
PVector pos_ = new PVector(0, 0);

void setup() {
  size (640, 480);
  background(255);
  
}

void draw() {
  fill(255, 30);
  rect(0, 0, width, height);
  
  //noStroke(); 
  //fill(map(mouseX, 0, width, 0, 255), map(mouseX, 0, width, 255, 0), (map(mouseX, 0, width, 0, 255) + 128) % 255);
  pos_.x = lerp(pos_.x, newPos.x, 0.05);
  pos_.y = lerp(pos_.y, newPos.y, 0.05);
  pos.x = lerp(pos.x, pos_.x, 0.05);
  pos.y = lerp(pos.y, pos_.y, 0.05);
  ellipse(pos.x, pos.y, 20, 20);
}

void mousePressed() {
  newPos = new PVector(mouseX, mouseY);
}