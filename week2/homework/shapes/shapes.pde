ArrayList<Line> lines = new ArrayList<Line>();
ArrayList<Box> boxes = new ArrayList<Box>();

int bNum = 10;

void setup() {
  size(500, 500, P3D);
  noStroke();
  fill(250, 50);
  blendMode(ADD);  
  
  for (int i=0; i<=bNum; i++) {
    //boxes.add(new Box(new PVector((width/2)/2,height/2), new PVector((width/2)*1.3,height/2)));
    float x = lerp((width/2)/2, (width/2)*1.3, i/(float)bNum) + bNum;
    float y = lerp(height/2, height/2, i/(float)bNum);
    point(x, y);
  }
  
  //lines.add(new Line(new PVector((width/2)/2,height/2), new PVector((width/2)*1.3,height/2)));
}

void draw() {
  //background(30);
  //translate(width / 2, height / 2, 0);
  for(Box box: boxes) {
    box.draw();
  }
}
