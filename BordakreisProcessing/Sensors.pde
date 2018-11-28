void sensorDetection(){
  // Steht was in portStream? (d.h. wurde ein vollständiger Datenblock übertragen)
    if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(3) == 'E') {
      // 2. und 3. Zeichen auslesen
      B1in = int(portStream.substring(1,2));   // z.B. bei "S10E" = 1
      B2in = int(portStream.substring(2,3));   // z.B. bei "S10E" = 0
 
      // Wenn Button1 gedrückt dann Farbe grün einstellen, sonst rot
      if (B1in == 1) {
        fill(0,255,0);
      }
      else {
        fill(255,0,0);
      }      
      // und mit der Füllfarbe ein Quadrat zeichen
      rect(20,20,160,160);
 
      // Wenn Button2 gedrückt dann Farbe grün einstellen, sonst rot
      if (B2in == 1) {
        fill(0,255,0);
      }
      else {
        fill(255,0,0);
      }     
      // und noch ein Quadrat für Button 2 
      rect(200,20,160,160);
    }
  }
}
