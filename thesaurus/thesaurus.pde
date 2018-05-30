import java.util.Set;
import java.util.Map;
import java.util.TreeMap;
import java.util.TreeSet;
import java.util.Scanner;
import java.util.Arrays;
PImage lou;
private Map<String,Set<String>> wordMap;
String remove;
void setup(){
 wordMap = new TreeMap<String,Set<String>>();
 remove = "wonderful";
 size(1800,800);
 background(0);
 PImage lou = loadImage("desktop/thesaurus/lou.png");
}

void draw(){
 noLoop();
 try{
   Scanner scan = new Scanner(new File("desktop/thesaurus/data/synonyms.txt"));
 while(scan.hasNextLine()){
   String[] in = scan.nextLine().split("-");
String[] synonyms = in[1].split(" ");
  for(String s: synonyms){
    addSynonym(in[0],s);
  }
 }
 
 scan.close();
 }catch(Exception e){
   System.out.println("ERROR");
 }

 visual();
}
public void addSynonym(String word, String syn){
 if(wordMap.containsKey(word)){
   Set<String> s = wordMap.get(word);
   s.add(syn);
   wordMap.put(word,s);
 }else{
  Set<String> s = new TreeSet<String>(); 
  s.add(syn);
  wordMap.put(word,s);
 }
}

public void removeSynonym(String syn){
  for(Map.Entry<String, Set<String>> entry : wordMap.entrySet()) {
      Set<String> s = entry.getValue();
      s.remove(syn);
      wordMap.put(entry.getKey(),s);
    }
}

public void visual(){
  int x = 20;
  int y = 20;
  int yInc = 50;
  fill(83, 244, 66);
  textSize(18);
  text("list before removal",x,y);
  y+=yInc;
  text(wordMap.toString(),x,y);
  
  fill(255, 21, 0);
  removeSynonym(remove);
  y+=yInc;
  text("list after removing: " + remove,x,y);
  y+=yInc;
    text(wordMap.toString(),x,y);
    
  
  removeSynonym("great");
  y+=yInc;
  text("list after removing: great",x,y);
  y+=yInc;
    text(wordMap.toString(),x,y);
    y+=yInc;
    try{
    image(lou,100,100,x,y);
    }catch(Exception e){
    }
}