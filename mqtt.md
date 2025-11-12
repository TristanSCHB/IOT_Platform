# 🛰️ MQTT

## 📘 What is MQTT?

**MQTT (Message Queuing Telemetry Transport)** is a **lightweight messaging protocol** designed for **machine-to-machine (M2M)** and **IoT (Internet of Things)** communications.  
It allows devices, sensors, or applications to **publish** and **receive** messages on “**topics**” via a central server called a **broker**.

### ⚙️ General Functioning

The protocol is based on a **publish/subscribe (pub/sub) model**:

1. **Publisher** → sends a message on a **topic** (e.g., `sensor/temperature`).
2. **Broker** → receives the message and redistributes it.
3. **Subscriber** → receives all messages on the topic it is subscribed to.

There is no direct connection between publisher and subscriber:  
👉 the **broker** acts as an intermediary.

---

## 🔌 MQTT Ports: 1883 and 8000

### 🧱 Port 1883 → “Pure” MQTT
- Protocol: **TCP**
- Used by: **server or embedded programs** (Node-RED)
- Direct communication via the MQTT protocol

Example: Node-RED client → TCP 1883 → Mosquitto Broker

### 🌐 Port 8000 → MQTT via WebSocket

- Protocol: **WebSocket (HTTP)**
- Used by: **web pages (JavaScript)**, because browsers **cannot open raw TCP sockets**
- Requires enabling `websockets` in the Mosquitto configuration

Example: Web page (JS) → WebSocket 8000 → Mosquitto Broker

---

### 🔁 QoS (Quality of Service)

| Level | Description | Guarantee |
|-------|-------------|-----------|
| 0 | “At most once” | Sent without acknowledgment |
| 1 | “At least once” | Confirmed reception at least once |
| 2 | “Exactly once” | Guaranteed single delivery |

---

# ⚙️ Mosquitto Installation and Configuration

## 🧩 Installation on Raspberry Pi / Linux (Debian, Ubuntu)

```bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
```

Enable Mosquitto at startup :

```bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```