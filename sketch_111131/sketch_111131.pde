void setup()
{
  size(500,500);
  
  //projectile
  
  xball = 250;
  yball = 0;
  ballSize = 10;
  
  //shield
  
  shieldx = 250;
  shieldy = 250;
}

void draw()
{
  background(0);
  
  player();
  shield();
  projectile();
  collision();
  lives();
}

//player

float playerx = 250;
float playery = 250;
float playerSize = 50;

void player()
{
  rectMode(CENTER);
  fill(255,255,255);
  rect(playerx,playery,playerSize,playerSize);
}


//shield

boolean upS,leftS,rightS,downS;
float shieldx;
float shieldy;
void shield()
{
  //preshield
  fill(135,206,250,100);
    triangle(shieldx, shieldy-50, shieldx-25, shieldy-35, shieldx+25, shieldy-35);
     fill(135,206,250,100);
    triangle(shieldx, shieldy+50, shieldx-25, shieldy+35, shieldx+25, shieldy+35);
    fill(135,206,250,100);
    triangle(shieldx+50, shieldy, shieldx+35, shieldy-25, shieldx+35, shieldy+25);
    fill(135,206,250,100);
    triangle(shieldx-50, playery, shieldx-35, playery-25, shieldx-35, playery+25);
  
  if (downS)
  {
    fill(135,206,250);
    triangle(shieldx, shieldy+50, shieldx-25, shieldy+35, shieldx+25, shieldy+35);
  }
  
  if (upS)
  {
    fill(135,206,250);
    triangle(shieldx, shieldy-50, shieldx-25, shieldy-35, shieldx+25, shieldy-35);
  }
  
  if (rightS)
  {
    fill(135,206,250);
    triangle(shieldx+50, shieldy, shieldx+35, shieldy-25, shieldx+35, shieldy+25);
  }
  
  if (leftS)
  {
    fill(135,206,250);
    triangle(shieldx-50, playery, shieldx-35, playery-25, shieldx-35, playery+25);
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    downS = true;
          if (dist(shieldx, shieldy+50, xball, yball)<(ballSize))
  {
   
  }
  }
  
  
    if (key == 'w' || key == 'W')
  {
    upS = true;
      if (dist(shieldx, shieldy-50, xball, yball)<(ballSize))
  {
    yball = 0;
  }
  }
  
  
  if (key == 'd' || key == 'D')
  {
    rightS = true;
          if (dist(shieldx+50, shieldy, xball, yball)<(ballSize))
  {
    yball = 0;
  }
  }
  
  
  if (key == 'a' || key == 'A')
  {
    leftS = true;
          if (dist(shieldx-50, shieldy, xball, yball)<(ballSize))
  {
    yball = 0;
  }
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


//projectile

float xball;
float yball;
float ballSize;

void projectile()
{
  fill(255,255,255);
  ellipse(xball, yball, ballSize, ballSize);
  
  yball++;
}

void collision()
{
  //player
  if (dist(playerx,playery-20,xball,yball)<(ballSize))
  {
    lives--;
    yball = 0;
  }
    if (dist(playerx,playery+20,xball,yball)<(ballSize))
  {
    lives--;
    yball = 0;
  }
    if (dist(playerx+20,playery,xball,yball)<(ballSize))
  {
    lives--;
    yball = 0;
  }
      if (dist(playerx-20,playery,xball,yball)<(ballSize))
  {
    lives--;
    yball = 0;
  }
}


int lives = 10;

void lives()
{
  fill(250);
  text("Lives"+" " +"="+" "+lives,60,20);
}
