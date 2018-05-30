ArrayList<Integer> years = new ArrayList<Integer>();

ArrayList<Double> phosphateUsed = new ArrayList<Double>();
ArrayList<Double> phosPerAcre = new ArrayList<Double>();

ArrayList<Double> potashUsed = new ArrayList<Double>();
ArrayList<Double> potashPerAcre = new ArrayList<Double>();

ArrayList<Double> nitrogenUsed = new ArrayList<Double>();
ArrayList<Double> nitrogenPerAcre = new ArrayList<Double>();


ArrayList<Double> cropPlanted = new ArrayList<Double>();
ArrayList<Double> cropHarvested = new ArrayList<Double>();
ArrayList<Double> yieldPerAcre = new ArrayList<Double>();

void loadData(){
  try{
  loadYears();
  loadHarvest();
  loadPhosphate();
  loadNitrogen();
  loadPotash();
  System.out.println("crop yield\n"+yieldPerAcre+"\n");
    System.out.println("phos used\n"+phosPerAcre+"\n");
  }catch(Exception e){
   System.out.println(e); 
  }
}

void loadYears(){
  for(TableRow row: fertTable.rows()){
    if(row.getInt("Year")!=0)
    years.add(row.getInt("Year"));
  }
  numYears = years.size();
}

void loadHarvest(){
  for(TableRow row: cropTable.rows()){
    //add planted acres(millions)
    if(row.getInt("Planted acreage (Million acres)")!=0){
      cropPlanted.add(row.getDouble("Planted acreage (Million acres)"));
    }
    //add harvested bushels(millions)
    if(row.getInt("Production (Million bushels)")!=0){
      cropHarvested.add(row.getDouble("Production (Million bushels)"));
    }
  }
  
  //calculate bushels yielded per acre of crop planted
  for(int i = 0;i<cropPlanted.size();i++){
   yieldPerAcre.add(new Double(cropHarvested.get(i)/cropPlanted.get(i))); 
  }
}

private void loadPhosphate(){
  //reads in data for phosphate used
  for(TableRow row: fertTable.rows()){
    if(row.getInt("PH/Corn")!=0){
    phosphateUsed.add(row.getDouble("PH/Corn"));
    }
    //handles years where fertilizer data is unavailable, marked in data as "NA"
    if(row.getString("PH/Corn").contains("NA")){
    phosphateUsed.add(new Double(0));
  }
}
  //calculate phosphate used per acre in respective year, in lbs.
  for(int i =0;i<cropPlanted.size();i++){
    Double phos = (phosphateUsed.get(i)*20000);
    Double acreage = (cropPlanted.get(i)*10000000);
    if(phos==0){
      phosPerAcre.add(new Double(0));
    }else{
    phosPerAcre.add(new Double(acreage/phos));
  }
  }
}

private void loadPotash(){
  //reads in data for potash used
  for(TableRow row: fertTable.rows()){
    if(row.getInt("PO/Corn")!=0){
    potashUsed.add(row.getDouble("PO/Corn"));
    }
    //handles years where fertilizer data is unavailable, marked in data as "NA"
    if(row.getString("PO/Corn").contains("NA")){
    potashUsed.add(new Double(0));
  }
}
  //calculate potash used per acre in respective year, in lbs.
  for(int i =0;i<cropPlanted.size();i++){
    Double pot = (potashUsed.get(i)*20000);
    Double acreage = (cropPlanted.get(i)*10000000);
    if(pot==0){
      potashPerAcre.add(new Double(0));
    }else{
    potashPerAcre.add(new Double(acreage/pot));
  }
  }
}

private void loadNitrogen(){
  //reads in data for nitrogen used
  for(TableRow row: fertTable.rows()){
    if(row.getInt("N/Corn")!=0){
    nitrogenUsed.add(row.getDouble("N/Corn"));
    }
    //handles years where fertilizer data is unavailable, marked in data as "NA"
    if(row.getString("N/Corn").contains("NA")){
    nitrogenUsed.add(new Double(0));
  }
}
  //calculate nitrogen used per acre in respective year, in lbs.
  for(int i =0;i<cropPlanted.size();i++){
    Double nit = (nitrogenUsed.get(i)*20000);
    Double acreage = (cropPlanted.get(i)*10000000);
    if(nit==0){
      nitrogenPerAcre.add(new Double(0));
    }else{
    nitrogenPerAcre.add(new Double(acreage/nit));
  }
}
}



Double getMaxDataValue(){
  //this works on the principle that yield will always be greater than fertilizer used
  Double max = Double.MIN_VALUE;
  for(int i =0;i<yieldPerAcre.size();i++){
   if(max<yieldPerAcre.get(i)){
     max=yieldPerAcre.get(i);
  }
  
}
return max;
}