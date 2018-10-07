class Ball {
  PVector pos, vel, mousePos;
  float radius;
  color ballColor;

  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = new PVector(random(-3, 3), random(-3, 3));
    vel.limit(3);
    ballColor = color(random(255),random(255),random(255));
    this.radius = radius;
  }
  
  void mouseGrav(int mousePosX, int mousePosY) {
     
    PVector mousePos = new PVector(mousePosX, mousePosY);
    
    mousePos.sub(pos);
    
    mousePos.setMag(.25);
    
    vel.add(mousePos);
  }
  
  void checkDistance(Ball otherB) {
    float distBetween = dist(pos.x, pos.y, otherB.pos.x, otherB.pos.y);
    
    if (distBetween < this.radius + otherB.radius) {
      vel.x *= -1;
      vel.y *= -1;
      otherB.vel.x *= -1;
      otherB.vel.y *= -1;
    }
    
  }

  void update() {
    pos.add(vel);
    
    if (pos.x <= this.radius || pos.x > width-this.radius) {
      vel.x *= -1;
    }
    
    if (pos.y <= this.radius || pos.y > height-this.radius) {
      vel.y *= -1;
    }
  }

  void draw() {
    fill(ballColor);
    ellipse(pos.x, pos.y, radius*2, radius*2);
  }
}
