import peasy.*;

Table craterTable;
ArrayList<Crater> craters = new ArrayList<Crater>();

PeasyCam cam;
float moonRadius = 1737.1; // in km

void setup() {
  size(1280, 720, P3D);
  stroke(255);
  noFill();

  cam = new PeasyCam(this, 2000);

  rectMode(CENTER);

  // tell the function that the csv has a header
  craterTable = loadTable("moon_crater_coords.csv", "header");
  
  
  //populate data from csv
  for (int i = 0 ; i < craterTable.getRowCount(); i++) {
    float lat = craterTable.getFloat(i, "lat");
    float lon = craterTable.getFloat(i, "lon");
    float diam = craterTable.getFloat(i, "diam");
    
    craters.add(new Crater(lat, lon, diam));
  }
  
}


void draw() {
  background(0);
  
  for (Crater crater : craters) crater.draw();
}
