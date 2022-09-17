//set cols and rows for initial tiles
int cols = 2;
int rows = 2;
//set splitx and splity for tiles created through split
int splitx = 2;
int splity = 2;
int stepx, stepy;
boolean loop = true;
ArrayList<Tiles> tiles;

void setup() {
  fill(255);
  size(1000, 1000);
  stepx = (width / cols);
  stepy = (height / rows);
  
  tiles = new ArrayList<Tiles>();
}

void draw() {
  background(255);
  
  if (loop == true){
    for (int y = 0; y < rows; y++) {
      for (int x = 0; x < cols; x++) {
        tiles.add(new Tiles(x * stepx, y*stepy, stepx, stepy));
      }
    }
    loop = false;
  }
  
  for (Tiles tile: tiles){
     tile.run();
  }
  
  for (int i=0; i<=tiles.size()-1; i++) {
    if (tiles.get(i).exist == false) {
       for (int y = 0; y < splity; y++) {
         for (int x = 0; x < splitx; x++) {
           tiles.add(new Tiles(tiles.get(i).xpos+(x * (tiles.get(i).wid/splitx)), tiles.get(i).ypos+(y*(tiles.get(i).hgt/splity)), tiles.get(i).wid/splitx, tiles.get(i).hgt/splity));
         }
        }
      tiles.remove(i);
    }
  }
  println(tiles.size());
}
