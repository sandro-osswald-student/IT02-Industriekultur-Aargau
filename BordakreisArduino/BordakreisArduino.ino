#include <TimerOne.h>

#include <TM1637.h>
#include <SoftwareSerial.h>


#define CLK 7//pins definitions for TM1637 and can be changed to other ports
#define DIO 8
TM1637 tm1637(CLK,DIO);

SoftwareSerial bt(2,3); // RX, TX

int sensorPin1 = A1; // select the input pin for LDR
int sensorPin2 = A2; // select the input pin for LDR
int sensorPin3 = A3; // select the input pin for LDR
int sensorPin4 = A4; // select the input pin for LDR
int sensorPin5 = A5; // select the input pin for LDR
int sensorPinEnv = A0; // select the input pin for LDR

int sensorValue1 = 0; // variable to store the value coming from the sensor
int sensorValue2 = 0; // variable to store the value coming from the sensor
int sensorValue3 = 0; // variable to store the value coming from the sensor
int sensorValue4 = 0; // variable to store the value coming from the sensor
int sensorValue5 = 0; // variable to store the value coming from the sensor

int sensorValueEnv = 0; // variable to store the value coming from the sensor

//led pins
const int ledPin1 = 6;
const int ledPin2 = 5;
const int ledPin3 = 4;
const int ledPin4 = 3;
const int ledPin5 = 2;

int lightState1 = 0;
int lightState2 = 0;
int lightState3 = 0;
int lightState4 = 0;
int lightState5 = 0;

String S1string;
String S2string;
String S3string;
String S4string;
String S5string;

String angleString ="00";
 
// Enthält den String, der an den PC geschickt wird
String data = "abbaabbaaaa";
 
// Serielle Schnittstelle einrichten, pinModes setzen
void setup() {

  bt.begin(9600);
  Serial.begin(9600);
  pinMode(ledPin1, OUTPUT);
  pinMode(ledPin2, OUTPUT);
  pinMode(ledPin3, OUTPUT);
  pinMode(ledPin4, OUTPUT);
  pinMode(ledPin5, OUTPUT);

  pinMode(sensorPin1, INPUT);
  pinMode(sensorPin2, INPUT);
  pinMode(sensorPin3, INPUT);
  pinMode(sensorPin4, INPUT);
  pinMode(sensorPin5, INPUT);
  
  pinMode(sensorPinEnv, INPUT);

  tm1637.init();
  tm1637.set(BRIGHT_TYPICAL);//BRIGHT_TYPICAL = 2,BRIGHT_DARKEST = 0,BRIGHTEST = 7;
}

void loop() {

  angleString = setAngle();

  int8_t firstDigit = angleString.substring(0,1).toInt();
  int8_t secondDigit = angleString.substring(1,2).toInt();
  int8_t ListDisp[4] = {0,0,firstDigit,secondDigit};

tm1637.display(0,ListDisp[0]);
    tm1637.display(1,ListDisp[1]);
    tm1637.display(2,ListDisp[2]);
    tm1637.display(3,ListDisp[3]);

sensorValue1 = analogRead(sensorPin1); // read the value from the sensor 1
sensorValue2 = analogRead(sensorPin2); // read the value from the sensor 2
sensorValue3 = analogRead(sensorPin3)-30; // read the value from the sensor 1
sensorValue4 = analogRead(sensorPin4)-60; // read the value from the sensor 2
sensorValue5 = analogRead(sensorPin5)-100; // read the value from the sensor 1

sensorValueEnv = analogRead(sensorPinEnv)-40; // read the value from the sensor Enviroment

sensorDif1 = sensorValue1 - sensorValueEnv;
sensorDif2 = sensorValue2-sensorValueEnv;
sensorDif3 = sensorValue3-sensorValueEnv;
sensorDif4 = sensorValue4- sensorValueEnv;
sensorDif5 = sensorValue5- sensorValueEnv;


  data = normalizeData(lightState1, lightState2, lightState3, lightState4, lightState5);
  // dieser String (z.B. S10E+Zeilwenwechsel) wird dann seriell ausgegeben.
  Serial.println(data);
  // Um die serielle Ausgabe zu beobachten, einfach nach dem Programmstart den seriellen Monitor in der Arduino Umgebung starten
  delay(500);

  if (sensorValue1  >= sensorValueEnv + 40)
  //if (sensorValue1  >= 900)
  {
   digitalWrite(ledPin1, HIGH);
   lightState1=true;
   
  }
   else{
    digitalWrite(ledPin1, LOW);
    lightState1=false;
  }

  //if (sensorValue2 >= sensorValueEnv + 50)
  if (sensorValue2  >= sensorValueEnv + 40)
  {
   digitalWrite(ledPin2, HIGH);
   lightState2=true;
   
  }
   else{
    digitalWrite(ledPin2, LOW);
    lightState2=false;
  }
  if (sensorValue3  >= sensorValueEnv + 40)
  {
   digitalWrite(ledPin3, HIGH);
   lightState3=true;
   
  }
   else{
    digitalWrite(ledPin3, LOW);
    lightState3=false;
  }
  if (sensorValue4  >= sensorValueEnv + 40)
  {
   digitalWrite(ledPin4, HIGH);
   lightState4=true;
   
  }
   else{
    digitalWrite(ledPin4, LOW);
    lightState4=false;
  }
  if (sensorValue5  >= sensorValueEnv + 40)
  {
   digitalWrite(ledPin5, HIGH);
   lightState5=true;
   
  }
   else{
    digitalWrite(ledPin5, LOW);
    lightState5=false;
  }
}
 
// normalizeData fügt die Werte der Sensoren zusammen und ergänzt den String um ein eindeutiges Start- und Endezeichen
String normalizeData(int s1, int s2, int s3, int s4, int s5) {
 
  S1string = String(s1);
  S2string = String(s2);
  S3string = String(s3);
  S4string = String(s4);
  S5string = String(s5);
 
  // Erzeugt Werte wie S00000E, S10000E, S00001E, S01100E
  String ret = String("S") + S1string + S2string + S3string + S4string + S5string +String("E");
  return ret;
}

String setAngle(){
  
if(S1string == "1" && S2string =="1"){
  return "12";
}else if(S1string == "1" && S3string =="1"){
  return "25";
}else if(S1string == "1" && S4string =="1"){
  return "32";
}else if(S1string == "1" && S5string =="1"){
  return "39";
}else if(S2string == "1" && S3string =="1"){
  return "13";
}else if(S2string == "1" && S4string =="1"){
  return "20";
}else if(S2string == "1" && S5string =="1"){
  return "27";
}else if(S3string == "1" && S4string =="1"){
  return "07";
}else if(S3string == "1" && S5string =="1"){
  return "14";
}else if(S4string == "1" && S5string =="1"){
  return "07";
}
return "00";
}
