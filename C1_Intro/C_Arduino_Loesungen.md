# C-Programmierung mit Arduino – Musterlösungen
## Lösungen zu allen Übungsaufgaben

> **Hinweis:** Diese Musterlösungen zeigen einen möglichen Lösungsweg. In der Programmierung gibt es oft mehrere korrekte Wege zum Ziel. Abweichende Lösungen der Studierenden sind gültig, sofern sie die Aufgabenstellung erfüllen und die Konzepte korrekt anwenden.

---

# Modul 1 – Lösungen

## ✅ Übung 1.1 – Installation und erstes Programm

### Aufgabe 4: delay() auf 200 ändern

Die LED blinkt nun 5× schneller – die Pause zwischen Ein und Aus beträgt nur noch 200 ms statt 1000 ms. Das menschliche Auge nimmt es als deutlich schnelleres Flackern wahr.

### Aufgabe 5 (Bonus): Morsecode „S" (···) mit langer Pause

```c
// Morsecode S = drei kurze Signale (dit dit dit)
// Konvention: dit = 200ms, Pause zwischen Zeichen = 600ms

void setup() {
    pinMode(LED_BUILTIN, OUTPUT);
}

void loop() {
    // Drei kurze Blinker (dit dit dit = S)
    for (int i = 0; i < 3; i++) {
        digitalWrite(LED_BUILTIN, HIGH);
        delay(200);                      // LED an: 200 ms (dit)
        digitalWrite(LED_BUILTIN, LOW);
        delay(200);                      // Pause zwischen dits
    }

    delay(600);  // Lange Pause nach dem Buchstaben
}
```

---

# Modul 2 – Lösungen

## ✅ Übung 2.1 – Serial Monitor

### Aufgabe 1: Begrüssung

```c
void setup() {
    Serial.begin(9600);
    Serial.println("Hallo, mein Name ist Anna Muster!");
}

void loop() {
    // Nichts – Begrüssung nur einmal in setup()
}
```

### Aufgabe 2: Zeitstempel in loop()

```c
void setup() {
    Serial.begin(9600);
}

void loop() {
    unsigned long ms = millis();
    unsigned long sekunden = ms / 1000;
    unsigned long minuten  = sekunden / 60;

    Serial.print("Zeit: ");
    Serial.print(minuten);
    Serial.print(" min ");
    Serial.print(sekunden % 60);
    Serial.print(" s  (");
    Serial.print(ms);
    Serial.println(" ms)");

    delay(1000);
}
```

### Aufgabe 3: Kreisumfang

```c
void setup() {
    Serial.begin(9600);

    const float PI_WERT = 3.14159;
    const float RADIUS  = 5.0;

    float umfang = 2.0 * PI_WERT * RADIUS;
    float flaeche = PI_WERT * RADIUS * RADIUS;

    Serial.print("Radius:   ");
    Serial.print(RADIUS, 1);
    Serial.println(" cm");

    Serial.print("Umfang:   ");
    Serial.print(umfang, 2);
    Serial.println(" cm");

    Serial.print("Flaeche:  ");
    Serial.print(flaeche, 2);
    Serial.println(" cm2");
}

void loop() {}
```

### Aufgabe 4 (Bonus): Rückwärts zählen

```c
void setup() {
    Serial.begin(9600);

    for (int i = 10; i >= 0; i--) {
        Serial.println(i);
        delay(500);
    }

    Serial.println("Start!");
}

void loop() {}
```

---

# Modul 3 – Lösungen

## ✅ Übung 3.1 – Datentypen und Variablen

### Aufgabe 1: Persönliche Variablen

```c
void setup() {
    Serial.begin(9600);

    String name       = "Anna Muster";
    int    alter      = 28;
    float  groesse    = 1.72;
    bool   magKaffee  = true;

    Serial.println("=== Meine Daten ===");
    Serial.print("Name:    "); Serial.println(name);
    Serial.print("Alter:   "); Serial.println(alter);
    Serial.print("Groesse: "); Serial.print(groesse, 2); Serial.println(" m");
    Serial.print("Kaffee:  "); Serial.println(magKaffee ? "Ja" : "Nein");
}

void loop() {}
```

### Aufgabe 2: LED-Streifen Berechnung

```c
void setup() {
    Serial.begin(9600);

    // Wichtig: 60 * 2.4 könnte als int * float gerechnet werden
    // Sicherer: explizit float verwenden und dann konvertieren
    const int   LEDS_PRO_METER = 60;
    const float LAENGE_METER   = 2.4;

    // float-Multiplikation, dann Ergebnis als int (kein Rest möglich bei ganzen LEDs)
    int anzahlLEDs = (int)(LEDS_PRO_METER * LAENGE_METER);

    Serial.print("LEDs/Meter: "); Serial.println(LEDS_PRO_METER);
    Serial.print("Laenge:     "); Serial.print(LAENGE_METER, 1); Serial.println(" m");
    Serial.print("Total LEDs: "); Serial.println(anzahlLEDs);  // 144

    // int reicht hier problemlos (144 << 32767)
    // unsigned int oder byte würden auch genügen
}

void loop() {}
```

### Aufgabe 3: Konstanten für Pins

```c
const int PIN_LED    = 13;
const int PIN_TASTER = 2;
const int PIN_BUZZER = 8;

void setup() {
    Serial.begin(9600);

    pinMode(PIN_LED,    OUTPUT);
    pinMode(PIN_TASTER, INPUT_PULLUP);
    pinMode(PIN_BUZZER, OUTPUT);

    Serial.print("LED-Pin:    "); Serial.println(PIN_LED);
    Serial.print("Taster-Pin: "); Serial.println(PIN_TASTER);
    Serial.print("Buzzer-Pin: "); Serial.println(PIN_BUZZER);
}

void loop() {}
```

