import processing.serial.*;  //needed for exchange between Arduino and Processing
 
// Objekt zur Überwachung eines seriellen Ports erzeugen
Serial myPort;

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
PImage rulerImage;

//Images for Object display above input fields
PImage leftObject;
PImage rightObject;

PImage dufourMap;

//Mainscreen buttons
Button game;
Button menu2;
Button menu3;
Button menu4;

//Game buttons
Button home;
Button next;
Button back;
Button newGame;

//Inputfields objects for entering values
InputField angleField;
InputField distance1;
InputField distance2;
InputField result;
 
// String of recieved data from Aruino: S and E are start and end of String, the number between them are 0 for sensor inactivated, 1 for active .
String portStream = "S00000E";

PFont openSansC;
 
// State of the 5 sensors
public int S1in = 0;
public int S2in = 0;
public int S3in = 0;
public int S4in = 0;
public int S5in = 0;

// setup() wird einmal zu Beginn dea Programms ausgeführt
void setup() {
  //determines size of window
  size(displayWidth, displayHeight);
  //loads custom font
  openSansC = loadFont("OpenSans-CondensedLight-48.vlw");
  //sets Font for all text, size will be changed at different point in the code
  textFont(openSansC, 32);
     
  dufourMap = loadImage("backgroundPicture.png");
  
  //creates Image and Gif objects
  siloImage = loadImage("Icon Silo.png");
  treeImage = loadImage("Icon Tree.png");
  barnImage = loadImage("Icon Barn.png");
  houseImage = loadImage("Icon House.png");
  angleImage = loadImage("angle.png");
  emptyImage = loadImage("emptyIcon.png");
  leftObject = loadImage("emptyIcon.png");
  rightObject = loadImage("emptyIcon.png");
  rulerImage = loadImage("Icon Ruler.png");
  
  
  //ressizes dufourMap in the Background to current Screensize
  dufourMap.resize((displayWidth/10)*4,displayHeight);
  
  //creates all button and Inputfield objects with Position based on screensize
  game = new Button("Spiel", (displayWidth /10)*3 - displayWidth /20,((displayHeight/10)*3));
  menu2 = new Button("menu2", (displayWidth /10)*7 - displayWidth /20,((displayHeight/10)*3));
  menu3 = new Button("menu3", (displayWidth /10)*3 - displayWidth /20,((displayHeight/10)*6));
  menu4 = new Button("menu4", (displayWidth /10)*7 - displayWidth /20,((displayHeight/10)*6));
  
  home = new Button("home",displayWidth/20,displayHeight/10);
  next = new Button("weiter",(displayWidth /10)*5,((displayHeight/10)*9));
  back = new Button("zurück",(displayWidth /20), ((displayHeight/10)*9));
  newGame = new Button("wiederholen",((displayWidth /10)*5)-30,(displayHeight/10)*9);
  
  angleField = new InputField(angleLabel, (displayWidth /10)*1, (displayHeight/10)*7, 100, 100);
  distance1 = new InputField(distance1Label, (displayWidth /10)*2, (displayHeight/10)*7, 100, 100);
  distance2 = new InputField(distance2Label, (displayWidth /10)*3, (displayHeight/10)*7, 100, 100);
  result = new InputField("", (displayWidth /10)*4, (displayHeight/10)*7, 100, 100);

  //*Arduino variables*  
  //Index of Arduino-Port has to be selected. in a pinch use trial and error
  String portName = Serial.list()[0];
  //myPort is initialised, baudrate is put at 9600. Has to match baudrate of Arduino 
  myPort = new Serial(this, portName, 9600);
  // Ankommende Zeichen am Port werden solange gebuffert, bis das angebene Zeichen empfangen wird.
  // Damit ist ein Datenblock vollständig übertragen. \n ist das 2. Zeichen eines Zeilenwechsels (\r\n)
  myPort.bufferUntil('\n');
  
 
}
 
// Wie loop() beim Arduino wird draw() immer wieder aufgerufen, solange das Programm ausgeführt wird.
void draw() {
  background(255);  //background for Processing is set to colour white (rgb)
  drawScreen();  //drawScreen method in Views is called, responsible for displaying all GUI except white background
  sensorDetection(); //catches String with sensor states from Arudion 
  
  
if ( myPort.available() > 0){   // If data is available,
  portStream = myPort.readStringUntil('\n'); // read it and store it in val
  }
  
}
 
// serialEvent wird aufgerufen, wenn das weiter oben über bufferUntil definierte Zeichen empfangen wird.
// Dann wird der Inhalt des seriellen Buffers in portStream geschrieben.
void serialEvent(Serial myPort) {
  portStream = myPort.readString();

}  
//catches String with sensor states from Arudion 
public void sensorDetection(){
 if(portStream != null) {  //Is recieved datapackage of the form "SxxE\r\n"? 
    
      S1in = int(portStream.substring(1,2));   // z.B. bei "S10000E" = 1
      S2in = int(portStream.substring(2,3));   // z.B. bei "S10000E" = 0 
      S3in = int(portStream.substring(3,4));   // z.B. bei "S10000E" = 0 
      S4in = int(portStream.substring(4,5));   // z.B. bei "S10000E" = 0 
      S5in = int(portStream.substring(5,6));   // z.B. bei "S00001E" = 1 
  }
}
//returns sensor value
public int getSensorValue(int sensor){
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
  default:    
    return 0;
  }
}
