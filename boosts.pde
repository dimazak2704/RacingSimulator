public class Boost{
float xBoost;
float yBoost;
PImage picB;
 
  
Boost(String imagB){
this.xBoost=int(random(423));
this.yBoost=-1*(int(random(900))+500);
this.picB=loadImage(imagB);
}



public void resetB(){
this.xBoost=int(random(423));
this.yBoost=-100;  
}

public void fallB(){
this.yBoost+=2;
}

public void displayB(){
image(picB,xBoost,yBoost,110,170);
}
}
