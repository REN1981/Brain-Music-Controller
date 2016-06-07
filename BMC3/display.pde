void drawBrain() {
    pushMatrix();
  translate(width/2, height/2, -200);
  rotateX(eleva);
  rotateY(azimu);
  stroke(col, col, col, alpha);
  strokeWeight(0.5);
  brain.draw();
  popMatrix();
  azimu += 0.01;
  eleva = sin(azimu/10);
}

void drawCursor()  {
    noStroke();
  //fill(255, 20);
  //rect(0, 0, width, height);
  //
  stroke(100);
  noFill();
  strokeWeight(10);
  pushMatrix();
  translate(pos.x, pos.y);
  beginShape();
  vertex(curPos[0].x, curPos[0].y);
  bezierVertex(curAng[0].x, curAng[0].y, curAng[1].x, curAng[1].y, curPos[1].x, curPos[1].y);
  bezierVertex(curAng[2].x, curAng[2].y, curAng[3].x, curAng[3].y, curPos[2].x, curPos[2].y);
  bezierVertex(curAng[4].x, curAng[4].y, curAng[5].x, curAng[5].y, curPos[3].x, curPos[3].y);
  endShape();
  popMatrix();
}