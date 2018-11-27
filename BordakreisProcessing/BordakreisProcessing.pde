//Processing Sketch
// Serielle Bibliothek einbinden
import processing.serial.*;
 
// Objekt zur Überwachung eines seriellen Ports erzeugen
Serial myPort;
 
// String für empfangene Daten
String portStream;
 
// Zustände der beiden Buttons
int B1in = 0;
int B2in = 0;
 
// setup() wird einmal zu Beginn dea Programms ausgeführt
void setup() {
  // Ausgabefenster und Vorder-/Hintergrundfarben definieren
  size(380,200);
  // Wenn nur ein Wert angegeben wird, wird dieser für alle 3 Farben verwendet, d.h. 255 entspricht RGB(255,255,255)
  background(255);
  stroke(160);
  fill(50);
  // Hier muss der Index des Arduino-Ports ausgewählt werden. Notfalls ausprobieren.
  String portName = Serial.list()[0];
  // myPort initialisieren, Übertragungsrate wie bei Arduino Sketch einstellen
  myPort = new Serial(this, portName, 2400);
  // Ankommende Zeichen am Port werden solange gebuffert, bis das angebene Zeichen empfangen wird.
  // Damit ist ein Datenblock vollständig übertragen. \n ist das 2. Zeichen eines Zeilenwechsels (\r\n)
  myPort.bufferUntil('\n');
}
 
// Wie loop() beim Arduino wird draw() immer wieder aufgerufen, solange das Programm ausgeführt wird.
void draw() {
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
 
// serialEvent wird aufgerufen, wenn das weiter oben über bufferUntil definierte Zeichen empfangen wird.
// Dann wird der Inhalt des seriellen Buffers in portStream geschrieben.
void serialEvent(Serial myPort) {
  portStream = myPort.readString();
}