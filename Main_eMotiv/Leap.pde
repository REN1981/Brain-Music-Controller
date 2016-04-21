void leapSetup()
{
  leap = new LeapMotion(this).withGestures("screen_tap");
}

void leapAnalisis()
{
  for (Hand hand : leap.getHands ()) {
    if (hand.isRight())
    {
      leapPos = hand.getStabilizedPosition();
    }
  }
}

void leapOnScreenTapGesture(ScreenTapGesture g) {
  println("just tapped"); 
}