### Aufgabe 4 (Bonus): byte-Overflow

```c
void setup() {
    Serial.begin(9600);

    byte b = 255;
    Serial.print("Vorher: "); Serial.println(b);  // 255

    b++;
    Serial.print("Nachher: "); Serial.println(b); // 0 !

    // Erklärung: byte speichert 8 Bits: 1111 1111 (= 255)
    // +1 ergibt 1 0000 0000 – das neunte Bit passt nicht ins byte
    // Das Ergebnis wird auf 8 Bit abgeschnitten: 0000 0000 = 0
    // Dieses Verhalten heisst "Integer Overflow" oder "Wraparound"
    Serial.println("Erklaerung: 255 + 1 = 256 = 0b100000000");
    Serial.println("byte hat nur 8 Bit -> oberstes Bit faellt weg -> 0");
}

void loop() {}
```

---

# Modul 4 – Lösungen

## ✅ Übung 4.1 – Ampel-Steuerung

### Aufgabe 1: Einfache Ampel

```c
const int PIN_ROT   = 10;
const int PIN_GELB  = 11;
const int PIN_GRUEN = 12;

void setup() {
    pinMode(PIN_ROT,   OUTPUT);
    pinMode(PIN_GELB,  OUTPUT);
    pinMode(PIN_GRUEN, OUTPUT);
}

void alleAus() {
    digitalWrite(PIN_ROT,   LOW);
    digitalWrite(PIN_GELB,  LOW);
    digitalWrite(PIN_GRUEN, LOW);
}

void loop() {
    // Rot: 5 Sekunden
    alleAus();
    digitalWrite(PIN_ROT, HIGH);
    delay(5000);

    // Rot + Gelb: 1 Sekunde
    digitalWrite(PIN_GELB, HIGH);   // Rot bleibt an
    delay(1000);

    // Grün: 4 Sekunden
    alleAus();
    digitalWrite(PIN_GRUEN, HIGH);
    delay(4000);

    // Gelb: 1 Sekunde
    alleAus();
    digitalWrite(PIN_GELB, HIGH);
    delay(1000);
}
```

### Aufgabe 2: 3 Zyklen + Nachtmodus

```c
const int PIN_ROT   = 10;
const int PIN_GELB  = 11;
const int PIN_GRUEN = 12;

void setup() {
    pinMode(PIN_ROT,   OUTPUT);
    pinMode(PIN_GELB,  OUTPUT);
    pinMode(PIN_GRUEN, OUTPUT);
}

void alleAus() {
    digitalWrite(PIN_ROT,   LOW);
    digitalWrite(PIN_GELB,  LOW);
    digitalWrite(PIN_GRUEN, LOW);
}

void loop() {
    // 3 normale Ampelzyklen
    for (int zyklus = 0; zyklus < 3; zyklus++) {
        alleAus();
        digitalWrite(PIN_ROT, HIGH);
        delay(5000);

        digitalWrite(PIN_GELB, HIGH);
        delay(1000);

        alleAus();
        digitalWrite(PIN_GRUEN, HIGH);
        delay(4000);

        alleAus();
        digitalWrite(PIN_GELB, HIGH);
        delay(1000);
    }

    // Nachtmodus: Gelb blinkt endlos
    while (true) {
        alleAus();
        digitalWrite(PIN_GELB, HIGH);
        delay(500);
        alleAus();
        delay(500);
    }
}
```

### Aufgabe 3: Fussgänger-Taster

```c
const int PIN_ROT    = 10;
const int PIN_GELB   = 11;
const int PIN_GRUEN  = 12;
const int PIN_TASTER = 2;

bool tasterWurdeGedrueckt = false;

void setup() {
    pinMode(PIN_ROT,    OUTPUT);
    pinMode(PIN_GELB,   OUTPUT);
    pinMode(PIN_GRUEN,  OUTPUT);
    pinMode(PIN_TASTER, INPUT_PULLUP);
    Serial.begin(9600);
}

void alleAus() {
    digitalWrite(PIN_ROT,   LOW);
    digitalWrite(PIN_GELB,  LOW);
    digitalWrite(PIN_GRUEN, LOW);
}

// Wartet ms Millisekunden, prüft dabei den Taster
void warteMitTasterCheck(int ms) {
    unsigned long start = millis();
    while (millis() - start < (unsigned long)ms) {
        if (digitalRead(PIN_TASTER) == LOW) {
            tasterWurdeGedrueckt = true;
        }
        delay(10);
    }
}

void loop() {
    tasterWurdeGedrueckt = false;

    // Rot-Phase
    alleAus();
    digitalWrite(PIN_ROT, HIGH);
    warteMitTasterCheck(5000);

    // Rot+Gelb
    digitalWrite(PIN_GELB, HIGH);
    warteMitTasterCheck(1000);

    // Grün (evtl. verlängert wenn kein Taster, verkürzt wenn Taster)
    alleAus();
    digitalWrite(PIN_GRUEN, HIGH);
    if (tasterWurdeGedrueckt) {
        Serial.println("Fussgaenger! Gruen verkuerzt.");
        warteMitTasterCheck(2000);   // Kürzeres Grün
    } else {
        warteMitTasterCheck(4000);   // Normales Grün
    }

    // Gelb
    alleAus();
    digitalWrite(PIN_GELB, HIGH);
    warteMitTasterCheck(1000);
}
```

### Aufgabe 4 (Bonus): Countdown im Serial Monitor

