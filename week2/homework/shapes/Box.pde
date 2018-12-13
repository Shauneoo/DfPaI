class Box {
  PVector startPos, endPos, pos;
  //Box(PVector startPos, PVector endPos, PVector Pos) {
  Box(float x, float y) {
    this.startPos = startPos;
    this.endPos = endPos;
    pos = new PVector(x,y);
    
  }
  
  void draw() {
    point(pos.x,pos.y);
  }
}
