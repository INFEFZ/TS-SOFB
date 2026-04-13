|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Variablen \& Datentypen](#1-variablen--datentypen)
  - [1.1. Was ist eine Variable?](#11-was-ist-eine-variable)
  - [1.2. Datentypen im Überblick](#12-datentypen-im-überblick)
  - [1.3. Konstanten](#13-konstanten)
  - [1.4. Variablen-Scope (Geltungsbereich)](#14-variablen-scope-geltungsbereich)
  - [1.5. Typumwandlung (Casting)](#15-typumwandlung-casting)
    - [1.5.1. Automatische Typkonversion (Implizite Typkonversion)](#151-automatische-typkonversion-implizite-typkonversion)
    - [1.5.2. Explizite Typkonversion (Casting)](#152-explizite-typkonversion-casting)
    - [1.5.3. Zusammenfassung](#153-zusammenfassung)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Datentypen und Variablen](#21-datentypen-und-variablen)

---

# 1. Variablen & Datentypen

**Lernziele:** Die Studierenden kennen die wichtigsten Datentypen in C, können Variablen deklarieren und initialisieren, und verstehen Scope und Konstanten.

---

## 1.1. Was ist eine Variable?

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

## 1.2. Datentypen im Überblick

| **Datentyp**       | **Grösse** | **Wertebereich**        | **Verwendung**             |
| ------------------ | ---------- | ----------------------- | -------------------------- |
| `bool`             | 1 Byte     | `true` oder `false`     | Zustände, Flags            |
| `byte` / `uint8_t` | 1 Byte     | 0 bis 255               | Bytes, Farbwerte           |
| `char`             | 1 Byte     | -128 bis 127            | Einzelne Zeichen: `'A'`    |
| `int`              | 2 Byte     | -32'768 bis 32'767      | Standardzahlen             |
| `unsigned int`     | 2 Byte     | 0 bis 65'535            | Positive Zahlen            |
| `long`             | 4 Byte     | -2.1 Mrd bis +2.1 Mrd   | Grosse Zahlen              |
| `unsigned long`    | 4 Byte     | 0 bis 4.29 Mrd          | `millis()`, Zeitwerte!     |
| `float`            | 4 Byte     | ca. 6–7 Dezimalstellen  | Kommazahlen                |
| `double`           | 4 Byte     | wie `float` auf Arduino | (kein Vorteil auf Uno)     |
| `String`           | variabel   | Zeichenketten           | Texte (sparsam verwenden!) |

> ⚠️ **Overflow-Gefahr!** Wenn ein Wert den Wertebereich überschreitet, „wrapt" er um:
>
> ```c
> byte b = 255;  b++;  // b ist jetzt 0, nicht 256!
> int i = 32767; i++;  // i ist jetzt -32768
> ```
>
> **Lösung:** Den richtigen Datentyp wählen oder auf `long` / `unsigned long` ausweichen.

---

## 1.3. Konstanten

Werte, die sich **nicht ändern** sollen, werden als Konstanten definiert:

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

## 1.4. Variablen-Scope (Geltungsbereich)

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

**Faustregel:** Variablen **so lokal wie möglich** deklarieren. Globale Variablen nur verwenden, wenn wirklich nötig (z.B. für Interrupt-Service-Routinen mit `volatile`).

---

## 1.5. Typumwandlung (Casting)

### 1.5.1. Automatische Typkonversion (Implizite Typkonversion)

**Automatische Typkonversion** (auch type promotion genannt) tritt auf, wenn der Compiler **einen kleineren Datentyp in einen grösseren Datentyp konvertiert**, ohne dass der Programmierer dies explizit anweist. Diese Konversionen passieren oft innerhalb von Ausdrücken, um mit unterschiedlichen Datentypen zu arbeiten.

```c
#include <LibPrintf.h>

void setup() {
    int a = 5;
    double b = 2.3;
    
    // Hier wird `a` automatisch in `double` konvertiert
    double result = a + b;
    
    printf("Result: %f\n", result);  // Ausgabe: Result: 7.300000
    return 0;
}
```

- In diesem Beispiel wird die Ganzzahl `a` automatisch in `double` konvertiert, bevor die Addition durchgeführt wird.
- Dies passiert, weil `b` vom Typ `double` ist und der Compiler sicherstellen möchte, dass **beide Operanden denselben Datentyp haben**, um eine genaue Berechnung durchzuführen.

**Wann wird die automatische Typkonversion ausgeführt:**

- Ganzzahlen (int, short, long) werden zu Gleitkommazahlen (float, double) konvertiert.
- char wird automatisch zu int konvertiert.
- kleinere Ganzzahlen zu grösseren Ganzzahlen.

### 1.5.2. Explizite Typkonversion (Casting)

- Explizite Typkonversion, auch als type **casting** bekannt, ist eine manuelle Umwandlung eines Datentyps in einen anderen.
- Dies erfolgt durch den Einsatz eines Cast-Operators. Der Cast-Operator wird in Klammern vor dem Zieltyp geschrieben.

```c
#include <LibPrintf.h>

void setup() {
    double a = 5.6;
    int b;
    
    // Explizite Typkonversion von double zu int
    b = (int)a;
    
    printf("a: %f, b: %d\n", a, b);  // Ausgabe: a: 5.600000, b: 5
    return 0;
}
```

- In diesem Beispiel wird der double-Wert von `a` explizit in einen `int`-Wert konvertiert.
- Dabei wird der **Dezimalteil abgeschnitten**, sodass nur der ganzzahlige Wert 5 übrig bleibt.

> **Wichtig**
>
> - Bei der Konversion von Gleitkommawerten in Ganzzahlen werden die Dezimalstellen **abgeschnitten** (keine Rundung).
> - Bei der Konversion von `int` zu `char` oder `float` zu int kann es zu **Datenverlust** kommen, wenn der Zieltyp **nicht gross genug ist**, um den Wert zu speichern.

**Beispiele zu Typenumwandlungen:**

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

### 1.5.3. Zusammenfassung

- **Datenverlust**
  - Bei der Konversion von grösseren Datentypen zu kleineren kann es zu einem Verlust von Daten kommen, wenn der Zieltyp nicht genügend Platz für die Originaldaten hat.
  - Beispiel: `long` zu `short` oder `double` zu `int` kann zu unerwarteten Ergebnissen führen.
- **Überlauf**
  - Wenn die konvertierten Daten den Bereich des Zieltyps überschreiten (z. B. ein sehr grosser `long` wird in einen `int` konvertiert), kann es zu einem Überlauf kommen.
- **Präzisionsverlust**
  - Bei der Konversion von `float` oder double zu `int` oder bei der Konversion von double zu `float` kann es zu Präzisionsverlust kommen, da Gleitkommazahlen auf eine kleinere Genauigkeit gerundet werden.

---

</br>

# 2. Aufgaben

## 2.1. Datentypen und Variablen

| **Vorgabe**         | **Beschreibung**                                        |
| :------------------ | :------------------------------------------------------ |
| **Lernziele**       | Kennen die Regeln zu korrekten Benennung der Bezeichner |
|                     | Kennen die Literale für Zahlen, Zeichen, und Strings    |
|                     | Können Variablen und Konstanten korrekt deklarieren     |
| **Sozialform**      | Einzelarbeit                                            |
| **Auftrag**         | siehe unten                                             |
| **Hilfsmittel**     |                                                         |
| **Zeitbedarf**      | 20min                                                   |
| **Lösungselemente** |                                                         |

**Lernziel:** Variablen deklarieren, Datentypen korrekt auswählen, Scope und Casting verstehen.

1. **Deklarieren Sie Variablen für:** Ihren Namen (`String`), Ihr Alter (`int`), Ihre Körpergrösse (`float`), ob Sie Kaffee mögen (`bool`).
   1. Geben Sie alle Werte im Serial Monitor aus.
2. **Berechnen Sie:** Ein LED-Streifen hat 60 LEDs/Meter und ist 2.4 m lang.
   1. Wie viele LEDs insgesamt? Welcher Datentyp ist geeignet? Achten Sie auf die Typen bei der Multiplikation.
3. **Erstellen Sie Konstanten** für PIN-Nummern (LED: 13, Taster: 2, Buzzer: 8) und verwenden Sie diese in `setup()` für `pinMode()`.
4. **Bonus:** Was passiert, wenn Sie einen `byte` mit dem Wert `255` deklarieren und dann `++` anwenden?
   1. Testen Sie es und erklären Sie das Ergebnis.

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
