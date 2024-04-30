
/**
 * Created by Adesola Samuel
 * 
 * Email:adesolasamuel2018@gmail.c0m
 * 
 * Github: https://github.com/adesolasamuel/ESP8266-NodeMCU-to-Google-Firebase
 * 
 * Copyright (c) 2022 samuel
 *
*/

#if defined(ESP32)
#include <WiFi.h>
#include <FirebaseESP32.h>
#elif defined(ESP8266)
#include <ESP8266WiFi.h>
#include <FirebaseESP8266.h>
#endif
#include "DHT.h"

//Provide the token generation process info.
#include <addons/TokenHelper.h>

//Provide the RTDB payload printing info and other helper functions.
#include <addons/RTDBHelper.h>

#define DHTPIN 2    // Digital pin connected to the DHT sensor
#define DHTTYPE DHT11   // DHT 11
#define sensor    A0       // Hook water sensor to pin A0 of NODEMCU module

/* 1. Define the WiFi credentials */
#define WIFI_SSID "your Wi-Fi ssid"
#define WIFI_PASSWORD "your Wi-Fi password"

//For the following credentials, see examples/Authentications/SignInAsUser/EmailPassword/EmailPassword.ino

/* 2. Define the API Key */
#define API_KEY "your API Key"

/* 3. Define the RTDB URL */
#define DATABASE_URL "Your DataBase URL" //<databaseName>.firebaseio.com or <databaseName>.<region>.firebasedatabase.app

/* 4. Define the user Email and password that alreadey registerd or added in your project */
#define USER_EMAIL "your user e-mail"
#define USER_PASSWORD "your user password"

//Define Firebase Data object
FirebaseData fbdo;

FirebaseAuth auth;
FirebaseConfig config;

unsigned long sendDataPrevMillis = 0;

unsigned long count = 0;
DHT dht(DHTPIN, DHTTYPE);

void setup()
{
  pinMode(4,OUTPUT);
  Serial.begin(9600);
  pinMode(sensor, INPUT);   // Analog pin setup for read
  //dht.begin();
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.print(".");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();

  Serial.printf("Firebase Client v%s\n\n", FIREBASE_CLIENT_VERSION);

  /* Assign the api key (required) */
  config.api_key = API_KEY;

  /* Assign the user sign in credentials */
  auth.user.email = USER_EMAIL;
  auth.user.password = USER_PASSWORD;

  /* Assign the RTDB URL (required) */
  config.database_url = DATABASE_URL;

  /* Assign the callback function for the long running token generation task */
  config.token_status_callback = tokenStatusCallback; //see addons/TokenHelper.h

  //Or use legacy authenticate method
  //config.database_url = DATABASE_URL;
  //config.signer.tokens.legacy_token = "<database secret>";

  //To connect without auth in Test Mode, see Authentications/TestMode/TestMode.ino

  //////////////////////////////////////////////////////////////////////////////////////////////
  //Please make sure the device free Heap is not lower than 80 k for ESP32 and 10 k for ESP8266,
  //otherwise the SSL connection will fail.
  //////////////////////////////////////////////////////////////////////////////////////////////

  Firebase.begin(&config, &auth);

  //Comment or pass false value when WiFi reconnection will control by your code or third party library
  Firebase.reconnectWiFi(true);

  Firebase.setDoubleDigits(5);

 
}
void loop()
{
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  float wat = analogRead(sensor);
  int level = map(wat, 0, 521, 0, 100); 

  if (Firebase.ready() && (millis() - sendDataPrevMillis > 2000 || sendDataPrevMillis == 0))
  {
    sendDataPrevMillis = millis();
    Serial.printf("Set Temperature... %s\n", Firebase.setFloat(fbdo, F("/ESP/Tmp"), t) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Temperature... %s\n", Firebase.getFloat(fbdo, F("/ESP/Tmp")) ? String(fbdo.to<float>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Set Humidity... %s\n", Firebase.setDouble(fbdo, F("/ESP/Hum"), h) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Humidity... %s\n", Firebase.getDouble(fbdo, F("/ESP/Hum")) ? String(fbdo.to<double>()).c_str() : fbdo.errorReason().c_str());

   
     Serial.printf("Set Water Sensor... %s\n", Firebase.setInt(fbdo, F("/ESP/Wat"), level) ? "ok" : fbdo.errorReason().c_str());

    Serial.printf("Get Water Sensor... %s\n", Firebase.getInt(fbdo, F("/ESP/Wat")) ? String(fbdo.to<int>()).c_str() : fbdo.errorReason().c_str());

    Serial.printf("Get Led... %s\n", Firebase.getInt(fbdo, F("/ESP/Led")) ? String(fbdo.to<int>()).c_str() : fbdo.errorReason().c_str());

    int led =fbdo.to<int>();
    Serial.println(led);
    if(led==1){
      digitalWrite(4,HIGH);
    }
    else if(led==0){
      digitalWrite(4,LOW);
    }
        
  }
}
