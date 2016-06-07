void oscRoutine() {
  OscBundle bndle = new OscBundle();
  
  //==========================================
  OscMessage volMsg = new OscMessage("/BMC/Vol");
  volMsg.add(vol.getValue());
  OscMessage muteMsg = new OscMessage("/BMC/Mute");
  muteMsg.add(mute.getValue());
  bndle.add(volMsg);
  bndle.add(muteMsg);
  //==========================================
  osc.send(bndle, maxDir);
}

void oscEvent (OscMessage msg) {
  if (msg.checkAddrPattern("/BMC/pos")) {
    if (msg.checkTypetag("fff")) {
      nPos.x = msg.get(0).floatValue();
      nPos.y = msg.get(1).floatValue();
      //nPos.z = msg.get(2).floatValue();
    }
  }
}