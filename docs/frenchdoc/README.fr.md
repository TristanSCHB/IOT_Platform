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


## ⚙️ Stack technique

Le projet s’appuie sur plusieurs composants **matériels / technologiques** interconnectés :

| Couche | Composant | Rôle |
|----------|------------|------|
| **Serveur** | **VM Linux** | Héberge le broker MQTT, traite les données des capteurs et les stocke dans la base de données. |
| **Passerelle** | **Raspberry Pi3 (Modèle B V1.2)** | Sert de passerelle entre les capteurs et le serveur, exécutant Node-RED et le broker Mosquitto. |
| **Communication** | **Bluetooth Low Energy (BLE)** | Canal de communication sans fil entre les capteurs (NUCLEO + cartes capteurs) et la passerelle Raspberry Pi. |
| **Capteur (CPU)** | **X-NUCLEO-L053R8** | Microcontrôleur chargé de lire les données des capteurs et de les envoyer via BLE. |
| **Capteur (BLE)** | **X-NUCLEO-IDB05A1** | Gère la communication BLE, transmet les données du NUCLEO vers la Raspberry Pi. |
| **Capteur (capteurs)** | **X-NUCLEO-IKS01A2** | Mesure les paramètres environnementaux tels que la température, l’humidité et la pression, et les transmet au MCU. |

> [!NOTE]
> X pour STM32

Le projet s’appuie sur plusieurs briques logicielles interconnectées :

| Hébergement | Composant | Rôle |
|--------------|------------|------|
| Machine de développement|STM32CubeIDE| Interface de développement de code en C pour les cartes STMicroelectronics|
| **Raspberry Pi** | **Node-RED** | Fournit une interface visuelle pour traiter, transformer et afficher les données reçues des topics MQTT. |
| **Raspberry Pi** | **Mosquitto Client** | Publie et Lit les messages MQTT sur des topics tels que `sensors/#`. |
| **VM Linux** | **Mosquitto** | Broker MQTT qui permet de l'envoie et la reception des données mqtt entre les différent client. |
| **VM Linux** | **MongoDB** | Base de données utilisée pour stocker les mesures et les journaux reçus du broker MQTT. |
| **Lien Nucleo ↔️ RPi** | **Bluetooth (RFCOMM)** | Canal de communication entre la carte Nucleo et la Raspberry Pi. |
| **Dispositif embarqué** | **Nucleo (STM32)** | Collecte les données des capteurs (température, humidité, etc.) et les envoie via Bluetooth. |
| Web | SendGrid | Utilisé pour envoyer des notifications par e-mail automatisées en fonction des données ou d’alertes spécifiques. |



# Vu Systeme Globale

# Utilisation du repo

## L'Objets connecté

Vous pouvez importer le projet directement sur STM32CubeIDE ...

## Passrelle

Ici nous utiliserons Node-red 

Vous n'aurez qu'à importer les flows avec ...

## Serveur

### mongodb
> [!NOTE]
> Pour mieux comprendre la communication mqtt et la configuration mosquitto référer vous au document associé.. [Lisez-le ici.](./docs/frenchdoc/mqtt.fr.md)
installer mongoDB
commandes

### mosquitto

> [!NOTE]
> Pour mieux comprendre la communication mqtt et la configuration mosquitto référer vous au document associé.. [Lisez-le ici.](./docs/frenchdoc/mqtt.fr.md)

intaller mosquitto
commandes

### Page web

Package à installer
Fonctions clées ...


