public class Car{
float xCar, yCar;
PImage pic;
float a;
String colorC = "red";
float speed = 1;


Car(String imag){
this.a=int(random(3)+1);
if(a==1){this.xCar=50;}
if(a==2){this.xCar=240;}
if(a==3){this.xCar=430;}
this.yCar=-1*random(500);
this.pic=loadImage(imag);



}  


public void fall (){
this.yCar+=speed;
}


public void reset(){
this.a=int(random(3)+1);
if(a==1){this.xCar=50;}
if(a==2){this.xCar=240;}
if(a==3){this.xCar=430;}
this.yCar=-1*random(400, 1000);
}


public void displayCar(){
 image(pic,xCar,yCar,100,200);
}

public void speedup(){
this.speed+=0.005;
}

public void speeddown(){
this.speed=1;
}
}
