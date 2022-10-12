//User Inputs
PVector ball;
PVector up, down;
PVector right, left;
//Gravity/jump applies to speed
//Right/left applies to speed2
//Both speed applies to ball
PVector speed, speed2; 
//Multiple movement inputs
boolean[] keys = new boolean [4];
//Changeable ball size and speed limit
int size = 25, limit = 100;
float bg = 0;

ArrayList<Squares> squares;
ArrayList<Splash> splashes;
ArrayList<Explode> explosions;

void setup(){
  size(900, 900);
  smooth();
  
  //Set PVectors
  ball = new PVector(width/2, height/2);
  speed = new PVector(0, 0);
  speed2 = new PVector(0, 0);
  up = new PVector(0, -3);
  down = new PVector(0, 3);
  right = new PVector(3, 0);
  left = new PVector(-3, 0);
  squares = new ArrayList<Squares>();
  splashes = new ArrayList<Splash>();
  explosions = new ArrayList<Explode>();
}

void draw(){
  noStroke();
  background(0, 80);
  bg+=random(-25, 25)/100;
  fill(0, 99);
  rect(0, 0, height, width);
  
  speed.y = speed.y * 0.98;
  speed.limit(limit);
  speed2.x = speed2.x * 0.98;
  speed2.limit(limit);
  ball.add(speed);
  ball.add(speed2);
  
  //Multiple key inputs
  for (int i = 0; i < keys.length; i++) {
    if (keys[0]) {
      speed2.add(left);
    }
    if (keys[1]) {
      speed.add(up);
    }
    if (keys[2]) {
      speed2.add(right);
    }
    if (keys[3]) {
      speed.add(down);
    }
  }
  
  //Boundary detection
  if (ball.y + size/2 > height){
    ball.y = height - size/2;
    speed.y = speed.y * -0.9;
    squares.add(new Squares(ball.x, ball.y, 1, -1));
    for (int i = 0; i < int(random(10, 20)); i++){
      splashes.add(new Splash(ball.x, ball.y));
    }
  }
  if (ball.y < size/2){
    ball.y+=size;
    speed.y = speed.y * -0.9;
    squares.add(new Squares(ball.x, ball.y, 1, 1));
    for (int i = 0; i < int(random(10, 20)); i++){
      splashes.add(new Splash(ball.x, ball.y));
    }
  }
  if (ball.x + size/2 > width){
    ball.x = width - size/2;
    speed2.x = speed2.x * -0.9;
    squares.add(new Squares(ball.x, ball.y, -1, 1));
    for (int i = 0; i < int(random(10, 20)); i++){
      splashes.add(new Splash(ball.x, ball.y));
    }
  }
  if (ball.x < size/2){
    ball.x+=size/2;
    speed2.x = speed2.x * -0.9;
    squares.add(new Squares(ball.x, ball.y, 1, 1));
    for (int i = 0; i < int(random(10, 20)); i++){
      splashes.add(new Splash(ball.x, ball.y));
    }
  }
  
  for (Explode explosion : explosions){
    explosion.run();
  }
  
  
  for (int o = 0; o < int(random(2, 10)); o++){
    for (int p=explosions.size()-1; p>=0; p--) {
       if (explosions.get(p).out == true) {
          explosions.remove(p);
       }
     }
  }
  
  for (Splash splash : splashes){
    splash.run();
  }
  
  for (int i=splashes.size()-1; i>=0; i--) {
    if (splashes.get(i).exist == false) {
        for (int o = 0; o < int(random(20, 40)); o++){
          explosions.add(new Explode(splashes.get(i).ball.x, splashes.get(i).ball.y, splashes.get(i).red, splashes.get(i).green, splashes.get(i).blue, splashes.get(i).size));
        }
        splashes.remove(i);
    }
  }
  
  
  for (Squares square : squares){
    square.run();
  }
  
  for (int i=squares.size()-1; i>=0; i--) {
    if (squares.get(i).exist == false) {
        squares.remove(i);
    }
  }
  
  fill(255);
  ellipse(ball.x, ball.y, size, size);
}

void keyPressed() {
  if (key == 'a')  keys[0] = true;
  if (key == 'w')  keys[1] = true;
  if (key == 'd')  keys[2] = true;
  if (key == 's')  keys[3] = true;
  if (key == ' '){
    squares.clear();
    splashes.clear();
  }
}

void keyReleased() {
  if (key == 'a')  keys[0] = false;
  if (key == 'w')  keys[1] = false;
  if (key == 'd')  keys[2] = false;
  if (key == 's')  keys[3] = false;
}
