import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer player;
AudioBuffer buffer;
AudioInput ai;

float lerpedAverage = 0;

float[] lerpedBuffer;
float z = 0;

void setup()
{

  background(0);
  size(512, 512);
  minim = new Minim(this);
  player = minim.loadFile("Gorgon City - All Four Walls ft. Vaults (Official Video).mp3", width);
  player.play();
  ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  buffer = player.left;


  lerpedBuffer = new float[buffer.size()];

}
float x;
float pr;
float t1 = 0;
float t4 = 700; // up and down circles
float t2 = - 200;
float t3 = 600; // left and right circles
int lives = 3;
void draw()
{
  background(0);
  colorMode(HSB);
  sideWaves();
  println(mouseX, mouseY);
  fill(255);
  text("lives:", 30, 60);
  text(lives, 80, 60);
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(250, 250, 50, 50);
  //Controls
  if(keyPressed == true && key == 'w')
  {
    x =1 ;
  
  }
  if(keyPressed == true && key == 'a')
  {
    x =2 ;
  
  }
  if(keyPressed == true && key == 'd')
  {
    x =3 ;
  
  }
  if(keyPressed == true && key == 's')
  {
    x =4 ;
  
  }
 //Control functions
  if (x == 1)
 {
   colorMode(RGB);
   stroke(255,255,0);
   fill(255,255,0);
   triangle(245, 220, 255,220, 250,210); 
   pr=1;
   
 }
 if (x == 2)
 {
      colorMode(RGB);

   stroke(255,255,0);
   fill(255,255,0);
   triangle(220, 245, 220,255, 210,250); 
   pr=2;
 }
 if (x == 3)
 {
      colorMode(RGB);

   stroke(255,255,0);
   fill(255,255,0);
   triangle(280, 245, 280,255, 290,250); 
   pr=3;
 }
 if (x == 4)
 {
      colorMode(RGB);

   stroke(255,255,0);
   fill(255,255,0);
   triangle(245, 280, 255, 280, 250, 290); 
   pr=4;
 }
 

 //Baddies 
 float sum = 0;
  for (int i = 0; i < buffer.size(); i ++) 
  {
    sum += abs(buffer.get(i));
  }
    float smoothedAverage = 0;

    float average = sum / buffer.size();
  smoothedAverage = lerp(smoothedAverage, average, 0.1);
  fill(random(1, 255), random(1, 255), random(1, 255));
  ellipse(250, t1, average * 100, average * 100);
   t1 += smoothedAverage * 50;
   
   
  ellipse(250, t4, average * 100, average * 100);
  t4 -= smoothedAverage * 125;
  
  ellipse(t2, 250, average * 100, average * 100);
  t2 += smoothedAverage * 75;
  
  ellipse(t3, 250, average * 100, average * 100);
  t3 -= smoothedAverage * 100;
  

 //Collider
 if(t1 > 200 && t1 < 220 && pr == 1)
 {
   t1 = 0;
 }
 if( t1 > 220)
 {
  t1 = 0; 
  lives --;
 }
 
 
 if(t4 > 280 && t4 < 300 && pr == 4)
 {
   t4 = 600;
 }
if(t4 < 300)
{
  t4 = 600;
  lives --;

}


if(t2 > 200 && t2 < 220 && pr == 2)
{
  t2 = -100;
}
if(t2 > 220)
{
  t2 = -100;
  lives --;

}


 if(t3 > 280 && t3 < 300 && pr == 3)
 {
   t3 = 600;
 }
if(t3 < 300)
{
  t3 = 600;
  lives --;

}




}
void sideWaves()
{
     background(0);
  float halfH = height / 2;
  
  strokeWeight(1);
  for (int i = 0; i < buffer.size(); i ++)
  {
    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    lerpedBuffer[i] = lerp(lerpedBuffer[i], buffer.get(i), 0.1f);
    float sample = lerpedBuffer[i] * width * 1;    
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(i, 0 + sample, i, 0 - sample); 
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(i, height + sample, i, height - sample);
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(height + sample, i, height - sample, i);
    stroke(map(i, 0, buffer.size(), 0, 255), 255, 255);
    line(0 + sample, i, 0 - sample, i);

  }
  
  float sum = 0;
  for (int i = 0; i < buffer.size(); i ++)
  {
    sum += abs(buffer.get(i));
  }

  noStroke();
  float average = sum / buffer.size();
  lerpedAverage = lerp(lerpedAverage, average, 0.1f);
}

float sum = 0;
float smoothedAverage = 0;
