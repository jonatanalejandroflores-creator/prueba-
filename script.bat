// Definición de pines
const int sensorPin = A0;
const int relayPin = 7;

// Umbral de humedad (ajustar según necesidad)
// 0 = muy húmedo, 1023 = muy seco
const int limiteHumedad = 600; 

void setup() {
  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, HIGH); // El relé suele apagarse con HIGH (depende del modelo)
  Serial.begin(9600);
}

void loop() {
  int lectura = analogRead(sensorPin);
  
  Serial.print("Humedad detectada: ");
  Serial.println(lectura);

  if (lectura > limiteHumedad) {
    // Si la lectura es mayor al límite, la tierra está SECA
    Serial.println("Tierra seca - Regando...");
    digitalWrite(relayPin, LOW); // Activa la bomba
    delay(3000);                 // Riega por 3 segundos
    digitalWrite(relayPin, HIGH); // Apaga la bomba
    delay(1000);
  } else {
    // La tierra está HÚMEDA
    Serial.println("Tierra húmeda - No requiere riego");
    digitalWrite(relayPin, HIGH);
  }

  delay(2000); // Espera 2 segundos antes de la próxima lectura
}