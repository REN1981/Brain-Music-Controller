void calculations() {
  
  /*
  Funciones para determinar los coeficientes
  que determinarán la el grado de expresión
  del cursor así como el color a usar.
  
  La función coefCalc() se encuentra definida
  abajo.
  */
  
  coef[0] = coefCalc(pos.x/(float)width, true);
  coef[1] = coefCalc(pos.y/(float)height, true);
  coef[2] = coefCalc(pos.x/(float)width, false);
  coef[3] = coefCalc(pos.y/(float)height, false);
  
  /*
  Se resetean los valores de la posición actual
  para recalcularos en cada nueva ejecución
  de draw(); lo mismo ocurre con el color actual.
  */
  
  for (int i = 0; i < curPos.length; i++) {
    curPos[i] = new PVector (0, 0);
  }
  
  for (int i = 0; i < curAng.length; i++) {
    curAng[i] = new PVector (0, 0);
  }
  
  curCol = color(0, 0, 0);
  
  /*
  Se calculan los posiciones a través de una 
  interpolación de cada elemento contra 0 dependiendo
  del coeficiente calculado al inicio. 
  Esto permite anular cada elemento en caso de que 
  el cursor esté por fuera de la región que le compete.
  Esta misma condición permite definir la posición
  actual como la suma de las interpolaciones obtenidas
  de cada elemento contra 0 de acuerdo al coeficiente
  correspondiente.
  */

  //Se calculan las posiciones del cursor
  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curPos.length; i++) {
      curPos[i].x += lerp(0, elmPos[j][i].x, coef[j]);
      curPos[i].y += lerp(0, elmPos[j][i].y, coef[j]);
    }
  }
  
  //Se calculan las posiciones de control de Bezier
  for (int j = 0; j < coef.length; j++) {
    for (int i = 0; i < curAng.length; i++) {
      curAng[i].x += lerp(0, elmAng[j][i].x, coef[j]);
      curAng[i].y += lerp(0, elmAng[j][i].y, coef[j]);
    }
  }
  
  //Se calculan los colores usados
  for (int i = 0; i < coef.length; i++) {
    float r, g, b;
    r = red(curCol); 
    g = green(curCol);
    b = blue(curCol);
    r += lerp(0, red(elmCol[i]), coef[i]);
    g += lerp(0, green(elmCol[i]), coef[i]);
    b += lerp(0, blue(elmCol[i]), coef[i]);
    curCol = color (r, g, b);
  }
  /*
  Se hace una interpolación doble para lograr
  un movimiento fluido y curvilíeno
  */
  
  pos_.x = lerp(pos_.x, nPos.x, 0.05);
  pos_.y = lerp(pos_.y, nPos.y, 0.05);
  pos.x = lerp(pos.x, pos_.x, 0.05);
  pos.y = lerp(pos.y, pos_.y, 0.05);
}

float coefCalc (float x, boolean polarity) {
  /*
  Esta funcion definirá los coeficientes que determinarán
  el grado de expresión de cada elemento de acuerdo a una
  posición del mismo dentro de la pantalla.
  
  A través de esta función se configura una cuadrícula en donde
  las posiciones superior, inferior, izquierda y derecha permiten
  la expresión total de un elemento. El centro implica una
  expresión nula y las equinas interpolaciones medias entre las
  parejas de elementos correspondientes.
  
           |         |         
           |  Aire   |         
  _________|_________|_________
           |         |         
    Fuego  |    0    |  Agua
  _________|_________|_________
           |         |
           | Tierra  |         
           |         |
  */
  
  float y = 0;
  if (!polarity) {
    y = 1 - 8 * x / 3.0f;
    if (y < 0) y = 0;
  } else {
    y = 8 * x /3.0f - 5/3.0f;
    if (y < 0) y = 0;
  }
  return y;
}