void setup() {
  size(480, 480);
}

void draw() {
  loadPixels();
  genGradient();
  updatePixels();
}

void genGradient() {
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = (x + y * width);
      pixels[index] = color(x,(x+y)/4,y);
      pixels[index] = color(x,(x+y)/4,y);
    }
  }
}
