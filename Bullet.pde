class Bullet extends Floater
{
  public Bullet(Spaceship theShip)
  {
    corners = 4;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -2; yCorners[0] = -2;
    xCorners[1] = 2;  yCorners[1] = -2;
    xCorners[2] = 2;  yCorners[2] = 2;
    xCorners[3] = -2; yCorners[3] = 2;
    myColor = color(255);
    myCenterX = theShip.getX();
    myCenterY = theShip.getY();
    myXspeed = theShip.myXspeed;
    myYspeed = theShip.myYspeed;
    myPointDirection = theShip.myPointDirection;
    accelerate(6.0);
  }
  public void show()
  {
    fill(myColor);
    stroke(myColor);
    ellipse((float)myCenterX, (float)myCenterY, 6, 6); // 6x6 circle
  }
}
