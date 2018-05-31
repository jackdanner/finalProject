# AgriViz - Illustrate the effects of fertilizer use on crop yield over a period of years

This project was to create a visualization of fertilizer usage in corn fields and the correlation with the yield per acre of corn planted. Phosphates, nitrogen and potash were the observed fertilizers in this project.

### Difficulties or opportunities you encountered along the way.

The toughest part was trying to come up with a way to illustrate the efficiency of the harvest. The amount planted and harvested increases as time progresses as trend for the set. To show the increase in efficiency, the data represented is a ratio of corn harvested(bushels) to the amount planted (acres).  It was done this way so that the yield is shown, not total amounts.

### Most interesting piece of your code and explanation for what it does.

```Java
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
```
I think this is the most interesting piece of code. It produces the amount of fertilizer used per acre. The incoming data was in millions of acres and 1,000 short tons, so conversions were necessary to get the usage in lbs./acre, because that is the most logical unit of measure in this circumstance. 

## Built With

* [Processing](https://processing.org/) - The IDE used

## Authors

Jack Danner


## Acknowledgments
Data provided the United States Department of Agriculture division of the Economic Research Service. Raw data files are posted under the project’s “raw data” folder, with the original, unmodified files residing under the folder titled “original data”.
Links to datasets:
-https://www.ers.usda.gov/data-products/fertilizer-use-and-price.aspx
-https://www.ers.usda.gov/data-products/feed-grains-database/feed-grains-yearbook-tables/


## Inspiration
I find agriculture interesting, and was curious to see if fertilizer usage has anything to do with increase of efficiency in the field(no pun intended) of agriculture. The visualization shows that there is no correlation between the increase in yield and fertilizer used. Increased efficiencies come from somewhere else.s
