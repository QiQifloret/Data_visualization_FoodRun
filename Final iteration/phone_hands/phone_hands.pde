import nl.tue.id.oocsi.*;

PImage phone,phone_1,apple,banana,celery,table,together;
PImage []recipe= new PImage[4];
int ap = 0,ba = 450,ce = 0;
int []times={0,0,0};
int []i={2,2,2};
int []m= new int[3];
int []n= new int[3];
int y,speed;
boolean []show={false,false,false,false};
boolean []turn={false,false};
boolean share=false;

void setup(){
  
  size(500,700);
  smooth();
  phone = loadImage("phone.png");
  phone_1 = loadImage("phone_1.png");
  apple = loadImage("apple_hands.png");
  banana = loadImage("banana_hands.png");
  celery = loadImage("celery_hands.png");
  table = loadImage("table.png");
  together = loadImage("together.png");
  recipe[0] = loadImage("RecipeApple.png");
  recipe[1] = loadImage("RecipeBanana.png");
  recipe[2] = loadImage("RecipeCelery.png");
  recipe[3] = loadImage("Recipeall.png");
}

void draw(){
  background(255);
  smooth();
  image(phone,90,0,350,700); // show phone image
 
  image(apple,ap,120,100,100); // show apple icon
  image(banana,ba,220,100,100);// show banana icon
  image(celery,200,ce,100,100);// show celery icon
  
  ap = ap+i[0];
  ba = ba-i[1];
  ce = ce+i[2];
  //apple icon movement
  if (ap >= 100)
  {
   times[0]++;
   i[0] = -2;
  }
  if (ap <= 0){
    i[0] = 2;
    if(times[0]<=2){
      m[0]=millis();
    }else
    {
      i[0]=0;
       n[0]= millis();
       println("n"+n);
    }
    if((n[0]-m[0])>10000){
    i[0]=2;
    times[0]=0;
  }
  }
 
  if (ba < 330){
    times[1]++;
    i[1]=-2;
  }
   
  if (ba > 450){
     i[1]=2;
     if(times[1]<=2){
      m[1]=millis();
    }else
    {
      i[1]=0;
      n[1]= millis();
      println("n"+n[1]);
    }
    if((n[1]-m[1])>9000){
    i[1]=2;
    times[1]=0;
  }
   }
   
  if (ce > 80){
    times[2]++;
    i[2]=-2;
  }
  if (ce < -35){
     i[2]=2;
     if(times[2]<=2){
      m[2]=millis();
    }else
    {
      i[2]=0;
      n[2]= millis();
      println("n"+n[2]);
    }
    if((n[2]-m[2])>12000){
    i[2]=2;
    times[2]=0;
  }
   }
  
  if (show[0]){
    image(recipe[0],105,63,320,560);
    fill(255);
    noStroke();
    ellipse(110,345,40,40);
    ellipse(420,345,40,40);
 
    if(turn[0]){
      show[3]=true;
      show[0]=false;
      turn[0]=false;
    }
     if(turn[1]){
      show[1]=true;
      show[0]=false;
      turn[1]=false;
    }
    
    image(table,105,590,320,100);
    if(share){
    noStroke();
    fill(255,255,255,200);
    rect(105,63,320,560);
    image(together,105,y,320,550);
        if (y<103){
            y=103;
             }
         if(y>600){
              y=600;
                }
    }
  }
  if (show[1]){
    image(recipe[1],105,63,320,560);  
    fill(255);
    noStroke();
    ellipse(110,345,40,40);
    ellipse(420,345,40,40);
   
    if(turn[0]){
      show[0]=true;
      show[1]=false;
      turn[0]=false;
    }
     if(turn[1]){
      show[2]=true;
      show[1]=false;
      turn[1]=false;
    } 
     image(table,105,590,320,100);
    if(share){
    noStroke();
    fill(255,255,255,200);
    rect(105,63,320,560);
    image(together,105,y,320,550);
        if (y<103){
            y=103;
             }
         if(y>600){
              y=600;
                }
    }
  }
  if (show[2]){
    image(recipe[2],105,63,320,560);  
    fill(255);
    noStroke();
    ellipse(110,345,40,40);
    ellipse(420,345,40,40);
    if(turn[0]){
      show[1]=true;
      show[2]=false;
      turn[0]=false;
    }
     if(turn[1]){
      show[3]=true;
      show[2]=false;
      turn[1]=false;
    }
    image(table,105,590,320,100);
    if(share){
    noStroke();
    fill(255,255,255,200);
    rect(105,63,320,560);
    image(together,105,y,320,550);
        if (y<103){
            y=103;
             }
         if(y>600){
              y=600;
                }
    }
  }
  if (show[3]){
    image(recipe[3],105,63,320,560);  
    fill(255);
    noStroke();
    ellipse(110,345,40,40);
    ellipse(420,345,40,40);
    if(turn[0]){
      show[2]=true;
      show[3]=false;
      turn[0]=false;
    }
     if(turn[1]){
      show[0]=true;
      show[3]=false;
      turn[1]=false;
    }
    image(table,105,590,320,100);
    if(share){
    noStroke();
    fill(255,255,255,200);
    rect(105,63,320,560);
    image(together,105,y,320,550);
        if (y<103){
            y=103;
             }
         if(y>600){
              y=600;
                }
    }
  }
  
  fill(255);
  noStroke();
  rect(0,0,93,700);
  rect(430,0,73,700);
  image(phone_1,90,0,350,700);
}

void mouseClicked(){
  if(mouseX > ap && mouseX < ap+100 && mouseY < 220 && mouseY > 120){
    show[0]=!show[0];
  }
  if(mouseX > ba && mouseX < ba+100 && mouseY < 320 && mouseY > 220){
    show[1]=!show[1];
  }
  if(mouseX > 200 && mouseX < 300 && mouseY < ce+100 && mouseY > ce){
    show[2]=!show[2];
  }
  if (mouseX<130 && mouseX>110 && mouseY<370 && mouseY>330){
      turn[0]=true;
    }
  if (mouseX<420 && mouseX>400 && mouseY<370 && mouseY>330){
      turn[1]=true;
    }
 if (mouseX<90 && mouseX>0 && mouseY<700 && mouseY>0||mouseX<500 && mouseX>430){
      for(int i=0; i<4;i++){
        show[i]=false;
      }
      turn[0]=false;
      turn[1]=false;
    }
   
}
void mousePressed(){
  if (mouseX<430 && mouseX>90 && mouseY<620 && mouseY>580){
      share = true;
      y=600;
    }else
    {
      share=false;
    }
}
void mouseDragged() {
  if(share) {
    y = mouseY; 
  }
}
void mouseReleased() {
     share=false;
}