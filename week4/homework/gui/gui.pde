import controlP5.*;

ControlP5 cp5;
int bgColor = color(0,0,0);
int bgSlider = 100;

void setup() {
	size(1280, 720);
  noStroke();
  cp5 = new ControlP5(this);
  
  cp5.addSlider("bgColor")
     .setPosition(width/2,height/2-100)
     .setSize(20,100)
     .setRange(0,255);
}

void draw() {
  background(bgSlider);
}

void bgColor(color bg) {
  bgSlider = bg;
}
