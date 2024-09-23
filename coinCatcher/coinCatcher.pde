//To-do list.
//Make trail behind mouse for effect
//Make level (non random)
//Make coins
//Need 10 coins to go next level

//SETTINGS------------------------------------------------------------
int trailLength = 50; //Choose amount of ellipses for trail.
int rectNum = 65; //Choose amount of rectangles you want to avoid.

int numCoins = 10; //Amount of coins falling. ERROR

//SETTINGS------------------------------------------------------------

Rules rules;
MouseTrail newTrail;
boolean lost = false; //Starts with false since no collision with rect.
Coins[] coins1 = new Coins[numCoins];
RectRandom[] rectangles;

void setup() {
  size (800, 800);
  smooth();
  rectSetup();
  newTrail = new MouseTrail(trailLength);
  rules = new Rules(rectangles);
  
  coins1 = new Coins[numCoins];
  coinSetup();
}

void draw() {
  background (0);

  if (lost) {
    fill(255, 0, 0, 100);
    rect(0, 0, width, height);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("You died...", width/2, height/2);
    textSize(25);
    text("Press 'R' to restart", width/2, height/2+40);
  } else {
    gameLoop();
  }
}

void gameLoop() {
  //Map setup with rectRandom
  rectDraw();

  //Trail setup
  newTrail.update(mouseX, mouseY);
  newTrail.display();

  if (rules.collision()) {
    lost = true; // If collision with rect lost = true
  }
  for (Coins coin : coins1) {
  coin.coinUpdate();
  coin.coinDisplay();
  }
}

void keyPressed() {
  if (lost && key == 'r' || lost && key == 'R') {
    gameReset();
  }
}

void gameReset() {
  lost = false;
  rectSetup();
  newTrail = new MouseTrail(trailLength);
  rules = new Rules(rectangles);
}
