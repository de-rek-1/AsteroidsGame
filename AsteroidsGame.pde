Spaceship ship;
Star[] stars;
public void setup()
{
  size(800, 600);
  ship = new Spaceship();
  stars = new Star[200];
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}
public void draw()
{
  background(0);
  for (Star s : stars)
  {
    s.show();
  }

  ship.move();
  ship.show();
}
public void keyPressed()
{
  if (key == 'a' || key == 'A'){
    ship.turn(-5);
  }
  if (key == 'd' || key == 'D'){
    ship.turn(5);
  }
  if (key == 'w' || key == 'W'){
    ship.accelerate(0.2);
  }
  if (key == 's' || key == 'S'){
    ship.hyperspace();
  }
}
