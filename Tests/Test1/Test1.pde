Pointer pointer;

int miVariable = 100;

void setup ()
{
  size (640, 480);
  
  pointer = new Pointer(width/2, height/2);
  background(0);
  
}


void draw()
{
  background(100);
  pointer.animate();
  
}