# C-Programmierung mit Arduino
## Vollständiges Unterrichtsmaterial – HF Lehrgang

> **Didaktisches Prinzip:** Verstehen → Üben → Anwenden  
> Jedes Modul baut auf dem vorherigen auf und endet mit praxisorientierten Übungsaufgaben.

---

## Lehrgangsübersicht

| Modul     | Thema                           | Lernzeit (ca.)    |
| --------- | ------------------------------- | ----------------- |
| 1         | Einführung & Installation       | 3 Lektionen       |
| 2         | Grundlagen der C-Programmierung | 3 Lektionen       |
| 3         | Variablen & Datentypen          | 4 Lektionen       |
| 4         | Programmflusssteuerung          | 4 Lektionen       |
| 5         | Funktionen                      | 4 Lektionen       |
| 6         | Arrays & Strings                | 3 Lektionen       |
| 7         | Zeiger & Speicher               | 4 Lektionen       |
| 8         | Strukturen & Modularisierung    | 4 Lektionen       |
| 9         | Hardware-Programmierung         | 4 Lektionen       |
| 10        | Abschlussprojekt                | 6 Lektionen       |
| **Total** |                                 | **~39 Lektionen** |

---

# Modul 1: Einführung & Installation

**Lernziele:** Nach diesem Modul können die Studierenden die Arduino IDE installieren, ein erstes Programm auf den Arduino laden und die grundlegende Entwicklungsumgebung bedienen.

---

## 1.1 Was ist C und warum lernen wir es?

C ist eine der wichtigsten und einflussreichsten Programmiersprachen der Geschichte. Entwickelt in den frühen 1970er-Jahren von Dennis Ritchie bei Bell Labs, bildet C die Grundlage für viele moderne Programmiersprachen – darunter C++, C#, Java und Go.

> 💡 **Warum C mit Arduino?**
> - **Hardware-nah:** C gibt uns direkte Kontrolle über Speicher und Hardware
> - **Ressourcenschonend:** Der Arduino Uno hat nur 2 KB RAM und 32 KB Flash – C ist sehr effizient
> - **Grundlage:** Wer C versteht, versteht die Basis aller modernen Sprachen
> - **Praxisrelevant:** Embedded Systems, Mikrocontroller und IoT-Geräte laufen fast alle auf C/C++

---

## 1.2 Der Arduino-Mikrocontroller

Arduino ist eine Open-Source-Elektronikplattform, die aus einem Mikrocontroller-Board und einer integrierten Entwicklungsumgebung (IDE) besteht. Im Lehrgang verwenden wir den **Arduino Uno** als Einstiegsplattform.

| Eigenschaft       | Arduino Uno Spezifikation                  |
| ----------------- | ------------------------------------------ |
| Mikrocontroller   | ATmega328P (8-Bit, AVR)                    |
| Taktfrequenz      | 16 MHz                                     |
| Flash-Speicher    | 32 KB (0.5 KB für Bootloader)              |
| SRAM              | 2 KB                                       |
| EEPROM            | 1 KB                                       |
| Digitale I/O Pins | 14 (davon 6 PWM-fähig)                     |
| Analoge Eingänge  | 6 (10-Bit ADC, 0–1023)                     |
| Betriebsspannung  | 5V                                         |
| USB-Verbindung    | USB-B (Programmierung und Stromversorgung) |

---

## 1.3 Installation der Arduino IDE

Die Arduino IDE ist kostenlos und unterstützt Windows, macOS und Linux. Download unter: **arduino.cc/en/software**

### Schritt-für-Schritt Installation (Windows)

1. Browser öffnen und `arduino.cc/en/software` besuchen
2. **Arduino IDE 2.x** herunterladen (Windows Installer `.exe`)
3. Installer als Administrator ausführen
4. Alle Standardoptionen bestätigen – **wichtig: USB-Treiber mitinstallieren!**
5. Nach der Installation: Arduino IDE starten
6. Arduino Uno per USB verbinden
7. **Tools → Board → "Arduino AVR Boards" → "Arduino Uno"** auswählen
8. **Tools → Port → COM-Port des Arduino** auswählen (z. B. COM3)

> ⚠️ **Port finden:**  
> **Windows:** Geräte-Manager → Anschlüsse (COM & LPT) → Arduino erscheint als „USB Serial Device"  
> **Linux/macOS:** `/dev/ttyACM0` oder `/dev/tty.usbmodem...` auswählen

---

## 1.4 Aufbau der Arduino IDE

Die IDE besteht aus folgenden Bereichen:

- **Toolbar:** Schaltflächen für Verifizieren (✓), Hochladen (→), Serial Monitor
- **Sketch-Bereich:** Hier wird der Code geschrieben
- **Ausgabebereich:** Compiler-Meldungen und Fehler werden hier angezeigt
- **Serial Monitor** (`Strg+Shift+M`): Kommunikation mit dem Arduino über USB (für Debugging)

---

## 1.5 Das erste Programm: Blink

