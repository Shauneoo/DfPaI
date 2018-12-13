//pixelSize
int pxSize = 20;
PImage sourceIMG;

void setup() {
  sourceIMG = loadImage("hand.jpg");
  
  size(1280, 720);
  sourceIMG.resize(1280,720);
  
  noStroke();
  rectMode(CENTER);
  
  
}

void draw() {
  pxSize = (int)random(10,80);
  //loop througth x & y of source img
  for (int x = pxSize; x < sourceIMG.width; x+=pxSize) {
    for (int y = pxSize; y < sourceIMG.height; y+=pxSize) {
      int loc = x+y*sourceIMG.width;

      //get avg rbg for each px location
      float r = red(sourceIMG.pixels[loc]);
      float g = green(sourceIMG.pixels[loc]);
      float b = blue(sourceIMG.pixels[loc]);

      
      fill(r, g, b);
      rect(x, y, pxSize, pxSize); //fill rect with avg pixels color
    }
  }
}
