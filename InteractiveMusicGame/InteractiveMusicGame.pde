void setup()
{
  background(0);
  size(500, 500);
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
   triangle(245, 290, 255,290, 250,300); 
   pr=4;
 }
 
 //Baddies
 fill(255,0,0);
 ellipse(250,t1,20,20);
 t1++;
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