```c
const int PIN_ROT   = 10;
const int PIN_GELB  = 11;
const int PIN_GRUEN = 12;

void setup() {
    Serial.begin(9600);
    pinMode(PIN_ROT,   OUTPUT);
    pinMode(PIN_GELB,  OUTPUT);
    pinMode(PIN_GRUEN, OUTPUT);
}

void alleAus() {
    digitalWrite(PIN_ROT,   LOW);
    digitalWrite(PIN_GELB,  LOW);
    digitalWrite(PIN_GRUEN, LOW);
}

// Countdown mit LED-Zustand und Serial-Ausgabe
void phaseAbwarten(String phaseName, int dauerSek) {
    Serial.print("=== ");
    Serial.print(phaseName);
    Serial.println(" ===");
    for (int i = dauerSek; i > 0; i--) {
        Serial.print(i); Serial.println(" s");
        delay(1000);
    }
}

void loop() {
    alleAus();
    digitalWrite(PIN_ROT, HIGH);
    phaseAbwarten("ROT", 5);

    digitalWrite(PIN_GELB, HIGH);
    phaseAbwarten("ROT+GELB", 1);

    alleAus();
    digitalWrite(PIN_GRUEN, HIGH);
    phaseAbwarten("GRUEN", 4);

    alleAus();
    digitalWrite(PIN_GELB, HIGH);
    phaseAbwarten("GELB", 1);
}
```

---

# Modul 5 – Lösungen

## ✅ Übung 5.1 – Funktions-Bibliothek für LEDs

### Aufgabe 1: alleAus / alleEin / toggeln

```c
// Setzt alle Pins von vonPin bis bisPin auf LOW
void alleAus(int vonPin, int bisPin) {
    for (int pin = vonPin; pin <= bisPin; pin++) {
        digitalWrite(pin, LOW);
    }
}

// Setzt alle Pins von vonPin bis bisPin auf HIGH
void alleEin(int vonPin, int bisPin) {
    for (int pin = vonPin; pin <= bisPin; pin++) {
        digitalWrite(pin, HIGH);
    }
}

// Wechselt den Zustand eines einzelnen Pins
void toggeln(int pin) {
    // digitalRead gibt den aktuellen Ausgangszustand zurück
    int zustand = digitalRead(pin);
    digitalWrite(pin, !zustand);
}

void setup() {
    for (int p = 2; p <= 9; p++) pinMode(p, OUTPUT);

    alleEin(2, 5);    // Pins 2-5 an
    delay(1000);
    alleAus(2, 9);    // Alle aus
    delay(500);
    toggeln(7);       // Pin 7 an
    delay(500);
    toggeln(7);       // Pin 7 aus
}

void loop() {}
```

### Aufgabe 2: lauflicht()

```c
void lauflicht(int startPin, int endPin, int geschwindigkeitMs) {
    // Vorwärts
    for (int pin = startPin; pin <= endPin; pin++) {
        digitalWrite(pin, HIGH);
        delay(geschwindigkeitMs);
        digitalWrite(pin, LOW);
    }
    // Rückwärts
    for (int pin = endPin - 1; pin > startPin; pin--) {
        digitalWrite(pin, HIGH);
        delay(geschwindigkeitMs);
        digitalWrite(pin, LOW);
    }
}

void setup() {
    for (int p = 2; p <= 9; p++) pinMode(p, OUTPUT);
}

void loop() {
    lauflicht(2, 9, 80);    // Schnelles Lauflicht
}
```

### Aufgabe 3: mapWert()

```c
// Rechnet 'wert' linear vom Quellbereich [vonMin..vonMax]
// in den Zielbereich [zuMin..zuMax] um.
int mapWert(int wert, int vonMin, int vonMax, int zuMin, int zuMax) {
    // Sicherstellen, dass wert im Quellbereich liegt:
    if (wert <= vonMin) return zuMin;
    if (wert >= vonMax) return zuMax;

    // Lineare Interpolation:
    // Anteil des Wertes im Quellbereich (0.0 bis 1.0)
    float anteil = (float)(wert - vonMin) / (float)(vonMax - vonMin);

    // Auf Zielbereich anwenden:
    return zuMin + (int)(anteil * (zuMax - zuMin));
}

void setup() {
    Serial.begin(9600);

    // Test:
    Serial.println(mapWert(0,    0, 1023, 0, 255));  // 0
    Serial.println(mapWert(512,  0, 1023, 0, 255));  // 127
    Serial.println(mapWert(1023, 0, 1023, 0, 255));  // 255
    Serial.println(mapWert(25,   0, 100,  0, 180));  // 45
}

void loop() {}
```

### Aufgabe 4 (Bonus): Ampel refaktoriert

```c
const int PIN_ROT   = 10;
const int PIN_GELB  = 11;
const int PIN_GRUEN = 12;

void setup() {
    pinMode(PIN_ROT,   OUTPUT);
    pinMode(PIN_GELB,  OUTPUT);
    pinMode(PIN_GRUEN, OUTPUT);
    Serial.begin(9600);
}

void alleAus() {
    digitalWrite(PIN_ROT,   LOW);
    digitalWrite(PIN_GELB,  LOW);
    digitalWrite(PIN_GRUEN, LOW);
}

void phaseRot(int ms) {
    Serial.println("ROT");
    alleAus();
    digitalWrite(PIN_ROT, HIGH);
    delay(ms);
}

void phaseRotGelb(int ms) {
    Serial.println("ROT+GELB");
    digitalWrite(PIN_GELB, HIGH);  // Rot bleibt an
    delay(ms);
}

void phaseGruen(int ms) {
    Serial.println("GRUEN");
    alleAus();
    digitalWrite(PIN_GRUEN, HIGH);
    delay(ms);
}

void phaseGelb(int ms) {
    Serial.println("GELB");
    alleAus();
    digitalWrite(PIN_GELB, HIGH);
    delay(ms);
}

void nachtmodus() {
    Serial.println("NACHT");
    while (true) {
        alleAus();
        digitalWrite(PIN_GELB, HIGH);
        delay(500);
        alleAus();
        delay(500);
    }
}

void ampelZyklus() {
    phaseRot(5000);
    phaseRotGelb(1000);
    phaseGruen(4000);
    phaseGelb(1000);
}

void loop() {
    for (int i = 0; i < 3; i++) {
        ampelZyklus();
    }
    nachtmodus();
}
```

