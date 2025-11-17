Contributeurs principaux : Tristan SCHREIBER & Adrien DELMAS

# ❓ À propos du projet

Le contexte de ce projet est de protéger le célèbre tableau de Léonard de Vinci, la Joconde, contre le vol ou des conditions de conservation inappropriées. Nous sommes responsables du développement d’un système pour un musée capable de surveiller la température et l’humidité autour du tableau et de détecter s’il est en train d'être volé.


## 🎯 Objectifs du projet

| Objectif | Sous-objectifs | Comportement attendu / Description |
|----------|---------------|----------------------------------|
| **Température & Humidité** | Mesure de la température | La température de la pièce doit être surveillée pour assurer la bonne conservation de l’œuvre. Tout dépassement de 27°C déclenche une alerte. |
|  | Mesure de l’humidité | L’humidité doit être surveillée pour maintenir une conservation optimale. Tout dépassement de 60% déclenche une alerte. |
|  | Affichage en temps réel | Les valeurs actuelles de température et d’humidité doivent être affichées sur l’interface web. |
|  | Affichage quotidien | Les moyennes ou relevés quotidiens de température et d’humidité doivent être accessibles sur le site web. |
|  | Alerte sirène | Une sirène centrale (simulée par une LED) doit se déclencher lorsque les seuils sont dépassés ou lorsque l’œuvre est déplacée. |
|  | Alerte HTML | Les alertes doivent être affichées en temps réel sur l’interface web du musée. |
|  | Alerte e-mail | Les alertes doivent être envoyées au smartphone du conservateur. |
|  | Réarmement | Seul le conservateur peut réarmer les alarmes, y compris éteindre la sirène. |
| **Vol / Sécurité** | Détection d’effraction | Tout déplacement de l’œuvre doit déclencher les alarmes. |
|  | Alerte sirène | La sirène centrale (LED) doit se déclencher lorsqu’une effraction est détectée. |
|  | Alerte HTML | L’interface web doit afficher en temps réel l’alerte d’effraction. |
|  | Alerte e-mail | Notification par e-mail ou smartphone envoyée au conservateur. |
|  | Réarmement | Seul le conservateur peut réarmer les alarmes après un événement. |
| **Global** | Historique | Tous les événements d’alarme doivent être enregistrés dans une base de données avec des options de filtrage accessibles au conservateur. |
|  | Qualité de l’interface | |

# 🌍 Vu Systeme Globale

<p align="center">
  <img src="/docs/images/systemArchitecture.png" alt="Diagramme architecture" width="700" />
</p>

> [!NOTE]  
> Pour savoir comment nous avons créer le réseau et gérer le system de développement référer vous au document associé. [Lisez-le ici.](./docs/englishdoc/architecture.fr.md)


## ⚙️ Stack technique

> [!NOTE]
> X pour STM32

Le projet s’appuie sur plusieurs composants **matériels / technologiques** interconnectés :

| Couche | Composant | Rôle |
|----------|------------|------|
| **Serveur** | **VM Linux** | Héberge le broker MQTT, traite les données des capteurs et les stocke dans la base de données. |
| **Passerelle** | **Raspberry Pi3 (Modèle B V1.2)** | Sert de passerelle entre les capteurs et le serveur, exécutant Node-RED et le broker Mosquitto. |
| **Communication** | **Bluetooth Low Energy (BLE)** | Canal de communication sans fil entre les capteurs (NUCLEO + cartes capteurs) et la passerelle Raspberry Pi. |
| **Capteur (CPU)** | **X-NUCLEO-L053R8** | Microcontrôleur chargé de lire les données des capteurs et de les envoyer via BLE. |
| **Capteur (BLE)** | **X-NUCLEO-IDB05A1** | Gère la communication BLE, transmet les données du NUCLEO vers la Raspberry Pi. |
| **Capteur (capteurs)** | **X-NUCLEO-IKS01A2** | Mesure les paramètres environnementaux tels que la température, l’humidité et la pression, et les transmet au MCU. |

Le projet s’appuie sur plusieurs briques logicielles interconnectées :

| Hébergement | Composant | Rôle |
|--------------|------------|------|
| Machine de développement|STM32CubeIDE| Interface de développement de code en C pour les cartes STMicroelectronics|
| **Raspberry Pi** | **Node-RED** | Fournit une interface visuelle pour traiter, transformer et afficher les données reçues des topics MQTT. |
| **Raspberry Pi** | **Mosquitto Client** | Publie et Lit les messages MQTT sur des topics tels que `sensors/#`. |
| **VM Linux** | **Mosquitto** | Broker MQTT qui permet de l'envoie et la reception des données mqtt entre les différent client. |
| **VM Linux** | **MongoDB** | Base de données utilisée pour stocker les mesures et les journaux reçus du broker MQTT. |
| Web | SendGrid | Utilisé pour envoyer des notifications par e-mail automatisées en fonction des données ou d’alertes spécifiques. |

