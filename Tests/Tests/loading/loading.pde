class LoadingWindow {
  int numSteps;
  int r; //
  int R;
  int maxSize;
  int counter;
  int timeEvent;
  boolean updateFlag;

  LoadingWindow(int initNumSteps, int initr, int initR) {
    numSteps = initNumSteps;
    r = initr;
    R = initR;
    maxSize = width * height;
    counter = 0;
    timeEvent = 0;
    updateFlag = false;
  }
  
  void count () {
    if (timeEvent != floor((float)millis() / 100))
    {
      counter++;
      updateFlag = false;
      timeEvent = floor((float)millis() / 100);
    }
  }

  void animate() {
    int area = mouseX*mouseY;
    noStroke();
    pushMatrix();
    translate(width/2 - r, height/2 - r);
    fill (255 * (maxSize - area)/maxSize);
    for (int i = 0; i < numSteps; i++)
    {
      fill (((i + counter) % numSteps) *  255 / numSteps);
      ellipse(R * cos(i * TWO_PI / numSteps), 
        R * sin(i * TWO_PI / numSteps), 
        2 * r, 2 * r);
    }
    popMatrix();
  }
}


//====================================================================================

LoadingWindow loading;
LoadingWindow loading2;

void setup() {
  size (640, 480);
  loading = new LoadingWindow(12, 5, 30);
  loading2 = new LoadingWindow(12, 5, 30);
}

void draw() {
  background(200);
  loading.count();
  loading2.count();
  loading.animate();
  pushMatrix();
  translate ( 10, 10);
  loading2.animate();
  popMatrix();
  
}