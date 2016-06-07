void calculations() {
  coef[0] = coefCalc(pos.x/(float)width, true);
  coef[1] = coefCalc(pos.y/(float)height, true);
  coef[2] = coefCalc(pos.x/(float)width, false);
  coef[3] = coefCalc(pos.y/(float)height, false);
  
  for (int i = 0; i < curPos.length; i++) {
    curPos[i] = new PVector (0, 0);
  }
  
  for (int i = 0; i < curAng.length; i++) {
    curAng[i] = new PVector (0, 0);
  }

  
  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curPos.length; i++) {
      curPos[i].x += lerp(0, elmPos[j][i].x, coef[j]);
      curPos[i].y += lerp(0, elmPos[j][i].y, coef[j]);
    }
  }

  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curAng.length; i++) {
      curAng[i].x += lerp(0, elmAng[j][i].x, coef[j]);
      curAng[i].y += lerp(0, elmAng[j][i].y, coef[j]);
    }
  }

  pos_.x = lerp(pos_.x, nPos.x, 0.05);
  pos_.y = lerp(pos_.y, nPos.y, 0.05);
  pos.x = lerp(pos.x, pos_.x, 0.05);
  pos.y = lerp(pos.y, pos_.y, 0.05);
}