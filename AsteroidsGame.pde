ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Asteroid> asteroids;
Spaceship ship;
Star[] stars; 
class Asteroid extends Floater
{
  private double rotSpeed;
  public Asteroid()
  {
    corners = 6;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -20;  yCorners[0] = -10;
    xCorners[1] = -10;  yCorners[1] = -20;
    xCorners[2] =  15;  yCorners[2] = -15;
    xCorners[3] =  20;  yCorners[3] =  0;
    xCorners[4] =  10;  yCorners[4] = 15;
    xCorners[5] = -15;  yCorners[5] = 10;
    myCenterX = (int)(Math.random() * width);
    myCenterY = (int)(Math.random() * height);
    myXspeed = (Math.random() * 2 - 1);
    myYspeed = (Math.random() * 2 - 1);
    myPointDirection = (int)(Math.random() * 360);
    rotSpeed = (Math.random() * 2 - 1);
    myColor = color(150);
  }
  public void move()
  {
    myPointDirection += rotSpeed;
    myCenterX += myXspeed;
    myCenterY += myYspeed;
    if (myCenterX > width){
      myCenterX = 0;
    }
    if (myCenterX < 0){    
      myCenterX = width;
    }
    if (myCenterY > height){ 
      myCenterY = 0;
    }
    if (myCenterY < 0){   
      myCenterY = height;
    }
  }
  public double getX()
  {
    return myCenterX;
  }

  public double getY()
  {
    return myCenterY;
  }
}
public void setup()
{
  size(800, 600);

  ship = new Spaceship();
  asteroids = new ArrayList<Asteroid>();
  for (int i = 0; i < 5; i++) {
    asteroids.add(new Asteroid());
  }
  stars = new Star[200];
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
}
public void draw()
{
  background(0);
  for (Star s : stars) {
    s.show();
  }
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.move();
    b.show();
    if (b.myCenterX < 0 || b.myCenterX > width || b.myCenterY < 0 || b.myCenterY > height) {
      bullets.remove(i);
    }
  }
  for (int i = asteroids.size() - 1; i >= 0; i--) {
    Asteroid a = asteroids.get(i);
    boolean asteroidHit = false;
    for (int j = bullets.size() - 1; j >= 0; j--) {
      Bullet b = bullets.get(j);
      double dx = a.getX() - b.myCenterX;
      double dy = a.getY() - b.myCenterY;
      double distanceSquared = dx*dx + dy*dy;
      if (distanceSquared < 400) {
        asteroids.remove(i);
        bullets.remove(j);
        asteroidHit = true;
        break;
      }
    }

    if (!asteroidHit) {
      double dxShip = a.getX() - ship.getX();
      double dyShip = a.getY() - ship.getY();
      double distanceShipSq = dxShip*dxShip + dyShip*dyShip;

      if (distanceShipSq < 400) {
        asteroids.remove(i); 
      } else {
        a.move();
        a.show();
      }
    }
  }
  ship.move();
  ship.show();
}
public void keyPressed()
{
  if (key == 'a' || key == 'A') {
    ship.turn(-5);
  }
  if (key == 'd' || key == 'D') {
    ship.turn(5);
  }
  if (key == 'w' || key == 'W') {
    ship.accelerate(0.2);
  }
  if (key == 's' || key == 'S') {
    ship.hyperspace();
  }
  if (key == ' ') {
    bullets.add(new Bullet(ship));
  }
}
