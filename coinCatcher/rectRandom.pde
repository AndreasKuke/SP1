class RectRandom { //Designs map with random rect calls creating obstacles.
  float h; //height
  float w; //width
  float x; //x pos
  float y; //y pos

  RectRandom() {
    h = random(10, 100);
    w = random(10, 100);
    x = random(width);
    y = random(height);
  }
  void display() {
    fill(134,134,134);
    rect(x, y, w, h);
  }
  boolean isMouseOver() { //Checks if mouse is over rectangle to make sure you will lose.
    return mouseX > x && mouseX < x + w && mouseY > y && mouseY < y +h;
  }
}

//RectRandom[] rectangles; //Array to hold rect.

void rectSetup() {
  rectangles = new RectRandom[rectNum];

  for (int i = 0; i < rectNum; i++) {
    rectangles[i] = new RectRandom();
  }
}
void rectDraw() {
  for (RectRandom rect : rectangles) {
    rect.display();
  }
}