---

# Modul 6 – Lösungen

## ✅ Übung 6.1 – Temperatur-Datenlogger

### Aufgaben 1 & 2: Array + Statistik-Funktionen

```c
const int ANZAHL = 10;
float temperaturen[ANZAHL] = {18.5, 20.0, 21.5, 23.0, 24.5,
                               25.0, 24.0, 22.5, 21.0, 19.5};

float durchschnitt(float arr[], int n) {
    float summe = 0;
    for (int i = 0; i < n; i++) {
        summe += arr[i];
    }
    return summe / n;
}

float minimum(float arr[], int n) {
    float min = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] < min) min = arr[i];
    }
    return min;
}

float maximum(float arr[], int n) {
    float max = arr[0];
    for (int i = 1; i < n; i++) {
        if (arr[i] > max) max = arr[i];
    }
    return max;
}

void setup() {
    Serial.begin(9600);

    Serial.println("=== Alle Messwerte ===");
    for (int i = 0; i < ANZAHL; i++) {
        Serial.print("Messung ");
        Serial.print(i + 1);
        Serial.print(": ");
        Serial.print(temperaturen[i], 1);
        Serial.println(" C");
    }

    Serial.println("=== Statistik ===");
    Serial.print("Min:  "); Serial.print(minimum(temperaturen, ANZAHL), 1); Serial.println(" C");
    Serial.print("Max:  "); Serial.print(maximum(temperaturen, ANZAHL), 1); Serial.println(" C");
    Serial.print("Avg:  "); Serial.print(durchschnitt(temperaturen, ANZAHL), 1); Serial.println(" C");
}

void loop() {}
```

### Aufgabe 3: Echter Datenlogger mit Ring-Buffer

```c
const int PUFFER_GROESSE = 10;
float messwerte[PUFFER_GROESSE];
int   schreibIdx  = 0;
int   anzahlWerte = 0;

float durchschnitt(float arr[], int n) {
    float s = 0;
    for (int i = 0; i < n; i++) s += arr[i];
    return s / n;
}

float minimum(float arr[], int n) {
    float m = arr[0];
    for (int i = 1; i < n; i++) if (arr[i] < m) m = arr[i];
    return m;
}

float maximum(float arr[], int n) {
    float m = arr[0];
    for (int i = 1; i < n; i++) if (arr[i] > m) m = arr[i];
    return m;
}

void neuerMesswert(float wert) {
    messwerte[schreibIdx] = wert;
    schreibIdx = (schreibIdx + 1) % PUFFER_GROESSE;
    if (anzahlWerte < PUFFER_GROESSE) anzahlWerte++;
}

void setup() {
    Serial.begin(9600);
    Serial.println("Datenlogger gestartet...");
}

void loop() {
    // Analogwert lesen und in Temperatur umrechnen (LM35-Näherung)
    int roh = analogRead(A0);
    float temp = roh * (5.0 / 1023.0) * 100.0;

    neuerMesswert(temp);

    Serial.print("Neu: ");
    Serial.print(temp, 1);
    Serial.print(" C  |  ");
    Serial.print("Min: "); Serial.print(minimum(messwerte, anzahlWerte), 1);
    Serial.print("  Max: "); Serial.print(maximum(messwerte, anzahlWerte), 1);
    Serial.print("  Avg: "); Serial.println(durchschnitt(messwerte, anzahlWerte), 1);

    delay(5000);
}
```

### Aufgabe 4 (Bonus): ASCII-Balkendiagramm

```c
void zeigeBalken(float wert, float maxWert, int maxBreite) {
    int balkenLaenge = (int)((wert / maxWert) * maxBreite);
    Serial.print("|");
    for (int i = 0; i < balkenLaenge; i++) Serial.print("*");
    for (int i = balkenLaenge; i < maxBreite; i++) Serial.print(" ");
    Serial.print("| ");
    Serial.print(wert, 1);
    Serial.println(" C");
}

// In loop() nach neuerMesswert():
void zeigeDiagramm() {
    Serial.println("--- Verlauf (letzte Messungen) ---");
    for (int i = 0; i < anzahlWerte; i++) {
        Serial.print("M");
        if (i < 9) Serial.print("0");
        Serial.print(i + 1); Serial.print(": ");
        zeigeBalken(messwerte[i], 40.0, 20);
    }
}
```

---

# Modul 7 – Lösungen

## ✅ Übung 7.1 – Zeiger und Funktionen

### Aufgabe 1: Tauschen mit Zeigern

```c
void tauschen(int *a, int *b) {
    int temp = *a;  // Wert an Adresse a in temp sichern
    *a = *b;        // Wert an Adresse b nach a schreiben
    *b = temp;      // temp nach b schreiben
}

void setup() {
    Serial.begin(9600);

    int x = 10;
    int y = 20;

    Serial.print("Vor dem Tausch:  x="); Serial.print(x);
    Serial.print(", y="); Serial.println(y);

    tauschen(&x, &y);   // Adressen von x und y übergeben

    Serial.print("Nach dem Tausch: x="); Serial.print(x);
    Serial.print(", y="); Serial.println(y);
    // Ausgabe: x=20, y=10
}

void loop() {}
```

