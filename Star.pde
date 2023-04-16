class Star //note that this class does NOT extend Floater
{
  private int myX, myY;
  public Star()
  {
    myX = (int)(Math.random()*width);
    myY = (int)(Math.random()*height);
  }
  public void show()
  {
    noStroke();
    fill(255);
    ellipse(myX, myY, 3, 3);
  }
}
