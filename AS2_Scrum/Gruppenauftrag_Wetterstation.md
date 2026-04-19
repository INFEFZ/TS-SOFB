|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Gruppenauftrag · Agiles Datenbankprojekt mit Arduino (Wetterstation)](#1-gruppenauftrag--agiles-datenbankprojekt-mit-arduino-wetterstation)
  - [1.1. Übersicht](#11-übersicht)
  - [1.2. Arduino Wetterstation](#12-arduino-wetterstation)
    - [1.2.1. Systemübersicht](#121-systemübersicht)
    - [1.2.2. Benötigte Hardware (pro Team)](#122-benötigte-hardware-pro-team)
    - [1.2.3. Technologie-Stack](#123-technologie-stack)
  - [1.3. 4.2 Rollenverteilung](#13-42-rollenverteilung)
  - [1.4. Übung 3 · Sprint 1 – Sensor auslesen \& Display anzeigen](#14-übung-3--sprint-1--sensor-auslesen--display-anzeigen)
    - [1.4.1. Sprint 1 – Daily Scrum Protokoll](#141-sprint-1--daily-scrum-protokoll)
    - [1.4.2. Sprint 1 – Retrospektive](#142-sprint-1--retrospektive)
  - [1.5. Übung 4 · Sprint 2 – Grenzwerte, Alarm \& Helligkeitsmessung](#15-übung-4--sprint-2--grenzwerte-alarm--helligkeitsmessung)
    - [1.5.1. Burndown-Diagramm Sprint 2](#151-burndown-diagramm-sprint-2)
  - [1.6. Übung 5 · Sprint 3 – Datenlogging, Kalibrierung \& Präsentation](#16-übung-5--sprint-3--datenlogging-kalibrierung--präsentation)

---

</br>

# 1. Gruppenauftrag · Agiles Datenbankprojekt mit Arduino (Wetterstation)

> **Fokus:** Dieser Auftrag bewertet primär das **agile Vorgehen** – nicht die technische Perfektion. Ein Team, das Scrum konsequent lebt und einen kleinen Scope sauber liefert, schneidet besser ab als ein Team mit viel Code, aber chaotischem Prozess.

## 1.1. Übersicht

**Auftrag:**

Teams entwickeln eine Idee für eine Wetterstation (Arduino-Projekt).

Hardwareplattform: Arduino Uno

1. Schritt 1 – Product Backlog erstellen (5 Minuten)
   1. Teams schreiben User Stories auf Post-its.
2. Sprint Planung (5 Minuten)
   1. Teams wählen 3 User Stories für den Sprint.
   2. Dann zerlegen sie diese in Tasks.
3. Scrum Board erstellen (5 Minuten)
   1. To Do | In Progress | Done
   2. Tasks werden auf Post-its geschrieben und in die Spalten gelegt.

---

## 1.2. Arduino Wetterstation

> **Projektziel:** Ihr entwickelt als Team eine **Arduino-basierte Wetterstation** über drei simulierte Sprints. Das System misst Temperatur und Luftfeuchtigkeit, zeigt die Werte auf einem Display an und gibt bei Grenzwertüberschreitung einen Alarm aus. Jeder Sprint entspricht einer Unterrichtseinheit. Alle Scrum-Events finden statt.

### 1.2.1. Systemübersicht

```console
┌─────────────────────────────────────────────────────────┐
│                  Arduino Wetterstation                  │
│                                                         │
│  [DHT22 Sensor] ──► [Arduino Uno] ──► [LCD 16x2]        │
│  [LDR Sensor]   ──►      │       ──► [RGB LED]          │
│                          │       ──► [Buzzer]           │
│                          └───────► [Serial Monitor]     │
└─────────────────────────────────────────────────────────┘
```

### 1.2.2. Benötigte Hardware (pro Team)

| Komponente              | Anzahl | Verwendung                        |
| ----------------------- | :----: | --------------------------------- |
| Arduino Uno (oder Nano) |   1    | Mikrocontroller                   |
| DHT22 Temperatursensor  |   1    | Temperatur & Luftfeuchtigkeit     |
| LCD Display 16×2 (I2C)  |   1    | Anzeige der Messwerte             |
| RGB LED                 |   1    | Statusanzeige (grün/gelb/rot)     |
| Buzzer (passiv)         |   1    | Alarm bei Grenzwertüberschreitung |
| LDR (Fotowiderstand)    |   1    | Helligkeit messen (Sprint 2)      |
| Widerstände 10kΩ        |   3    | Pull-down für Sensoren            |
| Breadboard + Kabel      | 1 Set  | Verkabelung                       |
| USB-Kabel               |   1    | Programmierung & Stromversorgung  |

### 1.2.3. Technologie-Stack

| Schicht                | Technologie                                 |
| ---------------------- | ------------------------------------------- |
| Mikrocontroller        | Arduino C++ (Arduino IDE)                   |
| Bibliotheken           | `DHT.h`, `LiquidCrystal_I2C.h`              |
| Serielle Kommunikation | Arduino Serial Monitor / Python-Script      |
| Optionale Erweiterung  | Python + `pyserial` für Datenlogging auf PC |

---

## 1.3. 4.2 Rollenverteilung

| Rolle                     | Person | Hauptaufgaben im Arduino-Projekt                                                              |
| ------------------------- | ------ | --------------------------------------------------------------------------------------------- |
| **Product Owner**         |        | Backlog pflegen, Akzeptanzkriterien definieren (z. B. «Sensor liest alle 2 s»), Demo abnehmen |
| **Scrum Master**          |        | Events moderieren, Impediments lösen (z. B. fehlende Bauteile), Team schützen                 |
| **Developer HW**          |        | Schaltung aufbauen, Sensoren anschliessen, Verkabelung dokumentieren                          |
| **Developer SW**          |        | Arduino-Sketch schreiben, Bibliotheken einbinden, testen                                      |
| **Developer Integration** |        | HW + SW zusammenführen, Serial-Output, optionales Python-Logging                              |

> 💡 In kleinen Teams (3 Personen) übernimmt der PO auch Entwicklungsaufgaben. Die Rollen können pro Sprint rotieren.

---

## 1.4. Übung 3 · Sprint 1 – Sensor auslesen & Display anzeigen

⏱ **60 Minuten**

**Sprint-Ziel:** Der DHT22-Sensor ist angeschlossen und zeigt Temperatur & Luftfeuchtigkeit alle 2 Sekunden auf dem LCD-Display an.

**Sprint Planning (15 Min.):**

1. Wählt User Stories aus dem Product Backlog (→ Anhang A)
2. Definiert das Sprint-Ziel als Team
3. Schätzt die Stories in Story Points (Planning Poker)
4. Erstellt euren Sprint Backlog (Board: To Do / In Progress / Review / Done)

**Entwicklung (35 Min.):**
5. Führt (simuliert) einen Daily Scrum durch (3 Fragen, max. 5 Min.)
6. Dokumentiert Impediments sofort im Protokoll (z. B. «I2C-Adresse des Displays unbekannt»)
7. HW-Developer baut Schaltung auf, SW-Developer schreibt Sketch parallel

**Starter-Sketch als Ausgangsbasis:**

```cpp
#include <DHT.h>
#include <LiquidCrystal_I2C.h>

#define DHTPIN 2
#define DHTTYPE DHT22

DHT dht(DHTPIN, DHTTYPE);
LiquidCrystal_I2C lcd(0x27, 16, 2);  // I2C-Adresse ggf. anpassen

void setup() {
  Serial.begin(9600);
  dht.begin();
  lcd.init();
  lcd.backlight();
}

void loop() {
  float temp = dht.readTemperature();
  float humi = dht.readHumidity();

  lcd.setCursor(0, 0);
  lcd.print("Temp: ");
  lcd.print(temp, 1);
  lcd.print(" C");

  lcd.setCursor(0, 1);
  lcd.print("Humi: ");
  lcd.print(humi, 1);
  lcd.print(" %");

  Serial.print("T="); Serial.print(temp);
  Serial.print(" H="); Serial.println(humi);

  delay(2000);
}
```

**Sprint Review + Retrospektive (10 Min.)**
8. Live-Demo: Sensor vor Klasse auslesen, Werte auf Display zeigen
9. Retrospektive: Was lief gut? Was war das grösste Impediment (HW oder SW)?

---

### 1.4.1. Sprint 1 – Daily Scrum Protokoll

**Sprint-Ziel:** ________________________________________________________________

**Datum:** __________________

| Person | Was tat ich gestern? | Was tue ich heute? | Impediments? |
| ------ | -------------------- | ------------------ | ------------ |
|        |                      |                    |              |
|        |                      |                    |              |
|        |                      |                    |              |
|        |                      |                    |              |

**Impediment-Log:**

| #   | Impediment | Gemeldet von | Gelöst durch | Status           |
| --- | ---------- | ------------ | ------------ | ---------------- |
| 1   |            |              |              | ☐ offen ☐ gelöst |
| 2   |            |              |              | ☐ offen ☐ gelöst |
| 3   |            |              |              | ☐ offen ☐ gelöst |

---

### 1.4.2. Sprint 1 – Retrospektive

**Methode: Start / Stop / Continue:**

| Start (anfangen) | Stop (aufhören) | Continue (beibehalten) |
| ---------------- | --------------- | ---------------------- |
|                  |                 |                        |
|                  |                 |                        |
|                  |                 |                        |

**Massnahmen für Sprint 2:**

| Massnahme | Verantwortlich | Bis wann |
| --------- | -------------- | -------- |
|           |                |          |
|           |                |          |

---

## 1.5. Übung 4 · Sprint 2 – Grenzwerte, Alarm & Helligkeitsmessung

⏱ **60 Minuten**

**Sprint-Ziel:** Das System gibt bei Temperatur > 28 °C einen optischen (RGB LED) und akustischen (Buzzer) Alarm aus. Der LDR misst zusätzlich die Helligkeit.

**Zusatzaufgaben Sprint 2:**

- Sprint Planning anhand der Retro-Erkenntnisse aus Sprint 1 durchführen
- Mindestens 1 aufgetretenes Impediment dokumentieren und lösen
- **Backlog Refinement** (20 Min.): Sprint-3-Stories verfeinern und schätzen
- **Burndown-Diagramm** für den Sprint führen

**Erweiterung Sketch – Alarm-Logik:**

```cpp
#define LED_R 9
#define LED_G 10
#define LED_B 11
#define BUZZER 8
#define LDR_PIN A0

#define TEMP_WARN  25.0   // Gelb
#define TEMP_ALARM 28.0   // Rot + Buzzer

void setStatus(float temp) {
  if (temp >= TEMP_ALARM) {
    // Rot + Buzzer
    analogWrite(LED_R, 255); analogWrite(LED_G, 0); analogWrite(LED_B, 0);
    tone(BUZZER, 1000, 500);
  } else if (temp >= TEMP_WARN) {
    // Gelb
    analogWrite(LED_R, 255); analogWrite(LED_G, 80); analogWrite(LED_B, 0);
    noTone(BUZZER);
  } else {
    // Grün – alles OK
    analogWrite(LED_R, 0); analogWrite(LED_G, 255); analogWrite(LED_B, 0);
    noTone(BUZZER);
  }
}

// Im loop() ergänzen:
// int licht = analogRead(LDR_PIN);
// setStatus(temp);
```

### 1.5.1. Burndown-Diagramm Sprint 2

Tragt täglich den verbleibenden Aufwand in Story Points ein:

```console
SP
│
30 │ ×
   │    \  (Ideallinie)
20 │     \
   │      \
10 │       \
   │        \
 0 └──────────────────────────
   Tag 1  Tag 2  Tag 3  Tag 4  Tag 5
```

| Tag | Geplante SP (Ideal) | Tatsächliche Rest-SP |
| --- | ------------------: | -------------------: |
| 1   |                     |                      |
| 2   |                     |                      |
| 3   |                     |                      |
| 4   |                     |                      |
| 5   |                     |                      |

---

## 1.6. Übung 5 · Sprint 3 – Datenlogging, Kalibrierung & Präsentation

⏱ **60 Minuten**

**Sprint-Ziel:** Das System loggt Messwerte über die serielle Schnittstelle. Ein Python-Script liest die Daten aus und zeigt sie als Verlaufsgraph an. Präsentation der Wetterstation vor der Klasse.

**Lieferobjekte Sprint 3:**

- Vollständig funktionierende Wetterstation (Demo live vor der Klasse)
- Python-Script für serielles Datenlogging (optional als Erweiterung)
- Schaltplan (Fritzing oder handgezeichnet, fotografiert)
- Sprint Review: 5-minütige Live-Demo mit Erklärung der Architektur
- Abschlussdiskussion: Was würdet ihr beim nächsten Hardware-Scrum-Projekt anders machen?

**Optionale Erweiterung – Python Serial Logger:**

```python
import serial
import csv
from datetime import datetime

PORT = "COM3"       # Windows: COM3, macOS/Linux: /dev/ttyUSB0
BAUD = 9600

with serial.Serial(PORT, BAUD, timeout=1) as ser:
    with open("messwerte.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Zeitstempel", "Temperatur", "Luftfeuchtigkeit"])
        print("Logging gestartet – CTRL+C zum Beenden")
        while True:
            line = ser.readline().decode("utf-8").strip()
            # Erwartet Format: "T=23.5 H=55.2"
            if line.startswith("T="):
                parts = line.replace("T=","").replace("H=","").split()
                row = [datetime.now().isoformat()] + parts
                writer.writerow(row)
                print(row)
```

**Definition of Done – Arduino Wetterstation:**

- ✅ DHT22 liest Temperatur und Luftfeuchtigkeit alle 2 Sekunden korrekt aus
- ✅ LCD zeigt beide Werte formatiert an
- ✅ RGB LED zeigt korrekten Status (grün / gelb / rot)
- ✅ Buzzer löst bei Temperatur > 28 °C aus
- ✅ Serielle Ausgabe im Format `T=xx.x H=xx.x`
- ✅ Schaltplan vorhanden und korrekt
- ✅ Code kommentiert und im Team-Repository eingecheckt
- ✅ Live-Demo vor der Klasse erfolgreich durchgeführt

**Bewertungskriterien:**

| Kriterium                                                         | Gewichtung |
| ----------------------------------------------------------------- | ---------- |
| Einhaltung des Scrum-Frameworks (Rollen, Events, Artefakte)       | 25 %       |
| Funktionierende Hardware (Definition of Done)                     | 30 %       |
| Qualität der Dokumentation (User Stories, Schaltplan, Protokolle) | 20 %       |
| Teamarbeit und Selbstorganisation                                 | 15 %       |
| Präsentation und Reflexion                                        | 10 %       |

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
