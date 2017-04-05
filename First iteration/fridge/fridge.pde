import nl.tue.id.oocsi.*;

PImage img_0,img_1,img_2,img; 
boolean circleOver = false;
color currentColor, circleColor;
int circleX, circleY,circleSize = 50;
boolean[] buttons = {false, false, false};
boolean[] images_0 = {false, false, false, false, false};
boolean[] images_1= {false, false, false, false, false};
boolean[] images_2= {false, false, false, false, false};
String[] items = {"apple","shrimp","milk","steak","eggs"};
PImage [] food_0 = new PImage[5];
PImage [] food_1 = new PImage[5];
PImage [] food_2 = new PImage[5];
int []position = {280, 310, 350, 450, 500};
int day=1;
int[] expiration= {2,5,14,7,10};
int[] trans_0 = new int[5];
int[] trans_1 = new int[5];
int[] trans_2 = new int[5];
int sizeoffood = 25;
int person;
int food;
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
  food_0[0] = loadImage("apple.png");
  food_0[1] = loadImage("shrimp.png");
  food_0[2] = loadImage("milk.png");
  food_0[3] = loadImage("steak.png");
  food_0[4] = loadImage("eggs.png");
  food_2=food_1=food_0;
  for (int i = 0; i < 5; i++) {
    trans_0[i] = 255/expiration[i];
    trans_1[i] = 255/expiration[i];
    trans_2[i] = 255/expiration[i];
  }
  OOCSI oocsi = new OOCSI(this, "fridge", "oocsi.id.tue.nl");
  oocsi.subscribe("foodfridge");
}  

