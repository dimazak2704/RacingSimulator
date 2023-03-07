//import processing.sound.*;

PImage background;
PImage maincar;
PImage menu1;
PImage startButton;
PImage redcar;                                                        //images
PImage greencar;
PImage exit;
PImage pause;
PImage speedboost;
PImage slowboost;
PImage fps;
PImage soundOn;

boolean menu = true;
boolean boosts = false;
boolean speedupB= false;
boolean timer=false;
boolean speedcars= false;

String onF = "OFF";
String onS = "ON";


int score=1;
int sped = 10;

int fpsn=1;
int sndn=2;


int savedTime;                                                   //timer int
int totalTime = 7000;
int totalTimeB=5000;
int passedTime;
int passedTimeB;

Car[] car = new Car[3];                                          //cars

Boost[] boost = new Boost[1];                                    //boosts 

float xMaincar, yMaincar;

//SoundFile click;
//SoundFile over;

void setup(){
size(573,869);

background = loadImage("background.png");                        //loadImage
maincar = loadImage("maincar.png");
menu1 = loadImage("menu.jpg");
startButton = loadImage("startButton.png");
redcar = loadImage("redcar.png");
greencar = loadImage("greencar.png");
exit = loadImage("exit.png");
pause = loadImage("pause.png");
speedboost = loadImage("speedboost.png");
slowboost = loadImage("slowboost.png");
fps = loadImage("FPS.png");
soundOn=loadImage("sounds.png");
frameRate(120);

savedTime = millis();

for(int i =0; i<3; i++){                                          //spawn cars
  car[i]=new Car("redcar.png"); 
  }
  
   //click= new SoundFile(this, "click.wav");
   //over = new SoundFile(this, "gameover.wav");
  
  xMaincar= 240.5;
  yMaincar= 650;
  
score=1;


 boost[0] = new Boost("slowboost.png"); 
  
}



