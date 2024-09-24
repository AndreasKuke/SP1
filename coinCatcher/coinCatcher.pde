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

//Class calls and extra-----------------------------------------------
Rules rules;
MouseTrail newTrail;
boolean lost = false; //Starts with false since no collision with rect.
ArrayList<Coins> coins1;
RectRandom[] rectangles;
//--------------------------------------------------------------------

void setup() {
  size (800, 800);
  smooth();
  rectSetup();
  newTrail = new MouseTrail(trailLength);
  rules = new Rules(rectangles);
  
  coins1 = new ArrayList<Coins>();
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

//Game loop to help reset state if collision is detected------------
void gameLoop() {
  //Map setup with rectRandom
  rectDraw();

  //Trail setup
  newTrail.update(mouseX, mouseY);
  newTrail.display();

  if (rules.collision()) {
    lost = true; // If collision with rect lost = true
  }
  collisionCoin();
  
  for (Coins coin : coins1) {
  coin.coinUpdate();
  coin.coinDisplay();
  }
}

//------------------------------------------------------------------

//Pressing the 'r' key resets game after lost = true; to reset the instance.
void keyPressed() {
  if (lost && key == 'r' || lost && key == 'R') {
    gameReset();
  }
}
//------------------------------------------------------------------

//Startup credentials for new game, sets lost = false;, makes a new set of rectangles, generates new trail and rules.
void gameReset() {
  lost = false;
  rectSetup();
  newTrail = new MouseTrail(trailLength);
  rules = new Rules(rectangles);
}
//------------------------------------------------------------------
