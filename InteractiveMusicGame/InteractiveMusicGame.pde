void setup()
{
  background(0);
  size(500, 500);
}

float x;
void draw()
{
  println(mouseX, mouseY);
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  rect(250, 250, 50, 50);
  if(keyPressed == true && key == 'w')
  {
    x =1 ;
  }
  if(keyPressed == true && key == 'a')
  {
    x = 2;
  }
    if(keyPressed == true && key == 'd')
  {
    x = 3;
  }
      if(keyPressed == true && key == 's')
  {
    x = 4;
  }
  
  if (x == 1)
 {
   fill(255);
   triangle(225, 225, 250, 200, 275, 225);
 }
 if (x == 2)
 {
   fill(255);
   triangle(225, 275, 200, 250, 225, 225); 
 }
 if(x == 3)
 {
  fill(255);
  triangle(275, 225, 300, 250, 275, 275); 
 }
 if(x == 4)
 {
  fill(255);
  triangle(225, 275, 250, 300, 275, 275); 
 }
 
}
