import nl.tue.id.oocsi.*;

PImage img_0,img_1,img_2; 
boolean[] person={false, false, false};
boolean[] images_0 = {false, false, false, false, false};
boolean[] images_1= {false, false, false, false, false};
boolean[] images_2= {false, false, false, false, false};
PImage [] food_0 = new PImage[5];
PImage [] food_1 = new PImage[5];
PImage [] food_2 = new PImage[5];
int m;
int[] n_0=new int[5],n_1=new int[5],n_2=new int[5];

OOCSI oocsi;

void setup()
{
  size(600,700);
  smooth();
  img_0 = loadImage("girl_0.png");
  img_1 = loadImage("girl_1.png");
  img_2 = loadImage("girl_2.png"); 
  
  food_0[0] = loadImage("apple.png");
  food_0[1] = loadImage("shrimp.png");
  food_0[2] = loadImage("milk.png");
  food_0[3] = loadImage("steak.png");
  food_0[4] = loadImage("eggs.png");
  food_2=food_1=food_0;
  
   oocsi = new OOCSI(this, "table", "oocsi.id.tue.nl");
}
void draw(){
  
  background(255);
  smooth();
  for (int i = 0;i < 3;i++){
    stroke(100);
    strokeWeight(2);
    if(person[i]){
      fill(200);
    }else{
      fill(255);
    }
    ellipse(width/2-65+i*70,70,50,50);
  }
  tint(255);
  image(img_0,width/2-85,50,40,40);
  image(img_1,width/2-15,50,40,40);
  image(img_2,width/2+55,50,40,40);
  fill(230);
  quad(width/2-200,height/2,width/2+200,height/2,width/2+160,height/2-50,width/2-160,height/2-50);
  rect(width/2-200,height/2,400,20);
  rect(width/2-180,height/2+20,20,200);
  rect(width/2+160,height/2+20,20,200);
  
  for(int i = 0; i < 5; i++){
    tint(255,255,255,230);
    if (images_0[i]){
       m=millis();
       image(food_0[i],120+80*i, height/2-60, 40,40);
       if((m-n_0[i])>5000){
       oocsi.channel("foodfridge").data("person", 1).data("food",i+1).send();
       }
    }
    if (images_1[i]){
        m=millis();
       image(food_0[i],120+80*i, height/2-60, 40,40);
        if((m-n_1[i])>5000){
       oocsi.channel("foodfridge").data("person", 2).data("food",i+1).send();
       }
    }
    if (images_2[i]){
       m=millis();
       image(food_0[i],120+80*i, height/2-60, 40,40);
       if((m-n_2[i])>5000){
       oocsi.channel("foodfridge").data("person", 3).data("food",i+1).send();
       }
    }
    else{
    oocsi.channel("foodfridge").data("person", 0).data("food",0).send();
  }
  }
  
}

void mousePressed(){
  for(int i =0 ; i < 3; i++){
   if (dist(mouseX,mouseY,width/2-65+i*70,70)<=25){
    person[i]=!person[i];
    for(int j=0; j<3; j++){
     if (j!=i){
       person[j]=false;
     }
     }
   }
  }
  
}

void keyPressed() {
  
   if (person[0]){
  for(int i = 0;i < 5;i++){
    
    if(key == (i+49) ){
    images_0[i]= !images_0[i];
    n_0[i] = millis();
    } 
  }
  } 
  if(person[1]){
      for(int i = 0;i < 5;i++){  
    if(key == (i+49)){
    images_1[i]=  !images_1[i];
    n_1[i]= millis();
    }
  }    
  } 
  if(person[2]){
    for(int i = 0;i < 5;i++){    
       if(key == char(i+49)){
       images_2[i]= !images_2[i];  
       n_2[i]=millis();
  }
  }    
  }
  
  
}