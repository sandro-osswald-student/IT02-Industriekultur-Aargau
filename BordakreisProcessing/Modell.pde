void drawModell(int x, int y){
  fill(150);
  stroke(100);
  
 //Wall
rect(x, y, 500, 50);

if(getGameState()>=1){
//Angle
stroke(8,127,35);
fill(255);
strokeWeight(3);
ellipse(x+262, y+280, 50, 50);
strokeWeight(1);
stroke(255);
rect(x+220, y+270, 100, 50);
}

//Bordakreis
stroke(100);
fill(80,127,85);
ellipse(x+262, y+300, 70, 70);
fill(8,127,35);
ellipse(x+262, y+300, 50, 50);


//Sensoren
fill(255);
rect(x+50, y,25, 50);
rect(x+170, y, 25, 50);
rect(x+300, y, 25, 50);
rect(x+360, y, 25, 50);
rect(x+450, y, 25, 50);

//icons
image(treeImage, x+30, y-70);
image(houseImage, x+150, y-70);
image(siloImage, x+280, y-70);
image(barnImage, x+340, y-65);
image(treeImage, x+430, y-70);

//Verbindungslinien
}

boolean nothingLeftOf(int sensor){
  for(int i = 1; i < sensor; i++){
    if(getSensorValues(i)!=0){
      return false;
    }
  }
  return true;
}


void drawLines(int x, int y, int gameState){
      String resultText = "";
  
      textSize(20);
      strokeWeight(3);
      
          
  // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(1) == 1) {
          fill(92,107,192);
          stroke(92,107,192);
          text("Distanz 1", x+80, y+150);
       
        line(x+62 , y+50, x+262, y+300); 
        rect(x+50, y,25, 50);
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(2) == 1) {
        if(nothingLeftOf(2)){
          fill(92,107,192);
          stroke(92,107,192);
          text("Distanz 1", x+160, y+150);
        }else{
          fill(186,104,200);
          stroke(186,104,200);
          text("Distanz 2", x+290, y+150);
        }
        line(x+182, y+50, x+262, y+300); 
        rect(x+170, y,25, 50);
      }
      else {
      } 
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(3) == 1) {
        if(nothingLeftOf(3)){
          fill(92,107,192);
          stroke(92,107,192);
          text("Distanz 1", x+180, y+150);
        }else{
          fill(186,104,200);
          stroke(186,104,200);
          text("Distanz 2", x+350, y+150);
        }
        line(x+312, y+50, x+262, y+300); 
        rect(x+300, y,25, 50);
      }
      else {
      }
      
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(4) == 1) {
        if(nothingLeftOf(4)){
          fill(92,107,192);
          stroke(92,107,192);
          text("Distanz 1", x+210, y+150);
        }else{
          fill(186,104,200);
          stroke(186,104,200);
          text("Distanz 2", x+350, y+150);
        }
        line(x+372, y+50, x+262, y+300); 
        rect(x+360, y,25, 50);
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(5) == 1) {
        fill(186,104,200);
        stroke(186,104,200);
        //text("Distanz 2", x+390, y+150);
        line(x+462, y+50, x+262, y+300);
        rect(x+450, y,25, 50);
      }
      else {
      } 
      
      if(gameState == 4){
        fill(255,202,40);
        stroke(255,202,40);
        if(getSensorValues(1)==1 && getSensorValues(2)== 1){
          rect(x+75, y, 95, 50);
          resultText="Distanz zwischen Baum und Haus";
        }else if(getSensorValues(1)==1 && getSensorValues(3)== 1){
          rect(x+75, y, 225, 50);
          resultText="Distanz zwischen Baum und Silo";
        }else if(getSensorValues(1)==1 && getSensorValues(4)== 1){
          resultText="Distanz zwischen Baum und Scheune";
          rect(x+75, y, 285, 50);
        }else if(getSensorValues(1)==1 && getSensorValues(5)== 1){
          resultText="Distanz zwischen den zwei Bäumen";
          rect(x+75, y, 375, 50);
        }else if(getSensorValues(2)==1 && getSensorValues(3)== 1){
          resultText="Distanz zwischen Haus und Silo";
          rect(x+195, y, 105, 50);
        }else if(getSensorValues(2)==1 && getSensorValues(4)== 1){
          resultText="Distanz zwischen Haus und Scheune";
          rect(x+195, y, 165, 50);
        }else if(getSensorValues(2)==1 && getSensorValues(5)== 1){
          resultText="Distanz zwischen Haus und Baum";
          rect(x+195, y, 255, 50);
        }else if(getSensorValues(3)==1 && getSensorValues(4)== 1){
          resultText="Distanz zwischen Silo und Scheune";
          rect(x+325, y, 35, 50);
        }else if(getSensorValues(3)==1 && getSensorValues(5)== 1){
          resultText="Distanz zwischen Silo und Baum";
          rect(x+325, y, 125, 50);
        }else if(getSensorValues(4)==1 && getSensorValues(5)== 1){
          resultText="Distanz zwischen Scheune und Baum";
          rect(x+385, y, 65, 50);
        }
        textAlign(LEFT);
        text(resultText, x+ 520, y+20);
      }
      
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