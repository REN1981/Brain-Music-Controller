import saito.objloader.*;

OBJModel brain;

float azimu;
float eleva;

float col = 200;
float alpha = 40;

void setup()
{
  size(700, 700, P3D);
  brain = new OBJModel(this, "brain-simple-mesh.obj", "relative", LINES);
  brain.scale(60);
}

void draw() {
  background(0);

  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(eleva);
  rotateY(azimu);
  brain.draw();
  stroke(col, col, col, alpha);
  popMatrix();
  azimu += 0.1;
  eleva = sin(azimu/10);
}

void mouseDragged()
{
  azimu += (mouseX - pmouseX) * 0.01;
  eleva -= (mouseY - pmouseY) * 0.01;
}