// PImage leftObject = emptyImage;
// PImage rightObject = ;

int tree1Position = 30;
int housePosition = 150;
int siloPosition = 280;
int barnPosition = 342;
int tree2Position = 430;


void drawModell(int x, int y){
  fill(150);
  stroke(100);
  
 //Wall
//rect(x, y, 500, 50);

/*if(getGameState()>=1){
//Angle
stroke(8,127,35);
fill(255);
strokeWeight(3);
ellipse(x+262, y+280, 50, 50);
strokeWeight(1);
stroke(255);
rect(x+220, y+270, 100, 50);
}
*/
//Bordakreis
noStroke();
fill(158);
ellipse(x+262, y+300, 70, 70);
fill(69);
ellipse(x+262, y+300, 50, 50);


//Sensoren
/*
fill(255);
rect(x+50, y,25, 50);
rect(x+170, y, 25, 50);
rect(x+300, y, 25, 50);
rect(x+360, y, 25, 50);
rect(x+450, y, 25, 50);
*/
//icons



image(treeImage, x+tree1Position, y-70);
image(houseImage, x+housePosition, y-70);
image(siloImage, x+siloPosition, y-70);
image(barnImage, x+barnPosition, y-72);
image(treeImage, x+tree2Position, y-70);

//Verbindungslinien


}

boolean nothingLeftOf(int sensor){
  for(int i = 1; i < sensor; i++){
    if(getSensorValue(i)!=0){
      return false;
    }
  }
  return true;
}


