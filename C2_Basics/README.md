|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Grundlagen der C-Programmierung](#1-grundlagen-der-c-programmierung)
  - [1.1. Lexikalische Konventionen der Programmiersprache C](#11-lexikalische-konventionen-der-programmiersprache-c)
    - [1.1.1. Bezeichner (Identifiers)](#111-bezeichner-identifiers)
    - [1.1.2. Schlüsselwörter (Keywords)](#112-schlüsselwörter-keywords)
    - [1.1.3. Operatoren (Operators)](#113-operatoren-operators)
    - [1.1.4. Literals](#114-literals)
    - [1.1.5. Kommentare](#115-kommentare)
    - [1.1.6. Whitespace (Leerzeichen, Tabulatoren, Zeilenumbrüche)](#116-whitespace-leerzeichen-tabulatoren-zeilenumbrüche)
    - [1.1.7. Sonderzeichen](#117-sonderzeichen)
    - [1.1.8. Klammern (`()`, `{}`, `[]`)](#118-klammern---)
- [2. Struktur eines C/Arduino-Programms](#2-struktur-eines-carduino-programms)
  - [2.1. Syntax-Grundregeln](#21-syntax-grundregeln)
  - [2.2. Der Serial Monitor](#22-der-serial-monitor)
- [3. Aufgaben](#3-aufgaben)
  - [3.1. Aufgabe Literale](#31-aufgabe-literale)
  - [3.2. Aufgabe Serial Monitor](#32-aufgabe-serial-monitor)

---

# 1. Grundlagen der C-Programmierung

**Lernziele:** Die Studierenden verstehen die **Struktur eines C-Programms**, kennen die **Syntax-Grundregeln** und können den Serial Monitor für Ausgaben nutzen.

---

## 1.1. Lexikalische Konventionen der Programmiersprache C

- Die **lexikalischen Konventionen** einer Programmiersprache beschreiben die **grundlegenden Regeln**, wie die **Quellcodezeichenfolgen** (also der Text, den ein Programmierer schreibt) in für den Compiler verständliche Einheiten (Token) zerlegt werden.
- In der Programmiersprache C umfassen diese Konventionen unter anderem die Regeln für **Bezeichner**, **Schlüsselwörter**, **Operatoren**, **Literale** und **Kommentare**.

### 1.1.1. Bezeichner (Identifiers)

Ein **Bezeichner** ist der Name, den man **Variablen**, **Funktionen**, **Typen** oder andere Programmbestandteile zuweist.

**Die Regeln:**

- Ein **Bezeichner** muss mit einem **Buchstaben** (`A-Z`, `a-z`) oder einem **Unterstrich** (`_`) beginnen.
- Danach können **Bezeichner** beliebig viele Buchstaben, Ziffern (`0-9`) und Unterstriche enthalten.
- **Bezeichner** sind **case-sensitive**, das heisst, `myVariable` und `myvariable` sind zwei verschiedene Bezeichner.
- **Bezeichner** dürfen keine Schlüsselwörter (wie `int`, `return`, `if` etc.) sein.

**Beispiel:**

```c
int age;         // Gültiger Bezeichner
float _radius;   // Gültiger Bezeichner (beginnt mit Unterstrich)
int var1;        // Gültiger Bezeichner (beginnt mit Buchstaben und enthält Ziffern)
int 1var;        // Ungültiger Bezeichner (beginnt mit einer Zahl)
int return;      // Ungültiger Bezeichner (Schlüsselwort)
```

### 1.1.2. Schlüsselwörter (Keywords)

- **Schlüsselwörter** sind **reservierte Wörter**, die eine spezielle Bedeutung in der Programmiersprache C haben.
- Diese Wörter dürfen **nicht** als Bezeichner verwendet werden.

**Beispiel:**

```c
int x = 10;  // "int" ist ein Schlüsselwort für den Datentyp
if (x > 0) {  // "if" ist ein Schlüsselwort für bedingte Anweisungen
return x;     // "return" ist ein Schlüsselwort, um eine Funktion zu verlassen
```

Die vollständige Liste der Schlüsselwörter in C umfasst unter anderem: `int`, `float`, `char`, `if`, `else`, `for`, `while`, `return`, `switch`, `case`, `struct`, `union`, `typedef` und viele andere.

---

### 1.1.3. Operatoren (Operators)

- **Operatoren** sind **Symbole**, die bestimmte Operationen auf Operanden ausführen.
- C bietet eine Vielzahl von Operatoren, die in Kategorien unterteilt werden.

**Arithmetische Operatoren:**

```c
+   // Addition
-   // Subtraktion
*   // Multiplikation
/   // Division
%   // Modulo (Rest der Division)
```

**Beispiel:**

```c
int a = 5, b = 2;
int sum = a + b;    // sum = 7
int product = a * b; // product = 10
```

**Vergleichsoperatoren:**

```c
==  // Gleich
!=  // Ungleich
>   // Grösser als
<   // Kleiner als
>=  // Grösser oder gleich
<=  // Kleiner oder gleich
```

**Beispiel:**

```c
int a = 5, b = 10;
if (a < b) {
    printf("a ist kleiner als b");
}
```

**Logische Operatoren:**

```c
&&  // Logisches UND
||  // Logisches ODER
!   // Logisches NICHT
```

**Beispiel:**

```c
int a = 5, b = 10;
if (a < b && b > 5) {
    printf("Beide Bedingungen sind wahr");
}
```

**Zuweisungsoperatoren:**

```c
=   // Zuweisung
+=  // Addiere und weise zu
-=  // Subtrahiere und weise zu
*=  // Multipliziere und weise zu
/=  // Dividiere und weise zu
```

**Beispiel:**

```c
int a = 5;
a += 3;  // a = a + 3 -> a = 8
```

---

### 1.1.4. Literals

- Literals sind Werte, die direkt in den Code geschrieben werden.
- Sie können in verschiedenen Formaten

**Ganzzahlige Literale:**

```c
int a = 10;     // Dezimal (Basis 10)
int b = 0xA;    // Hexadezimal (Basis 16)
int c = 012;    // Oktal (Basis 8)
```

**Fliesskomma-Literale:**

```c
float f = 3.14;
double d = 2.71828;
```

**Zeichenliterale:**

Ein Zeichenliteral wird durch einfache Anführungszeichen (`'`) umschlossen:

```c
char c = 'A';    // Einzelnes Zeichen
```

**String-Literale:**

Ein String-Literal wird durch doppelte Anführungszeichen (`"`) umschlossen:

```c
char *str = "Hello, World!";
```

---

### 1.1.5. Kommentare

Kommentare werden vom Compiler ignoriert und dienen zur Dokumentation des Codes.

**Einzeilige Kommentare:**

```c
// Dies ist ein einzeiliger Kommentar
int x = 10;  // Kommentar am Ende einer Zeile
```

**Mehrzeilige Kommentare:**

```c
/*
  Dies ist ein mehrzeiliger Kommentar.
  Er kann über mehrere Zeilen gehen.
*/
int y = 20;
```

---

### 1.1.6. Whitespace (Leerzeichen, Tabulatoren, Zeilenumbrüche)

- **Whitespace**-Zeichen wie Leerzeichen, Tabulatoren und Zeilenumbrüche dienen der Formatierung und Lesbarkeit des Codes.
- Sie sind für den Compiler von Bedeutung, da sie die **Trennung** von Token darstellen.
- Diese Zeichen werden jedoch im Allgemeinen **ignoriert**, es sei denn, sie trennen zwei Token oder erzeugen eine neue Zeile.

**Beispiel:**

```c
int a = 5;  // Leerzeichen zwischen den Tokens
int b = 10; // Kommentar
```

---

### 1.1.7. Sonderzeichen

C verwendet auch einige Sonderzeichen, die spezielle Bedeutungen haben:

**Semikolon (`;`):**

Das Semikolon wird verwendet, um das Ende einer Anweisung zu kennzeichnen.

**Beispiel:**

```c
int a = 5;  // Ende der Anweisung
```

---

### 1.1.8. Klammern (`()`, `{}`, `[]`)

- **`()`**: Wird verwendet, um Funktionsaufrufe zu kennzeichnen und Parameter zu gruppieren.
- **`{}`**: Wird verwendet, um Codeblöcke zu definieren (z. B. in Schleifen, Funktionen).
- **`[]`**: Wird verwendet, um auf Elemente von Arrays zuzugreifen.

**Beispiel:**

```c
if (a > b) {
    printf("a ist grösser als b");
}
```

---

# 2. Struktur eines C/Arduino-Programms

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

## 2.1. Syntax-Grundregeln

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

## 2.2. Der Serial Monitor

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

</br>

# 3. Aufgaben

## 3.1. Aufgabe Literale

| **Vorgabe**         | **Beschreibung**                                               |
| :------------------ | :------------------------------------------------------------- |
| **Lernziele**       | Kennen die Regeln zu korrekten Benennung der Bezeichner        |
|                     | Kennen die Literale für Zahlen, Zeichen, und Strings           |
|                     | Können den Programmcode einzeilig oder mehrzeilig kommentieren |
| **Sozialform**      | Einzelarbeit                                                   |
| **Auftrag**         | siehe unten                                                    |
| **Hilfsmittel**     |                                                                |
| **Zeitbedarf**      | 20min                                                          |
| **Lösungselemente** |                                                                |

a) **Bezeichner und Schlüsselwörter:**

- Erstelle eine Liste mit fünf gültigen und fünf ungültigen **Bezeichnern**.
- Begründe, warum die ungültigen Bezeichner nicht erlaubt sind.

b) **Literals und Datentypen:**

- Deklariere drei Variablen:
  - Eine **Ganzzahl** mit dem Wert `100` (Verwende ein Dezimalliteral)
  - Eine **Fliesskommazahl** mit dem Wert `3.14` (Verwende ein Fliesskomma-Literal)
  - Ein **Zeichen** mit dem Wert `'A'` (Verwende ein Zeichenliteral)

Weise den Variablen Werte zu und gib diese auf der Konsole aus.

c) **Kommentare:**

- Kommentiere deinen Code entsprechend, damit er für andere Programmierer verständlich ist.

---

</br>

## 3.2. Aufgabe Serial Monitor

| **Vorgabe**         | **Beschreibung**                                                             |
| :------------------ | :--------------------------------------------------------------------------- |
| **Lernziele**       | Serial Monitor für Ausgaben nutzen, Werte berechnen und formatiert ausgeben. |
| **Sozialform**      | Einzelarbeit                                                                 |
| **Auftrag**         | siehe unten                                                                  |
| **Hilfsmittel**     |                                                                              |
| **Zeitbedarf**      | 30min                                                                        |
| **Lösungselemente** |                                                                              |

1. Schreiben Sie einen Sketch, der beim Start `"Hallo, mein Name ist [Ihr Name]!"` im Serial Monitor ausgibt.
2. Geben Sie in `loop()` jede Sekunde den aktuellen Zeitstempel aus. Tipp: `millis()` gibt Millisekunden seit Start zurück.
3. Berechnen Sie den Kreisumfang für `r = 5.0` und geben Sie das Ergebnis formatiert (2 Dezimalstellen) aus.
4. **Bonus:** Bringen Sie den Arduino dazu, von 10 auf 0 rückwärts zu zählen und dann `"Start!"` auszugeben.

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
