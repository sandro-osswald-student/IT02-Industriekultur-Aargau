#include <TimerOne.h>

#include <TM1637.h>
#include <SoftwareSerial.h>

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


int sensorDif1 = 0; // variable to store the value coming from the sensor
int sensorDif2 = 0; // variable to store the value coming from the sensor
int sensorDif3 = 0; // variable to store the value coming from the sensor
int sensorDif4 = 0; // variable to store the value coming from the sensor
int sensorDif5 = 0; // variable to store the value coming from the sensor


const int ledPin1 = 6;
const int ledPin2 = 5;
const int ledPin3 = 4;
const int ledPin4 = 3;
const int ledPin5 = 2;

// Zum Zwischenspeichern der Button-Zustände
int lightState1 = 0;
int lightState2 = 0;
int lightState3 = 0;
int lightState4 = 0;
int lightState5 = 0;
 
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
}

void loop() {

sensorValue1 = analogRead(sensorPin1); // read the value from the sensor 1
sensorValue2 = analogRead(sensorPin2); // read the value from the sensor 2
sensorValue3 = analogRead(sensorPin3)-30; // read the value from the sensor 1
sensorValue4 = analogRead(sensorPin4)-60; // read the value from the sensor 2
sensorValue5 = analogRead(sensorPin5)-100; // read the value from the sensor 1

sensorValueEnv = analogRead(sensorPinEnv)-40; // read the value from the sensor Enviroment

/*
sensorValue1 = analogRead(sensorPin1); // read the value from the sensor 1
sensorValue2 = analogRead(sensorPin2); // read the value from the sensor 2
sensorValue3 = analogRead(sensorPin3); // read the value from the sensor 3
sensorValue4 = analogRead(sensorPin4); // read the value from the sensor 4
sensorValue5 = analogRead(sensorPin5); // read the value from the sensor 5
sensorValue6 = analogRead(sensorPin6); // read the value from the sensor 6

sensorValueEnv = analogRead(sensorPinEnv)-50; // read the value from the sensor Enviroment
*/
sensorDif1 = sensorValue1 - sensorValueEnv;
sensorDif2 = sensorValue2-sensorValueEnv;
sensorDif3 = sensorValue3-sensorValueEnv;
sensorDif4 = sensorValue4- sensorValueEnv;
sensorDif5 = sensorValue5- sensorValueEnv;



Serial.print("SensorValue1: ");
Serial.println(sensorValue1);
Serial.print("SensorValue2: ");
Serial.println(sensorValue2);
Serial.print("SensorValue3: ");
Serial.println(sensorValue3);
Serial.print("SensorValue4: ");
Serial.println(sensorValue4);
Serial.print("SensorValue5: ");
Serial.println(sensorValue5);

Serial.print("SensorValueEnv: ");
Serial.println(sensorValueEnv);

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
 
// normalizeData fügt die Werte der beiden Buttons zusammen und ergänzt den String um ein eindeutiges Start- und Endezeichen
String normalizeData(int s1, int s2, int s3, int s4, int s5) {
 
  String S1string = String(s1);
  String S2string = String(s2);
  String S3string = String(s3);
  String S4string = String(s4);
  String S5string = String(s5);
 
  // Erzeugt Werte wie S00E, S10E, S01E, S11E
  String ret = String("S") + S1string + S2string + S3string + S4string + S5string +String("E");
  return ret;
}
