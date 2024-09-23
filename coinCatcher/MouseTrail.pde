class MouseTrail { //Mouse trail following mouse to give more depth and character.
  int length;
  float[] xPos;
  float[] yPos;

  MouseTrail(int i) {
    length = i;
    xPos = new float[length];
    yPos = new float[length];

    for (int j = 0; j < length; j++) {
      xPos[j] = mouseX;
      yPos[j] = mouseY;
    }
  }
  void update(float x, float y) {
    for (int i = 0; i < length-1; i++) {
      xPos[i] = xPos[i+1];
      yPos[i] = yPos[i+1];
    }
    xPos[length-1]=x;
    yPos[length-1]=y;
  }
  void display() {
    for (int i= 0; i < length; i++) {
    noStroke();
    fill(255-i*5);
      ellipse(xPos[i], yPos[i], 20, 20);
    }
  }
}
