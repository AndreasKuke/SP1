//To-do list.
//Make trail behind mouse for effect X
//Make level (random) X
//Make coins X
//Make score X
//Need 10 coins to beat game, make win screen.

//SETTINGS------------------------------------------------------------
int trailLength = 50; //Choose amount of ellipses for trail.
int rectNum = 65; //Choose amount of rectangles you want to avoid.
int numCoins = 10; //Amount of coins falling. ERROR
//SETTINGS------------------------------------------------------------

//Class calls and extra-----------------------------------------------
Rules rules;
MouseTrail newTrail;
boolean lost = false; //Starts with false since no collision with rect.
boolean won = false; //Turns true if all coins have been collected.
ArrayList<Coins> coinsList;
RectRandom[] rectangles;
//--------------------------------------------------------------------

void setup() {
  size (800, 800);
  rectSetup();
  newTrail = new MouseTrail(trailLength);
  rules = new Rules(rectangles);

  coinsList = new ArrayList<Coins>();
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
  } else if (won) {
    fill(0, 255, 0, 100);
    rect(0, 0, width, height);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("You won!", width/2, height/2);
  } else {
    gameLoop();
  }
}

//Game loop to help reset state if collision is detected------------
void gameLoop() {
  //Map setup with rectRandom
  rectDraw();
  fill(255);
  textSize(40);
  text("Score: "+score, 150, 40); //Point counter
  //Trail setup
  newTrail.update(mouseX, mouseY);
  newTrail.display();
  if (rules.collision()) {
    lost = true; // If collision with rect lost = true
  }
  if (score == numCoins) {
    won = true; // If score = max amount of coins collected, turn true.
  }
  //Insert Win boolean here for when true.
  collisionCoin();

  for (Coins coin : coinsList) {
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
  score = 0;
  coinsList = new ArrayList<Coins>();
  coinSetup();
}
//------------------------------------------------------------------