void draw(){
  
  
if(menu==true){                                                             //menu start
  
background(menu1);
image(startButton,0,500,600,250);                                          //start button

image(fps,513,10,50,50);
fill(255, 0, 0);                                                                  //framerate
textSize(17);
text(onF, 523, 50);

if (fpsn%2==0){
onF= "ON";
}
else{
onF="OFF";
}

image(soundOn,453,10,50,50);
fill(255, 0, 0);                                                                  //sound on/off
textSize(17);
text(onS, 463, 50);

if(sndn%2==0){
onS="ON";
}
else{ 
onS="OFF";
}


image(exit,130,750,300,100);                                               //exit button
if(mouseX>130 && mouseX<430 && mouseY>750 && mouseY<850 && mousePressed){
 if(sndn%2==0){
 //click.play(); 
 }
 exit();
 }

if(mouseX>50 && mouseX<525 && mouseY>600 && mouseY<700 && mousePressed){
 menu=false;                                                                //menu false
  if(sndn%2==0){
 //click.play(); 
  }
 }
} 

if(menu==false){                                                             //game start 

background(background);

image(maincar,xMaincar,yMaincar,100,200);

textSize(50);
 fill(0, 255, 0);                                                          //score
 text(score-1,503,50);

if (xMaincar<50){xMaincar=50;}
if (xMaincar>430){xMaincar=430;}                                             //borders
if (yMaincar<0){yMaincar=0;}
if (yMaincar>669){yMaincar=669;}

for (int i=0;i<3;i++){                                                       //cars   
                                                                            //display
  /*if((car[1].xCar==car[2].xCar)&&(car[1].yCar>car[2].yCar)){
  if(car[1].yCar-car[2].yCar<450){
  car[2].reset();
  }
  }
  
  if((car[0].xCar==car[1].xCar)&&(car[0].yCar>car[1].yCar)){
  if(car[0].yCar-car[1].yCar<450){
  car[1].reset();
  }
  }
  
  if((car[0].xCar==car[2].xCar)&&(car[0].yCar>car[2].yCar)){
  if(car[0].yCar-car[2].yCar<450){
  car[2].reset();
  }
  }
  
  
  if(car[i].xCar==car[i+1].xCar && car[i].yCar-car[i+1].yCar<450){
  car[i+1].yCar-=300;
    if(i>2){
    i=0;
    }
  }*/
  
  if(car[0].xCar==car[1].xCar && car[0].xCar>car[1].xCar && car[0].yCar-car[1].yCar<450){
  car[1].yCar-=random(200,400);
  }
  if(car[1].xCar==car[2].xCar && car[1].xCar>car[2].xCar && car[1].yCar-car[2].yCar<450){
  car[2].yCar-=random(200,400);
  }
  if(car[0].xCar==car[2].xCar && car[0].xCar>car[2].xCar && car[0].yCar-car[2].yCar<450){
  car[2].yCar-=random(200,400);
  }
  
  
  
  if(((car[0].xCar!=car[1].xCar)&&(car[0].xCar!=car[2].xCar))&&(car[1].xCar!=car[2].xCar)){
  car[2].reset();
  }
  
  
  car[i].displayCar();
 
  car[i].fall();                                                             //fall
if(car[i].yCar>=869){
  car[i].reset();                                                               //reset
  score++;
}

if((car[i].yCar+200>yMaincar && car[i].yCar<yMaincar+200) && (car[i].xCar+100>xMaincar && car[i].xCar<xMaincar+100)){    //collision
  menu = true;
  car[0].reset();                                                               //reset
  car[1].reset();                                                               
  car[2].reset();                                                               

  if(sndn%2==0){
  //over.play();
  }
  xMaincar= 240.5;
  yMaincar= 650;  
  score=1;
  
  car[0].speeddown();
  car[1].speeddown();
  car[2].speeddown();
   
  boost[0].resetB();
  boosts=false;
}


if(i>2){
i=0;
if(car[i].xCar==car[i+1].xCar){
car[i+1].yCar=-420;
}
}

if (score%5 == 0){
speedcars=true;
}

if (speedcars==true){
car[i].speedup();
speedcars=false;
}


}


image(pause,0,0,80,65); 
if(mousePressed && mouseX>0 && mouseX<80 && mouseY>0 && mouseY<65){                 //pause
  menu=true;
   if(sndn%2==0){
  //click.play(); 
}
}
                              


 passedTime = millis() - savedTime;                                            //timer
if (passedTime > totalTime) {
  boosts =true;
    
    savedTime = millis(); 
}

if (boosts == true){
    boost[0].displayB();                                                                //display boost
    boost[0].fallB();                                                                   //fall boost 
    if((boost[0].yBoost+170>yMaincar &&  boost[0].yBoost<yMaincar+200)&&(boost[0].xBoost+110>xMaincar && boost[0].xBoost<xMaincar+100)){
    boost[0].resetB();
    speedupB=true; 
    boosts=false;
    }
}


if(boost[0].yBoost>900){
boost[0].resetB();
boosts=false;
}

if (speedupB==true){
sped=5;
timer = true;
speedupB=false;
}

if (timer==true){
  
   passedTimeB = millis() - savedTime;                                            //timerBoosts
   if (passedTimeB > totalTimeB) {
    savedTime = millis(); 
    sped = 10;
    timer=false;
  }
}



}                                                                                 //game

if(fpsn%2==0){
fill(0, 255, 0);                                                                  //framerate
textSize(30);
text(int(frameRate),100,50);
}

}

void keyPressed(){                                                  //control
    if (key == CODED) {
        if (keyCode == RIGHT) {
            xMaincar += 190;
        } 
    else if (keyCode == LEFT) {
            xMaincar -= 190;                                                      
        } 
    else if(keyCode == UP){
            yMaincar-=sped;
        }
    else if(keyCode == DOWN){
            yMaincar+=sped;
    }    
    
    }
  
}


void mouseClicked(){

  if (mouseX>513 && mouseX<563 && mouseY>10 && mouseY<60 && menu == true){
  fpsn+=1;
  }
  
  if (mouseX>453 && mouseX<503 && mouseY>10 && mouseY<60 && menu==true){

sndn+=1;
}

}
