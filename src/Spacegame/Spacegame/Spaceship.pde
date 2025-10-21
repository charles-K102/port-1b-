// charles killpack | 2025 sep 13 | Spacegame

class SpaceShip {
  // Member varibles
  //health,speed,ammo,lives; | boolean sheild | color c;
  int x, y, w, laserCount, turretCount, health, mouseX, mouseY;
  PImage bug;
  // Constructor
  SpaceShip() {
    x = width/2;
    y = height/2;
    w = 100;
    laserCount = 1000;
    turretCount = 1;
    health = 100;
    bug = loadImage ("bugship.png");
  }

  // Member methods
  void display() {
    imageMode(CENTER);
    image(bug, x, y);
  }

  void move(int x, int y) {
    this.x = x;
    this.y = y;
  }

  boolean fire() {
    if (laserCount>0) {
    return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock r) {
    float d = dist (x, y, r.x, r.y);
    if (d<50) {
      return true;
    } else {
      return false;
    }
  }
}
