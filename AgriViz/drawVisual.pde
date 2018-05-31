float margin = 75.0;
float xInc;
float yInc;
float graphXZero;
float graphYZero;
float plotSize = 5;

color phosColor = #00ff00;
color potColor = #ff0000;
color nitColor = #0000ff;
color yieldColor = #000000;
void drawVisual(){
  //establishes variables to reference origin of the graph
  graphXZero = margin;
  graphYZero = (height-margin); 
  //determine positioning of points(increments) on graph
  xInc = (width-(margin*2))/numYears;
  float steps = (float)(getMaxDataValue()/10);
  yInc = (height-(margin*2))/steps;
  //plots points for each ArrayList of elements
  plot(yieldPerAcre,yieldColor);
  plot(phosPerAcre,phosColor);
  plot(nitrogenPerAcre,nitColor);
  plot(potashPerAcre,potColor);
  //draws axis, key and labels
  drawAxis();
  drawKey();
}

private void drawAxis(){
  //print graph title
  fill(0);
  textSize(24);
  textAlign(CENTER);
  text("Crop Yield vs. Fertilizer Use",width/2,30);
  stroke(0);
  float xPos=graphXZero;
  //y-axis
  line(margin,margin,margin,height-margin);
  //x-axis
  line(margin,height-margin,width-margin,height-margin);
  //x-axis labels(years)
  fill(0);
  textSize(12);
  text("Year",width/2,height-15);
  xPos-=xInc;
  for(Integer i:years){
    xPos+=xInc;
    if(i%2!=0){
    text(i,xPos,graphYZero+25);
    line(xPos,graphYZero,xPos,graphYZero+10);
    }else{
      text(i,xPos,graphYZero+40);
      line(xPos,graphYZero,xPos,graphYZero+30);
    }
  }
  //y-axis labels(just numerical values)
  textAlign(RIGHT,CENTER);
  Double max = getMaxDataValue();
  int count = 0;
  float yPos=graphYZero;
  while(count<max){
    line(margin-10,yPos,margin,yPos);
    text(count,margin-15,yPos);
    yPos-=yInc;
    count+=10;
  }
  textAlign(LEFT);
}


private void drawKey(){
  fill(255);
  stroke(0);
  float xPos = margin+30;
  float yPos = margin+30;
    //box for key
  rect(margin+20,margin+20,200,90);
  //labels and their respective colors
  drawLabel(xPos,yPos,nitColor,"Nitrogen(lbs/acre)");
  yPos+=20;
  drawLabel(xPos,yPos,phosColor,"Phosphates(lbs/acre)");
  yPos+=20;
  drawLabel(xPos,yPos,potColor,"Potash(lbs/acre)");
  yPos+=20;
  drawLabel(xPos,yPos,yieldColor,"Corn yield(bushels/acre)");
}

void drawLabel(float x,float y,color c, String text){
  fill(c);
  rect(x,y,10,10);
  fill(0);
  text(text,x+20,y+10);
}

void plot(ArrayList<Double> aL,color c){
  noStroke();
  fill(c);
  ellipseMode(CENTER);
  float xCoord = graphXZero;
 for(int i=0;i<aL.size();i++){
   if(aL.get(i)!=0){  
   ellipse(xCoord,graphYZero-(((float)(double)aL.get(i)/10)*yInc),plotSize,plotSize);
   }
   xCoord+=xInc;
 }
}
