import java.util.Map;
import java.util.TreeMap;
import java.util.Scanner;
import java.util.Arrays;

Map<String,Integer> wordMap;
String bookFile = "desktop/wordMapViz/data/book.txt";

void setup(){
  wordMap = new TreeMap<String,Integer>();
  size(1400,800);
  background(0);
}

void draw(){
 noLoop();
 //loadBook();

}

void loadBook(){
  try{
  Scanner scan = new Scanner(new File(bookFile));
  while(scan.hasNextLine()){
    addLine(scan.nextLine());
  }
  scan.close();
 }catch(Exception e){
   System.out.println("error loading file");
 }
}

void addLine(String s){
  String[] words = s.split("\\W");
  for(String in:words){
    if(wordMap.containsKey(in)){
      int temp = wordMap.get(in);
      wordMap.put(in,(temp+1));
    }else{
      wordMap.put(in,1);
    }
  }
}

void drawVis(){
  
}