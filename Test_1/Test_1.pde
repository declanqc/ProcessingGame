void setup()
{
  size(500,500);
}

void draw()
{
  background(0);
  
  player();
  shield();
}

float playerx = 250;
float playery = 250;
float playerSize = 50;

void player()
{
  rectMode(CENTER);
  rect(playerx,playery,playerSize,playerSize);
}


boolean upS,leftS,rightS,downS;
void shield()
{
  if (downS)
  {
    triangle(playerx, playery+50, playerx-25, playery+35, playerx+25, playery+35);
  }
  
  if (upS)
  {
    triangle(playerx, playery-50, playerx-25, playery-35, playerx+25, playery-35);
  }
  
  if (rightS)
  {
    triangle(playerx+50, playery, playerx+35, playery-25, playerx+35, playery+25);
  }
  
  if (leftS)
  {
    triangle(playerx-50, playery, playerx-35, playery-25, playerx-35, playery+25);
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    downS = true;
  }
  
    if (key == 'w' || key == 'W')
  {
    upS = true;
  }
  
  if (key == 'd' || key == 'D')
  {
    rightS = true;
  }
  
  if (key == 'a' || key == 'A')
  {
    leftS = true;
  }
}

void keyReleased()
{
  if (key == 's' || key == 'S')
  {
    downS = false;
  }
  
  if (key == 'w' || key == 'W')
  {
    upS = false;
  }
  
  if (key == 'd' || key == 'D')
  {
    rightS = false;
  }
  
  if (key == 'a' || key == 'A')
  {
    leftS = false;
  }
}
