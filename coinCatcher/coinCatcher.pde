//To-do list.
//Make trail behind mouse for effect
//Make level (non random)
//Make coins
//Need 10 coins to go next level

int trailLength = 50;

MouseTrail newTrail;

void setup(){
size (800,800);
smooth();
newTrail = new MouseTrail(trailLength);
}

void draw(){
background (255);

newTrail.update(mouseX,mouseY);

newTrail.display();
}
