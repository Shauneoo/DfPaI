class Triangle {
  PVector pos;
  float rotation;
 
  Triangle(float x, float y) {
    pos = new PVector(x, y);
    rotation = 0;
  }

  void draw() {
    stroke(255, 0, 120);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(rotation+HALF_PI); //rotation tri to face mouse
    scale(2, 2);
    triangle(-5, 2, 5, 2, 0, -10);
    popMatrix();
  }
  
  void faceTowards(float x, float y) {
    rotation = atan2(y-pos.y, x-pos.x); //angle from mouse to tri in radians
  }
}
