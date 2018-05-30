boolean eggMode = false;
PImage flake;
PImage present;
float[] amps;
float[] xVals;
float[] yVals;
float[] angles;
float[] speeds;
int flakes = 250;
int maxSpeed = 25;
class BlizzardSnow{
  public void generate(){
    present = loadImage("present.png");
    flake = loadImage("flake.png");
    amps = new float[flakes];
    xVals = new float[flakes];
    yVals = new float[flakes];
    angles = new float[flakes];
    speeds = new float[flakes];
    for(int i = 0; i < xVals.length;i++){
      xVals[i] = random(0,1020);
      yVals[i] = random(10,650);
      angles[i] = random(0,6.24);
      amps[i] = random(0,2);
      speeds[i] = random(0.25,1)*maxSpeed;
    }  
  }
  public void draw(){
    noStroke();
    fill(255);
    for(int i =0; i < xVals.length;i++){
    if(eggMode){
      image(present,xVals[i],yVals[i],25,25);
    }else{
      image(flake,xVals[i],yVals[i],15,15);
    }
    yVals[i]=yVals[i]+(amps[i]*cos(angles[i]));
    if(angles[i]<=6.27){
      angles[i]+=.01;
    }else{
      angles[i] = 0;
    }
    if(xVals[i] > 1024){
        xVals[i] = 0;
    }
    xVals[i]+=speeds[i];
}
  }
  public void egg(){
    eggMode=!eggMode;
  }
}