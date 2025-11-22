ArrayList<Asteroid> asteroids;
Spaceship ship;
Star[] stars; 
public void setup()
{
  size(800, 600);
  asteroids = new ArrayList<Asteroid>();
  ship = new Spaceship();
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
  for (Star s : stars)
  {
    s.show();
  }
  for (int i = asteroids.size() - 1; i >= 0; i--)
  {
    Asteroid a = asteroids.get(i);

    float d = dist((float)a.getX(), (float)a.getY(), (float)ship.getX(), (float)ship.getY());
    if (d < 20) {
      asteroids.remove(i);
    } 
    else {
      a.move();
      a.show();
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
}
