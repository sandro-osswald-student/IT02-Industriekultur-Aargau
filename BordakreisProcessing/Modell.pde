

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
rect(x+500, y, 25, 50);

//Verbindungslinien
}

void drawLines(int x, int y){
 if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(3) == 'E') {
      // 2. und 3. Zeichen auslesen
      B1in = int(portStream.substring(1,2));   // z.B. bei "S10E" = 1
      B2in = int(portStream.substring(2,3));   // z.B. bei "S10E" = 0
 
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (B1in == 1) {
        line(x, y, x+262, y+300); 
      }
      else {
      }      
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (B2in == 1) {
        line(x+100, y, x+262, y+300); 
      }
      else {
      }     
    }
  }
  
}