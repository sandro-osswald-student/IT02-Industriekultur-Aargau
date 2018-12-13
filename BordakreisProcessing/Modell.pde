

void drawModell(int x, int y){
  fill(150);
  
 //Wall
rect(x, y, 500, 50);

//Bordakreis
ellipse(x+262, y+300, 50, 50);

//Sensoren
fill(255);
rect(x, y,25, 50);
rect(x+100, y, 25, 50);
rect(x+200, y, 25, 50);
rect(x+300, y, 25, 50);
rect(x+400, y, 25, 50);

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


void drawLines(int x, int y){
  
  // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(1) == 1) {
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
      if (getSensorValues(2) == 1) {
        stroke(153, 102, 0);
        line(x+100, y, x+262, y+300); 
        fill(153, 102, 0);
        textSize(20);
        if(nothingLeftOf(2)){
          text("Distanz 1", x+80, y+150);
        }else{
          text("Distanz 2", x+240, y+150);
        }
        
        rect(x+100, y,25, 50);
      }
      else {
      } 
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(3) == 1) {
        stroke(153, 102, 0);
        line(x+200, y, x+262, y+300); 
        fill(153, 102, 0);
        textSize(20);
        if(nothingLeftOf(3)){
          text("Distanz 1", x+80, y+150);
        }else{
          text("Distanz 2", x+240, y+150);
        }
        rect(x+200, y,25, 50);
      }
      else {
      }
      
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(4) == 1) {
        stroke(0, 102, 153);
        line(x+300, y, x+262, y+300); 
        fill(0, 102, 153);
        textSize(20);
        if(nothingLeftOf(2)){
          text("Distanz 1", x+80, y+150);
        }else{
          text("Distanz 2", x+240, y+150);
        }
        rect(x+300, y,25, 50);
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (getSensorValues(5) == 1) {
        stroke(153, 102, 0);
        line(x+400, y, x+262, y+300); 
        fill(153, 102, 0);
        textSize(20);
        text("Distanz 2", x+240, y+150);
        rect(x+400, y,25, 50);
      }
      else {
      } 
    
  
  
  
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