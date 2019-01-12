import gifAnimation.*;
import g4p_controls.*;


//Processing Sketch
// Serielle Bibliothek einbinden
import processing.serial.*;
 
 
 
// Objekt zur Überwachung eines seriellen Ports erzeugen
Serial myPort;

Gif BordaGif;

//Icon Images
PImage anglePicture;
PImage siloImage;
PImage barnImage;
PImage houseImage;
PImage treeImage;
PImage homeImage;
PImage homeImageHover;
PImage angleImage;
PImage emptyImage;

PImage leftObject;
PImage rightObject;

PImage backgroundPic;
 
// String für empfangene Daten
String portStream = "S00000E";

PFont openSansC;
 
// Zustände der beiden Sensoren
public int S1in = 1;
public int S2in = 1;
public int S3in = 0;
public int S4in = 0;
public int S5in = 0;
 
// setup() wird einmal zu Beginn dea Programms ausgeführt
void setup() {
  
  fullScreen();
  smooth();
  openSansC = loadFont("OpenSans-CondensedLight-48.vlw");
  //§size(1600,1000);
  
  textFont(openSansC, 32);
  
  backgroundPic = loadImage("background.png");
  // Wenn nur ein Wert angegeben wird, wird dieser für alle 3 Farben verwendet, d.h. 255 entspricht RGB(255,255,255)
  
  stroke(160);
  fill(0);
  BordaGif = new Gif(this, "borda.gif");
  anglePicture = loadImage("angle.jpg");
  siloImage = loadImage("Icon Silo.png");
  treeImage = loadImage("Icon Tree.png");
  barnImage = loadImage("Icon Barn.png");
  houseImage = loadImage("Icon House.png");
  homeImage = loadImage("home.png");
  homeImageHover = loadImage("homeHover.png");
  angleImage = loadImage("angle.png");
  emptyImage = loadImage("emptyImage.png");
  leftObject = loadImage("emptyImage.png");
  rightObject = loadImage("emptyImage.png");
  BordaGif.play();
  
  
  //Arduino code  /**/
  
  /*
  // Hier muss der Index des Arduino-Ports ausgewählt werden. Notfalls ausprobieren.
  String portName = Serial.list()[0];
  // myPort initialisieren, Übertragungsrate wie bei Arduino Sketch einstellen
  myPort = new Serial(this, portName, 9600);
  // Ankommende Zeichen am Port werden solange gebuffert, bis das angebene Zeichen empfangen wird.
  // Damit ist ein Datenblock vollständig übertragen. \n ist das 2. Zeichen eines Zeilenwechsels (\r\n)
  myPort.bufferUntil('\n');
  */
  
}
 
// Wie loop() beim Arduino wird draw() immer wieder aufgerufen, solange das Programm ausgeführt wird.
void draw() {
  background(255);
  drawScreen(portStream);
  //sensorDetection();
  
  /*
  if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    if (portStream.length() == 6 && portStream.charAt(0) == 'S' && portStream.charAt(6) == 'E') {
  drawScreen(portStream);
    }
  }
  drawScreen("S00000E");


if ( myPort.available() > 0)
{ // If data is available,
portStream = myPort.readStringUntil('\n'); // read it and store it in val
}
//println(portStream); //print it out in the console
 */
}

 
// serialEvent wird aufgerufen, wenn das weiter oben über bufferUntil definierte Zeichen empfangen wird.
// Dann wird der Inhalt des seriellen Buffers in portStream geschrieben.
void serialEvent(Serial myPort) {
  portStream = myPort.readString();
}  

public boolean MouseIsOver(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
    return true;
  }
  return false;
}

public void sensorDetection(){
 if(portStream != null) {
    // Entspricht der Datenblock dem Format "SxxE\r\n"? Wenn ja, dann weiter
    println(portStream);
      S1in = int(portStream.substring(1,2));   // z.B. bei "S10E" = 1
      S2in = int(portStream.substring(2,3));   // z.B. bei "S10E" = 0 
      S3in = int(portStream.substring(3,4));   // z.B. bei "S10E" = 0 
      S4in = int(portStream.substring(4,5));   // z.B. bei "S10E" = 0 
      S5in = int(portStream.substring(5,6));   // z.B. bei "S10E" = 0 
  }
}

public int getSensorValues(int sensor){
  switch(sensor) {
  case 1: 
    return(S1in); 
  case 2: 
    return(S2in);  
  case 3: 
    return(S3in);  
  case 4: 
    return(S4in);  
  case 5: 
    return(S5in);  
  default:             // Default executes if the case labels
    return 0;
  }

}