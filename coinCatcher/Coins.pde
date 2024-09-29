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
    fill(255, 202, 10);
    strokeWeight(2);
    stroke(172,136,0);
    ellipse(x, y, size, size);
  }
  boolean isMouseOver(){
  return dist(mouseX,mouseY,x,y)<size/2;
  }
}
void coinSetup() {
  for (int i = 0; i < numCoins; i++) {
    float coinYPos = random(-height, 0);
    coinsList.add(new Coins(random(width), coinYPos, 20, random(1, 5)));
  }
}
 int score;
void collisionCoin() {
  for (int i = coinsList.size()-1; i>=0; i--) {
    Coins coin = coinsList.get(i);
    if (coin.isMouseOver()) {
      coinsList.remove(i);
      score++;
      println(score);
    }
  }
}
