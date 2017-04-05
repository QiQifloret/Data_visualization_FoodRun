import nl.tue.id.oocsi.*;

PImage phone,phone_1,apple,banana,celery;
int ap = 0,ba = 450,ce = 700;
int []i={2,2,2};
int item;
int []times={0,0,0};

OOCSI oocsi;

void setup(){
  
  size(500,700);
  smooth();
  phone = loadImage("phone.png");
  phone_1 = loadImage("phone_1.png");
  apple = loadImage("apple_hands.png");
  banana = loadImage("banana_hands.png");
  celery = loadImage("celery_hands.png");
  
  OOCSI oocsi = new OOCSI(this, "phone_receive", "oocsi.id.tue.nl");
  oocsi.subscribe("foodfridge");
}

void draw(){
  background(255);
  smooth();
  image(phone,90,0,350,700);
  
  image(apple,ap,120,100,100); // show apple icon
  image(banana,ba,220,100,100);// show banana icon
  image(celery,200,ce,100,100);// show celery icon
  
  if(item==1){
  ap = ap+i[0];
  if (ap >= 100)
  {
    times[0]++;
    i[0] = -2;
  }
  if (ap <= 0){
    i[0] = 2;
    if(times[0]<=2){
        i[0] = 0;
     }
  }
  }
  
  if(item==2){
  ba = ba+i[1];
  if (ba >= 450)
  {
    i[1] = -2;
    if(times[1]<=2){
        i[1] = 0;
     }
  }
  if (ba <= 330){
    i[1] = 2;
     times[1]++;
  }
  }
  
  if(item==3){
   ce = ce+i[2];
  if (ce >= 700)
  {
    i[2] = -2;
    if(times[2]<=2){
        i[2] = 0;
     }
  }
  if (ce <= 520){
    i[2] = 2;
    times[2]++;
  }
  }
  
  fill(255);
  noStroke();
  rect(0,0,93,700);
  rect(430,0,73,700);
  image(phone_1,90,0,350,700);
  
}
void foodfridge(OOCSIEvent event){

  item = event.getInt("food",0);
}