void draw()  
{ 
  background(255);
  smooth();
  tint(255);
  image(img,245,40,310,600);
  noStroke();
  tint(255,255,255,255);
  fill(245, 245, 220);
  rect(width/2-150, height/2-270, 300, 80);
  fill(240, 248, 255);
  rect(width/2-150, height/2-190, 300, 80);
  fill(255, 240, 255);
  rect(width/2-150, height/2-110, 300, 80);
  
  strokeWeight(2);
  stroke(0);
  noFill();
  //rect(width/2-150, height/2-300, 300, 600, 20);
 // line(width/2-150, 350, width/2+150, 350);
  //rect(380, 340, 40, 10, 6, 6, 0, 0);
  //rect(380, 350, 40, 10, 0, 0, 6, 6);
  //rect(width/2-130, height/2+300, 20, 20);
  
  stroke(100);
  fill(100);
  textSize(15);
  text("Day "+ day, width/2-20, 30);
  
  for(int i = 0;i < 3;i++) {
    if(buttons[i]) {
      fill(200);
    }
    else{
      fill(255);
    }
    
    ellipse(width / 2, height / 2 - 235 + i * 80, 50, 50);
  }
  image(img_0,width/2-20, height/2-255, 40, 40);
  image(img_1,width/2-20, height/2-175, 40, 40);
  image(img_2,width/2-20, height/2-95, 40, 40);
  
 
  for (int i = 0; i < 5; i++){
    smooth();
    textSize(12);
    fill(100);
    //text(items[i],80, 80+i*20);
    if (images_0[i]){
      tint(255,255,255,trans_0[i]);
      image(food_0[i],position[i], height/2-250, sizeoffood,sizeoffood);
      println("1,"+items[i]);
      if (trans_0[i] >= 255 && trans_0[i]< 255 + 255/expiration[i]){
        fill(245, 245, 220);
        noStroke();
        rect(position[i], height/2-250, sizeoffood,sizeoffood);
        tint(255,255,255,random(0,255));
        image(food_0[i],position[i], height/2-250, sizeoffood,sizeoffood);
        //image(food_0[i],random(position[i]-5,position[i]+5), height/2-250, sizeoffood,sizeoffood);
        oocsi.channel("foodfridge").data("hi", i+1).send();
        if(keyPressed){
          if(key=='a'){
            trans_0[i]= 255/expiration[i];
            images_0[i]=false;
          }
        }
      }else if(trans_0[i] >= 255 + 255/expiration[i] ){
       trans_0[i]= 255/expiration[i];
       images_0[i]=false;
       }
  }
       
  if (images_1[i]){
       tint(255,255,255,trans_1[i]);
       image(food_1[i],position[i], height/2-170, sizeoffood,sizeoffood);
       println("2,"+items[i]);
        if (trans_1[i] >= 255 && trans_1[i]< 255 + 255/expiration[i]){
         fill(240, 248, 255);
         noStroke();
         rect(position[i], height/2-170, sizeoffood,sizeoffood);
         tint(255,255,255,random(0,255));
         image(food_1[i],position[i], height/2-170, sizeoffood,sizeoffood);
         if(keyPressed){
          if(key=='s'){
            trans_0[i]= 255/expiration[i];
            images_1[i]=false;
          }
        }
      }
       else if(trans_1[i] >= 255 + 255/expiration[i] ){
       trans_1[i]= 255/expiration[i];
       images_1[i]=false;
       }
       } 
    if (images_2[i]){
       tint(255,255,255,trans_2[i]);
       image(food_2[i],position[i], height/2-90, sizeoffood,sizeoffood);
       println("3,",items[i]);
        if (trans_2[i] >= 255 && trans_2[i]< 255 + 255/expiration[i]){
         fill(255, 240, 255);
         noStroke();
         rect(position[i], height/2-90, sizeoffood,sizeoffood);
         tint(255,255,255,random(0,255));
         image(food_2[i],position[i], height/2-90, sizeoffood,sizeoffood);
         if(keyPressed){
          if(key=='d'){
            trans_0[i]= 255/expiration[i];
            images_2[i]=false;
          }
        }
      }else if(trans_2[i] >= 255 + 255/expiration[i] ){
       trans_2[i]= 255/expiration[i];
       images_2[i]=false;
       }
    }
  } 

 for (int i=0;i<5;i++){
  if (person==1){
    if(food==i+1){
      noStroke();
      fill(245, 245, 220);
      rect(position[i],height/2-250,sizeoffood,sizeoffood);
      image(food_0[i],random(position[i]-10,position[i]+10), height/2-250, sizeoffood,sizeoffood);
    }
  }
  if (person==2){
    if(food==i+1){
      noStroke();
      fill(240, 248, 255);
      rect(position[i],height/2-170,sizeoffood,sizeoffood);
      image(food_0[i],random(position[i]-10,position[i]+10), height/2-170, sizeoffood,sizeoffood);
    }
  }
  if (person==3){
    if(food==i+1){
       noStroke();
       fill(255, 240, 255);
       rect(position[i],height/2-90,sizeoffood,sizeoffood);
       image(food_0[i],random(position[i]-10,position[i]+10), height/2-90, sizeoffood,sizeoffood);
    }
  }
 }

  
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
 
  if(mouseX > (width/2-20) && mouseX < (width/2+20) && mouseY < 40 && mouseY > 20){
    day++;
     for (int i = 0; i < 5; i++){
       if(images_0[i]){
       trans_0[i] += 255/expiration[i];
     }
       if(images_1[i]){
       trans_1[i] += 255/expiration[i];
     }
      if(images_2[i]){
       trans_2[i] += 255/expiration[i];
     }
  }
  }
   if (buttons[0]){
  for(int i = 0;i < 5;i++){
    if(mouseX > 80 && mouseX < 120 && mouseY < 80+20*i && mouseY > 60+20*i){
    images_0[i]= true;
    } 
  }
  } 
}

void keyPressed() {
  
   if (buttons[0]){
  for(int i = 0;i < 5;i++){
    
    if(key == (i+49) ){
    images_0[i]= true;
    } 
  }
  } 
  if(buttons[1]){
      for(int i = 0;i < 5;i++){  
    if(key == (i+49)){
    images_1[i]= true;
    }
  }    
  } 
  if(buttons[2]){
    for(int i = 0;i < 5;i++){    
       if(key == char(i+49)){
       images_2[i]= true;   
  }
  }    
  }
  
  
}
void foodfridge(OOCSIEvent event){
  person = event.getInt("person",0);
  food = event.getInt("food",0);
}