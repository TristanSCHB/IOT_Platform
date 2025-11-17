> [!IMPORTANT]
> This document is available in French. [Lisez-le ici.](./docs/frenchdoc/README.fr.md)

This is a repository focused on school project for the ISMIN cursus of "Ecole des mines de Saint-Etienne" school on the design of an IOT platform.

**Main contributors : Tristan SCHREIBER & Adrien DELMAS**

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

# 🌍 Global System Overview

<p align="center">
  <img src="/docs/images/systemArchitecture.png" alt="Diagramme architecture" width="700" />
</p>

> [!NOTE]  
> To know how we manage the network and dev organisation check the associated document. [Read it here.](./docs/englishdoc/architecture.md)

## ⚙️ Technical Stack

> [!NOTE]
> X stand for STM32

The project relies on several interconnected **hardware / technology** components:

| Layer | Component | Role |
|----------|------------|------|
| **Server** | **Linux Virtual Machine** | Hosts the MQTT subscriber, processes incoming sensor data, and stores it in the database. |
| **Gateway** | **Raspberry Pi3 (Model B V1.2)** | Serves as the gateway between the sensor devices and the server, running Node-RED and Mosquitto broker. |
| **Communication** | **Bluetooth Low Energy (BLE)** | Wireless communication channel between the sensor devices (NUCLEO + sensor boards) and the Raspberry Pi gateway. |
| **Sensor device (CPU)** | **X-NUCLEO-L053R8** | MCU responsible for reading sensor data and sending it via BLE. |
| **Sensor device (BLE)** | **X-NUCLEO-IDB05A1** | Handles BLE communication, transmitting sensor data from the NUCLEO MCU to the Raspberry Pi. |
| **Sensor device (Sensors)** | **X-NUCLEO-IKS01A2** | Measures environmental parameters such as temperature, humidity, pressure, and sends them to the MCU. |

The project relies on several interconnected **software** components:

| Hosting | Component | Role |
|----------|------------|------|
| Dev Machine | STM32CubeIDE & soft pack| Developping Interface for C Code for STMicroelectronics MCU |
| **Raspberry Pi** | **Node-RED** | Provides a visual interface for processing, transforming, and displaying data received from the Nucleo board or MQTT topics. |
| **Raspberry Pi** | **Mosquitto Client** | Publishes and reads MQTT messages on topics such as `sensors/#`. |
| **Linux VM** | **Mosquitto** | MQTT Broker that enables the sending and receiving of MQTT data between different clients. |
| **Linux VM** | **MongoDB** | Database used to store the measurements and logs received from the MQTT broker. |
| **Web** | **SendGrid** | Used to send automated email notifications based on sensor data or specific alert conditions. |

# 💾 How to make it ?

## 🔩 Connected Object

> [!NOTE]
> To better understand the role of the files, refer to the associated document. [Read-it here.](./stm32ProjectArchitecture.fr.md)

You can clone the project by downloading the IOT_PLATFORM folder and importing it into STM32CubeIDE. You will then just need to flash the code onto the NUCLEO board.

Diagram of the file organization in the STM32 project:
<p align="center">
  <img src="/docs/images/stm32projectArchitecture.png" alt="Diagramme STM32" width="700" />
</p>


Currently, the project allows:

- Sending **temperature** data on the characteristic: `001c0000000111e1ac360002a5d5c51b`
- Sending **humidity** data on the characteristic: `001c0000000111e1ac360002a5d5c51b`
- Sending **acceleration** data on the characteristic: `00E00000000111e1ac360002a5d5c51b`
- Sending **gyroscopic acceleration** data on the characteristic: `00E00000000111e1ac360002a5d5c51b`

## 🌉 Gateway

Install Node-RED:

Install the required packages:

Import the `flows.js` file into Node-RED.

Configure the different nodes:

## 🖥️ Server

### 🍃 MongoDB

> [!NOTE]  
> To better understand Mongo Services, please refer to the associated document. [Read it here.](./docs/englishdoc/mongodb.md)

> [!IMPORTANT]  
> After thinking about it, a better option for you could be downloading docker an create a mongob container.

### 🔹 Download

Go to the official website to download a compatible version:
👉 [MongoDB Community Edition Archive](https://www.mongodb.com/try/download/community-edition/releases/archive)

Download the package that matches your distribution:

- .deb for Debian/Ubuntu

- .rpm for RedHat/CentOS

### 🔹 Installation
🐧 On Debian/Ubuntu :
```bash
sudo apt install [nom-du-fichier].deb
```
🐧 Sur RedHat/CentOS :
```bash
sudo dnf install [nom-du-fichier].rpm
```
### 🔹 Starting the service

Start MongoDB using systemctl:
```bash
sudo systemctl start mongod
```

Enable automatic startup at boot:
```bash
sudo systemctl enable mongod
```

## ⚙️ Network configuration

The configuration file is located here:

```bash
sudo nano /etc/mongod.conf
```
Modify the line:

bindIp: 127.0.0.1

> [!IMPORTANT]  
> Replace it with the IP address of your server, for me it's my VM's IP (obtained with ```ifconfig```).

Restart MongoDB to apply the changes:

```bash
sudo systemctl restart mongod
```

## 🧰 Creating the database and collections

Open the MongoDB shell:
```bash
mongo --host [IP_VM] --port 27017
```

Create a database:
```bash
use IOT
```

Create collections:

```bash
db.createCollection("Temp")
db.createCollection("Hum")
db.createCollection("Alarme")
```

### 🧩 Mosquitto Installation

> [!NOTE]  
> To better understand MQTT communication and Mosquitto configuration, please refer to the associated document. [Read it here.](./docs/englishdoc/mqtt.md)

```bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
```
Enable and start Mosquitto:

```bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```

Open the configuration file:

```bash
sudo nano /etc/mosquitto/conf.d/default.conf
```
Add the following lines at the top:

```
listener 1883
allow_anonymous true  # you may need to add this line
listener 8000
protocol websockets
allow_anonymous true  # you may need to add this line
```

Restart the service:

```bash
sudo systemctl restart mosquitto
```

### 🌐 Web Page

You will find in the repository an example web page that was used for this project.

You will also need to download the JavaScript files required by this interface.

The page displays real-time temperature and humidity data, along with two sections dedicated to viewing historical data for specific days. The interface also lists all recently triggered alarms and allows the conservator to reset them.
A password is required for this action. By default, the password is joconde123.
For security reasons, the system now verifies the SHA-256 hash of the password entered by the user and authorizes the reset only if the hash matches the stored value.