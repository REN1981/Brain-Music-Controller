import de.voidplus.leapmotion.*;
import development.*;

Pointer pointer;
LeapMotion leap;

PVector leapPos = new PVector();

void setup() {
  size(480, 640);
  
  leapSetup();
  
  pointer = new Pointer(new PVector(width/2, height/2), new PVector(0.0f,0.0f), new PVector(0.0f,0.0f));
}

void draw() {
  background(0);
  graphics();
  leapAnalisis();
  pointer.setPos(new PVector(leapPos.x, leapPos.y));
  pointer.animate();
  pointer.display();
  pointer.getPos();
  
  fill(255);
  text(str((int)leapPos.x) + ", " + str((int)leapPos.y), width/2, height/2 - 20);
}