# 💾 Utilisation du repo

## 🔩 L'Objets connecté

Vous pouvez prendre le projet STM32 du repo et modifier selon vos envie les différents fichiers utiles afin de le flasher sur le microcontrolleur de la NUCLEO.

Schéma de l'organsiation des fichiers dans le projet STM32 : 
<p align="center">
  <img src="/docs/images/stm32projectArchitecture.png" alt="Diagramme STM32" width="700" />
</p>
Actuellement le projet permet :

- L'envoie de la température sur la charactértisique : 001c0000000111e1ac360002a5d5c51b
- L'envoie de l'humidité sur la charactéristique : 001c0000000111e1ac360002a5d5c51b
- L'envoie de l'accélération sur la charactéristique : 00E00000000111e1ac360002a5d5c51b
- L'envoie de l'accélération gyroscopique sur la charactéristique : 00E00000000111e1ac360002a5d5c51b

## 🌉 Passerelle

Installer node-red :

Installer les packets : 

Importer le fichier flows.js sur node red.

Configurer les différents noeud :

## 🖥️ Serveur

### 🧩 Installation mosquitto

> [!NOTE]
> Pour mieux comprendre la communication mqtt et la configuration mosquitto référer vous au document associé. [Lisez-le ici.](./mqtt.fr.md)

```bash
sudo apt update
sudo apt install -y mosquitto mosquitto-clients
```

Activer Mosquitto et demarrer le :

```bash
sudo systemctl enable mosquitto
sudo systemctl start mosquitto
```

Ouvrir le fichier de oonfiguration

```bash
sudo nano /etc/mosquitto/conf.d/default.conf
```
Ajouter aux premières lignes :

```
listener 1883
allow_anonymous true // il faut parfois ajouter cette ligne
listener 8000
protocol websockets
allow_anonymous true // il faut parfois ajouter cette ligne
```

Restart the service 

```bash
sudo systemctl restart mosquitto
```


### 🍃 MongoDB

> [!NOTE]
> Pour mieux comprendre le rôle et comment utiliser la base de donnée référez vous au document associé. [Lisez-le ici.](./mongodb.fr.md)

### 🔹 Téléchargement

Rendez-vous sur le site officiel pour télécharger une version compatible :
👉 [MongoDB Community Edition Archive](https://www.mongodb.com/try/download/community-edition/releases/archive)

Téléchargez le paquet correspondant à votre distribution :

- .deb pour Debian/Ubuntu

- .rpm pour RedHat/CentOS

### 🔹 Installation
🐧 Sur Debian/Ubuntu :
```bash
sudo apt install [nom-du-fichier].deb
```
🐧 Sur RedHat/CentOS :
```bash
sudo dnf install [nom-du-fichier].rpm
```
### 🔹 Lancement du service

Démarrer MongoDB via systemctl :
```bash
sudo systemctl start mongod
```

Lancer automatiquement au démarrage :
```bash
sudo systemctl enable mongod
```

## ⚙️ Configuration du réseau

Le fichier de configuration se trouve ici :

```bash
sudo nano /etc/mongod.conf
```
Modifiez la ligne :

bindIp: 127.0.0.1

> [!IMPORTANT]  
> remplacer par l’adresse IP de votre VM ou de votre serveur (obtenue via ifconfig).

Redémarrez MongoDB pour appliquer les changements :

```bash
sudo systemctl restart mongod
```

## 🧰 Création de la base de données et des collections

Ouvrez le shell MongoDB :
```bash
mongo --host [IP_VM] --port 27017
```

Créer une base de données :
```bash
use IOT
```

Créer une ou des collection :

```bash
db.createCollection("Temp")
db.createCollection("Hum")
db.createCollection("Alarme")
```

### 🌐 Page web

Vous trouverez dans le dépôt un exemple de page web utilisée pour ce projet.

Vous devrez également télécharger les fichiers JavaScript nécessaires à son fonctionnement.

La page affiche en temps réel les données de température et d’humidité, ainsi que deux sections permettant de consulter l’historique pour des journées spécifiques. L’interface présente aussi les alarmes récemment déclenchées et offre la possibilité pour le conservateur de les réinitialiser.

Pour effectuer cette réinitialisation, un mot de passe est requis. Par défaut, il s’agit de joconde123.
Par mesure de sécurité, le système vérifie désormais le hash SHA-256 du mot de passe saisi par l’utilisateur et n’autorise la réinitialisation que si ce hash correspond à la valeur enregistrée.
