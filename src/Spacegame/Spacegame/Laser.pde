class Laser {
  // Member varibles
  //health,speed,ammo,lives; | boolean sheild | color c;
  int x, y, w, h, speed;

  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 5;
    h = 10;
    speed = 8;
  }

  // Member methods
  void display() {
    fill (255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }

  void fire() {
  }

  boolean reachedTop() {
    if (y<-20) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<5) {
      return true;
    } else {
      return false;
   }
  }
}
