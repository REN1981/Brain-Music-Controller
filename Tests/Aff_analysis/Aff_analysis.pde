import netP5.*;
import oscP5.*;

OscP5 osc;

float excit, inte, frust, medit;
float excitMax, inteMax, frustMax, meditMax;
float excitMin, inteMin, frustMin, meditMin;
float excitMean, inteMean, frustMean, meditMean;
float excitDev, inteDev, frustDev, meditDev;

int n = 100;


void setup() {
  size (640, 480);
  osc = new OscP5(this, 7400);

  excitMean = 0; 
  inteMean = 0;
  frustMean = 0; 
  meditMean = 0;
  excitDev = 0;
  inteDev = 0;
  frustDev = 0;
  meditDev = 0;
  excitMax = 0;
  excitMin = 1;
  inteMax = 0;
  inteMin = 1;
  meditMax = 0;
  meditMin = 1;
  frustMax = 0;
  frustMin = 1;
  
}

void draw() {
  background(255);

  fill(0);
  stroke(0);
  text("curExcit: " + str(excit) + " [" + str(excitMin) + ", " + str(excitMax) + "]" +
    "\nexcitMean: " + str(excitMean) +
    "\nexcitDev: " + str(excitDev), 20, height/4 - 40);

  text("curInte: " + str(inte) +" [" + str(inteMin) + ", " + str(inteMax) + "]" +
    "\nInteMean: " + str(inteMean) +
    "\nInteDev: " + str(inteDev), 20, 2 * height/4 - 40);

  text("curMedit: " + str(medit) +" [" + str(meditMin) + ", " + str(meditMax) + "]" +
    "\nmeditMean: " + str(meditMean) +
    "\nmeditDev: " + str(meditDev), 20, 3 * height/4 - 40);

  text("curFrust: " + str(frust) +" [" + str(frustMin) + ", " + str(frustMax) + "]" +
    "\nfrustMean: " + str(frustMean) +
    "\nfrustDev: " + str(frustDev), 20, height - 40);

  //ellipse(width/2, height/2 + 100 * (excit - 0.5), 50, 50);
}

void oscEvent(OscMessage newMsg) {
  if (newMsg.checkAddrPattern("/AFF/Excitement")) {
    println("ya0");
    excit = newMsg.get(0).floatValue();
    if(excitMax < excit) excitMax = excit;
    if(excitMin > excit) excitMin = excit;
    if(excitMean == 0) excitMean = excit;
    excitMean = (excitMean * n + excit)/(n+1);
    excitDev = sqrt((pow(excitDev, 2) * (n-2) + pow((excit - excitMean), 2))/(n-1));
  }
  if (newMsg.checkAddrPattern("/AFF/Engaged/Bored")) {
    println("ya1");
    inte = newMsg.get(0).floatValue();
    if(inteMax < inte) inteMax = inte;
    if(inteMin > inte) inteMin = inte;
    if(inteMean == 0) inteMean = inte;
    inteMean = (inteMean * n + inte)/(n+1);
    inteDev = sqrt((pow(inteDev, 2) * (n-2) + pow((inte - inteMean), 2))/(n-1));
  }
  if (newMsg.checkAddrPattern("/AFF/Meditation")) {
    println("ya2");
    medit = newMsg.get(0).floatValue();
    if(meditMax < medit) meditMax = medit;
    if(meditMin > medit) meditMin = medit;
    if(meditMean == 0) meditMean = medit;
    meditMean = (meditMean * n + medit)/(n+1);
    meditDev = sqrt((pow(meditDev, 2) * (n -2) + pow((medit - meditMean), 2))/(n-1));
  }
  if (newMsg.checkAddrPattern("/AFF/Frustration")) {
    println("ya3");
    frust = newMsg.get(0).floatValue();
    if(frustMax < frust) frustMax = frust;
    if(frustMin > frust) frustMin = frust;
    if(frustMean == 0) frustMean = frust;
    frustMean = (frustMean * n + frust)/(n+1);
    frustDev = sqrt((pow(frustDev, 2) * (n -2) + pow((frust - frustMean), 2))/(n-1));
  }
}