class Spaceship extends Floater
{
  boolean wPressed, aPressed, dPressed;
  public Spaceship()
  {
    super();
    wPressed = aPressed = dPressed = false;
    myColor = 255;//(int)(Math.random() * 255);
    myCenterX = width/2;
    myCenterY = height/2;
    corners = 4;
    xCorners = new int[]{-8, 16, -8, -2};
    yCorners = new int[]{-8, 0, 8, 0};
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }
  public void setXspeed (double x)
  {
    myXspeed = x;
  }

  public void setYspeed (double y)
  {
    myYspeed = y;
  }

  public void setXCenter(double x)
  {
    myCenterX = x;
  }
  public void setYCenter(double y)
  {
    myCenterY = y;
  }
  public void setPointDirection (double angle)
  {
    myPointDirection = angle;
  }
  public void hyperspace()
  {
    myCenterX = 0;
    myCenterY = 0;
    setXspeed(0);
    setYspeed(0);
    wPressed = aPressed = dPressed = false;
    myCenterX = (int)(Math.random()*width);
    myCenterY = (int)(Math.random()*height);
  }
  public double getXspeed ()
  {
    return myXspeed;
  }

  public double getYspeed ()
  {
    return myYspeed;
  }

  public double getXCenter()
  {
    return myCenterX;
  }
  public double getYCenter()
  {
    return myCenterY;
  }
  public double getPointDirection ()
  {
    return myPointDirection;
  }
  public void smoothMove()
  {
    if (aPressed == true)
    {
      bob.setPointDirection(bob.myPointDirection-5);
    }
    if (dPressed == true)
    {
      bob.setPointDirection(bob.myPointDirection+5);
    }
    if (wPressed == true)
    {
      bob.accelerate(0.05);
    }
  }
}
