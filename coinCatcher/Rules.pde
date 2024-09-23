class Rules {
  RectRandom[] rectangles;

  Rules(RectRandom[] rectangles) {
    this.rectangles = rectangles;
  }
  boolean collision() {
    for (RectRandom rect : rectangles) {
      if (rect.isMouseOver()) {
        return true;
      }
    }
    return false;
  }
}
