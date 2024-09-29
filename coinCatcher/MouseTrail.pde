class MouseTrail { //Mouse trail following mouse to give visual as to where mouse is.
  int trailLength;
  float[] xPos;
  float[] yPos;

  MouseTrail(int i) {
    trailLength = i;
    xPos = new float[trailLength];
    yPos = new float[trailLength];

    for (int j = 0; j < trailLength; j++) {
      xPos[j] = mouseX;
      yPos[j] = mouseY;
    }
  }
  void update(float x, float y) {
    for (int i = 0; i < trailLength-1; i++) {
      xPos[i] = xPos[i+1];
      yPos[i] = yPos[i+1];
    }
    xPos[trailLength-1]=x;
    yPos[trailLength-1]=y;
  }
  void display() {
    for (int i= 0; i < trailLength; i++) {
    noStroke();
    fill(255-i*5,255-i*2,255-i*4);
      ellipse(xPos[i], yPos[i], 20, 20);
    }
  }
}
