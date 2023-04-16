//your variable declarations here
Spaceship bob = new Spaceship();
ArrayList <Bullet> bulletsGroup;
//Bullet bullet = new Bullet(0, 0, 0);
Star[] nightSky = new Star[200];
ArrayList <Asteroid> asteroidsGroup;
int numAsteroids, numBullets;
int asteroidsCounter ;

public void setup()
{
  numAsteroids = 10;
  asteroidsCounter = 0;
  numBullets = 0;
  asteroidsGroup = new ArrayList <Asteroid>();
  bulletsGroup = new ArrayList <Bullet>();
  size(750, 750);

  for (int i = 0; i< nightSky.length; i++)
  {
    nightSky[i] = new Star();
  }

  for (int i=0; i < numAsteroids; i++)
  {
    asteroidsGroup.add(new Asteroid());
    asteroidsCounter ++;
  }
  /*for (int i=bulletsGroup.size()-1; i>=0; i--)
  {
    float bulletXcenter = (float)bulletsGroup.get(i).getXCenter();
    float bulletYcenter = (float)bulletsGroup.get(i).getYCenter();
    float asteroidXcenter = (float)asteroidsGroup.get(i).getXCenter();
    float asteroidYcenter = (float)asteroidsGroup.get(i).getYCenter();
    System.out.println(bulletXcenter);
    //System.out.print(dist((float)bulletsGroup.get(i).getXCenter(), (float)bulletsGroup.get(i).getYCenter(), (float)asteroidsGroup.get(i).getXCenter(), (float) asteroidsGroup.get(i).getYCenter()));
    if (dist(bulletXcenter, bulletYcenter, asteroidXcenter, asteroidYcenter) < 20)
    {
      asteroidsGroup.remove(asteroidsGroup.get(i));
    }
  }*/
 for (int i = asteroidsGroup.size() - 1; i >= 0; i--) {
    float asteroidXcenter = (float)asteroidsGroup.get(i).getXCenter();
    float asteroidYcenter = (float)asteroidsGroup.get(i).getYCenter();

    for (int j = bulletsGroup.size() - 1; j >= 0; j--) {
        float bulletXcenter = (float)bulletsGroup.get(j).getXCenter();
        float bulletYcenter = (float)bulletsGroup.get(j).getYCenter();
        

       if (dist(bulletXcenter, bulletYcenter, asteroidXcenter, asteroidYcenter) < 100) {
            asteroidsGroup.remove(i);
            bulletsGroup.remove(j);
            break; // Stop checking bullets for this asteroid since it has already been destroyed
        }
    }
}
  //print(asteroidsGroup.size());
  // Iterate over the bullets in the bulletsGroup






}
public void draw()
{
  background(0);
  noStroke();
  for (int i = 0; i < nightSky.length; i++)
  {
    nightSky[i].show();
  }
  bob.show();
  bob.move();
  bob.smoothMove();

  for (int i=bulletsGroup.size()-1; i>=0; i--)
  {
    bulletsGroup.get(i).move();
    bulletsGroup.get(i).show();
  }

  for (int i=asteroidsGroup.size()-1; i>=0; i--)
  {
    asteroidsGroup.get(i).move();
    asteroidsGroup.get(i).show();
  }

}

public void keyPressed()
{
  if (key == 'h')
  {
    bob.accelerate(0);
    bob.hyperspace();
  }
  if (key == 'a')
  {

    bob.aPressed = true;
  }
  if (key == 'd')
  {

    bob.dPressed = true;
  }
  if (key == 'w')
  {

    bob.wPressed = true;
  }
  if (key == ' ')
  {
    numBullets+=1;
    bulletsGroup.add(new Bullet((float) bob.getXCenter(), (float)bob.getYCenter(), (float) bob.getPointDirection()));
    //bullet.setXCenter(bob.getXCenter());
    //bullet.setYCenter(bob.getYCenter());
    //bullet.setPointDirection(bob.getPointDirection());
    //bullet.show();
    //bullet.move();
    //bullet.accelerate(0.5);
  }
  // if (key == 's')
  //{
  //  bob.accelerate(-0.05);
  //}
}
public void keyReleased()
{

  if (key == 'a')
  {

    bob.aPressed = false;
  }
  if (key == 'd')
  {

    bob.dPressed = false;
  }
  if (key == 'w')
  {

    bob.wPressed = false;
  }
}

/*public void removeBullets(ArrayList<Bullet> bulletsGroup) //note that this should NOT be called in a for loop
{
  for (int i = bulletsGroup.size()-1; i >=0; i--)
  {
    if (bulletsGroup.get(i).getRemove())
    {
      bulletsGroup.remove(i);
    }
  }
}*/
