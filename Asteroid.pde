class Asteroid extends Floater
{

  public double rotSpeed;
  int[] myColorRGB;
  int myR, myG, myB, asteroidSize;
  Asteroid()
  {
    super();
    myCenterX = width/2;
    myCenterY = height/2;
    myColorRGB = new int[3];
    for (int i =0; i < myColorRGB.length; i++)
    {
      // sets each index of bColor to int 0-255
      myColorRGB[i] = (int)(Math.random()*155)+100;
    }
    myR = myColorRGB[0];
    myG = myColorRGB[1];
    myB = myColorRGB[2];
    corners = 10;
    asteroidSize = 20;
    xCorners = new int[corners];
    yCorners = new int[corners];
    for (int i = 0; i<((int)corners/4); i++)
    {
      xCorners[i] = (int)(Math.random() * (asteroidSize));
    }
    for (int i = ((int)corners/4); i<(2*(int)corners/4); i++)
    {
      xCorners[i] = (int)(Math.random() * (asteroidSize));
    }
    for (int i = (2*(int)corners/4); i<(3*(int)corners/4); i++)
    {
      xCorners[i] = (int)(Math.random() * (-asteroidSize));
    }
    for (int i = (3*(int)corners/4); i<(4*(int)corners/4); i++)
    {
      xCorners[i] = (int)(Math.random() * (-asteroidSize));
    }
    for (int i = 0; i<((int)corners/4); i++)
    {
      yCorners[i] = (int)(Math.random() * (asteroidSize));
    }
    for (int i = ((int)corners/4); i<(2*(int)corners/4); i++)
    {
      yCorners[i] = (int)(Math.random() * (-asteroidSize));
    }
    for (int i = (2*(int)corners/4); i<(3*(int)corners/4); i++)
    {
      yCorners[i] = (int)(Math.random() * (-asteroidSize));
    }
    for (int i = (3*(int)corners/4); i<(4*(int)corners/4); i++)
    {
      yCorners[i] = (int)(Math.random() * (asteroidSize));
    }

    myCenterX = (int)(Math.random() * width) - (width/2);
    myCenterY = (int)(Math.random() * height) - (height/2);

    myXspeed = Math.random()*5 - 2.5;
    myYspeed = Math.random()*5 - 2.5;
    myPointDirection = Math.random() * 2 * Math.PI;
    rotSpeed = Math.random() * 5;
  }
  public void move()
  {
    super.move();
    turn(rotSpeed);
    
  }

  public void show()
  {
    
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()
    float dRadians = (float)(myPointDirection*(Math.PI/180));

    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);

    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);

    fill(myR, myG, myB);
    noStroke();
  }
  public double getXCenter()
  {
    return myCenterX;
  }
  public double getYCenter()
  {
    return myCenterY;
  }
}