### Aufgabe 2: Bubble Sort

```c
void sortierenBubble(int arr[], int n) {
    // Äussere Schleife: n-1 Durchgänge
    for (int i = 0; i < n - 1; i++) {
        bool getauscht = false;
        // Innere Schleife: benachbarte Elemente vergleichen
        for (int j = 0; j < n - 1 - i; j++) {
            if (arr[j] > arr[j + 1]) {
                // Tauschen (inline, ohne Funktion):
                int temp  = arr[j];
                arr[j]    = arr[j + 1];
                arr[j + 1] = temp;
                getauscht = true;
            }
        }
        // Optimierung: Abbruch wenn kein Tausch mehr nötig
        if (!getauscht) break;
    }
}

void arrayAusgeben(int arr[], int n, String label) {
    Serial.print(label); Serial.print(": ");
    for (int i = 0; i < n; i++) {
        Serial.print(arr[i]);
        if (i < n - 1) Serial.print(", ");
    }
    Serial.println();
}

void setup() {
    Serial.begin(9600);

    int werte[] = {64, 34, 25, 12, 22, 11, 90};
    int n = sizeof(werte) / sizeof(werte[0]);

    arrayAusgeben(werte, n, "Vorher ");
    sortierenBubble(werte, n);
    arrayAusgeben(werte, n, "Nachher");
}

void loop() {}
```

### Aufgabe 3: Statistik mit Zeigern

```c
void statistik(float arr[], int n,
               float *minVal, float *maxVal, float *avg) {
    *minVal = arr[0];
    *maxVal = arr[0];
    float summe = arr[0];

    for (int i = 1; i < n; i++) {
        if (arr[i] < *minVal) *minVal = arr[i];
        if (arr[i] > *maxVal) *maxVal = arr[i];
        summe += arr[i];
    }
    *avg = summe / n;
}

void setup() {
    Serial.begin(9600);

    float werte[] = {18.5, 22.0, 19.3, 25.7, 20.1, 17.8, 24.4};
    int   n       = sizeof(werte) / sizeof(werte[0]);

    float minT, maxT, avgT;
    statistik(werte, n, &minT, &maxT, &avgT);

    Serial.print("Min: "); Serial.println(minT, 1);
    Serial.print("Max: "); Serial.println(maxT, 1);
    Serial.print("Avg: "); Serial.println(avgT, 1);
}

void loop() {}
```

### Aufgabe 4 (Bonus): Binary Search

```c
// Voraussetzung: arr[] ist aufsteigend sortiert!
// Gibt Index zurück, oder -1 wenn nicht gefunden.
int suchen(int arr[], int n, int ziel) {
    int links  = 0;
    int rechts = n - 1;

    while (links <= rechts) {
        int mitte = links + (rechts - links) / 2;  // Overflow-sicher

        if (arr[mitte] == ziel) {
            return mitte;          // Gefunden!
        } else if (arr[mitte] < ziel) {
            links = mitte + 1;     // Rechte Hälfte suchen
        } else {
            rechts = mitte - 1;    // Linke Hälfte suchen
        }
    }
    return -1;  // Nicht gefunden
}

void setup() {
    Serial.begin(9600);

    int sortiert[] = {2, 5, 8, 12, 16, 23, 38, 56, 72, 91};
    int n = sizeof(sortiert) / sizeof(sortiert[0]);

    int idx = suchen(sortiert, n, 23);
    Serial.print("23 gefunden bei Index: "); Serial.println(idx);  // 5

    idx = suchen(sortiert, n, 99);
    Serial.print("99 gefunden bei Index: "); Serial.println(idx);  // -1
}

void loop() {}
```

---

# Modul 8 – Lösungen

## ✅ Übung 8.1 – Strukturierte Wetterstation

### Aufgaben 1 & 2: Struktur + Funktionen (Einzeldatei)

```c
struct MessStation {
    String name;
    int    tempPin;
    int    lichtPin;
    float  letzteTemp;
    int    letztesLicht;
};

MessStation drinnen = {"Drinnen", A0, A1, 0.0, 0};
MessStation draussen = {"Draussen", A2, A3, 0.0, 0};

// Liest neue Messwerte und aktualisiert die Struktur
void aktualisieren(MessStation &s) {
    int rohTemp = analogRead(s.tempPin);
    float spannung = rohTemp * (5.0 / 1023.0);
    s.letzteTemp   = (spannung - 0.5) * 100.0;  // LM35
    s.letztesLicht = analogRead(s.lichtPin);
}

// Gibt alle Werte der Station formatiert aus
void ausgeben(MessStation s) {
    Serial.println("─────────────────────");
    Serial.println(s.name);
    Serial.print("  Temp:  ");
    Serial.print(s.letzteTemp, 1);
    Serial.println(" C");
    Serial.print("  Licht: ");
    Serial.println(s.letztesLicht);
}

void setup() {
    Serial.begin(9600);
    Serial.println("=== Wetterstation ===");
}

void loop() {
    aktualisieren(drinnen);
    aktualisieren(draussen);

    ausgeben(drinnen);
    ausgeben(draussen);

    delay(3000);
}
```

### Aufgabe 3: Aufteilung in .h / .cpp

**messtation.h**

```c
#ifndef MESSTATION_H
#define MESSTATION_H

#include <Arduino.h>

struct MessStation {
    String name;
    int    tempPin;
    int    lichtPin;
    float  letzteTemp;
    int    letztesLicht;
};

void aktualisieren(MessStation &s);
void ausgeben(MessStation s);

#endif
```