void drawLines(int x, int y, int gameState){
  String resultText = "";
      textSize(32);
      strokeWeight(3);
      stroke(69);
      
      /*
      if(S1in == 0 && S2in == 0 && S3in == 0 && S4in == 0 && S5in == 0){
        leftObject = loadImage("emptyIcon.png");
        rightObject = loadImage("emptyIcon.png");
      }
      */
      
      if(S1in+S2in+S3in+S4in+S5in== 0){
        leftObject = loadImage("emptyIcon.png");
        rightObject = loadImage("emptyIcon.png");
      }
      if(S1in+S2in+S3in+S4in+S5in== 1 && S5in != 1){
        rightObject = loadImage("emptyIcon.png");
      }
      
          
  // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (S1in == 1) {
        if(gameState >= 2){text(distanceInt1 + "cm", x+80, y+150);}
        line(x+62 , y, x+262, y+300); 
        if(gameState >= 2){
          leftObject = loadImage("Icon Tree.png");
        }else{
          leftObject = loadImage("Icon TreeInactive.png");
        }
        leftObjectName = "dem linken Baum";
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (S2in == 1) {
        if(nothingLeftOf(2)){
          if(gameState >= 2){
            text(distanceInt1 + "cm", x+160, y+150);
            leftObject = loadImage("Icon House.png");
          }else{
            leftObject = loadImage("Icon HouseInactive.png");
          }
          leftObjectName = "dem Haus";
        }else{
          if(gameState >= 3){
          text(distanceInt2 + "cm", x+290, y+150);
          rightObject = loadImage("Icon House.png");
        }else{
          rightObject = loadImage("Icon HouseInactive.png");
        }
          rightObjectName = "dem Haus";
        }
        line(x+182, y, x+262, y+300); 
      }
      else {
      } 
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (S3in == 1) {
        if(nothingLeftOf(3)){
          if(gameState >= 2){
          text(distanceInt1 + "cm", x+220, y+150);
          leftObject = loadImage("Icon Silo.png");
          }else{
            leftObject = loadImage("Icon SiloInactive.png");
          }
          leftObjectName = "dem Silo";
        }else{
          if(gameState >= 3){
            text(distanceInt2 + "cm", x+350, y+150);
            rightObject = loadImage("Icon Silo.png");
        }else{
          rightObject = loadImage("Icon SiloInactive.png");
        }
          rightObjectName = "dem Silo";
        }
        line(x+312, y, x+262, y+300);
      }
      else {
      }
      
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (S4in == 1) {
        if(nothingLeftOf(4)){
          if(gameState >= 2){
            text(distanceInt1 + "cm", x+250, y+150);
            leftObject = loadImage("Icon Barn.png");
          }else{
            leftObject = loadImage("Icon BarnInactive.png");
          }
          leftObjectName = "der Scheune";
        }else{
          if(gameState >= 3){
          text(distanceInt2 + "cm", x+365, y+150);
          rightObject = loadImage("Icon Barn.png");
        }else{
          rightObject = loadImage("Icon BarnInactive.png");
        }
          rightObjectName = "der Scheune";
        }
        line(x+372, y, x+262, y+300); 
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (S5in == 1) {
        line(x+462, y, x+262, y+300);
        if(gameState >= 3){
          text(distanceInt2 + "cm", x+410, y+150);
          rightObject = loadImage("Icon Tree.png");
        }else{
          rightObject = loadImage("Icon TreeInactive.png");
        }
        rightObjectName = "dem rechten Baum";
      }
      else {
      }
      
      if(gameState == 4){
        stroke(69);
        if(S1in==1 && S2in== 1){
          //75 y 95 50
          resultText="Distanz zwischen Baum und Haus";
          line(x+tree1Position+32, y, x+tree1Position+housePosition, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+housePosition))/2, y+20);
        }else if(S1in==1 && S3in== 1){
          resultText="Distanz zwischen Baum und Silo";
          line(x+tree1Position+32, y, x+tree1Position+siloPosition, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+siloPosition))/2, y+20);
        }else if(S1in==1 && S4in== 1){
          resultText="Distanz zwischen Baum und Scheune";
          line(x+tree1Position+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S1in==1 && S5in== 1){
          resultText="Distanz zwischen den zwei Bäumen";
          line(x+tree1Position+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+tree1Position+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S2in==1 && S3in== 1){
          resultText="Distanz zwischen Haus und Silo";
          line(x+housePosition+32, y, x+tree1Position+siloPosition, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+siloPosition))/2, y+20);
        }else if(S2in==1 && S4in== 1){
          resultText="Distanz zwischen Haus und Scheune";
          line(x+housePosition+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S2in==1 && S5in== 1){
          resultText="Distanz zwischen Haus und Baum";
          line(x+housePosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+housePosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S3in==1 && S4in== 1){
          resultText="Distanz zwischen Silo und Scheune";
          line(x+siloPosition+32, y, x+tree1Position+barnPosition, y);
          text(resultInt + "cm",((x+siloPosition+32)+(x+tree1Position+barnPosition))/2, y+20);
        }else if(S3in==1 && S5in== 1){
          resultText="Distanz zwischen Silo und Baum";
          line(x+siloPosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+siloPosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }else if(S4in==1 && S5in== 1){
          resultText="Distanz zwischen Scheune und Baum";
          line(x+barnPosition+32, y, x+tree1Position+tree2Position, y);
          text(resultInt + "cm",((x+barnPosition+32)+(x+tree1Position+tree2Position))/2, y+20);
        }
        textAlign(LEFT);
        //text(resultText, x+ 520, y+20);
      }
      
      fill(255);
      textSize(32);
      textAlign(CENTER, CENTER);
      if(gameState >= 1){text(angle + "°" ,x+262, y+300);}
      
      textAlign(LEFT, TOP);
      stroke(30);
      strokeWeight(1);

    
  
  
  
 /*if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(3) == 'E') {
      // 2. und 3. Zeichen auslesen
      S1in = int(portStream.substring(1,2));   // z.B. bei "S10E" = 1
      S2in = int(portStream.substring(2,3));   // z.B. bei "S10E" = 0
      S3in = int(portStream.substring(3,4));   // z.B. bei "S10E" = 1
      S4in = int(portStream.substring(4,5));   // z.B. bei "S10E" = 0
      S5in = int(portStream.substring(5,6));   // z.B. bei "S10E" = 1
      S6in = int(portStream.substring(6,7));   // z.B. bei "S10E" = 0
 
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (S1in == 1) {
        stroke(0, 102, 153);
        line(x, y, x+262, y+300); 
        fill(0, 102, 153);
        textSize(20);
        text("Distanz 1", x+80, y+150);
        rect(x, y,25, 50);
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (S2in == 1) {
        stroke(153, 102, 0);
        line(x+100, y, x+262, y+300); 
        fill(153, 102, 0);
        textSize(20);
        text("Distanz 2", x+240, y+150);
        rect(x+100, y,25, 50);
      }
      else {
      } 
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (S2in == 1) {
        stroke(153, 102, 0);
        line(x+100, y, x+262, y+300); 
        fill(153, 102, 0);
        textSize(20);
        text("Distanz 2", x+240, y+150);
        rect(x+100, y,25, 50);
      }
      else {
      }
    }
  }
 */
} 