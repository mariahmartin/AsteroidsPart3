//your variable declarations here
Spaceship bob = new Spaceship();
ArrayList <Bullet> bulletsGroup;
//Bullet bullet = new Bullet(0, 0, 0);
Star[] nightSky = new Star[200];
ArrayList <Asteroid> asteroidsGroup;
int numAsteroids, numBullets;
int asteroidsCounter;
int health;
int score;

public void setup()
{
  numAsteroids = 10;
  asteroidsCounter = 0;
  numBullets = 0;
  health = 5;
  score = 0;
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
}
public void draw()
{
  if (health ==0)
  {
    return;
  }
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
  for (int j = bulletsGroup.size() - 1; j >= 0; j--) {
    for (int i = asteroidsGroup.size() - 1; i >= 0; i--) {
      float bulletXcenter = (float)bulletsGroup.get(j).getXCenter();
      float bulletYcenter = (float)bulletsGroup.get(j).getYCenter();
      float asteroidXcenter = (float)asteroidsGroup.get(i).getXCenter();
      float asteroidYcenter = (float)asteroidsGroup.get(i).getYCenter();

      float distance = dist(bulletXcenter, bulletYcenter, asteroidXcenter, asteroidYcenter);
      //System.out.println(distance);
      if (distance < 50) {
        asteroidsGroup.remove(i);
        bulletsGroup.remove(j);
        score += 100;
        break;
      }
    }
    for (int i = asteroidsGroup.size() - 1; i >= 0; i--) {
      float asteroidXcenter = (float)asteroidsGroup.get(i).getXCenter();
      float asteroidYcenter = (float)asteroidsGroup.get(i).getYCenter();


      float distance = dist(asteroidXcenter, asteroidYcenter, (float)bob.getXCenter(), (float)bob.getYCenter());
      //System.out.println(distance);
      if (distance < 20 && health>0) {
        asteroidsGroup.remove(i);
        health -=1;
        break;
      }
    }
  }
  if (health == 0) {
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("You lost! ", width/2, height/2); //prints sum
  }
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("You have " + health + " health points left!", width/2, height-50);
  text("You have " + score + " points!", width/2, height-20);
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
    bulletsGroup.add(new Bullet(bob));
  }
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