Jedes Arduino-Programm (genannt „Sketch") hat **zwei Pflichtfunktionen**: `setup()` und `loop()`.

```c
// Erstes Arduino-Programm: LED blinken lassen
// Der Kommentar mit // gilt für eine Zeile

/* Mehrzeiliger Kommentar:
   setup() wird einmal beim Start ausgeführt.
   loop() wird danach endlos wiederholt. */

void setup() {
    // LED_BUILTIN ist Pin 13 (eingebaute LED auf dem Board)
    pinMode(LED_BUILTIN, OUTPUT);  // Pin als Ausgang konfigurieren
}

void loop() {
    digitalWrite(LED_BUILTIN, HIGH);  // LED einschalten (5V)
    delay(1000);                       // 1000 ms = 1 Sekunde warten
    digitalWrite(LED_BUILTIN, LOW);   // LED ausschalten (0V)
    delay(1000);                       // 1 Sekunde warten
}
```

Dieser Sketch lässt die eingebaute LED (Pin 13) im Sekundentakt blinken. Code mit dem **Häkchen-Button** verifizieren, dann mit dem **Pfeil-Button** hochladen.

---

## 🏋️ Übung 1.1 – Installation und erstes Programm

**Lernziel:** Arduino IDE einrichten, ersten Sketch hochladen und erste Modifikationen vornehmen.

1. Installieren Sie die Arduino IDE. Verbinden Sie den Arduino Uno per USB.
2. Öffnen Sie den Beispiel-Sketch: **Datei → Beispiele → 01.Basics → Blink**
3. Wählen Sie Board und Port korrekt aus. Laden Sie den Sketch hoch.
4. Beobachten Sie das Blinken der LED. Was passiert, wenn Sie `1000` in `delay()` auf `200` ändern?
5. **Bonus:** Lassen Sie die LED dreimal kurz blinken, dann einmal lang (Morsecode `S` = `···`).

---

# Modul 2: Grundlagen der C-Programmierung

**Lernziele:** Die Studierenden verstehen die Struktur eines C-Programms, kennen die Syntax-Grundregeln und können den Serial Monitor für Ausgaben nutzen.

---

## 2.1 Struktur eines C/Arduino-Programms

Ein vollständiges Arduino-Programm besteht aus folgenden Elementen in dieser Reihenfolge:

```c
// 1. PRÄPROZESSOR-DIREKTIVEN (vor dem Kompilieren verarbeitet)
#include <Arduino.h>    // Standard-Arduino-Bibliothek (meist automatisch)
#define LED_PIN 13      // Konstante definieren (kein = kein ;)

// 2. GLOBALE VARIABLEN (für das gesamte Programm sichtbar)
int blinkCount = 0;

// 3. FUNKTIONSDEKLARATIONEN (Vorwärts-Deklaration, optional)
void blinken(int mal);  // Sagt dem Compiler: Diese Funktion existiert

// 4. SETUP-FUNKTION (einmal beim Start)
void setup() {
    pinMode(LED_PIN, OUTPUT);
    Serial.begin(9600);  // Serial Monitor mit 9600 Baud starten
    Serial.println("Arduino gestartet!");
}

// 5. LOOP-FUNKTION (Endlosschleife)
void loop() {
    blinken(3);
    delay(2000);
}

// 6. EIGENE FUNKTIONEN
void blinken(int mal) {
    for (int i = 0; i < mal; i++) {
        digitalWrite(LED_PIN, HIGH);
        delay(200);
        digitalWrite(LED_PIN, LOW);
        delay(200);
    }
    blinkCount++;
    Serial.print("Geblinkt: ");
    Serial.println(blinkCount);
}
```

---

## 2.2 Syntax-Grundregeln

C hat einige wichtige Syntaxregeln, die **strikt** eingehalten werden müssen:

| Regel                     | Erklärung und Beispiel                                   |
| ------------------------- | -------------------------------------------------------- |
| Semikolon `;`             | **Jede Anweisung** endet mit `;`  → `int x = 5;`         |
| Geschweifte Klammern `{}` | Definieren Codeblöcke: `{ ... }`                         |
| Runde Klammern `()`       | Für Bedingungen und Funktionsaufrufe                     |
| Gross-/Kleinschreibung    | C ist **case-sensitive**: `Led` ≠ `led` ≠ `LED`          |
| Kommentare `//`           | Einzeilig: `// Das ist ein Kommentar`                    |
| Kommentare `/* */`        | Mehrzeilig: `/* Kommentar */`                            |
| Einrückung                | Nicht syntaktisch nötig, aber für Lesbarkeit **wichtig** |

> ⚠️ **Häufigster Anfängerfehler:** Fehlende Semikolons! Der Compiler zeigt den Fehler meist in der *nächsten* Zeile an.

---

## 2.3 Der Serial Monitor

Der Serial Monitor ist das wichtigste Werkzeug zum **Debuggen** und zur Ausgabe von Werten.

```c
void setup() {
    Serial.begin(9600);   // Baudrate: 9600 Bits/Sekunde
}

void loop() {
    Serial.print("Wert: ");    // Ausgabe OHNE Zeilenumbruch
    Serial.println(42);         // Ausgabe MIT Zeilenumbruch

    Serial.print("Pi: ");
    Serial.println(3.14159, 2); // 2 Dezimalstellen → 3.14

    unsigned long t = millis(); // Millisekunden seit Programmstart
    Serial.print("Zeit: ");
    Serial.print(t);
    Serial.println(" ms");

    delay(1000);
}
```

> ⚠️ **Wichtig:** Die Baudrate in `Serial.begin()` **muss** mit der Einstellung im Serial Monitor übereinstimmen! Einstellung unten rechts im Serial Monitor-Fenster.

---

## 🏋️ Übung 2.1 – Serial Monitor

**Lernziel:** Serial Monitor für Ausgaben nutzen, Werte berechnen und formatiert ausgeben.

1. Schreiben Sie einen Sketch, der beim Start `"Hallo, mein Name ist [Ihr Name]!"` im Serial Monitor ausgibt.
2. Geben Sie in `loop()` jede Sekunde den aktuellen Zeitstempel aus. Tipp: `millis()` gibt Millisekunden seit Start zurück.
3. Berechnen Sie den Kreisumfang für `r = 5.0` und geben Sie das Ergebnis formatiert (2 Dezimalstellen) aus.
4. **Bonus:** Bringen Sie den Arduino dazu, von 10 auf 0 rückwärts zu zählen und dann `"Start!"` auszugeben.

---

# Modul 3: Variablen & Datentypen

**Lernziele:** Die Studierenden kennen die wichtigsten Datentypen in C, können Variablen deklarieren und initialisieren, und verstehen Scope und Konstanten.

---

## 3.1 Was ist eine Variable?

Eine Variable ist ein **benannter Speicherbereich**, der einen Wert speichert. In C muss vor der Verwendung immer der **Datentyp** angegeben werden.

```c
// Syntax: Datentyp Variablenname = Anfangswert;
int alter = 25;           // Ganzzahl
float temperatur = 22.5;  // Kommazahl
char buchstabe = 'A';     // Einzelnes Zeichen
bool istAn = true;        // Wahrheitswert

// Deklaration ohne Initialisierung – GEFÄHRLICH!
int x;      // x hat einen zufälligen Wert (undefiniertes Verhalten)
int y = 0;  // BESSER: immer mit einem Anfangswert initialisieren
```

---

## 3.2 Datentypen im Überblick

| Datentyp           | Grösse   | Wertebereich            | Verwendung                 |
| ------------------ | -------- | ----------------------- | -------------------------- |
| `bool`             | 1 Byte   | `true` oder `false`     | Zustände, Flags            |
| `byte` / `uint8_t` | 1 Byte   | 0 bis 255               | Bytes, Farbwerte           |
| `char`             | 1 Byte   | -128 bis 127            | Einzelne Zeichen: `'A'`    |
| `int`              | 2 Byte   | -32'768 bis 32'767      | Standardzahlen             |
| `unsigned int`     | 2 Byte   | 0 bis 65'535            | Positive Zahlen            |
| `long`             | 4 Byte   | -2.1 Mrd bis +2.1 Mrd   | Grosse Zahlen              |
| `unsigned long`    | 4 Byte   | 0 bis 4.29 Mrd          | `millis()`, Zeitwerte!     |
| `float`            | 4 Byte   | ca. 6–7 Dezimalstellen  | Kommazahlen                |
| `double`           | 4 Byte   | wie `float` auf Arduino | (kein Vorteil auf Uno)     |
| `String`           | variabel | Zeichenketten           | Texte (sparsam verwenden!) |

> ⚠️ **Overflow-Gefahr!** Wenn ein Wert den Wertebereich überschreitet, „wrapt" er um:
> ```c
> byte b = 255;  b++;  // b ist jetzt 0, nicht 256!
> int i = 32767; i++;  // i ist jetzt -32768
> ```
> **Lösung:** Den richtigen Datentyp wählen oder auf `long` / `unsigned long` ausweichen.

---

## 3.3 Konstanten

Werte, die sich nicht ändern sollen, werden als Konstanten definiert:

```c
// Weg 1: #define (Präprozessor-Direktive, kein Typ, kein ;)
#define LED_PIN 13
#define MAX_TEMP 80.0

// Weg 2: const (empfohlen! hat Typ, gilt nur im Scope)
const int LED_PIN = 13;
const float MAX_TEMP = 80.0;
const char TRENNER = '-';

// Verwendung:
void setup() {
    pinMode(LED_PIN, OUTPUT);  // Konstante verwenden
    // LED_PIN = 12;  // FEHLER: Konstanten sind unveränderbar!
}
```

**Wann welches?**
- `const` bevorzugen: hat Datentyp, wird vom Compiler geprüft, gilt im Scope
- `#define` für Werte, die wirklich global und typlos sein müssen

---

## 3.4 Variablen-Scope (Geltungsbereich)

Der Scope bestimmt, **wo** eine Variable sichtbar ist:

```c
int globalVar = 100;  // Globale Variable: überall sichtbar

void setup() {
    int lokalVar = 50;  // Lokale Variable: nur in setup() sichtbar
    Serial.begin(9600);
    Serial.println(globalVar);  // OK
    Serial.println(lokalVar);   // OK
}

void loop() {
    Serial.println(globalVar);  // OK: global
    // Serial.println(lokalVar); // FEHLER! nicht sichtbar in loop()

    // Block-Scope:
    {
        int blockVar = 42;
        Serial.println(blockVar);  // OK: im Block
    }
    // Serial.println(blockVar);  // FEHLER! ausserhalb des Blocks
}
```

**Faustregel:** Variablen so lokal wie möglich deklarieren. Globale Variablen nur verwenden, wenn wirklich nötig (z. B. für Interrupt-Service-Routinen mit `volatile`).

---

## 3.5 Typumwandlung (Casting)

```c
int ganzzahl = 7;
int divisor  = 2;

// Ganzzahl-Division: 7 / 2 = 3 (kein Rest, kein Runden!)
int ergebnis1 = ganzzahl / divisor;  // = 3

// Expliziter Cast zu float:
float ergebnis2 = (float)ganzzahl / divisor;  // = 3.5

// Alternativ: eine der Zahlen als float-Literal schreiben:
float ergebnis3 = ganzzahl / 2.0;  // = 3.5

// Praxisbeispiel: Analogwert in Spannung umrechnen
int roherWert = analogRead(A0);               // 0–1023
float spannung = roherWert * (5.0 / 1023.0);  // 5.0 wichtig! sonst Ganzzahldivision
```

---

## 🏋️ Übung 3.1 – Datentypen und Variablen

**Lernziel:** Variablen deklarieren, Datentypen korrekt auswählen, Scope und Casting verstehen.

1. Deklarieren Sie Variablen für: Ihren Namen (`String`), Ihr Alter (`int`), Ihre Körpergrösse (`float`), ob Sie Kaffee mögen (`bool`). Geben Sie alle Werte im Serial Monitor aus.
2. Berechnen Sie: Ein LED-Streifen hat 60 LEDs/Meter und ist 2.4 m lang. Wie viele LEDs insgesamt? Welcher Datentyp ist geeignet? Achten Sie auf die Typen bei der Multiplikation.
3. Erstellen Sie Konstanten für PIN-Nummern (LED: 13, Taster: 2, Buzzer: 8) und verwenden Sie diese in `setup()` für `pinMode()`.
4. **Bonus:** Was passiert, wenn Sie einen `byte` mit dem Wert `255` deklarieren und dann `++` anwenden? Testen Sie es und erklären Sie das Ergebnis.

---

# Modul 4: Programmflusssteuerung

**Lernziele:** Die Studierenden beherrschen Verzweigungen (`if`/`else`, `switch`) und Schleifen (`for`, `while`, `do-while`) und können komplexe Bedingungen formulieren.

---

## 4.1 Vergleichsoperatoren und logische Operatoren

| Operator      | Bedeutung                       | Beispiel                  |
| ------------- | ------------------------------- | ------------------------- |
| `==`          | Gleich                          | `if (x == 5)`             |
| `!=`          | Ungleich                        | `if (x != 0)`             |
| `<` und `>`   | Kleiner / Grösser               | `if (temp < 30.0)`        |
| `<=` und `>=` | Kleiner-gleich / Grösser-gleich | `if (i <= 100)`           |
| `&&`          | Logisches UND                   | `if (x > 0 && x < 100)`   |
| `\|\|`        | Logisches ODER                  | `if (x < 0 \|\| x > 100)` |
| `!`           | Logisches NICHT                 | `if (!istAn)`             |

> ⚠️ **Häufiger Fehler:** `=` (Zuweisung) statt `==` (Vergleich)!  
> `if (x = 5)` setzt x auf 5 und ist immer wahr. `if (x == 5)` vergleicht.

---

## 4.2 if / else if / else

```c
float temperatur = analogRead(A0) * (5.0 / 1023.0) * 100.0;

if (temperatur < 0) {
    Serial.println("Frost! Heizung einschalten.");
    digitalWrite(HEIZUNG_PIN, HIGH);
} else if (temperatur >= 0 && temperatur < 20) {
    Serial.println("Kuehl. Normal-Betrieb.");
    digitalWrite(HEIZUNG_PIN, LOW);
} else if (temperatur >= 20 && temperatur < 35) {
    Serial.println("Angenehm.");
} else {
    Serial.println("WARNUNG: Zu heiss!");
    digitalWrite(ALARM_PIN, HIGH);
}

// Ternärer Operator (Kurzform für einfache Bedingungen):
int led = (temperatur > 25) ? HIGH : LOW;
digitalWrite(LED_PIN, led);
```

---

## 4.3 switch / case

Wenn eine Variable mehrere **diskrete Werte** annehmen kann, ist `switch/case` übersichtlicher:

```c
int modus = 2;

switch (modus) {
    case 1:
        Serial.println("Modus 1: Langsames Blinken");
        break;   // Verlässt den switch-Block
    case 2:
        Serial.println("Modus 2: Normales Blinken");
        break;
    case 3:
        Serial.println("Modus 3: Schnelles Blinken");
        break;
    default:     // Wenn kein case zutrifft:
        Serial.println("Unbekannter Modus!");
        break;
}
```

> 💡 **Fallthrough:** Fehlendes `break` lässt die Ausführung in den nächsten `case` fallen. Kann bewusst eingesetzt werden, ist aber oft ein Bug!

---

## 4.4 for-Schleife

```c
// Grundstruktur: for (Initialisierung; Bedingung; Schrittweite)
for (int i = 0; i < 10; i++) {
    Serial.println(i);  // Gibt 0 bis 9 aus
}

// Rückwärts zählen:
for (int i = 10; i >= 0; i--) {
    Serial.print(i);
    Serial.print(" ");
}

// Alle Digital-Pins 2–13 als Ausgang konfigurieren:
for (int pin = 2; pin <= 13; pin++) {
    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
}

// LED-Helligkeit graduell steigern (PWM, Pin 9):
for (int hell = 0; hell <= 255; hell += 5) {
    analogWrite(9, hell);
    delay(20);
}

// Danach wieder dimmen:
for (int hell = 255; hell >= 0; hell -= 5) {
    analogWrite(9, hell);
    delay(20);
}
```

---

## 4.5 while-Schleife und do-while

```c
// while: Bedingung wird VOR dem Schleifendurchgang geprüft
int count = 0;
while (count < 5) {
    Serial.println(count);
    count++;
}
// → Schleife wird 0 Mal ausgeführt, wenn Bedingung von Anfang an falsch ist

// Warten, bis Taster gedrückt wird (Pin 2 mit Pull-up):
while (digitalRead(2) == HIGH) {
    // Nichts tun, warten...
}
Serial.println("Taster wurde gedrueckt!");

// do-while: Schleifenkörper wird MINDESTENS EINMAL ausgeführt
int eingabe;
do {
    eingabe = analogRead(A0);
    Serial.println(eingabe);
    delay(100);
} while (eingabe < 512);   // Wiederholen, solange Wert unter 512
Serial.println("Schwellwert erreicht!");
```

---

## 4.6 break und continue

```c
// break: Schleife sofort verlassen
for (int i = 0; i < 100; i++) {
    if (digitalRead(2) == LOW) {    // Wenn Taster gedrückt:
        Serial.println("Abgebrochen!");
        break;                       // Schleife sofort verlassen
    }
    delay(100);
}

// continue: Aktuellen Durchgang überspringen, mit nächstem fortfahren
for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) {   // Wenn gerade Zahl:
        continue;        // Rest des Schleifenkörpers überspringen
    }
    Serial.println(i);  // Nur ungerade Zahlen: 1, 3, 5, 7, 9
}
```

---

## 🏋️ Übung 4.1 – Ampel-Steuerung

**Lernziel:** Verzweigungen und Schleifen praxisnah in einem realen Steuerungsprojekt anwenden.

**Hardware:** 3 LEDs (rot, gelb, grün) mit 220-Ω-Widerständen an Pins 10, 11, 12. Taster an Pin 2 (mit `INPUT_PULLUP`).

1. Bauen Sie eine Ampel: **Rot** (5 s) → **Rot+Gelb** (1 s) → **Grün** (4 s) → **Gelb** (1 s) → **Rot**. Verwenden Sie `digitalWrite()` und `delay()`.
2. Erweitern Sie: Nach **3 vollständigen Zyklen** wechselt die Ampel in den Nacht-Modus (Gelb blinkt endlos). Verwenden Sie eine `for`-Schleife für die Zyklen und `while(true)` für den Nachtmodus.
3. **Fussgänger-Ampel:** Wenn der Taster gedrückt wird, soll nach der aktuellen Rot-Phase sofort Grün geschaltet werden. Tipp: `if (digitalRead(2) == LOW)` innerhalb der Delay-Phasen prüfen.
4. **Bonus:** Implementieren Sie einen Countdown im Serial Monitor für jede Ampelphase (von N bis 0).

---

# Modul 5: Funktionen

**Lernziele:** Die Studierenden können eigene Funktionen mit Parametern und Rückgabewerten definieren und aufrufen. Sie verstehen das DRY-Prinzip und können Code strukturieren.

---

## 5.1 Warum Funktionen?

> 💡 **DRY – Don't Repeat Yourself**  
> Wenn Sie denselben Code mehrmals schreiben müssen, ist es Zeit für eine Funktion.  
> Funktionen machen Code: **übersichtlicher, wiederverwendbar, leichter testbar** und einfacher zu warten.  
> **Faustregel:** Jede Funktion sollte **eine Aufgabe** erledigen (Single Responsibility Principle).

---

## 5.2 Funktionsdefinition und -aufruf

```c
// Syntax:
// Rueckgabetyp Funktionsname(Typ Parameter1, Typ Parameter2) { ... }

// Funktion ohne Rückgabewert (void) und ohne Parameter:
void begruessung() {
    Serial.println("Hallo!");
}

// Funktion mit Parametern:
void blinken(int anzahl, int pauseMs) {
    for (int i = 0; i < anzahl; i++) {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(pauseMs);
        digitalWrite(LED_BUILTIN, LOW);
        delay(pauseMs);
    }
}

// Funktion mit Rückgabewert:
float fahrenheitZuCelsius(float fahrenheit) {
    return (fahrenheit - 32.0) * 5.0 / 9.0;
}

// Funktion mit bool-Rückgabe:
bool istTasterGedrueckt(int pin) {
    return digitalRead(pin) == LOW;
}

// ─── Verwendung ───────────────────────────────────────────────────
void setup() {
    Serial.begin(9600);
    pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
    begruessung();           // Kein Argument nötig
    blinken(3, 200);         // 3x blinken, 200 ms Pause
    blinken(1, 1000);        // 1x blinken, 1 s Pause

    float celsius = fahrenheitZuCelsius(98.6);
    Serial.println(celsius); // 37.0

    if (istTasterGedrueckt(2)) {
        Serial.println("Gedrueckt!");
    }
}
```

---

## 5.3 Parameter: Call by Value

In C werden Parameter standardmässig als **Kopie** übergeben – das Original wird nicht verändert:

```c
void verdoppeln(int wert) {
    wert = wert * 2;        // Nur die lokale Kopie wird verdoppelt!
    Serial.println(wert);   // Gibt 20 aus
}

void setup() {
    Serial.begin(9600);
    int x = 10;
    verdoppeln(x);           // Übergibt eine Kopie von x
    Serial.println(x);       // Gibt 10 aus – x ist unverändert!
}
```

---

## 5.4 Standardwerte für Parameter (C++ Feature)

Arduino-Sketches verwenden C++, das Standardwerte für Parameter erlaubt:

```c
// Wenn kein zweites Argument übergeben wird, ist pauseMs = 500
void blinken(int anzahl, int pauseMs = 500) {
    for (int i = 0; i < anzahl; i++) {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(pauseMs);
        digitalWrite(LED_BUILTIN, LOW);
        delay(pauseMs);
    }
}

void loop() {
    blinken(3);       // pauseMs = 500 (Standardwert)
    blinken(3, 100);  // pauseMs = 100 (überschrieben)
}
```

---

## 5.5 Praktisches Beispiel: Sensorauswertung

```c
const int TEMP_PIN  = A0;
const int LED_ROT   = 8;
const int LED_GRUEN = 9;

// Einzelne Aufgabe: Temperatur lesen und umrechnen
float leseTemperatur() {
    int rohWert = analogRead(TEMP_PIN);
    float spannung = rohWert * (5.0 / 1023.0);
    return (spannung - 0.5) * 100.0;   // LM35-Formel
}

// Einzelne Aufgabe: Formatierte Ausgabe
void zeigeTemperatur(float temp) {
    Serial.print("Temperatur: ");
    Serial.print(temp, 1);             // 1 Dezimalstelle
    Serial.println(" Grad C");
}

// Einzelne Aufgabe: LED-Status setzen
void setzeStatusLED(float temp) {
    bool zuWarm = temp > 30.0;
    digitalWrite(LED_ROT,   zuWarm ? HIGH : LOW);
    digitalWrite(LED_GRUEN, zuWarm ? LOW  : HIGH);
}

void setup() {
    Serial.begin(9600);
    pinMode(LED_ROT,   OUTPUT);
    pinMode(LED_GRUEN, OUTPUT);
}

void loop() {
    float temp = leseTemperatur();  // Lesen
    zeigeTemperatur(temp);          // Ausgeben
    setzeStatusLED(temp);           // Anzeigen
    delay(1000);
}
```

---

## 🏋️ Übung 5.1 – Funktions-Bibliothek für LEDs

**Lernziel:** Eigene Funktionen schreiben und ein Projekt durch Funktionen strukturieren.

1. Schreiben Sie drei Funktionen: `alleAus(int vonPin, int bisPin)`, `alleEin(int vonPin, int bisPin)` und `toggeln(int pin)`, die mehrere LEDs steuern.
2. Erstellen Sie eine Funktion `lauflicht(int startPin, int endPin, int geschwindigkeitMs)`, die eine Lauflicht-Animation erzeugt.
3. Schreiben Sie eine Funktion `int mapWert(int wert, int vonMin, int vonMax, int zuMin, int zuMax)`, die einen Wert von einem Bereich in einen anderen umrechnet (wie die eingebaute `map()`-Funktion).
4. **Bonus:** Refaktorieren Sie Ihre Ampel aus Übung 4.1 vollständig mit Funktionen – eine Funktion pro Ampelphase und eine übergeordnete Steuerungsfunktion.

---

# Modul 6: Arrays & Strings

**Lernziele:** Die Studierenden können Arrays deklarieren und verwenden, verstehen die Array-Index-Logik und können mit Strings in C/C++ arbeiten.

---

## 6.1 Arrays – Grundlagen

Ein Array ist eine **geordnete Sammlung** von Elementen desselben Datentyps. Der Index beginnt immer bei **0**.

```c
// Deklaration und Initialisierung:
int pins[6] = {3, 5, 6, 9, 10, 11};    // 6 PWM-Pins
float temperaturen[24] = {0};            // 24 Werte, alle 0
bool zustaende[8];                       // 8 bool-Werte (undefiniert!)

// Zugriff über Index (beginnt bei 0!):
pins[0] = 3;    // Erstes Element  (Index 0)
pins[5] = 11;   // Letztes Element (Index 5, bei Grösse 6)
// pins[6] = 12; // FEHLER! Buffer Overflow – undefiniertes Verhalten

// Array-Grösse berechnen (nützlicher Trick):
int laenge = sizeof(pins) / sizeof(pins[0]);  // = 6

// Array mit for-Schleife durchlaufen:
for (int i = 0; i < laenge; i++) {
    pinMode(pins[i], OUTPUT);
    Serial.println(pins[i]);
}

// Array mit automatischer Grössenbestimmung:
int ledPins[] = {2, 3, 4, 5, 6, 7, 8};  // Compiler zählt: 7 Elemente
int anzLEDs = sizeof(ledPins) / sizeof(ledPins[0]);  // = 7

// Lauflicht-Animation:
void loop() {
    for (int i = 0; i < anzLEDs; i++) {
        digitalWrite(ledPins[i], HIGH);
        delay(100);
        digitalWrite(ledPins[i], LOW);
    }
}
```

---

## 6.2 Mehrdimensionale Arrays

```c
// 2D-Array: 3 Zeilen, 4 Spalten
int matrix[3][4] = {
    {1,  2,  3,  4},
    {5,  6,  7,  8},
    {9, 10, 11, 12}
};

// Zugriff: matrix[Zeile][Spalte]
Serial.println(matrix[1][2]);  // 7

// Anwendungsbeispiel: LED-Matrix-Animationen
// Jede Zeile ist ein Frame, jede Spalte ein LED-Status
byte animationen[3][4] = {
    {1, 0, 0, 0},   // Frame 1
    {0, 1, 0, 0},   // Frame 2
    {0, 0, 1, 0},   // Frame 3
};
```

---

## 6.3 Ring-Buffer (Kreispuffer)

Ein Ring-Buffer ermöglicht es, immer die letzten N Werte zu speichern, ohne dass das Array verschoben werden muss:

```c
const int PUFFER_GROESSE = 10;
float messwerte[PUFFER_GROESSE];
int schreibIndex = 0;
int anzahlWerte  = 0;

void neuerMesswert(float wert) {
    messwerte[schreibIndex] = wert;
    schreibIndex = (schreibIndex + 1) % PUFFER_GROESSE;  // Wraparound
    if (anzahlWerte < PUFFER_GROESSE) anzahlWerte++;
}

float berechneDurchschnitt() {
    float summe = 0;
    for (int i = 0; i < anzahlWerte; i++) {
        summe += messwerte[i];
    }
    return summe / anzahlWerte;
}
```

---

## 6.4 Strings in Arduino

Arduino bietet zwei Möglichkeiten für Zeichenketten:

```c
// ── Weg 1: char-Array (C-Stil, speichereffizient) ────────────────
char name[] = "Arduino";      // Automatisch '\0' am Ende → 8 Zeichen
char name2[20] = "Arduino";   // Fixer Buffer mit 20 Zeichen

// Länge messen (aus <string.h>, automatisch eingebunden):
int laenge = strlen(name);    // = 7 (ohne '\0')

// ── Weg 2: String-Klasse (C++-Stil, bequemer) ────────────────────
String nachricht = "Hallo ";
String voll = nachricht + "Welt!";   // Verkettung mit +
Serial.println(voll);                 // "Hallo Welt!"

String text = "Temperatur: 22.5 C";
Serial.println(text.length());        // 18
Serial.println(text.toUpperCase());   // "TEMPERATUR: 22.5 C"
Serial.println(text.indexOf(":"));    // 11 (Position des ':')
Serial.println(text.substring(13));   // "22.5 C"

// Zahl zu String:
float temp = 23.7;
String ausgabe = "Temp: " + String(temp, 1) + " Grad";
Serial.println(ausgabe);              // "Temp: 23.7 Grad"
```

> ⚠️ **Speicher-Warnung:** Die `String`-Klasse kann auf kleinen Arduinos (Uno: 2 KB RAM) zu Heap-Fragmentierung führen!  
> Für fixe Texte: `Serial.println(F("Fixtext"))` – das `F()`-Makro speichert den String im Flash-Speicher statt im RAM.

---

## 🏋️ Übung 6.1 – Temperatur-Datenlogger

**Lernziel:** Arrays sinnvoll für Datensammlung einsetzen, eigene Analyse-Funktionen schreiben.

1. Erstellen Sie ein `float`-Array für 10 Temperaturmessungen. Befüllen Sie es mit Dummy-Werten (z. B. 20.0, 21.5, 23.0, ...) und geben Sie alle Werte aus.
2. Schreiben Sie Funktionen: `float durchschnitt(float arr[], int n)`, `float minimum(float arr[], int n)`, `float maximum(float arr[], int n)`.
3. Simulieren Sie einen echten Datenlogger: Lesen Sie alle 5 Sekunden einen Wert von A0 ein, speichern Sie die letzten 10 Werte in einem Ring-Buffer und geben Sie nach jeder Messung Min/Max/Durchschnitt aus.
4. **Bonus:** Stellen Sie die gespeicherten Werte als einfaches ASCII-Balkendiagramm im Serial Monitor dar (z. B. ein `*` für je 10 Grad).

---

# Modul 7: Zeiger & Speicher

**Lernziele:** Die Studierenden verstehen das Konzept von Zeigern (Pointer), können Arrays an Funktionen übergeben und kennen die Grundlagen der Speicherverwaltung in C.

---

## 7.1 Adressen und Zeiger

Jede Variable belegt Speicherplatz. Die **Adresse** dieses Speicherplatzes kann als Zeiger gespeichert werden:

```c
int x = 42;

// & = Adress-Operator:  gibt die Adresse einer Variable
// * = Dereferenzierung: Zeiger deklarieren / Wert an Adresse lesen

int *zeiger = &x;          // zeiger enthält die Speicheradresse von x

Serial.println(x);         // 42  (Wert von x)
Serial.println(*zeiger);   // 42  (Wert an der Adresse, auf die zeiger zeigt)

// Über den Zeiger den Wert verändern:
*zeiger = 99;
Serial.println(x);         // 99! – x wurde über den Zeiger verändert
```

---

## 7.2 Call by Reference – Arrays an Funktionen

Arrays werden in C **immer als Zeiger** übergeben – Änderungen in der Funktion wirken auf das Original:

```c
// Funktion empfängt Zeiger auf das erste Array-Element
void alleVerdoppeln(int arr[], int laenge) {
    for (int i = 0; i < laenge; i++) {
        arr[i] = arr[i] * 2;  // Verändert das ORIGINAL-Array!
    }
}

// Mehrere Ausgabewerte über Zeiger-Parameter:
void minMax(int arr[], int laenge, int *minWert, int *maxWert) {
    *minWert = arr[0];
    *maxWert = arr[0];
    for (int i = 1; i < laenge; i++) {
        if (arr[i] < *minWert) *minWert = arr[i];
        if (arr[i] > *maxWert) *maxWert = arr[i];
    }
}

void setup() {
    Serial.begin(9600);
    int werte[] = {5, 3, 8, 1, 9, 2};
    int n = 6;

    int klein, gross;
    minMax(werte, n, &klein, &gross);   // Adressen übergeben mit &
    Serial.print("Min: "); Serial.println(klein);  // 1
    Serial.print("Max: "); Serial.println(gross);  // 9

    alleVerdoppeln(werte, n);
    for (int i = 0; i < n; i++) {
        Serial.println(werte[i]);       // 10, 6, 16, 2, 18, 4
    }
}
```

---

## 7.3 Referenzen (C++ Feature)

Arduino-C++ bietet Referenzen als einfachere Alternative zu Zeigern:

```c
// Referenz: Alias für eine bestehende Variable
void tauschen(int &a, int &b) {   // & = Referenz-Parameter
    int temp = a;
    a = b;
    b = temp;
    // Keine Dereferenzierung (*) nötig!
}

void setup() {
    Serial.begin(9600);
    int x = 10, y = 20;
    tauschen(x, y);       // Normale Übergabe – keine & beim Aufruf nötig
    Serial.println(x);    // 20
    Serial.println(y);    // 10
}
```

---

## 7.4 Häufige Zeiger-Fehler

> ⚠️ **Zeiger-Fallen in C**
> 
> | Fehler | Beschreibung | Lösung |
> |---|---|---|
> | Null-Zeiger | `int *p = NULL;` → `*p` verwenden → Absturz! | `if (p != NULL)` prüfen |
> | Uninitialisierter Zeiger | `int *p;` → undefinierte Adresse! | Immer initialisieren |
> | Array-Überlauf | `arr[6]` bei `int arr[6]` → Buffer Overflow | Grenzen immer prüfen |
> | Dangling Pointer | Zeiger auf Variable, die nicht mehr existiert | Scope beachten |

---

## 🏋️ Übung 7.1 – Zeiger und Funktionen

**Lernziel:** Zeiger verstehen und für Funktionen mit mehreren Ausgabewerten nutzen.

1. Schreiben Sie eine Funktion `void tauschen(int *a, int *b)` (Zeiger-Version), die zwei Variablen vertauscht. Testen Sie: `int x = 10; int y = 20; tauschen(&x, &y);`
2. Implementieren Sie `void sortierenBubble(int arr[], int n)` mit dem Bubble-Sort-Algorithmus. Testen Sie mit einem unsortierten Array und geben Sie Vorher/Nachher im Serial Monitor aus.
3. Schreiben Sie `void statistik(float arr[], int n, float *minVal, float *maxVal, float *avg)`, die Min, Max und Durchschnitt in einem einzigen Funktionsaufruf berechnet.
4. **Bonus:** Implementieren Sie eine Funktion `int suchen(int arr[], int n, int ziel)`, die Binary Search auf einem sortierten Array ausführt und den Index zurückgibt (-1 wenn nicht gefunden).

---

# Modul 8: Strukturen & Modularisierung

**Lernziele:** Die Studierenden können `struct` verwenden, um zusammengehörige Daten zu gruppieren, und kennen die Grundlagen der Code-Aufteilung in mehrere Dateien.

---

## 8.1 Strukturen (struct)

Eine Struktur fasst mehrere Variablen unter einem Namen zusammen:

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

## 8.2 Array von Strukturen

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

## 8.3 Mehrere Dateien in der Arduino IDE

Grössere Projekte werden in mehrere Dateien aufgeteilt. In der Arduino IDE fügt man über den **`+`-Button** neben den Tabs neue Dateien hinzu.

> 💡 **Empfohlene Projektstruktur:**
> ```
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

## 🏋️ Übung 8.1 – Strukturierte Wetterstation

**Lernziel:** Structs für Datenmodellierung nutzen, Code in mehrere Dateien aufteilen.

1. Definieren Sie eine Struktur `MessStation` mit: `name` (String), `tempPin` (int), `lichtPin` (int), `letzteTemp` (float), `letztesLicht` (int). Erstellen Sie zwei Instanzen für „Drinnen" und „Draussen".
2. Schreiben Sie Funktionen `void aktualisieren(MessStation &s)` und `void ausgeben(MessStation s)`, die Messwerte einlesen bzw. ausgeben.
3. Lagern Sie die Struktur und die Funktionen in eine eigene Header-Datei `sensoren.h` und Implementierungsdatei `sensoren.cpp` aus.
4. **Bonus:** Erweitern Sie `MessStation` um `float letzte10Temps[10]` und `int ringIndex`, um einen gleitenden Durchschnitt zu berechnen.

---

# Modul 9: Hardware-Programmierung mit Arduino

**Lernziele:** Die Studierenden können digitale und analoge Pins verwenden, PWM-Signale erzeugen, Interrupts nutzen und externe Bibliotheken einbinden.

---

## 9.1 Digitale Ein- und Ausgaben

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

## 9.2 Analoge Ein- und Ausgaben (PWM)

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

## 9.3 millis() statt delay() – Non-Blocking Pattern

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

## 9.4 Interrupts – Zeitkritische Ereignisse

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
> - Kein `delay()` in der ISR
> - Kein `Serial.print()` in der ISR
> - Alle von der ISR veränderten Variablen müssen `volatile` sein
> - ISR so kurz wie möglich halten

---

## 9.5 Externe Bibliotheken einbinden

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

    delay(2000);  // DHT22 braucht mindestens 2 s zwischen Messungen
}
```

---

## 🏋️ Übung 9.1 – Reaktionsmesser

**Lernziel:** Digitale I/O, `millis()` für Zeitmessung, Interrupts und Bibliotheken kombinieren.

**Hardware:** LED (Pin 13), Taster (Pin 2, `INPUT_PULLUP`), Summer/Buzzer (Pin 8).

1. Bauen Sie einen Reaktionsmesser: Die LED leuchtet nach einer zufälligen Wartezeit (`randomSeed(analogRead(A5))` + `random(2000, 5000)` ms) auf. Messen Sie mit `millis()`, wie schnell der Spieler den Taster drückt.
2. Geben Sie die Reaktionszeit aus und speichern Sie den bisherigen Rekord (schnellste Reaktion).
3. Erweitern Sie um Interrupt: Der Taster (Pin 2) soll per `attachInterrupt()` mit `FALLING` registriert werden, damit keine Reaktion verloren geht.
4. **Bonus:** Summer-Feedback mit `tone(8, 1000, 200)` wenn die LED aufleuchtet, langer Beep bei neuem Rekord. Disqualifikation (Ton + Ausgabe) wenn Taster vor der LED gedrückt wird.

---

# Modul 10: Abschlussprojekt – Autonome Wetterstation

Das Abschlussprojekt fasst **alle Konzepte des Lehrgangs** zusammen. Die Studierenden entwickeln selbstständig eine vollständige, strukturierte Anwendung.

---

## 10.1 Projektbeschreibung

> **Projekt: Autonome Wetterstation mit Alarmfunktion**
>
> Eine Wetterstation liest kontinuierlich Umgebungswerte ein, speichert die letzten Messungen,
> berechnet Statistiken und gibt Warnmeldungen aus, wenn Grenzwerte überschritten werden.
>
> **Hardware:** Arduino Uno, LDR-Sensor, Potentiometer (simuliert Temp/Feuchte), 3 LEDs, 1 Taster, 1 Summer  
> **Software:** Alle Konzepte aus Modulen 1–9

---

## 10.2 Anforderungen

### Pflichtanforderungen

1. **Sensoren lesen:** Temperatur (A0), Lichtstärke (A1), Luftfeuchtigkeit (A2) alle 5 Sekunden
2. **Daten speichern:** Die letzten 12 Messungen (simuliert 1 Stunde) in Arrays speichern
3. **Statistik:** Minimum, Maximum, Durchschnitt für alle drei Sensorwerte berechnen
4. **LED-Anzeige:** Grün = alles OK, Gelb = Warnung, Rot = Alarm
5. **Alarm:** Bei Überschreitung von Grenzwerten Summer aktivieren (per Interrupt unterdrückbar)
6. **Serial-Ausgabe:** Alle Werte und Statistiken übersichtlich ausgeben
7. **Modularisierung:** Mindestens 3 separate Dateien (`.h` und `.cpp`)

### Erweiterungsanforderungen (Bonus)

1. **Kalibrierung:** Grenzwerte über Taster und Potentiometer einstellbar
2. **Trendanalyse:** Steigende/fallende Tendenz erkennen und melden
3. **Non-Blocking:** Alle Zeitsteuerungen mit `millis()` (kein `delay()`)
4. **EEPROM:** Rekordwerte permanent speichern (`#include <EEPROM.h>`)

---

## 10.3 Empfohlene Projektstruktur

```
Wetterstation/
├── Wetterstation.ino    ← Hauptdatei (nur setup + loop)
├── config.h             ← Alle Konstanten und Strukturdefinitionen
├── sensoren.h           ← Sensor-Funktionsdeklarationen
├── sensoren.cpp         ← Sensor-Implementierungen
├── alarm.h              ← Alarm-Funktionsdeklarationen
├── alarm.cpp            ← Alarm-Implementierungen
├── statistik.h          ← Statistik-Funktionen
└── statistik.cpp        ← Statistik-Implementierungen
```

---

## 10.4 Gerüst-Code

### config.h

```c
#ifndef CONFIG_H
#define CONFIG_H

// ── Pin-Definitionen ─────────────────────────────────────────────
#define PIN_TEMP      A0
#define PIN_LICHT     A1
#define PIN_FEUCHTE   A2
#define PIN_TASTER    2    // Interrupt-fähig (Uno: Pin 2 und 3)
#define PIN_LED_ROT   10
#define PIN_LED_GELB  11
#define PIN_LED_GRUEN 12
#define PIN_SUMMER    9

// ── Einstellungen ────────────────────────────────────────────────
#define MESS_INTERVALL_MS  5000
#define MAX_MESSUNGEN      12

// ── Grenzwerte ───────────────────────────────────────────────────
#define TEMP_WARN   30.0f
#define TEMP_ALARM  40.0f
#define LICHT_MIN   100
#define FEUCHTE_MAX 80.0f

// ── Datenstrukturen ──────────────────────────────────────────────
struct Messung {
    float        temperatur;
    int          licht;
    float        luftfeuchte;
    unsigned long zeitstempel;
};

struct Statistik {
    float minTemp;   float maxTemp;   float avgTemp;
    int   minLicht;  int   maxLicht;  float avgLicht;
    float minFeucht; float maxFeucht; float avgFeucht;
};

#endif
```

### sensoren.h

```c
#ifndef SENSOREN_H
#define SENSOREN_H

#include "config.h"

void    allesPinsModeSetzen();
Messung aktuelleMessungEinlesen();
void    messungAusgeben(Messung m);

#endif
```

### sensoren.cpp

```c
#include "sensoren.h"
#include <Arduino.h>

void allesPinsModeSetzen() {
    pinMode(PIN_LED_ROT,   OUTPUT);
    pinMode(PIN_LED_GELB,  OUTPUT);
    pinMode(PIN_LED_GRUEN, OUTPUT);
    pinMode(PIN_SUMMER,    OUTPUT);
    pinMode(PIN_TASTER,    INPUT_PULLUP);
}

Messung aktuelleMessungEinlesen() {
    Messung m;
    m.zeitstempel = millis();

    // Temperatur: LM35 → 10 mV/°C
    int rohTemp = analogRead(PIN_TEMP);
    float spTemp = rohTemp * (5.0f / 1023.0f);
    m.temperatur = spTemp * 100.0f;

    // Licht: LDR (0 = dunkel, 1023 = hell)
    m.licht = analogRead(PIN_LICHT);

    // Luftfeuchtigkeit: Potentiometer als Simulator (0–100 %)
    m.luftfeuchte = analogRead(PIN_FEUCHTE) * (100.0f / 1023.0f);

    return m;
}

void messungAusgeben(Messung m) {
    Serial.println("─────────────────────────────────");
    Serial.print("Zeit:        "); Serial.print(m.zeitstempel / 1000); Serial.println(" s");
    Serial.print("Temperatur:  "); Serial.print(m.temperatur, 1); Serial.println(" °C");
    Serial.print("Licht:       "); Serial.println(m.licht);
    Serial.print("Luftfeuchte: "); Serial.print(m.luftfeuchte, 1); Serial.println(" %");
}
```

### statistik.h

```c
#ifndef STATISTIK_H
#define STATISTIK_H

#include "config.h"

Statistik berechneStatistik(Messung verlauf[], int anzahl);
void       statistikAusgeben(Statistik s);

#endif
```

### alarm.h

```c
#ifndef ALARM_H
#define ALARM_H

#include "config.h"

void alarmPruefenUndSetzen(Messung m, bool unterdrückt);
void alarmISR();          // Interrupt Service Routine

#endif
```

### Wetterstation.ino (Hauptdatei)

```c
#include "config.h"
#include "sensoren.h"
#include "statistik.h"
#include "alarm.h"

// ── Globale Variablen ────────────────────────────────────────────
Messung verlauf[MAX_MESSUNGEN];
int     ringIndex     = 0;
int     anzahlGesamt  = 0;

volatile bool alarmUnterdrückt = false;

// ── Interrupt Service Routine ────────────────────────────────────
void alarmISR() {
    // Wird von alarm.cpp implementiert, hier nur registriert
    alarmUnterdrückt = !alarmUnterdrückt;
}

// ── Setup ────────────────────────────────────────────────────────
void setup() {
    Serial.begin(9600);
    allesPinsModeSetzen();
    attachInterrupt(digitalPinToInterrupt(PIN_TASTER), alarmISR, FALLING);
    Serial.println("=== Wetterstation gestartet ===");
}

// ── Hauptschleife ────────────────────────────────────────────────
void loop() {
    static unsigned long letzteMessung = 0;

    if (millis() - letzteMessung >= MESS_INTERVALL_MS) {
        letzteMessung = millis();

        // 1. Messen
        Messung m = aktuelleMessungEinlesen();

        // 2. Im Ring-Buffer speichern
        verlauf[ringIndex] = m;
        ringIndex = (ringIndex + 1) % MAX_MESSUNGEN;
        if (anzahlGesamt < MAX_MESSUNGEN) anzahlGesamt++;

        // 3. Ausgeben
        messungAusgeben(m);

        // 4. Statistik berechnen und ausgeben
        Statistik s = berechneStatistik(verlauf, anzahlGesamt);
        statistikAusgeben(s);

        // 5. Alarm prüfen
        alarmPruefenUndSetzen(m, alarmUnterdrückt);
    }
}
```

---

## 10.5 Bewertungskriterien

| Kriterium                                                   | Punkte  |
| ----------------------------------------------------------- | ------- |
| Funktionalität: Alle Pflichtanforderungen erfüllt           | 40      |
| Code-Qualität: Lesbarkeit, Kommentare, Benennung            | 20      |
| Modularisierung: Sinnvolle Aufteilung in Dateien/Funktionen | 20      |
| Fehlerbehandlung: Sensor-Fehler erkannt und behandelt       | 10      |
| Erweiterungen: Bonus-Anforderungen umgesetzt                | 10      |
| **Total**                                                   | **100** |

---

## 🏋️ Übung 10.1 – Abschlussprojekt Wetterstation

**Lernziel:** Alle Konzepte des Lehrgangs in einem vollständigen, gut strukturierten Programm anwenden.

1. Erstellen Sie das Projektgerüst mit allen beschriebenen Dateien. Definieren Sie alle Strukturen in `config.h`.
2. Implementieren Sie zuerst die Sensor-Funktionen und testen Sie sie einzeln im Serial Monitor.
3. Fügen Sie schrittweise Statistik und Alarm hinzu. Testen Sie nach **jedem Schritt**.
4. Refaktorieren Sie Ihren Code: Gibt es duplizierten Code? Können Funktionen extrahiert werden? Sind alle Variablennamen aussagekräftig?
5. Schreiben Sie eine Dokumentation: Kommentare im Code + kurzes README im ersten Tab (Was macht die Station? Welche Hardware wird benötigt? Wie wird sie bedient?).

---

# Anhang A: Arduino Quick Reference

## A.1 Häufig genutzte Arduino-Funktionen

| Funktion                         | Beschreibung                                                |
| -------------------------------- | ----------------------------------------------------------- |
| `pinMode(pin, MODUS)`            | Pin als `INPUT`, `OUTPUT` oder `INPUT_PULLUP` konfigurieren |
| `digitalWrite(pin, WERT)`        | Digitalen Pin auf `HIGH` oder `LOW` setzen                  |
| `digitalRead(pin)`               | Digitalen Pin lesen → `HIGH` oder `LOW`                     |
| `analogRead(pin)`                | Analogen Pin lesen → 0–1023 (10-Bit ADC)                    |
| `analogWrite(pin, wert)`         | PWM ausgeben → 0–255 (nur Pins 3, 5, 6, 9, 10, 11)          |
| `delay(ms)`                      | Programm für X Millisekunden anhalten (blockierend!)        |
| `millis()`                       | Millisekunden seit Programmstart (`unsigned long`)          |
| `micros()`                       | Mikrosekunden seit Programmstart                            |
| `map(w, vMin, vMax, zMin, zMax)` | Wert von einem Bereich in einen anderen umrechnen           |
| `constrain(wert, min, max)`      | Wert auf Bereich `min..max` begrenzen                       |
| `random(max)`                    | Zufallszahl von 0 bis `max-1`                               |
| `randomSeed(wert)`               | Zufallsgenerator initialisieren                             |
| `tone(pin, freq, dauer)`         | Ton auf Buzzer ausgeben                                     |
| `noTone(pin)`                    | Ton stoppen                                                 |
| `attachInterrupt(n, isr, modus)` | Interrupt registrieren                                      |
| `Serial.begin(baud)`             | Serielle Kommunikation starten                              |
| `Serial.print(wert)`             | Wert ausgeben (ohne Zeilenumbruch)                          |
| `Serial.println(wert)`           | Wert ausgeben (mit Zeilenumbruch)                           |
| `Serial.print(wert, n)`          | Zahl mit `n` Dezimalstellen ausgeben                        |

---

## A.2 Häufige Fehler und Lösungen

| Fehler / Problem                       | Ursache und Lösung                                                                  |
| -------------------------------------- | ----------------------------------------------------------------------------------- |
| `'xyz' was not declared in this scope` | Variable/Funktion nicht deklariert oder falsch geschrieben (case-sensitive!)        |
| `expected ';' before '}'`              | Fehlende Semikolon in der Zeile **davor**                                           |
| LED reagiert nicht                     | Vorwiderstand (220 Ω) prüfen, Pin-Nummer prüfen, Anode (+) und Kathode (−) richtig? |
| Wert springt/ist unruhig               | `analogRead` ohne Filterung → Mittelwert über mehrere Messungen berechnen           |
| Programm hängt                         | `delay()` blockiert alles → `millis()`-Pattern verwenden                            |
| Overflow: zu grosser Wert              | `int` reicht nicht → `long` oder `unsigned long` verwenden                          |
| Serial Monitor leer                    | `Serial.begin()` vergessen oder falsche Baudrate eingestellt                        |
| `avrdude: stk500: Port nicht gefunden` | Falscher COM-Port oder USB-Treiber fehlt → Geräte-Manager prüfen                    |
| ISR wird nicht aufgerufen              | `volatile` vergessen oder falscher Interrupt-Pin (Uno: nur Pin 2 und 3)             |

---

## A.3 Operatoren-Übersicht

| Operator          | Beschreibung                  | Beispiel                                    |
| ----------------- | ----------------------------- | ------------------------------------------- |
| `+ - * /`         | Grundrechenarten              | `int x = 10 / 3;` → `3` (Ganzzahldivision!) |
| `%`               | Modulo (Rest der Division)    | `10 % 3` → `1`                              |
| `++ --`           | Inkrement / Dekrement         | `i++;`  `i--;`                              |
| `+= -= *= /=`     | Zuweisung mit Operation       | `x += 5;` → `x = x + 5`                     |
| `== != < > <= >=` | Vergleiche (Ergebnis: `bool`) | `if (x >= 10)`                              |
| `&& \|\| !`       | Logisches UND, ODER, NICHT    | `if (a && !b)`                              |
| `& \| ^ ~`        | Bitweise AND, OR, XOR, NOT    | `0b1010 & 0b1100` → `0b1000`                |
| `<< >>`           | Bit-Shift                     | `1 << 3` → `8` (= 2³)                       |
| `? :`             | Ternärer Operator             | `int m = (a > b) ? a : b;`                  |

---

## A.4 Nützliche Präprozessor-Direktiven

```c
#include <Bibliothek.h>    // Systembibliothek einbinden
#include "eigene_datei.h"  // Eigene Datei einbinden

#define NAME wert           // Makro/Konstante definieren

#ifndef DATEI_H             // Include Guard: wenn NICHT definiert
#define DATEI_H
// ... Inhalt der Header-Datei ...
#endif

#ifdef DEBUG                // Nur compilieren, wenn DEBUG definiert
    Serial.println("Debug-Info");
#endif
```

---

# Anhang B: Schaltpläne und Hardware

## B.1 LED mit Vorwiderstand

```
Arduino Pin ──[R]──(LED+)──(LED−)── GND

Berechnung Vorwiderstand:
  R = (Ub − Uf) / If
  R = (5 V − 2 V) / 0.02 A = 150 Ω  →  220 Ω nehmen (nächster Standardwert)

  Ub = Betriebsspannung (5 V beim Arduino Uno)
  Uf = Vorwärtsspannung: rot/gelb/grün ≈ 2 V | blau/weiss ≈ 3.3 V
  If = LED-Strom: typisch 10–20 mA (= 0.01–0.02 A)
```

## B.2 Taster

```
Interner Pull-up (empfohlen – kein externer Widerstand nötig):
  Arduino Pin 2 ──[Taster]── GND
  Code: pinMode(2, INPUT_PULLUP);
        if (digitalRead(2) == LOW) { /* gedrückt */ }

Externer Pull-down (Taster = HIGH wenn gedrückt):
  5V ──[Taster]── Arduino Pin ──[10 kΩ]── GND
  Code: pinMode(2, INPUT);
        if (digitalRead(2) == HIGH) { /* gedrückt */ }
```

## B.3 Potentiometer

```
  5V ──[linkes Bein]──[Schleifer]──[rechtes Bein]── GND
                           │
                     Arduino A0

  analogRead(A0): 0 (GND) bis 1023 (5V)
  Spannung: float v = analogRead(A0) * (5.0 / 1023.0);
```

## B.4 Buzzer / Summer

```
Aktiver Buzzer (hat eingebauten Oszillator, tönt bei HIGH):
  Arduino Pin ──[Buzzer+]──[Buzzer−]── GND
  Code: digitalWrite(PIN_SUMMER, HIGH);  // An
        digitalWrite(PIN_SUMMER, LOW);   // Aus

Passiver Buzzer (braucht PWM-Signal, flexiblere Töne):
  Arduino PWM-Pin ──[Buzzer+]──[Buzzer−]── GND
  Code: tone(PIN_SUMMER, 440, 500);  // 440 Hz, 500 ms
        noTone(PIN_SUMMER);
```

---

## B.5 Einkaufsliste für den Lehrgang

| Komponente                      | Menge           | Hinweis                         |
| ------------------------------- | --------------- | ------------------------------- |
| Arduino Uno R3                  | 1× / Student    | Original oder kompatibles Board |
| USB-Kabel Typ B                 | 1× / Student    | Drucker-USB                     |
| Steckbrett (Breadboard)         | 1× / Student    | Mindestens 400 Punkte           |
| Jumperkabel-Set (M-M)           | 1× / Student    | Mindestens 40 Stück             |
| LEDs sortiert (rot, gelb, grün) | je 5× / Student |                                 |
| Widerstände 220 Ω               | 20× / Student   | Für LEDs                        |
| Widerstände 10 kΩ               | 10× / Student   | Für Taster, Pull-down           |
| Taster (Drucktaster)            | 3× / Student    |                                 |
| Potentiometer 10 kΩ             | 2× / Student    |                                 |
| Piezo-Summer                    | 1× / Student    | Aktiv oder passiv               |
| LDR (Fotowiderstand)            | 2× / Student    |                                 |
| DHT22 Sensor                    | 1× / Student    | Für Abschlussprojekt            |

---

*Ende des Unterrichtsmaterials – HF Lehrgang C-Programmierung mit Arduino*
