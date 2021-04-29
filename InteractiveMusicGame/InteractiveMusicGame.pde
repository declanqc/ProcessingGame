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
  player = minim.loadFile("Trance - 009 Sound System Dreamscape (HD).mp3", width);
  player.play();
  ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  buffer = player.left;


  lerpedBuffer = new float[buffer.size()];
}
float x;
float t1,t2,t3,t4;
float pr;

void draw()
{
  background(0);
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
   stroke(255,255,0);
   fill(255,255,0);
   triangle(245, 220, 255,220, 250,210); 
   pr=1;
   
 }
 if (x == 2)
 {
   stroke(255,255,0);
   fill(255,255,0);
   triangle(220, 245, 220,255, 210,250); 
   pr=2;
 }
 if (x == 3)
 {
   stroke(255,255,0);
   fill(255,255,0);
   triangle(280, 245, 280,255, 290,250); 
   pr=3;
 }
 if (x == 4)
 {
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
  fill(255);
  stroke(255);
  ellipse(250, t1, average * 100, average * 100);
   t1 += smoothedAverage * 50;

 //Collider
 if(t1 > 200 && t1 < 220 && pr ==1)
 {
   t1 = 0;
 }
 if( t1 > 220)
 {
  t1 = 0; 
 }
 
}
