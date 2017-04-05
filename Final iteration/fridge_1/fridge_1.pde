import nl.tue.id.oocsi.*;

PImage img_0,img_1,img_2,img; 
boolean circleOver = false;
color currentColor, circleColor;
int circleX, circleY,circleSize = 50;
boolean[] buttons = {false, false, false};
PImage [] food_0 = new PImage[5];
PImage [] food_1 = new PImage[5];
PImage [] food_2 = new PImage[5];
int []position = {280, 310, 350, 450, 500};
int sizeoffood = 25;
float x,y;
int angle=0;
int []num= {2,1,3};
int a= -1;
OOCSI oocsi;

void setup()  
{     
  size(800,700);    
  smooth();
  img=loadImage("fridge.jpg");
  img_0 = loadImage("girl_0.png");
  img_1 = loadImage("girl_1.png");
  img_2 = loadImage("girl_2.png");
 
  currentColor=color(255);
  circleColor=color(0);
  circleX=width/2;
  circleY= height/2-190;

 // OOCSI oocsi = new OOCSI(this, "fridge", "oocsi.id.tue.nl");
 // oocsi.subscribe("foodfridge");
}  

void draw()  
{ 
  background(255);
  smooth();
  tint(255);
  image(img,245,40,310,600);
  stroke(200);
  tint(255,255,255,255);
  
  noFill();
  strokeWeight(2);
  stroke(100);
  line(width/2-151,height/2-190,width/2+150,height/2-190);
  line(width/2-151,height/2-110,width/2+150,height/2-110);
  line(width/2-151,height/2-30,width/2+150,height/2-30);

  
  stroke(100);
  fill(100);
  textSize(15);
  
  for (int i = 0; i < num[0]; i++){ 
  fill(184,224,214);
  noStroke();
   if(i%2==0){
  ellipse(440+10*i+pow(-1,i/2)*10*sin((angle+i)*0.05),120+20*sin(i*10)*pow(-1,i/2)+pow(-1,i/2)*8*cos((angle+i)*0.01),20+10*cos(10*i),20+10*cos(10*i));
  }else{
  ellipse(370-10*i+pow(-1,i/2)*7*sin((angle+i)*0.01),120+20*sin(i*10)*pow(-1,i/2)+pow(-1,i/2)*9*cos((angle+i)*0.05),20+10*cos(10*i),20+10*cos(10*i));
  }
  }
 for (int i = 0; i < num[1]; i++){ 
  fill(184,224,214);
  noStroke();
  if(i%2==0){
  ellipse(440+10*i+pow(-1,i/2)*10*sin((angle+i)*0.01),200+20*sin(i*10)*pow(-1,i/2)+pow(-1,i/2)*7*cos((angle+i)*0.05),20+10*sin(10*i),20+10*sin(10*i));
  }else{
  ellipse(370-10*i+pow(-1,i/2)*9*sin((angle+i)*0.05),200+20*cos(i*10)*pow(-1,i/2)+pow(-1,i/2)*8*cos((angle+i)*0.01),20+10*sin(10*i),20+10*sin(10*i));
  }
  }
  for (int i = 0; i < num[2]; i++){ 
  fill(184,224,214);   
  noStroke();
  if(i%2==0){
  ellipse(440+10*i+pow(-1,i/2)*8*sin((angle+i)*0.05),280+20*cos(i*10)*pow(-1,i/2)+pow(-1,i/2)*9*cos((angle+i)*0.01),20+10*sin(10*i),20+10*sin(10*i));
  }else{
  ellipse(370-10*i+pow(-1,i/2)*7*sin((angle+i)*0.01),280+20*sin(i*10)*pow(-1,i/2)+pow(-1,i/2)*10*cos((angle+i)*0.05),20+10*sin(10*i),20+10*sin(10*i));
  }
  }
  angle++;
 
  for(int i = 0;i < 3;i++) {
    if(buttons[i]) {
      fill(200);
    }
    else{
      fill(255);
    }
    stroke(100);
    fill(245, 245, 220);
    ellipse(width / 2, height / 2 - 235 + i * 80, 50, 50);
  }
  image(img_0,width/2-20, height/2-255, 40, 40);
  image(img_1,width/2-20, height/2-175, 40, 40);
  image(img_2,width/2-20, height/2-95, 40, 40);
   

 
}

void mousePressed(){
  for(int i = 0;i < 3;i++) {
    if(dist(mouseX, mouseY, width / 2, height / 2 - 235 + i * 80) <= 25) {
      buttons[i] = !buttons[i];
      for(int j = 0;j < 3;j++) {
        if(j != i) {
          buttons[j] = false;
        }
      }
    }  
  } 
 
  
}

void mouseClicked(){
  num[0]++;
  
}