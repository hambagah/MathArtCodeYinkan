class Splash {
  private PVector ball, speed;
  private float size = random(2, 40), red, blue, green, decay;
  private Boolean exist = true;
  Splash(float xpos, float ypos){
    ball = new PVector(xpos, ypos, size);
    speed = new PVector(random(-50, 50), random(20, 50));
    red = random(100, 255);
    blue = random(100, 255);
    green = random(100, 255);
    decay = random(9500, 9999)/10000;
  }
  
  void run(){
    draw();
  }
  
  void draw(){
    noStroke();
    ball.add(speed);
    speed.x*=decay;
    speed.y*=decay;
    if (abs(speed.x) < 0.01 || abs(speed.y) < 0.01){
      exist = false;
    }
    if ((ball.x + size/2 > width)) {
      ball.x = width - size/2;
      speed.x = speed.x * -0.95;
    }
    if ((ball.x < size/2)) {
      ball.x+=size/2;
      speed.x = speed.x * -0.95;
    }
    if (ball.y + size/2 > height) {
      ball.y = height - size/2;
      speed.y = speed.y * -0.95; 
    }
    if (ball.y < size/2) {
      ball.y+=size/2;
      speed.y = speed.y * -0.95; 
    }
    fill(red, green, blue);
    ellipse(ball.x, ball.y, ball.z, ball.z);
  }
}
