# 🗄️ MongoDB

## 📘 Qu’est-ce que MongoDB ?

**MongoDB** est un **système de base de données NoSQL orienté documents**, qui stocke les données sous forme de **JSON (BSON en interne)**.  
Il est largement utilisé dans les projets IoT et Web pour sa **souplesse**, sa **scalabilité** et sa **simplicité d’accès via des bibliothèques**.

Les données y sont organisées comme suit :

- **Base de données (Database)** → contient plusieurs **collections**
- **Collection** → contient plusieurs **documents**
- **Document** → correspond à un enregistrement JSON

Exemple :
```json
{
  "temp": 23.4,
  "humidity": 58,
  "date": "2025-11-12",
  "time": "14:32:10"
}
```

Il y a 2 service MongoDB à connaître

- Mongod -> C'est le service qui permet d'ouvrir un serveur mongoDB
- Mongo -> Client CLI permettant de piloter nos base de donnée.


## ⚙️ Installation de MongoDB

🧩 Selon la version d’Ubuntu utilisée (ex. 16.04), certaines versions récentes de MongoDB peuvent ne pas être compatibles.
Vérifiez votre version du système avant l’installation :

```bash
cat /etc/lsb-release
```

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

➡️ pour la remplacer par l’adresse IP de votre VM (obtenue via ifconfig).

Le port d’écoute par défaut est 27017.

Redémarrez MongoDB pour appliquer les changements :

```bash
sudo systemctl restart mongod
```

## 🧰 Création de la base de données et des collections

Ouvrez le shell MongoDB :
```bash
mongo --host [IP_VM] --port 27017
```

Lister les bases existantes :
```bash
show dbs
```

Créer une base de données :
```bash
use myDatabase
```

Créer une collection :
```bash
db.createCollection("sensorData")
```

Lister les collections :
```bash
show collections
```

Afficher le contenu :
```bash
db.sensorData.find()
```