import nl.tue.id.oocsi.*;

PImage phone,phone_1;
PImage []food=new PImage[3];
int []x={0,0,0};
int m,m_1,m_2,m_3;
int []i = {3,3,3};
OOCSI oocsi;

void setup(){
  
  size(500,700);
  smooth();
  phone = loadImage("phone.png");
  phone_1 = loadImage("phone_1.png");
  food[0] = loadImage("apple_away.png");
  food[1] = loadImage("banana_away.png");
  food[2] = loadImage("celery_away.png");
  
  oocsi = new OOCSI(this, "away", "oocsi.id.tue.nl");
}

void draw(){
  background(255);
  smooth();
  image(phone,90,0,350,700);
  m = millis();
  
  if (m > 2000){
     image(food[0],x[0],500,100,100);
     x[0]=x[0]+i[0];
     if (x[0]>500){
      oocsi.channel("foodfridge").data("food",1).send();
      i[0]=0;
    }
  }
 
  if (m > 20000){
    image(food[1],x[1],400,100,100);
    x[1]=x[1]+i[1];
    if (x[1]>500){
     oocsi.channel("foodfridge").data("food",2).send();
     x[1]=501;
     i[1]=0;
    }
  }
  if (m > 40000){
    image(food[2],x[2],300,100,100);
    x[2]=x[2]+i[2];
     if (x[2]>450){
       oocsi.channel("foodfridge").data("food",3).send();
      // x[2]=500;
       i[2]=0;
    }
  }
 
  
  fill(255);
  noStroke();
  rect(0,0,93,700);
  rect(430,0,73,700);
  image(phone_1,90,0,350,700);
}