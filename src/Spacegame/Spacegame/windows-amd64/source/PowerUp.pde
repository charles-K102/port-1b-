class PowerUp {
  // Member varibles
  //health,speed,ammo,lives; | boolean sheild | color c;
  int x, y, diam, speed;
  char type;
  color c1;
  //PImage r1, r2, r3;

  // Constructor
  PowerUp() {
    
    x = int(random(width));
    y = - 100;
    diam = 100;       
    // (if you want random diam) int(random(100, 200));
    speed = 5;           
    // (if you want random speed) int(random(1, 10));
    
    if (random(10)>7) {
  
     type= 'H';
     c1 = color(255,0,255);
    } else if (random(10)>5) {
   
    type = 'T';
    c1 = color (234,33,24);
    } else if (random(10)>0) {
    type = 'A';
    c1= color(22,34,255);
    }
  }

  // Member methods
  void display() {
  fill(c1);
  ellipse(x,y,diam,diam);
  fill(255);
  
  textSize(30);
  textAlign(CENTER);
    text(type,x,y);
    
    // imageMode(CENTER);
    //if(diam<1) {
    //  diam = 10;
   // }
   // r1.resize(diam,diam);
   // image(r1, x, y);
  }

  void move() {
    y = y + speed  ;
  }

  boolean reachedBottom() {
    if (y>height+diam) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect (SpaceShip S) {
    float d = dist(x, y, S.x, S.y);
    if (d<50) {
      return true;
    } else {
      return false;
   }
  }
  
}
