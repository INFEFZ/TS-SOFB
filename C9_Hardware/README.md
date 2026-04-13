|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Hardware-Programmierung mit Arduino](#1-hardware-programmierung-mit-arduino)
  - [1.1. Digitale Ein- und Ausgaben](#11-digitale-ein--und-ausgaben)
  - [1.2. Analoge Ein- und Ausgaben (PWM)](#12-analoge-ein--und-ausgaben-pwm)
  - [1.3. millis() statt delay() – Non-Blocking Pattern](#13-millis-statt-delay--non-blocking-pattern)
  - [1.4. Interrupts – Zeitkritische Ereignisse](#14-interrupts--zeitkritische-ereignisse)
  - [1.5. Externe Bibliotheken einbinden](#15-externe-bibliotheken-einbinden)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Reaktionsmesser](#21-reaktionsmesser)

---

</br>

# 1. Hardware-Programmierung mit Arduino

**Lernziele:** Die Studierenden können digitale und analoge Pins verwenden, PWM-Signale erzeugen, Interrupts nutzen und externe Bibliotheken einbinden.

---

## 1.1. Digitale Ein- und Ausgaben

```c
void setup() {
    // OUTPUT: Kann HIGH (5 V) oder LOW (0 V) ausgeben
    // INPUT: Liest extern anliegenden Pegel
    // INPUT_PULLUP: Wie INPUT, aber mit internem Pull-up-Widerstand (~50 kΩ)

    pinMode(13, OUTPUT);        // LED als Ausgang
    pinMode(2,  INPUT_PULLUP);  // Taster (gedrückt = LOW, losgelassen = HIGH!)
}

void loop() {
    int taster = digitalRead(2);

    // Mit INPUT_PULLUP: LOW = gedrückt
    if (taster == LOW) {
        digitalWrite(13, HIGH);   // LED an, wenn Taster gedrückt
    } else {
        digitalWrite(13, LOW);
    }
}
```

---

## 1.2. Analoge Ein- und Ausgaben (PWM)

```c
// analogRead:  10-Bit ADC → Wert 0–1023 (nur analoge Pins A0–A5)
// analogWrite: 8-Bit PWM  → Wert 0–255  (nur PWM-Pins: 3, 5, 6, 9, 10, 11)

void loop() {
    // Potentiometer lesen, LED-Helligkeit steuern:
    int potWert    = analogRead(A0);                     // 0–1023
    int helligkeit = map(potWert, 0, 1023, 0, 255);     // 0–255
    analogWrite(9, helligkeit);

    // Spannung berechnen:
    float spannung = potWert * (5.0 / 1023.0);
    Serial.print("Spannung: ");
    Serial.print(spannung, 2);
    Serial.println(" V");

    // Sanftes Pulsieren (Breathing-Effekt):
    for (int i = 0;   i <= 255; i++) { analogWrite(9, i); delay(8); }
    for (int i = 255; i >= 0;   i--) { analogWrite(9, i); delay(8); }
}
```

---

## 1.3. millis() statt delay() – Non-Blocking Pattern

`delay()` **blockiert** das gesamte Programm. Mit `millis()` können mehrere Aufgaben „gleichzeitig" laufen:

```c
unsigned long letzterBlink = 0;
unsigned long letzteMessung = 0;
bool ledZustand = false;

void loop() {
    unsigned long jetzt = millis();

    // LED alle 500 ms toggeln – ohne delay()
    if (jetzt - letzterBlink >= 500) {
        letzterBlink = jetzt;
        ledZustand = !ledZustand;
        digitalWrite(LED_BUILTIN, ledZustand);
    }

    // Sensor alle 2 Sekunden lesen – unabhängig von der LED
    if (jetzt - letzteMessung >= 2000) {
        letzteMessung = jetzt;
        float temp = analogRead(A0) * (5.0 / 1023.0) * 100.0;
        Serial.println(temp);
    }

    // Taster jederzeit reagiert – wird nicht durch delay() blockiert
    if (digitalRead(2) == LOW) {
        Serial.println("Taster!");
    }
}
```

---

## 1.4. Interrupts – Zeitkritische Ereignisse

Interrupts ermöglichen die sofortige Reaktion auf Ereignisse, egal was der Hauptcode gerade tut:

```c
// Nur Pin 2 und Pin 3 unterstützen externe Interrupts auf dem Uno!
volatile int tasterCount = 0;          // volatile: wird in ISR verändert
volatile unsigned long letzterDruck = 0;

// Interrupt Service Routine (ISR) – muss schnell sein, kein delay()!
void tasterISR() {
    unsigned long jetzt = millis();
    if (jetzt - letzterDruck > 50) {   // Entprellen: 50 ms Totzeit
        tasterCount++;
        letzterDruck = jetzt;
    }
}

void setup() {
    Serial.begin(9600);
    pinMode(2, INPUT_PULLUP);

    // attachInterrupt(digitalPinToInterrupt(Pin), ISR, Modus)
    // Modus: RISING (↑), FALLING (↓), CHANGE (↑↓), LOW (dauerhaft)
    attachInterrupt(digitalPinToInterrupt(2), tasterISR, FALLING);
}

void loop() {
    Serial.print("Druecke: ");
    Serial.println(tasterCount);  // Immer aktuell, egal was loop() tut
    delay(500);
}
```

> ⚠️ **ISR-Regeln:**
>
> - Kein `delay()` in der ISR
> - Kein `Serial.print()` in der ISR
> - Alle von der ISR veränderten Variablen müssen `volatile` sein
> - ISR so kurz wie möglich halten

---

## 1.5. Externe Bibliotheken einbinden

Installation: **Sketch → Bibliotheken einbinden → Bibliotheken verwalten**

```c
// Beispiel: DHT22 Temperatur/Luftfeuchte-Sensor (Bibliothek: "DHT sensor library")
#include <DHT.h>

#define DHT_PIN  4
#define DHT_TYPE DHT22

DHT dht(DHT_PIN, DHT_TYPE);  // Sensor-Objekt erstellen

void setup() {
    Serial.begin(9600);
    dht.begin();
}

void loop() {
    float luftfeuchte = dht.readHumidity();
    float temperatur  = dht.readTemperature();  // Celsius

    // Fehlerbehandlung: isnan() prüft auf "Not a Number"
    if (isnan(luftfeuchte) || isnan(temperatur)) {
        Serial.println("Sensor-Lesefehler! Verkabelung pruefen.");
        return;  // Aktuellen Loop-Durchgang abbrechen
    }

    Serial.print("Temperatur: ");  Serial.print(temperatur);   Serial.println(" C");
    Serial.print("Luftfeuchte: "); Serial.print(luftfeuchte);  Serial.println(" %");
    Serial.print("Hitzeindex: ");
    Serial.print(dht.computeHeatIndex(temperatur, luftfeuchte, false));
    Serial.println(" C");

    delay(2000);  // DHT22 braucht mindestens 2s zwischen Messungen
}
```

---

</br>

# 2. Aufgaben

## 2.1. Reaktionsmesser

| **Vorgabe**         | **Beschreibung**                                                                   |
| :------------------ | :--------------------------------------------------------------------------------- |
| **Lernziele**       | Digitale I/O, `millis()` für Zeitmessung, Interrupts und Bibliotheken kombinieren. |
| **Sozialform**      | Einzelarbeit                                                                       |
| **Auftrag**         | siehe unten                                                                        |
| **Hilfsmittel**     |                                                                                    |
| **Zeitbedarf**      | 90min                                                                              |
| **Lösungselemente** | Vollständiges Sketch                                                               |

**Hardware:** LED (Pin 13), Taster (Pin 2, `INPUT_PULLUP`), Summer/Buzzer (Pin 8).

1. Baue einen **Reaktionsmesser**: Die LED leuchtet nach einer zufälligen Wartezeit (`randomSeed(analogRead(A5))` + `random(2000, 5000)` ms) auf.
   1. Messe mit `millis()`, wie schnell der Spieler den Taster drückt.
2. Gebe die Reaktionszeit aus und speichern Sie den bisherigen Rekord (schnellste Reaktion).
3. Erweitere um **Interrupt**: Der Taster (Pin 2) soll per `attachInterrupt()` mit `FALLING` registriert werden, damit keine Reaktion verloren geht.
4. **Bonus:** Summer-Feedback mit `tone(8, 1000, 200)` wenn die LED aufleuchtet, langer Beep bei neuem Rekord.
   1. Disqualifikation (Ton + Ausgabe) wenn Taster vor der LED gedrückt wird.

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
