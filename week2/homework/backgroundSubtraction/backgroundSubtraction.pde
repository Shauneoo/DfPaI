import processing.video.*;

Capture camFeed;

PImage subRef; //background subtraction Reference image
PImage superImg; //superimposed background image

int threshold = 35; //difference threshold

void setup() {
  size(640, 480);
  camFeed = new Capture(this, width, height);
  camFeed.start();
  superImg=loadImage("Background.jpg");
}

void draw() {

  if (subRef != null) { //wait until has been set
    loadPixels(); //load pixels of canvas

    camFeed.loadPixels();
    subRef.loadPixels();

    for (int i=0; i < pixels.length; i++) {

      //set pixel color values for cam and subRef image
      float camRed = red(camFeed.pixels[i]);
      float camGreen = green(camFeed.pixels[i]);
      float camBlue = blue(camFeed.pixels[i]);

      float subRefRed = red(subRef.pixels[i]);
      float subRefGreen = green(subRef.pixels[i]);
      float subRefBlue = blue(subRef.pixels[i]);

      // color diff between cam and subRef pixels
      float colorDiff = dist(camRed, camGreen, camBlue, subRefRed, subRefGreen, subRefBlue);

      //compare color difference to set threshold
      if (colorDiff > threshold) {
        pixels[i] = color(camRed, camGreen, camBlue); //then replace with camfeed pixel
      } else {
        pixels[i] = superImg.pixels[i]; //then replace with superimposed background pixel
      }
    }

    updatePixels();
  } else {
    image(camFeed, 0, 0);
  }
}

void captureEvent(Capture camFeed) {
  camFeed.read();
} 

void keyPressed() {
  if (key == 'b') subRef = camFeed.copy(); //copy img from webcam

  if (key == '-') {
    if (threshold > 0) {
      threshold--;
      println("Threshold set to: "+threshold);
    }
  }

  if (key == '+') {
    if (threshold < 100) {
      threshold++;
      println("Threshold set to: "+threshold);
    }
  }
}
