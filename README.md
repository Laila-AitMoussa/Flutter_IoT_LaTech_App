# Flutter IoT LaTech App

Welcome to the Flutter IoT LaTech App repository! This Flutter application allows you to control and monitor IoT devices seamlessly. You can remotely manage a LED, view real-time sensor data (Humidity, temperature, Water Level), and visualize the information conveniently through graphs and charts.

<p align="center">
    <img src="LaTech_App.gif" width="700" height="500" />
</p>

## Flutter Application

The Flutter application provides a user-friendly interface for monitoring sensor data and controlling devices remotely. It consists of three screens:

1. **Home Screen**: Displays real-time sensor data and allows navigation to other screens.
2. **Graphs Screen**: Visualizes historical sensor data using graphs.
3. **Settings Screen**: Enables users to adjust sensor threshold values.

## ESP8266 Firmware

The firmware running on the ESP8266 microcontroller continuously reads sensor data (temperature, humidity, and water level) and updates the Firebase Realtime Database. It also listens for commands from the database to control an LED connected to the microcontroller.

## Features

- Real-time monitoring of temperature, humidity, and water level.
- Historical data visualization using graphs.
- Remote control of an LED.
- Threshold adjustment for sensors.
- Seamless integration with Firebase Realtime Database.

## Requirements

### Flutter Application

- Flutter SDK installed on your development machine.
- Android Studio or Visual Studio Code with Flutter plugin.
- Firebase account with real-time database enabled.

### ESP8266 Firmware

- ESP8266 or ESP32 microcontroller board.
- DHT11 sensor for temperature and humidity monitoring.
- Analog water level sensor.
- LED for remote control.
- Arduino IDE for ESP8266 development.
- Firebase account with real-time database enabled.

## Installation

1. Clone or download the Flutter application and ESP8266/ESP32 firmware code [here](ESP_FLUTTER).
2. Set up Firebase Realtime Database for both projects and obtain API keys and database URLs.
3. Configure Wi-Fi credentials, API keys, and database URLs in the ESP8266 firmware.
4. Connect the sensors and LED to the appropriate pins on the microcontroller.
5. Upload the firmware to your ESP8266 board using Arduino IDE.
6. Run the Flutter application on an emulator or physical device.

## Usage

1. Open the Flutter application on your device.
2. Navigate through the screens to monitor sensor data, adjust settings, and control the LED remotely.
3. View historical sensor data using the graphs on the Graphs screen.

## Contributing

Contributions to both the Flutter application and ESP8266 firmware are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

## Credits

- Flutter application created by [Laila Ait Moussa].
- ESP8266 firmware created by [Adesola Samuel](https://github.com/adesolasamuel).

## Additional Resources
[YouTube Playlist](https://www.youtube.com/playlist?list=PLEDaotIsUUtiPeA21hq7B9FgO_MV-5a4H): Explore this YouTube playlist for inspiration and tutorials on building IoT applications with Flutter.

