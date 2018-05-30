float c1 = 70;
float c2 = 100;
float c3 = 70;
class Tree{
  public void drawTree(int size,int x,int y){
    fill(99,51,51);
    rectMode(CENTER);
    int stumpheight = size/4;
    rect(x,y,size/5,stumpheight);
    fill(c1,c2,c3);
    triangle(x+size/1.5,y-stumpheight/2,x,y-size/1.5,x-size/1.5,y-stumpheight/2);
    triangle(x-size/2,y-stumpheight/.75,x,y-size/1.2,x+size/2,y-stumpheight/.75);
    ellipseMode(CENTER);
    c1+=.25;
    c2+=.25;
    c3+=.25;
  }
}