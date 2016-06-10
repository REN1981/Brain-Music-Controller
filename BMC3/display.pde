void drawLights() {
  /*
  Esta función permitirá dibujar el fondo y el color
  que se utilizará en el mismo.
  */
  pointLight(red(curCol), green(curCol), blue(curCol), pos.x, pos.y, 400);
  pushMatrix();
  noStroke();
  translate (width/2, height/2, -2000);
  fill(180);
  sphere(1450);
  popMatrix();
}

void drawBrain() {
  /*
  Se dibuja el cerebro en 3D definiendo
  su color, transparencia y rotación
  
  Finalmente se redefine el azimuth y 
  la elevación para generar la rotación
  del cerebro frame tras frame.
  */
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

void drawCursor() {
  
  /*
  Esta función va a dibujar el cursor
  a partir de las posiciones de los vértices y
  de los puntos de control de Bezier definidos
  en la función del cálculo.
  */
  
  /*
  Inicialmente se calcula un color 40% más
  brillante que el color del fondo para definir
  el del cursor.
  
  Para esto, se utiliza la variable curCol y se
  definen unos valores de rgb para el stroke
  del cursor.
  
  Los colores se almacenan como números de 32bits
  en donde cada 8 bits almacenan una de las variables
  que determina el color final (argb).
  
  Debido a esto es posible utilizar bitwise operators
  para acceder a cada color de manera eficiente.
  
  Posteriormente se utiliza una interpolación entre
  el color del fondo y un nuevo valor de rgb
  y finalmetne se define el stroke a través de estos
  valores.
  */
  
  /*Este bitwise operator permite desplazar el número 
  curCol 16 posiciones a la derecha y multiplicarlo bit a bit 
  por el número 11111111 obteniendo así r.
  */
  float r = (curCol >> 16) & 0xFF;
  
  /*Este bitwise operator permite desplazar el número 
  curCol 8 posiciones a la derecha y multiplicarlo bit a bit 
  por el número 11111111 obteniendo así g.
  */
  float g = (curCol >> 8) & 0xFF;
  
  /*Este bitwise operator permite multiplicar bit a bit
  el número curCol por el número número 11111111 obteniendo así b.
  */
  float b = curCol & 0xFF;
  
  /*
  Se determina una fracción de 0.4 y se realiza la interpolación
  de acuerdo a la misma.
  */
  float frac = 0.4;
  r = lerp(r, 255, frac);
  g = lerp(g, 255, frac);
  b = lerp(b, 255, frac);
  
  
  /*
  El resto es dibujar el cursor a partir de los vértices y las
  posiciones de control.
  y utilizar la función translate para ponerla en la posición
  pos.x y pos.y
  */
  stroke(r, g, b);
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