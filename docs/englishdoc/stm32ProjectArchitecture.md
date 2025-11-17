# STM32 Project Architecture

Diagram of the file organization in the STM32 project:
<p align="center">
  <img src="/docs/images/stm32projectArchitecture.png" alt="Diagramme STM32" width="700" />
</p>


For better understanding and to help you know which files to modify for your needs, here is a list of the important folders and files.

Role of Level 1 Folders: :

- 📁 BlueNRG_MS → Handles everything related to Bluetooth Low Energy (BLE).

- 📁 Drivers → Manages the physical sensors (IKS01A2 / IKS02A1) and the STM32 hardware.

- 📁 Core → The main application (usually main.c), initializes and connects everything.

---

Role of Level 3 and 4 Files:

In 📁 BlueNRG_MS

- 🧠 app_bluenrg_ms.c / .h
  -  This is the Bluetooth entry point of your application.
  -  Initializes the BLE stack, starts services, sets the device name, callbacks, etc.
  -  Handles BLE events (connection, disconnection, data reception...).

- 🧩 gatt_db.c / .h
  - Defines your GATT database (Generic Attribute Table).
  - Describes what your BLE module exposes to other devices.

- 🌡️ sensor.c / .h
  - Acts as the link between physical sensors (via Drivers) and BLE.
  - Reads sensor values (temperature, humidity, motion...) using IKS01A2/IKS02A1.
  - Sends these data to the BLE characteristics defined in gatt_db.c.

In 📁 Drivers/BSP

- 🔹 iks01a2_env_sensors.c / .h
  - Manages environmental sensors (temperature, pressure, humidity).
  - Provides functions like IKS01A2_ENV_SENSOR_ReadID() or GetValue().

- 🔹 iks01a2_motion_sensors.c / .h
  - Manages motion sensors (accelerometer, gyroscope, magnetometer).

[!NOTE]
There are identical files with _ex at the end (ex = extended). They serve the same purpose as the regular files but offer additional advanced functionalities.