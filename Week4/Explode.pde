class Explode{
  private PVector ball, speed;
  private float red, green, blue;
  private Boolean out = false;
  Explode(float xpos, float ypos, float r, float g, float b, float size){
    ball = new PVector(xpos, ypos, size/2);
    red = r;
    green = g;
    blue = b;
    speed = new PVector(random(-50, 50), random(-50, 50));
  }
  
  void run(){
    draw();
  }
  
  void draw(){
    noStroke();
    fill(red, green, blue);
    ball.add(speed);
    
    if (ball.x> width + 100 || ball.x < -100 || ball.y> height + 100 || ball.y < -100) {
      out = true;
    }
    
    ellipse(ball.x, ball.y, ball.z, ball.z);
  }
}
