Table cropTable;
Table fertTable;

int numYears;

void setup(){
 //read csv files into table
 try{
   cropTable = loadTable("Corn.csv","header");
   fertTable = loadTable("Fertilizer.csv","header");
 }catch(Exception e){
  System.out.println("error loading data");
   exit(); 
 }
  size(1300,700);
  background(255);
  loadData();
  drawVisual();
}
