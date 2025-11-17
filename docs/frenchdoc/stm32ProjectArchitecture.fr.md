# Architecture du projet STM32

Schéma de l'organsiation des fichiers dans le projet STM32 : 
<p align="center">
  <img src="/docs/images/stm32projectArchitecture.png" alt="Diagramme STM32" width="700" />
</p>


Pour une meilleurs compréhension et pour que vous pouissiez comprendre quel fichiers modifier pour vos besoin, voici la liste des dossiers et fichiers à connaître.

Rôle des dossier de niveau 1 :

- 📁 BlueNRG_MS → tout ce qui gère le Bluetooth Low Energy (BLE).

- 📁 Drivers → tout ce qui gère les capteurs physiques (IKS01A2 / IKS02A1) et le matériel STM32.

- 📁 Core → l'application principale (souvent main.c), initialise et relie tout.

---

Rôle des fichiers de niveau 3 et 4 :

Dans 📁 BlueNRG_MS

- 🧠 app_bluenrg_ms.c /.h
  - C’est le point d’entrée Bluetooth de ton appli.
  - Initialise la stack BLE, démarre les services, configure le device name, les callbacks, etc.
  -  Gérer les événements BLE (connexion, déconnexion, réception de données...).

- 🧩 gatt_db.c / .h
  -  C’est ici qu’est définie ta base GATT (Generic Attribute Table).
  -  Décrit ce que ton module BLE expose aux autres appareils :

- 🌡️ sensor.c / .h
  -  Ce fichier fait le lien entre les capteurs physiques (via Drivers) et le BLE.
  -  Il lit les valeurs (température, humidité, mouvement...) via les IKS01A2/IKS02A1.
  -  Ensuite, il envoie ces données sur les characteristics BLE définies dans gatt_db.c.

Dans 📁 Driver/BSP

- 🔹 iks01a2_env_sensors.c / .h
  -  Gère les capteurs environnementaux (température, pression, humidité).
  -  Fournit des fonctions comme IKS01A2_ENV_SENSOR_ReadID() ou GetValue().

- 🔹 iks01a2_motion_sensors.c / .h
  -  Gère les capteurs de mouvement (accéléro, gyro, magnéto).

> [!NOTE]  
> Il existe des fichers identiques avec marqué _ex à la fin (ex = extended). Ils ont le même rôle que les précédents fichiers mais avec plus des fonctionnalités plus poussés. 