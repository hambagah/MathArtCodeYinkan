PImage img;
float amp = 100;
float period = 10;

void setup() {
  size(50, 50, P3D);
  img = loadImage("dog.jpg");
  //decreasing the image size will make it run a bit faster, unless if your computer
  //is better than mine
  //img.resize(500, 500);
  surface.setSize(img.width, img.height);
}

void draw() {
  //commenting out background shows more of the image, while still retaining
  //the blurry affect
  //background(255);
  float x;
  float y;
  float wave = amp * cos(TWO_PI * frameCount/period);
  for (int i = 0; i < img.width; i++) {
    for (int j = 0; j < img.height; j++) {

      int loc = i+j*img.width;


      stroke(color(img.pixels[loc]));
      float z = (red(img.pixels[loc])+green(img.pixels[loc])+blue(img.pixels[loc]))/3;      
      x = i + + random(-20, 20) + wave;
      y = j + random(-20, 20);
      point(x, y, z);
    }
  }
}
