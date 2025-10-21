// charles killpack | 2025 sep 13 | Spacegame
import processing.sound.*;
//Soundfile .wav;
SpaceShip s1;
//Rock r1;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<Star> stars = new ArrayList<Star>();
ArrayList<PowerUp> powups = new ArrayList<PowerUp>();
Timer rockTimer, puTimer;
boolean play;

int score, rocksPassed, level,rtime;

void setup () {
  size (1000, 1000);
  s1 = new SpaceShip();
  puTimer = new Timer (5000);
  puTimer.start();
  rockTimer = new Timer(5000);
  rockTimer.start();
  score = 0;
  rocksPassed = 0;
  play = false;
  level = 1;
  rtime = 5000;
}

void draw () {
  if (play == false) {
    startScreen();
  }else{
  
  background(22);

  //adding stars
  stars.add(new Star());

  for (int i = 0; i < stars.size(); i++) {
    Star star = stars.get(i);
    star.display();
    star.move();
    if (star.reachedBottom()==true) {
      stars.remove(star);
    }
  }

  //distributes rocks on timer
  if (rockTimer.isFinished()) {
    rocks.add(new Rock());
    rockTimer.start();
  }

  // dis tributes and star pu timer
  if (puTimer.isFinished()) {
    powups.add(new PowerUp());
    puTimer.start();
  }

  for (int i = 0; i < powups.size(); i++) {
    PowerUp powerup = powups.get(i);
    //collision detection between rock and ship
    powerup.display();
    powerup.move();
    if (powerup.intersect(s1)) {
      powups.remove(powerup);
      //basedf on type benifit gain
      if (powerup.type == 'H') {
        s1.health+=1000;
      } else if (powerup.type == 'T') {
        s1.turretCount+=1;}
        if (s1.turretCount>5) {
          s1.turretCount = 5;
        } else if (powerup.type == 'A') {
        s1.laserCount+=100;
      }
      if (powerup.reachedBottom()==true) {
        powups.remove(powerup);
        i--;
        //PowupsPassed++;
      }
    }
  }

    //display of rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      //collision detection between rock and ship
      rock.display();
      rock.move();
      if (s1.intersect(rock)) {
        rocks.remove(rock);
        score = score + rock.diam;
        s1.health = s1.health - rock.diam;
      }

      if (rock.reachedBottom()==true) {
        rocks.remove(rock);
        i--;
        rocksPassed++;
      }
    }

    //display of lasers
    for (int s = 0; s < lasers.size(); s++) {
      Laser laser = lasers.get(s);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (laser.intersect(r));
        {

          //reduce hp on rock;
          r.diam = r. diam -10;
          if (r.diam< 10) {
            rocks.remove(r);
          }
          lasers.remove(laser);

          score = score + 10;
        }
      }
      laser.display();
      laser.move();
      if (laser.reachedTop()) {
        lasers.remove(laser);
      }
      println(lasers.size());
    }


    println(rocks.size());
    s1.display ();
    s1.move(mouseX, mouseY);

    infoPanel();
    if (s1.health<1) {
      gameOver();
    }
 if (rocksPassed>10) {
  level++; 
  rtime-=10;
  //if (level<20);{
  //level--;}
 }
 }
  
}
  void mousePressed() {
   // if (s1.fire()) {
     // lasers.add(new Laser(s1.x, s1.y));
    //  s1.laserCount--;
   // } 
    if (s1.turretCount==1) {
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount--;
    }else
    if (s1.turretCount==2) {
      lasers.add(new Laser(s1.x, s1.y+10));
      lasers.add(new Laser(s1.x, s1.y-10));
      s1.laserCount--;
    } else if (s1.turretCount<3);
    lasers.add(new Laser(s1.x, s1.y+10));
      lasers.add(new Laser(s1.x, s1.y-10));
      lasers.add(new Laser(s1.x, s1.y));
      s1.laserCount--;
 
}
  
  void infoPanel() {
    rectMode(CENTER);
    rect(width/2, 25, width, 50);
    fill(220);
    textSize(30);
    text("Score: "+ score, 20, 40);
    text("health: " + s1.health, 350, height - 20);
    text ("ammo: " + s1.laserCount, 600, 40);
    text("Rocks Passed: " + rocksPassed, 780, 40);
     text("turret: " + s1.turretCount, 400, 40);
   text("level: " + level, width/2,300);  
   
    fill (255);
    
    rect(50, height-100, 100, 10);
    fill(255, 0, 0);
    rect(50, height-100, s1.health, 10);
  }

  void gameOver () {
    background(0);
    fill (255);
    textAlign(CENTER);
    text("ur dead :)", 500, height/2);
    noLoop();
  }
  void startScreen () {
    //imageMode(CENTER);
    //Image;
    background(0);
    fill(255);
    text("click to start",width/2,height/2);
    if(mousePressed){
   play = true;
 }
  }
  
