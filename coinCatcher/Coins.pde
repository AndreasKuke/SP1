class Coins {
  float x; //x pos of coin
  float y; //y pos of coin
  float size;
  float speed; //size of coin
  boolean picked;

  Coins(float x, float y, float size, float speed) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.speed = speed;
  }

  void coinUpdate() {
    y+= speed;
    if (y > height + size) {
      y = 0;
      x = random(width);
    }
  }
  void coinDisplay() {
    fill(255, 243, 0);
    ellipse(x, y, size, size);
  }
  boolean isMouseOver(){
  return dist(mouseX,mouseY,x,y)<size/2;
  }
}
void coinSetup() {
  for (int i = 0; i < numCoins; i++) {
    float coinYPos = random(-height, 0);
    coins1.add(new Coins(random(width), coinYPos, 20, random(1, 5)));
  }
}
void collisionCoin() {
  for (int i = coins1.size()-1; i>=0; i--) {
    Coins coin = coins1.get(i);
    if (coin.isMouseOver()) {
      coins1.remove(i);
    }
  }
}
