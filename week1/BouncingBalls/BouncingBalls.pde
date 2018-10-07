boolean mouseDown = false;

Ball[] balls = new Ball[15];

void setup() {
  size(720, 720);
  noStroke();

  for (int i = 0; i < balls.length; i++) {
    
    float radius = random(10, 20);
    float x = random(radius, width - radius);
    float y = random(radius, height - radius);
    
    balls[i] = new Ball(x, y, radius);
  }
}

void draw() {
  background(0);
  
  //loop through balls array
  for (int i=0; i < balls.length; i++) {
    
    //update and draw balls
    balls[i].update();
    balls[i].draw();
    
    //calculate distance between balls
    for (int j=i+1; j < balls.length; j++) {
      balls[i].checkDistance(balls[j]);
    }
    
    //moused pressed add attraction force
    if (mouseDown) balls[i].mouseGrav(mouseX, mouseY);
  }
}

void mousePressed(){
  mouseDown = true;  
}

void mouseReleased() {
  mouseDown = false;
}
