# 🗄️ MongoDB

## 📘 What is MongoDB ?

MongoDB is a **NoSQL document-oriented database** system that stores data in **JSON format (BSON internally).**
It is widely used in IoT and web projects for its flexibility, scalability, and easy access via libraries.

Data is organized as follows:

- **Database** → contains multiple collections
- **Collection** → contains multiple documents
- **Document** → corresponds to a JSON record

Exemple :
```json
{
  "temp": 23.4,
  "humidity": 58,
  "date": "2025-11-12",
  "time": "14:32:10"
}
```

There are 2 MongoDB services to know:

- **mongod** → the service that runs the MongoDB server
- **mongo** → CLI client to interact with your databases

## ⚙️ Installing MongoDB

🧩 Depending on your Ubuntu version (e.g., 16.04), some recent MongoDB versions may not be compatible.
Check your system version before installation:

```bash
cat /etc/lsb-release
```

### 🔹 Download

Go to the official website to download a compatible version:
👉 [MongoDB Community Edition Archive](https://www.mongodb.com/try/download/community-edition/releases/archive)

Download the package for your distribution:

- .deb for Debian/Ubuntu

- .rpm for RedHat/CentOS

### 🔹 Installation
🐧 On Debian/Ubuntu :
```bash
sudo apt install [nom-du-fichier].deb
```
🐧 On RedHat/CentOS :
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

List existing databases:
```bash
show dbs
```

Create a new database:
```bash
use myDatabase
```

Create a collection:
```bash
db.createCollection("sensorData")
```

List collections:
```bash
show collections
```

Display the content:
```bash
db.sensorData.find()
```