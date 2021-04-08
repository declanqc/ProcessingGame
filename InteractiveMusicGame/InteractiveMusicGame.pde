void setup()
{
  background(0);
  size(500, 500);
}
float x;
void draw()
{
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(250, 250, 50, 50);
  if(keyPressed == true && key == 'w')
  {
    x =1 ;
  
  }
  if (x == 1)
 { triangle(200, 150, 250,150, 225,120); }
 
}
