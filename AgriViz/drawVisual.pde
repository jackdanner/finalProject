float margin = 75.0;
float xInc;
float yInc;
float graphXZero;
float graphYZero;
float plotSize = 5;
void drawVisual(){
  graphXZero = margin;
  graphYZero = (height-margin); 
  drawAxis();
  //determine positioning of points on graph
  xInc = (width-(margin*2))/numYears;
  float steps = (float)(getMaxDataValue()/10);
  yInc = (height-(margin*2))/steps;
  plot(yieldPerAcre,0,0,0);
  plot(phosPerAcre,0,255,0);
  plot(nitrogenPerAcre,255,0,0);
  plot(potashPerAcre,0,0,255);
  
}

void drawAxis(){
  fill(0);
  //y-axis
  line(margin,margin,margin,height-margin);
  //x-axis
  line(margin,height-margin,width-margin,height-margin);
}

void drawLabels(){
  
}

void drawKey(){
  fill(255);
  
}

void plot(ArrayList<Double> aL,int r, int g, int b){
  noStroke();
  fill(r,g,b);
  ellipseMode(CENTER);
 float prevX = graphXZero;
 float prevY = graphYZero;
 float xCoord = graphXZero;
 for(int i=0;i<aL.size();i++){
   if(aL.get(i)!=0){  
   ellipse(xCoord,graphYZero-(((float)(double)aL.get(i)/10)*yInc),plotSize,plotSize);
   }
   xCoord+=xInc;
 }
}