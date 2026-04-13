|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Strukturen](#1-strukturen)
  - [1.1. Was ist eine struct in C?](#11-was-ist-eine-struct-in-c)
  - [1.2. Vorteile und Einsatzbereiche](#12-vorteile-und-einsatzbereiche)
  - [1.3. Einsatzbereiche](#13-einsatzbereiche)
  - [1.4. Strukturen (struct)](#14-strukturen-struct)
  - [1.5. Array von Strukturen](#15-array-von-strukturen)
- [2. Modularisierung](#2-modularisierung)
  - [2.1. Mehrere Dateien in der Arduino IDE](#21-mehrere-dateien-in-der-arduino-ide)
- [3. Aufgaben](#3-aufgaben)
  - [3.1. Strukturierte Wetterstation](#31-strukturierte-wetterstation)

---

</br>

# 1. Strukturen

**Lernziele:** Die Studierenden können `struct` verwenden, um zusammengehörige Daten zu gruppieren, und kennen die Grundlagen der Code-Aufteilung in mehrere Dateien.

---

## 1.1. Was ist eine struct in C?

In C sind `struct` (Strukturen) eine Möglichkeit, **benutzerdefinierte Datentypen** zu erstellen, die mehrere Werte unterschiedlicher Typen unter einem Namen zusammenfassen.

Strukturen (`struct`) sind ein **essenzieller Bestandteil** der C-Programmierung:

- Sie ermöglichen den Aufbau komplexer Datentypen.
- Der Zugriff ist flexibel (direkt oder über Zeiger).
- Sie sind Basis für moderne Programmiertechniken wie Datenkapselung und objektähnliches Denken.

```c
struct Person {
    char name[50];
    int alter;
    float gehalt;
};
```

- Diese Struktur fasst **Name**, **Alter** und **Gehalt** einer Person zusammen.
- Sie verhält sich wie ein **Container** für zusammengehörige Daten

## 1.2. Vorteile und Einsatzbereiche

- Strukturierung komplexer Daten (z. B. Person, Auto, Buch, Konto)
- Modularität und Wartbarkeit durch benannte Einheiten
- Unterstützt datenzentrierte Programmierung
- Wichtig für den Einsatz in Algorithmen, Dateien, Zeigern, Schnittstellen

## 1.3. Einsatzbereiche

- Darstellung von Datensätzen (z. B. eine Kundenkartei)
- Verwendung in Verketteten Listen, Bäumen oder Stacks
- Grundlage für Datenstrukturen in grösseren Projekten
- Übergabe komplexer Daten an Funktionen
- Paketieren von Informationen, z. B. beim Serialisieren

## 1.4. Strukturen (struct)

Eine Struktur fasst **mehrere Variablen unter einem Namen zusammen**:

```c
// Struktur definieren:
struct Sensor {
    int   pin;
    float minWert;
    float maxWert;
    String name;
};

struct LED {
    int  pin;
    bool istAn;
    int  helligkeitProzent;
};

// Instanzen erstellen:
Sensor tempSensor  = {A0, -40.0, 125.0, "TMP36"};
Sensor hellSensor  = {A1,   0.0, 100.0, "LDR"};
LED    statusLED   = {13, false, 100};

// Zugriff mit Punkt-Operator:
void setup() {
    Serial.begin(9600);
    pinMode(statusLED.pin, OUTPUT);
    Serial.print("Sensor: ");
    Serial.println(tempSensor.name);     // "TMP36"
    Serial.println(tempSensor.minWert);  // -40.0
}

// Struct an Funktion übergeben (Kopie):
float leseSensor(Sensor s) {
    int roh = analogRead(s.pin);
    float spannung = roh * (5.0 / 1023.0);
    // Lineares Mapping auf den Wertebereich:
    return s.minWert + (spannung / 5.0) * (s.maxWert - s.minWert);
}

// Struct per Referenz übergeben (kein Kopieren, kann verändert werden):
void setzeHelligkeit(LED &led, int prozent) {
    led.helligkeitProzent = constrain(prozent, 0, 100);
    int pwmWert = map(prozent, 0, 100, 0, 255);
    analogWrite(led.pin, pwmWert);
    led.istAn = (prozent > 0);
}
```

---

## 1.5. Array von Strukturen

```c
struct Ampel {
    int    pinRot;
    int    pinGelb;
    int    pinGruen;
    int    gruenDauerMs;
    String bezeichnung;
};

// Array von Ampeln (z. B. für eine Kreuzung):
Ampel kreuzung[4] = {
    {2,  3,  4,  30000, "Nord-Sued"},
    {5,  6,  7,  30000, "Sued-Nord"},
    {8,  9,  10, 25000, "Ost-West"},
    {11, 12, 13, 25000, "West-Ost"},
};

void ampelAuf(Ampel &a) {
    digitalWrite(a.pinRot,   LOW);
    digitalWrite(a.pinGelb,  LOW);
    digitalWrite(a.pinGruen, HIGH);
    Serial.print(a.bezeichnung);
    Serial.println(": GRUEN");
}

void setup() {
    for (int i = 0; i < 4; i++) {
        pinMode(kreuzung[i].pinRot,   OUTPUT);
        pinMode(kreuzung[i].pinGelb,  OUTPUT);
        pinMode(kreuzung[i].pinGruen, OUTPUT);
    }
}
```

---

</br>

# 2. Modularisierung

## 2.1. Mehrere Dateien in der Arduino IDE

Grössere Projekte werden in mehrere Dateien aufgeteilt. In der Arduino IDE fügt man über den **`+`-Button** neben den Tabs neue Dateien hinzu.

> 💡 **Empfohlene Projektstruktur:**
>
> ```console
> MeineWetterstation/
> ├── MeineWetterstation.ino   ← Hauptdatei (setup + loop)
> ├── sensoren.h               ← Struktur-Definitionen & Deklarationen
> ├── sensoren.cpp             ← Funktions-Implementierungen
> ├── display.h                ← Deklarationen für Display-Funktionen
> └── display.cpp              ← Implementierungen für Display
> ```

```c
// ── sensoren.h ──────────────────────────────────────────────────────
#ifndef SENSOREN_H    // Include Guard (verhindert Mehrfach-Include)
#define SENSOREN_H

struct TemperaturSensor {
    int   pin;
    float kalibrierung;
};

// Funktions-Deklarationen (Prototypen):
float leseTemperatur(TemperaturSensor sensor);
float leseLuftfeuchtigkeit(int pin);

#endif

// ── sensoren.cpp ────────────────────────────────────────────────────
#include "sensoren.h"
#include <Arduino.h>

float leseTemperatur(TemperaturSensor sensor) {
    int roh = analogRead(sensor.pin);
    float spannung = roh * (5.0 / 1023.0);
    return (spannung - 0.5) * 100.0 + sensor.kalibrierung;
}

float leseLuftfeuchtigkeit(int pin) {
    return analogRead(pin) * (100.0 / 1023.0);
}

// ── display.h ───────────────────────────────────────────────────────
#ifndef DISPLAY_H
#define DISPLAY_H

#include "sensoren.h"   // kennt TemperaturSensor

// Ausgabe-Modus für den Serial Monitor
enum AnzeigeFormat {
    FORMAT_KURZ,        // Nur Zahlenwerte
    FORMAT_LANG,        // Mit Einheiten und Beschriftungen
    FORMAT_CSV          // Kommagetrennt (für Datenexport)
};

// Funktions-Deklarationen:
void displayInitialisieren(int baudrate);
void zeigeTemperatur(float celsius, AnzeigeFormat format);
void zeigeLuftfeuchte(float prozent, AnzeigeFormat format);
void zeigeMessungKomplett(float celsius, float feuchte, AnzeigeFormat format);
void zeigeTrennlinie();

#endif


// ── display.cpp ─────────────────────────────────────────────────────
#include "display.h"
#include <Arduino.h>

void displayInitialisieren(int baudrate) {
    Serial.begin(baudrate);
    while (!Serial) { ; }   // Warten bis Serial bereit ist (Leonardo/Micro)
    zeigeTrennlinie();
    Serial.println("  Wetterstation bereit");
    zeigeTrennlinie();
}

void zeigeTemperatur(float celsius, AnzeigeFormat format) {
    switch (format) {
        case FORMAT_KURZ:
            Serial.println(celsius, 1);
            break;
        case FORMAT_LANG:
            Serial.print("Temperatur:  ");
            Serial.print(celsius, 1);
            Serial.println(" Grad C");
            break;
        case FORMAT_CSV:
            Serial.print(celsius, 1);
            Serial.print(",");
            break;
    }
}

void zeigeLuftfeuchte(float prozent, AnzeigeFormat format) {
    switch (format) {
        case FORMAT_KURZ:
            Serial.println(prozent, 1);
            break;
        case FORMAT_LANG:
            Serial.print("Luftfeuchte: ");
            Serial.print(prozent, 1);
            Serial.println(" %");
            break;
        case FORMAT_CSV:
            Serial.println(prozent, 1);   // Letzte Spalte: mit Zeilenumbruch
            break;
    }
}

void zeigeMessungKomplett(float celsius, float feuchte, AnzeigeFormat format) {
    if (format == FORMAT_CSV) {
        // CSV-Kopfzeile wird nur einmal beim Start ausgegeben (extern steuern)
        zeigeTemperatur(celsius, FORMAT_CSV);
        zeigeLuftfeuchte(feuchte, FORMAT_CSV);
    } else {
        zeigeTrennlinie();
        zeigeTemperatur(celsius, format);
        zeigeLuftfeuchte(feuchte, format);
    }
}

void zeigeTrennlinie() {
    Serial.println("─────────────────────────────────");
}


// ── MeineWetterstation.ino ─────────────────────────────────────────
#include "sensoren.h"
#include "display.h"

TemperaturSensor aussen = {A0, -0.5};
TemperaturSensor innen  = {A1, +0.2};

void setup() {
    displayInitialisieren(9600);
}

void loop() {
    float ta = leseTemperatur(aussen);
    float fa = leseLuftfeuchtigkeit(A2);

    Serial.println("-- Aussen --");
    zeigeMessungKomplett(ta, fa, FORMAT_LANG);

    float ti = leseTemperatur(innen);
    float fi = leseLuftfeuchtigkeit(A3);

    Serial.println("-- Innen --");
    zeigeMessungKomplett(ti, fi, FORMAT_LANG);

    delay(2000);
}
```

---

</br>

# 3. Aufgaben

## 3.1. Strukturierte Wetterstation

| **Vorgabe**         | **Beschreibung**                                                         |
| :------------------ | :----------------------------------------------------------------------- |
| **Lernziele**       | Structs für Datenmodellierung nutzen, Code in mehrere Dateien aufteilen. |
| **Sozialform**      | Einzelarbeit                                                             |
| **Auftrag**         | siehe unten                                                              |
| **Hilfsmittel**     |                                                                          |
| **Zeitbedarf**      | 60min                                                                    |
| **Lösungselemente** | Vollständiges Sketch                                                     |

1. Definieren Sie eine Struktur `MessStation` mit: `name` (String), `tempPin` (int), `lichtPin` (int), `letzteTemp` (float), `letztesLicht` (int).
   1. Erstellen Sie zwei Instanzen für „Drinnen" und „Draussen".
2. Schreiben Sie Funktionen `void aktualisieren(MessStation &s)` und `void ausgeben(MessStation s)`, die Messwerte einlesen bzw. ausgeben.
3. Lagern Sie die Struktur und die Funktionen in eine eigene Header-Datei `sensoren.h` und Implementierungsdatei `sensoren.cpp` aus.
4. **Bonus:** Erweitern Sie `MessStation` um `float letzte10Temps[10]` und `int ringIndex`, um einen gleitenden Durchschnitt zu berechnen.

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