**messtation.cpp**

```c
#include "messtation.h"

void aktualisieren(MessStation &s) {
    int rohTemp    = analogRead(s.tempPin);
    float spannung = rohTemp * (5.0 / 1023.0);
    s.letzteTemp   = (spannung - 0.5) * 100.0;
    s.letztesLicht = analogRead(s.lichtPin);
}

void ausgeben(MessStation s) {
    Serial.println("─────────────────────");
    Serial.println(s.name);
    Serial.print("  Temp:  ");
    Serial.print(s.letzteTemp, 1);
    Serial.println(" C");
    Serial.print("  Licht: ");
    Serial.println(s.letztesLicht);
}
```

**Wetterstation.ino**

```c
#include "messtation.h"

MessStation drinnen  = {"Drinnen",  A0, A1, 0.0, 0};
MessStation draussen = {"Draussen", A2, A3, 0.0, 0};

void setup() {
    Serial.begin(9600);
}

void loop() {
    aktualisieren(drinnen);
    aktualisieren(draussen);
    ausgeben(drinnen);
    ausgeben(draussen);
    delay(3000);
}
```

### Aufgabe 4 (Bonus): Gleitender Durchschnitt

```c
// Erweiterte Struktur mit Ring-Buffer:
struct MessStation {
    String name;
    int    tempPin;
    int    lichtPin;
    float  letzteTemp;
    int    letztesLicht;
    float  letzte10Temps[10];   // Ring-Buffer
    int    ringIndex;           // Schreibzeiger
    int    anzahlWerte;         // Wie viele Werte bisher
};

void aktualisieren(MessStation &s) {
    int rohTemp    = analogRead(s.tempPin);
    float spannung = rohTemp * (5.0 / 1023.0);
    s.letzteTemp   = (spannung - 0.5) * 100.0;
    s.letztesLicht = analogRead(s.lichtPin);

    // In Ring-Buffer schreiben:
    s.letzte10Temps[s.ringIndex] = s.letzteTemp;
    s.ringIndex = (s.ringIndex + 1) % 10;
    if (s.anzahlWerte < 10) s.anzahlWerte++;
}

float gleitenderDurchschnitt(MessStation s) {
    float summe = 0;
    for (int i = 0; i < s.anzahlWerte; i++) {
        summe += s.letzte10Temps[i];
    }
    return summe / s.anzahlWerte;
}
```

---

# Modul 9 – Lösungen

## ✅ Übung 9.1 – Reaktionsmesser

### Aufgaben 1 & 2: Grundversion mit Rekord

```c
const int PIN_LED    = 13;
const int PIN_TASTER = 2;
const int PIN_BUZZER = 8;

unsigned long besteZeit     = ULONG_MAX;  // Anfangs kein Rekord
int           rundenNummer  = 0;

void setup() {
    Serial.begin(9600);
    pinMode(PIN_LED,    OUTPUT);
    pinMode(PIN_TASTER, INPUT_PULLUP);
    pinMode(PIN_BUZZER, OUTPUT);
    randomSeed(analogRead(A5));  // Echter Zufallsseed

    Serial.println("=== Reaktionsmesser ===");
    Serial.println("Warte auf LED, dann Taster druecken!");
}

void loop() {
    rundenNummer++;
    Serial.print("\nRunde "); Serial.println(rundenNummer);

    // Zufällige Wartezeit 2–5 Sekunden
    unsigned long wartezeit = random(2000, 5001);
    delay(wartezeit);

    // LED einschalten + Ton
    digitalWrite(PIN_LED, HIGH);
    tone(PIN_BUZZER, 1000, 200);
    unsigned long start = millis();

    // Warten bis Taster gedrückt
    while (digitalRead(PIN_TASTER) == HIGH) {
        // Warten...
    }

    unsigned long reaktion = millis() - start;
    digitalWrite(PIN_LED, LOW);

    Serial.print("Reaktionszeit: ");
    Serial.print(reaktion);
    Serial.println(" ms");

    if (reaktion < besteZeit) {
        besteZeit = reaktion;
        Serial.println("*** NEUER REKORD! ***");
        // Langer Beep bei Rekord
        tone(PIN_BUZZER, 2000, 600);
    }

    Serial.print("Bestzeit: ");
    Serial.print(besteZeit);
    Serial.println(" ms");

    delay(2000);  // Pause vor der nächsten Runde
}
```

### Aufgabe 3: Interrupt-Version

```c
const int PIN_LED    = 13;
const int PIN_TASTER = 2;
const int PIN_BUZZER = 8;

volatile bool tasterGedrueckt = false;
volatile unsigned long drueckZeitpunkt = 0;

unsigned long startZeit   = 0;
unsigned long besteZeit   = ULONG_MAX;
bool          ledLeuchtet = false;

void tasterISR() {
    if (ledLeuchtet && !tasterGedrueckt) {
        drueckZeitpunkt = millis();
        tasterGedrueckt = true;
    }
}

void setup() {
    Serial.begin(9600);
    pinMode(PIN_LED,    OUTPUT);
    pinMode(PIN_TASTER, INPUT_PULLUP);
    pinMode(PIN_BUZZER, OUTPUT);
    randomSeed(analogRead(A5));

    attachInterrupt(digitalPinToInterrupt(PIN_TASTER), tasterISR, FALLING);
    Serial.println("=== Reaktionsmesser (Interrupt) ===");
}

void loop() {
    tasterGedrueckt = false;
    ledLeuchtet     = false;

    Serial.println("Bereit machen...");
    delay(random(2000, 5001));

    // LED an
    ledLeuchtet = true;
    digitalWrite(PIN_LED, HIGH);
    tone(PIN_BUZZER, 1000, 150);
    startZeit = millis();

    // Warten bis Interrupt ausgelöst (oder Timeout nach 5s)
    unsigned long timeout = millis() + 5000;
    while (!tasterGedrueckt && millis() < timeout) {
        // Nichts – Interrupt übernimmt
    }

    digitalWrite(PIN_LED, LOW);
    ledLeuchtet = false;

    if (!tasterGedrueckt) {
        Serial.println("Timeout – zu langsam!");
        return;
    }

    unsigned long reaktion = drueckZeitpunkt - startZeit;
    Serial.print("Reaktionszeit: "); Serial.print(reaktion); Serial.println(" ms");

    if (reaktion < besteZeit) {
        besteZeit = reaktion;
        Serial.println("*** NEUER REKORD! ***");
        tone(PIN_BUZZER, 2000, 800);
        delay(800);
    }

    Serial.print("Bestzeit: "); Serial.print(besteZeit); Serial.println(" ms");
    delay(1500);
}
```

