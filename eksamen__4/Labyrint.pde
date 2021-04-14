public class Labyrint{
  
 void mur(int x, int y){
   
  color hoved    = get(x+32,y+14); //tjekker den pixels farve
  color ryg      = get(x+32,y+55);
  color vskulder = get(x+14,y+32);

  println("hoved" + hoved);
  println("skulder" + vskulder);
    fill(hoved);
   rect(x+32,y+14,5,5);
   fill(ryg);
   rect(x+32,y+49,5,5);
   fill(vskulder);
   rect(x+14,y+32,5,5);
   //fill(hskulder);
   rect(x+49,y+32,5,5);
  
   /*
  if(hoved == -379125){ //-10000 skal self rettes når rigtige variabel findes
    y -= 0;
    println("t");
  }
  if(ryg == -379125){
    y += 0;
    println("h");
  }
  if(vskulder == -1623283){
    x -= 0;
    println("o");
  } */
  
     
   }
   
  boolean hovedRamt(){
  color hoved   = get(x+32,y+14); //tjekker den pixels farve
  boolean hramt = false;
   if(hoved == -379125){ //-10000 skal self rettes når rigtige variabel findes
      hramt = true;
}
   return hramt;
}

  boolean hskulderRamt(){
  color hskulder = get(x+55,y+32);
  boolean hsramt = false;
    if(hskulder == -1623283){
      hsramt = true;
    println("w");
  }
   return hsramt;
}



}




   
   
