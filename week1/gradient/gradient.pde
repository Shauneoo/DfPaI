color randColor1 = color(random(255), random(255), random(255));
color randColor2 = color(random(255), random(255), random(255));

void setup() {
  size(480, 480);
}

void draw() {
  loadPixels();
  genGradient();
  updatePixels();
}

void genGradient() {
  for (int i=0; i<pixels.length; i++) {
    //gradient step
    float step = map(i, 0, pixels.length, 0, 1);
    
    //gradient mix
    color gColor = lerpColor(randColor1, randColor2, step);
    
    //apply color to pixels
    pixels[i] = gColor;
  }  
}