### Aufgabe 4 (Bonus): Disqualifikation bei Frühstart

```c
// Zusätzlich zu obiger Interrupt-Version:

volatile bool fruehstart = false;

void tasterISR() {
    if (!ledLeuchtet) {
        // LED leuchtet noch nicht → Frühstart!
        fruehstart = true;
    } else if (!tasterGedrueckt) {
        drueckZeitpunkt = millis();
        tasterGedrueckt = true;
    }
}

// In loop() vor dem delay():
void loop() {
    tasterGedrueckt = false;
    fruehstart      = false;
    ledLeuchtet     = false;

    Serial.println("Bereit...");
    unsigned long wartezeit = random(2000, 5001);

    // Während der Wartezeit Frühstart überwachen
    unsigned long warteStart = millis();
    while (millis() - warteStart < wartezeit) {
        if (fruehstart) {
            Serial.println("DISQUALIFIZIERT! Zu frueh gedrueckt.");
            tone(PIN_BUZZER, 200, 1000);
            delay(2000);
            return;   // Loop von vorne
        }
    }

    // Weiter wie gehabt...
    ledLeuchtet = true;
    digitalWrite(PIN_LED, HIGH);
    // ...
}
```

---

# Modul 10 – Musterlösung

## ✅ Übung 10.1 – Abschlussprojekt Wetterstation

Die folgende Musterlösung implementiert alle Pflichtanforderungen. Sie dient als Referenz – die Lösungen der Studierenden werden individuell abweichen.

### statistik.h

```c
#ifndef STATISTIK_H
#define STATISTIK_H

#include "config.h"

Statistik berechneStatistik(Messung verlauf[], int anzahl);
void       statistikAusgeben(Statistik s);

#endif
```

### statistik.cpp

```c
#include "statistik.h"
#include <Arduino.h>

Statistik berechneStatistik(Messung verlauf[], int anzahl) {
    Statistik s;
    if (anzahl == 0) return s;

    s.minTemp  = s.maxTemp  = verlauf[0].temperatur;
    s.minLicht = s.maxLicht = verlauf[0].licht;
    s.minFeucht = s.maxFeucht = verlauf[0].luftfeuchte;

    float sumTemp = 0, sumLicht = 0, sumFeucht = 0;

    for (int i = 0; i < anzahl; i++) {
        // Temperatur
        if (verlauf[i].temperatur < s.minTemp) s.minTemp = verlauf[i].temperatur;
        if (verlauf[i].temperatur > s.maxTemp) s.maxTemp = verlauf[i].temperatur;
        sumTemp += verlauf[i].temperatur;

        // Licht
        if (verlauf[i].licht < s.minLicht) s.minLicht = verlauf[i].licht;
        if (verlauf[i].licht > s.maxLicht) s.maxLicht = verlauf[i].licht;
        sumLicht += verlauf[i].licht;

        // Luftfeuchte
        if (verlauf[i].luftfeuchte < s.minFeucht) s.minFeucht = verlauf[i].luftfeuchte;
        if (verlauf[i].luftfeuchte > s.maxFeucht) s.maxFeucht = verlauf[i].luftfeuchte;
        sumFeucht += verlauf[i].luftfeuchte;
    }

    s.avgTemp   = sumTemp   / anzahl;
    s.avgLicht  = sumLicht  / anzahl;
    s.avgFeucht = sumFeucht / anzahl;

    return s;
}

void statistikAusgeben(Statistik s) {
    Serial.println("─── Statistik ──────────────────────");
    Serial.print("Temp:  Min="); Serial.print(s.minTemp, 1);
    Serial.print("  Max="); Serial.print(s.maxTemp, 1);
    Serial.print("  Avg="); Serial.print(s.avgTemp, 1);
    Serial.println(" C");

    Serial.print("Licht: Min="); Serial.print(s.minLicht);
    Serial.print("  Max="); Serial.print(s.maxLicht);
    Serial.print("  Avg="); Serial.println((int)s.avgLicht);

    Serial.print("Feuch: Min="); Serial.print(s.minFeucht, 1);
    Serial.print("  Max="); Serial.print(s.maxFeucht, 1);
    Serial.print("  Avg="); Serial.print(s.avgFeucht, 1);
    Serial.println(" %");
}
```

### alarm.h

```c
#ifndef ALARM_H
#define ALARM_H

#include "config.h"

void alarmPruefenUndSetzen(Messung m, bool unterdrückt);

#endif
```

### alarm.cpp

