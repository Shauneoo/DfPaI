ArrayList<Triangle> friends = new ArrayList<Triangle>();

void setup() {
  size(500, 500);
  int N = 10;
  int spacing = width / (N + 1);
  
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < N; j++) {
      friends.add(new Triangle( i * spacing + spacing, j * spacing + spacing ));
    }
  }
}

void draw() {
  background(0);

  for (Triangle t : friends) {
    t.faceTowards(mouseX, mouseY);
    t.draw();
  }
}
