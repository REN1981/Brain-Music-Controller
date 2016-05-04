class CircularButton implements ControllerView<Button> {

  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.LIME);
      }  else { // mouse hovers the button
        theApplet.fill(ControlP5.YELLOW);
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(ControlP5.GREEN);
    }
    
    theApplet.ellipse(0, 0, theButton.getWidth(), theButton.getHeight());
    
    // center the caption label 
    int x = theButton.getWidth()/2 - theButton.getCaptionLabel().getWidth()/2;
    int y = theButton.getHeight()/2 - theButton.getCaptionLabel().getHeight()/2;
    
    translate(x, y);
    theButton.getCaptionLabel().draw(theApplet);
    
    theApplet.popMatrix();
  }
}

class triButton implements ControllerView<Button> {
  float rotation = 0;
  public void display(PGraphics theApplet, Button theButton) {
    theApplet.pushMatrix();
    if (theButton.isInside()) {
      if (theButton.isPressed()) { // button is pressed
        theApplet.fill(ControlP5.LIME);
      }  else { // mouse hovers the button
        theApplet.fill(ControlP5.YELLOW);
      }
    } else { // the mouse is located outside the button area
      theApplet.fill(ControlP5.GREEN);
    }
    rotate(theButton.getValue());
    theApplet.triangle(0, 0, theButton.getWidth(), 0, theButton.getWidth()/2, theButton.getHeight());
    theButton.getCaptionLabel().draw(theApplet);
    theApplet.popMatrix();
  }
}