```c
#include "alarm.h"
#include <Arduino.h>

void alarmPruefenUndSetzen(Messung m, bool unterdrückt) {
    bool alarm   = false;
    bool warnung = false;

    // Temperatur prüfen
    if (m.temperatur >= TEMP_ALARM) {
        alarm = true;
        Serial.println("!!! ALARM: Temperatur kritisch !!!");
    } else if (m.temperatur >= TEMP_WARN) {
        warnung = true;
        Serial.println("WARNUNG: Temperatur erhoeht");
    }

    // Licht prüfen
    if (m.licht < LICHT_MIN) {
        warnung = true;
        Serial.println("WARNUNG: Zu dunkel");
    }

    // Luftfeuchte prüfen
    if (m.luftfeuchte > FEUCHTE_MAX) {
        warnung = true;
        Serial.println("WARNUNG: Luftfeuchte zu hoch");
    }

    // LEDs setzen
    digitalWrite(PIN_LED_ROT,   alarm   ? HIGH : LOW);
    digitalWrite(PIN_LED_GELB,  warnung && !alarm ? HIGH : LOW);
    digitalWrite(PIN_LED_GRUEN, (!alarm && !warnung) ? HIGH : LOW);

    // Summer (wenn nicht unterdrückt)
    if (alarm && !unterdrückt) {
        tone(PIN_SUMMER, 880, 300);
    } else if (warnung && !unterdrückt) {
        tone(PIN_SUMMER, 440, 150);
    } else {
        noTone(PIN_SUMMER);
    }
}
```

### Wetterstation.ino (vollständig)

```c
#include "config.h"
#include "sensoren.h"
#include "statistik.h"
#include "alarm.h"

// ── Globale Zustandsvariablen ────────────────────────────────────
Messung       verlauf[MAX_MESSUNGEN];
int           ringIndex    = 0;
int           anzahlGesamt = 0;
volatile bool alarmUnterdrückt = false;

// ── Interrupt Service Routine ────────────────────────────────────
void alarmISR() {
    alarmUnterdrückt = !alarmUnterdrückt;
    // Kurze visuelle Bestätigung über LED-Blink wäre in ISR
    // zu komplex – wird im nächsten loop()-Durchgang sichtbar
}

// ── Setup ────────────────────────────────────────────────────────
void setup() {
    Serial.begin(9600);
    allesPinsModeSetzen();
    attachInterrupt(digitalPinToInterrupt(PIN_TASTER), alarmISR, FALLING);

    Serial.println("================================");
    Serial.println("  Wetterstation v1.0 gestartet");
    Serial.println("================================");
    Serial.print("Mess-Intervall: ");
    Serial.print(MESS_INTERVALL_MS / 1000);
    Serial.println(" s");
    Serial.print("Puffer: ");
    Serial.print(MAX_MESSUNGEN);
    Serial.println(" Messungen");
    Serial.println("Taster: Alarm unterdrücken");
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

        // 3. Aktuelle Messung ausgeben
        messungAusgeben(m);

        // 4. Statistik berechnen und ausgeben
        if (anzahlGesamt >= 2) {   // Erst ab 2 Messungen sinnvoll
            Statistik s = berechneStatistik(verlauf, anzahlGesamt);
            statistikAusgeben(s);
        }

        // 5. Alarm prüfen und Anzeige setzen
        alarmPruefenUndSetzen(m, alarmUnterdrückt);

        // 6. Alarm-Status anzeigen
        if (alarmUnterdrückt) {
            Serial.println("[Alarm unterdrückt – Taster zum Reaktivieren]");
        }
    }
}
```

---

# Anhang: Lösungshinweise für Dozierende

## Bewertungshinweise

### Was ist eine gute Lösung?

Eine akzeptable Lösung erfüllt die Aufgabenstellung und gibt korrekte Ergebnisse. Eine **gute** Lösung zeichnet sich zusätzlich durch folgende Merkmale aus:

| Kriterium      | Schwache Lösung | Gute Lösung                                   |
| -------------- | --------------- | --------------------------------------------- |
| Variablennamen | `int x, y, z;`  | `int tempWert, lichtWert;`                    |
| Magic Numbers  | `delay(1000);`  | `const int PAUSE_MS = 1000; delay(PAUSE_MS);` |
| Funktionen     | Alles in loop() | Klare, einzeln testbare Funktionen            |
| Kommentare     | Keine           | Erklärt das Warum, nicht das Was              |
| Typen          | Immer int       | Passende Typen (byte, unsigned long, float)   |
| Fehler         | Keine Prüfung   | Grenzfälle abgefangen                         |

### Häufige Fehler der Studierenden

**Modul 3 – Typen:**
- `int` für `millis()` statt `unsigned long` → Overflow nach 32 s
- Ganzzahldivision ohne Cast: `5 / 2 = 2` statt `2.5`

**Modul 4 – Schleifen:**
- Endlosschleife durch fehlende Inkrementierung: `while (i < 10)` ohne `i++`
- Off-by-one: `for (i = 0; i <= n; i++)` greift auf `arr[n]` zu

**Modul 5 – Funktionen:**
- Rückgabetyp vergessen → Compilerfehler
- `void` für Funktion mit `return`-Wert

**Modul 6 – Arrays:**
- Index-Fehler: Array der Grösse N hat Indizes 0 bis N-1, nicht 1 bis N
- Array-Grösse als Variable in for-Schleife – `sizeof()` vergessen

**Modul 7 – Zeiger:**
- `*` vergessen beim Schreiben: `a = b` statt `*a = *b`
- `&` vergessen beim Aufruf: `tauschen(x, y)` statt `tauschen(&x, &y)`

**Modul 9 – Interrupts:**
- `volatile` bei ISR-Variablen vergessen
- Zu viel Code in der ISR (delay, Serial, komplexe Berechnungen)
