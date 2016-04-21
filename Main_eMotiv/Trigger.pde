class Trigger{
  PVector curPos = new PVector();
  int state;
  
  Trigger () {
  }
  
  void setState (int newState) {
    state = newState;
  }
  
  int getState () {
    switch (state) {
      case 0 : 
        //mute all
        break;
      case 1 : 
        //start loop 1
        break;
      case 2 : 
        //start loop 2
        break;
      case 3 :
        //start loop 3
        break;
    }
    return state;
  }
  
  void clearState () {
    state = 0;
  }
}
  