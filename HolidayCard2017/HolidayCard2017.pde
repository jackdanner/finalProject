float g1 = 68;
float g2 = 48;
float g3 = 51;
Tree tr;
BlizzardSnow snow = new BlizzardSnow();
int numFlakes;
void setup(){
  size(1024,660);
  tr = new Tree();
  snow.generate();
  textSize(48);
}

void draw(){
  if(keyPressed){
    delay(250);
    snow.egg();
  }
  background(14,35,97);
  fill(g1,g2,g3);
  rectMode(CORNER);
  rect(-1,560,1025,100);
  fill(225,32,12);
  text("Stay warm this holiday season.",70,100);
  tr.drawTree(300,312,525);
  snow.draw();
  g1+=.125;
  g2+=.125;
  g3+=.125;
  
}