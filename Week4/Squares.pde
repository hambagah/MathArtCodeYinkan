class Squares{
  private float x, y, xsize, ysize, red, green, blue, randmove;
  private float red2, green2, blue2, weight, decay, rot = random(10, 360), rot2 = random(0.2, 1);
  private int val1, val2;
  private Boolean exist = true;
  Squares (float xpos, float ypos, int xwall, int ywall){
    val1 = xwall;
    val2 = ywall;
    x = xpos;
    y = ypos;
    xsize = random(100, width) * val1;
    ysize = random(100, height) * val2;
    red = random(100, 255);
    green = random(100, 255);
    blue = random(100, 255);
    red2 = random(50, 200);
    green2 = random(50, 200);
    blue2 = random(50, 200);
    randmove = random(1, 15);
    weight = random(2, 10);
    decay = random(9800, 9990)/10000;
  }
  
  void run(){
    draw();
  }
  
  void draw (){
    x+=random(-randmove, randmove);
    y+=random(-randmove, randmove);
    xsize*=decay;
    ysize*=decay;
    rectMode(CENTER);
    stroke(red2, green2, blue2);
    strokeWeight(weight*decay);
    fill(red, green, blue, 80);
    if (ysize < 0.01 && xsize < 0.01){
      exist = false;
    }
    pushMatrix();
    translate(width/2, height/2);
    rotate(rot);
    rect(x, y, xsize, ysize);
    popMatrix();
    rot+=rot2;
  }
}
