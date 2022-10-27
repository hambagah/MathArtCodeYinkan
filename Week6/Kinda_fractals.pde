int min = 7, max = 10, gen = 20, family = 15;
boolean loop = true; 
float len = 400, r, g, b; 
float x[] = new float[gen];
float y[] = new float[gen];

void setup(){
  size(1000, 1000);
  background(0);
  r = random(100, 255);
  g = random(100, 255);
  b = random(100, 255);
  x[0] = width/2;
  y[0] = height/2;
}

void draw(){
  ellipse(x[0], y[0], gen, gen);
  if (loop){
    //I tried to do an alternative version where I made a function that could actually
    //do recursion instead of a limited amount of for loops. 
    //Uncomment this section and the bottom function then comment the other 
    //for loop to test it out.
    /*for (int i = 0; i < gen-1; i++){
      fill(r, g, b);
      strokeWeight(gen);
      stroke(r, g, b);
      x[i+1] = x[i] + random(-len, len);
      y[i+1] = y[i] + random(-len, len);
      line(x[i], y[i], x[i+1], y[i+1]);
      run(x[i], y[i], x[i+1], y[i+1], i);
    }*/
    for (int i = 0; i < family; i++){
      strokeWeight(3);
      fill(r, g, b);
      stroke(r, g, b);
      x[1] = x[0] + random(-len, len);
      y[1] = y[0] + random(-len, len);
      line(x[0], y[0], x[1], y[1]);
      ellipse(x[1], y[1], family/1.5, family/1.5);
      for (int o = 0; o < family; o++){
        strokeWeight(2);
        fill(r + random(-50, 50), g + random(-50, 50), b + random(-50, 50));
        stroke(r + random(-50, 50), g + random(-50, 50), b + random(-50, 50));
        x[2] = x[1] + random(-len/2, len/2);
        y[2] = y[1] + random(-len/2, len/2);
        line(x[1], y[1], x[2], y[2]);
        ellipse(x[2], y[2], family/2, family/2);
        for (int k = 0; k < family; k++){
          strokeWeight(1);
          fill(r + random(-50, 50), g + random(-50, 50), b + random(-50, 50));
          stroke(r + random(-100, 100), g + random(-100, 100), b + random(-100, 100));
          x[3] = x[2] + random(-len/3, len/3);
          y[3] = y[2] + random(-len/3, len/3);
          line(x[2], y[2], x[3], y[3]);
          ellipse(x[3], y[3], family/4, family/4);
          for (int l = 0; l < family; l++){
            x[4] = x[3] + random(-len/4, len/4);
            y[4] = y[3] + random(-len/4, len/4);
            line(x[3], y[3], x[4], y[4]);
            ellipse(x[4], y[4], family/8, family/8);
          }
        }
      }
    }
    loop = false;
  }
}

/*public float run(float x, float y, float x2, float y2, float num){
  for (int i = 0; i < family; i++){
     strokeWeight(gen-num);
     fill(r + num * random(-20, 20), g + num * random(-20, 20), b + num * random(-20, 20));
     stroke(r + num * random(-20, 20), g + num * random(-20, 20), b + num * random(-20, 20));
     x2 = x + random(-len, len);
     y2 = y + random(-len, len);
     line(x, y, x2, y2);
     ellipse(x2, y2, gen-num, gen-num);
  }
  return 0;
}*/
