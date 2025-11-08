> 🇫🇷 Ce document est aussi disponible en français. [Lisez-le ici.](./docs/README/README.fr.md)

This is a repository focused on school project for the ISMIN cursus of "Ecole des mines de Saint-Etienne" school on the design of an IOT platform.

Main contributors : Tristan SCHREIBER & Adrien DELMAS

# ❓ About projet

The story behind this project is to protect Leonardo da Vinci's famous painting, the Mona Lisa, from theft or poor storage conditions. We're responsible for developping a system for a museum that can monitor the temperature and humidity around the painting and detect if it is being stolen. 


## 🎯 Project Goals

| Goal | Sub-goals | Expected Behavior / Description |
|------|-----------|--------------------------------|
| **Temperature & Humidity** | Temperature measurement | The room temperature must be monitored to ensure proper preservation of the artwork. Any deviation above 27°C triggers alerts. |
|  | Humidity measurement | The humidity must be monitored to maintain optimal conservation. Any deviation above 60% triggers alerts. |
|  | Real-time display | Current temperature and humidity values must be displayed on the web interface. |
|  | Daily display | Daily averages or logs of temperature and humidity must be accessible on the website. |
|  | Siren alert | A central siren (simulated by a LED) must sound whenever thresholds are exceeded or the artwork is moved. |
|  | HTML alert | Alerts must be displayed on the museum’s web interface in real-time. |
|  | Email alert | Alerts must be sent to the conservator’s smartphone.  |
|  | Reset / Rearm | Only the conservator can reset the alarms, including turning off the siren. |
| **Theft / Security** | Break-in detection | Any movement of the artwork must trigger the alarms. |
|  | Siren alert | The central siren (LED) must activate when a break-in is detected. |
|  | HTML alert | Web interface must show a real-time alert for break-in events. |
|  | Email alert | Email or smartphone notification sent to the conservator. |
|  | Reset / Rearm | Only the conservator can reset alarms after an event. |
| **Global** | Historical log | All alarms events must be logged in a database with filtering options accessible to the conservator. |
|  | Interface quality | |



 

## ⚙️ Technical Stack

The project relies on several interconnected **hardware / technology** components:

| Layer | Component | Role |
|----------|------------|------|
| **Server** | **Linux Virtual Machine** | Hosts the MQTT subscriber, processes incoming sensor data, and stores it in the database. |
| **Gateway** | **Raspberry Pi3 (Model B V1.2)** | Serves as the gateway between the sensor devices and the server, running Node-RED and Mosquitto broker. |
| **Communication** | **Bluetooth Low Energy (BLE)** | Wireless communication channel between the sensor devices (NUCLEO + sensor boards) and the Raspberry Pi gateway. |
| **Sensor device (CPU)** | **X-NUCLEO-L053R8** | MCU responsible for reading sensor data and sending it via BLE. |
| **Sensor device (BLE)** | **X-NUCLEO-IDB05A1** | Handles BLE communication, transmitting sensor data from the NUCLEO MCU to the Raspberry Pi. |
| **Sensor device (Sensors)** | **X-NUCLEO-IKS01A2** | Measures environmental parameters such as temperature, humidity, pressure, and sends them to the MCU. |

> [!INFO] X stand for STM32

The project relies on several interconnected **software** components:

| Hosting | Component | Role |
|----------|------------|------|
| Dev Machine | STM32CubeIDE & soft pack| Developping Interface for C Code for STMicroelectronics MCU |
| **Raspberry Pi** | **Node-RED** | Provides a visual interface for processing, transforming, and displaying data received from the Nucleo board or MQTT topics. |
| **Raspberry Pi / Linux VM** | **Mosquitto (MQTT Broker)** | Acts as a gateway between the gateway and the server. MQTT messages are published on topics like `sensors/#`. |
| **Linux VM** | **MongoDB** | Database used to store the measurements and logs received from the MQTT broker. |
| **Web** | **SendGrid** | Used to send automated email notifications based on sensor data or specific alert conditions. |


