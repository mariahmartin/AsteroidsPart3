class Bullet extends Floater
{
  Bullet(float centerX,float  centerY,float pd ) {
    //myCenterX = bob.getXCenter();
    //myCenterY = bob.getYCenter();
    //myXspeed = bob.getXspeed();
    //myYspeed = bob.getYspeed();
    //myPointDirection = bob.getPointDirection();
    
    myCenterX = centerX;
    myCenterY = centerY;
   // myXspeed = 0;
  //  myYspeed =0;
    myPointDirection = pd;
    accelerate(3);
  }

  public void show()
  {
    fill(255, 0, 0);
    ellipse((float)myCenterX, (float)myCenterY, 15, 15);
    //line((float)myCenterX, (float)myCenterY, (float) (myCenterX + myXspeed * 10), (float) (myCenterY + myYspeed * 10));
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
  public void move ()   //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myXspeed and myYspeed
    myCenterX += myXspeed;
    myCenterY += myYspeed;
  }
}
