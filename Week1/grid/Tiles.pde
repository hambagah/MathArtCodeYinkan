class Tiles {
  private int wid, hgt, xpos, ypos;
  private int red = 220, green = 150, blue = 140;
  private boolean exist = true;
  Tiles(int a, int b, int c, int d){
    xpos = a;
    ypos = b;
    wid = c;
    hgt = d;
  }
  
  void run(){
    draw(); 
  }
  
  void draw(){
    noStroke();
    fill(red+=random(-7, 10), green+=random(-4, 6), blue+=random(-4, 6));
    if (red > 250 && green > 200 && blue > 200){
      exist = false;
    }
    
    //noStroke();
    //pushMatrix();
    rect(xpos, ypos, wid, hgt);
    //popMatrix();
  }
}
