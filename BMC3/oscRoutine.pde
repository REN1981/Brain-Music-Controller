void oscRoutine(int id) {
  /*
  Esta función se llamará en cuanto se
  requiera enviar un mensaje por osc hacia max
  
  La misma consiste en crear un bundle de mensajes
  el cual contendrá un mensaje espcífico de acuerdo
  al id que se utilice para llamar la función oscRoutine.
  
  Este id Está determinado por quién llame la función
  bien puede ser el volumen, el mute o la J.
  */
  
  
  OscBundle bndle = new OscBundle();
  //==========================================

  switch (id) {
  case 0 : 
    OscMessage volMsg = new OscMessage("/BMC/Vol");
    volMsg.add(vol.getValue());
    bndle.add(volMsg);
    break;
  case 1 :
    OscMessage muteMsg = new OscMessage("/BMC/Mute");
    muteMsg.add(mute.getValue());
    bndle.add(muteMsg);
    break;
  case 2 :
    OscMessage nextPosMsg = new OscMessage("/BMC/nextPos");
    nextPosMsg.add(nextPosFlag);
    bndle.add(nextPosMsg);
    break;
  }
  //==========================================
  osc.send(bndle, maxDir);
}

void oscEvent (OscMessage msg) {
  /*
  Esta función se llamará en cuanto se reciba
  un mensaje por OSC.
  
  Dado que el único mensaje que se debería
  recibir es el correspondiente a la posición
  que debe adquirir el cursor, se hará una
  verificación de que el mensaje corresponda
  específicamente con eso para posteriormetne
  asignar su valor a la variable nPos que a su
  vez implicará un cambio de posición generando, 
  en la sección de cálculos, las interpolaciones
  necesarias.
  */
  
  if (msg.checkAddrPattern("/BMC/pos")) {
    if (msg.checkTypetag("fff")) {
      nPos.x = msg.get(0).floatValue();
      nPos.y = msg.get(1).floatValue();
      //nPos.z = msg.get(2).floatValue();
    }
  }
}