//import
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioInput ai;
AudioBuffer ab;

float halfHeight;

//player
float x;
float y;
float smoothedY;
float playerSize;
float pspeed;
boolean up;

PVector location;     
PVector velocity;  
PVector gravity;   

float radius;

//pillar
int numPillar = 1;

float [] pillarx1 = new float [numPillar];
float [] pillarx2 = new float [numPillar];
float [] pillary1 = new float [numPillar];
float [] pillary2 = new float [numPillar];
float [] pillarSize = new float [numPillar];

float Pspeed;
boolean push;

//UI
int Score = 0;

void setup()
{
  size(500,500);
  
  //minim
  minim = new Minim(this);
  ai = minim.getLineIn();
  ab = ai.mix;

  //player
  x = 90;
  y = height/2; 
  smoothedY = height/2;
  playerSize = 40;
  pspeed = 1;
  
  location = new PVector(x, y);
  velocity = new PVector(0.0,2.1);
  gravity = new PVector(0,0.1);
  
  //pillar 
  Pspeed = 0.01;
  
  for (int i = 0; i < numPillar; i++)
  {
    pillarSize[i] = 50;
    pillarx1[i] = 500;
    pillarx2[i] = 500;
    pillary1[i] = random(-20,0);
    pillary2[i] = random(500,600);
  }
}

void draw()
{
  background(0);
  
  pillardraw();
  playerdraw();
  playermovement();
  UI();
  healthbar();
}

void playerdraw()
{
  location.add(velocity);
  velocity.add(gravity);
  
  if ((location.x > width) || (location.x < 0)) 
  {
    velocity.x = velocity.x * -1;
  }
  
  if (location.y > height-20)
  {
    velocity.y = velocity.y * -0.75; 
    location.y = height-20;
  }
  
    if (location.y < 20)
  {
    velocity.y = velocity.y * -1; 
    location.y = 20;
  }
  
  smoothedY = lerp(smoothedY, velocity.y, 0.1);
  fill(255);
  ellipse(location.x, location.y, playerSize, playerSize);  
}
  
void playermovement()
{
  if (up)
  {
    velocity.y = 2;
    velocity.y = velocity.y * -1;
  }
  
  if (radius > 5)
  {
    up  = true;
  }
  
  if (radius < 5)
  {
    up = false;
  }
  
  for (int i = 0; i < ai.bufferSize() -1; i++)
  {
    stroke(255);
    ellipse(1000, 1000, radius, radius);
    
    radius = ai.right.get(i)*500;
  }
    
}

void pillardraw()
{
  for (int i = 0; i < pillarx1.length; i++)
  {
    noStroke();
    fill(169,169,169);
    rect(pillarx1[i], pillary1[i], pillarSize[i], 150);
    rect(pillarx2[i], pillary2[i], pillarSize[i], -150);
    
    pillarx1[i] -= pillarSize[i] * Pspeed;
    pillarx2[i] -= pillarSize[i] * Pspeed;
    
    if (pillarx1[i] + pillarSize[i] < -10)
    {
      pillarx1[i] = 500;
      pillary1[i] = random(-20,0);
      Score++;
    }
    
    if (pillarx2[i] + pillarSize[i] < -10)
    {
      pillarx2[i] = 500;
      pillary2[i] = random(500,600);
      Score++;
    }
    
    if (dist(location.x/90, location.y, pillarx1[i], pillary1[i]) < (150))
  {
    pillarx1[i] = 500;
    pillary1[i] = random(-20,0);
    Score++;  
  }  
    
    if (dist(location.x/90, location.y, pillarx2[i], pillary2[i]) < (150))
  {
    pillarx2[i] = 500;
    pillary2[i] = random(500,700);
    Score++;  
  }  
  }
  print (location.y);
}

void UI()
{
  fill(250);
  text(Score,250,30);
}

void healthbar()
{
  smooth();
  noStroke();
  fill(255,0,0);
  beginShape();
  vertex(50, 15);
  bezierVertex(50, -5, 90, 5, 50, 40);
  vertex(50, 15);
  bezierVertex(50, -5, 10, 5, 50, 40);
  endShape();
}
   
