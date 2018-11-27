int sensorPin1 = A0; // select the input pin for LDR
int sensorPin2 = A1; // select the input pin for LDR

int sensorValue1 = 0; // variable to store the value coming from the sensor
int sensorValue2 = 0; // variable to store the value coming from the sensor

const int ledPin1 = 2;
const int ledPin2 = 3;

// Zum Zwischenspeichern der Button-Zustände
int lightState1 = 0;
int lightState2 = 0;
 
// Enthält den String, der an den PC geschickt wird
String data;
 
// Serielle Schnittstelle einrichten, pinModes setzen
void setup() {
  Serial.begin(2400);
}

void loop() {

sensorValue1 = analogRead(sensorPin1); // read the value from the sensor 1
sensorValue2 = analogRead(sensorPin2); // read the value from the sensor 2

Serial.print("SensorValue1: ");
Serial.println(sensorValue1);
Serial.print("SensorValue2: ");
Serial.println(sensorValue2);

  data = normalizeData(lightState1, lightState2);
  // dieser String (z.B. S10E+Zeilwenwechsel) wird dann seriell ausgegeben.
  Serial.println(data);
  // Um die serielle Ausgabe zu beobachten, einfach nach dem Programmstart den seriellen Monitor in der Arduino Umgebung starten
  delay(500);


  if (sensorValue1  >= 940)
  {
   digitalWrite(ledPin1, HIGH);
   lightState1=true;
   
  }
   else{
    digitalWrite(ledPin1, LOW);
    lightState1=false;
    //Serial.write(sensorValue1);
  }

  if (sensorValue2 >= 940)
  {
   digitalWrite(ledPin2, HIGH);
   lightState2=true;
   
  }
   else{
    digitalWrite(ledPin2, LOW);
    lightState2=false;
  }

}
 
// normalizeData fügt die Werte der beiden Buttons zusammen und ergänzt den String um ein eindeutiges Start- und Endezeichen
String normalizeData(int b1, int b2) {
 
  String B1string = String(b1);
  String B2string = String(b2);
 
  // Erzeugt Werte wie S00E, S10E, S01E, S11E
  String ret = String("S") + B1string + B2string + String("E");
  return ret;
}
