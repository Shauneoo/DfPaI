class Crater {
  float lat,lon;
  float angle, radius;
  PVector craterPos;
  
  Crater(float lat, float lon, float diam) {
    this.lat = radians(lat);
    this.lon = radians(lon);
    this.radius = diam/2;
    craterPos = getCartesian(lat,lon,10.0);
  }
  
  void draw() {
    pushMatrix();
    PVector cartesianPOS = getCartesian(lat, lon, radius);
    translate(cartesianPOS.x,cartesianPOS.y,cartesianPOS.z); //translating to correct cartesian coords
    
    //rotate ellipses to correct orrientation
    //rotateX(TWO_PI * lat);
    rotateY(lat + TWO_PI);
    rotateZ(lon + TWO_PI );
    ellipse(0,0,radius, radius);
    popMatrix();
  }
  
  PVector getCartesian(float lat, float lon, float radius) {
    float z = cos(lon) * cos(lat) * moonRadius;
    float y = sin(lon) * cos(lat) * moonRadius;
    float x = sin(lat) * moonRadius;
    return new PVector(x, y, z);
  }
  
}
