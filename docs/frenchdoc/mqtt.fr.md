# 🛰️ MQTT

## 📘 Qu’est-ce que MQTT ?

**MQTT (Message Queuing Telemetry Transport)** est un **protocole de messagerie léger** conçu pour les communications **machine-to-machine (M2M)** et **IoT (Internet of Things)**.  
Il permet à des appareils, capteurs ou applications de **publier** et **recevoir** des messages sur des “**topics**” via un **serveur central** appelé **broker**.

### ⚙️ Fonctionnement général

Le protocole repose sur un **modèle "publish/subscribe"** (pub/sub) :

1. **Publisher** → envoie un message sur un **topic** (ex: `capteur/temperature`).
2. **Broker** → reçoit ce message et le redistribue.
3. **Subscriber** → reçoit tous les messages du topic auquel il est abonné.

Aucune connexion directe entre publisher et subscriber :  
👉 c’est le **broker** qui fait l’intermédiaire.

---

## 🔌 Les ports MQTT : 1883 et 8000

### 🧱 Port 1883 → MQTT “pur”
- Protocole : **TCP**
- Utilisé par : **les programmes serveur ou embarqués** (Node-RED)
- Communication directe via le protocole MQTT

Exemple : Client Node-RED → TCP 1883 → Broker Mosquitto

### 🌐 Port 8000 → MQTT via WebSocket

- Protocole : **WebSocket (HTTP)**
- Utilisé par : **les pages web (JavaScript)**, car un navigateur **ne peut pas ouvrir de socket TCP brut**
- Nécessite d’activer le protocole `websockets` dans la configuration Mosquitto

Exemple : Page web (JS) → WebSocket 8000 → Broker Mosquitto

### 🔁 QoS (Quality of Service)

| Niveau | Description | Garantie |
|---------|--------------|-----------|
| 0 | “At most once” | Envoi sans confirmation |
| 1 | “At least once” | Réception confirmée au moins une fois |
| 2 | “Exactly once” | Réception garantie une seule fois |

# ⚙️ Installation et configuration de Mosquitto

## 🧩 Installation sur Raspberry Pi / Linux (Debian, Ubuntu)

```bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
```

Activer Mosquitto au démarrage :

```bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```