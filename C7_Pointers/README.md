|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Zeiger \& Speicher](#1-zeiger--speicher)
  - [1.1. Was sind Pointer](#11-was-sind-pointer)
  - [1.2. Definition von Pointer-Typen](#12-definition-von-pointer-typen)
    - [1.2.1. Definition von Pointer-Variablen](#121-definition-von-pointer-variablen)
    - [1.2.2. Wozu dient das \*-Zeichen?](#122-wozu-dient-das--zeichen)
  - [1.3. Adress-Operator \&](#13-adress-operator-)
  - [1.4. Adressen und Zeiger](#14-adressen-und-zeiger)
  - [1.5. Call by Reference – Arrays an Funktionen](#15-call-by-reference--arrays-an-funktionen)
  - [1.6. Referenzen (C++ Feature)](#16-referenzen-c-feature)
  - [1.7. NULL-Pointer](#17-null-pointer)
  - [1.8. Häufige Zeiger-Fehler](#18-häufige-zeiger-fehler)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Zeiger und Funktionen](#21-zeiger-und-funktionen)

---

</br>

# 1. Zeiger & Speicher

**Lernziele:** Die Studierenden verstehen das Konzept von Zeigern (Pointer), können Arrays an Funktionen übergeben und kennen die Grundlagen der Speicherverwaltung in C.

---

## 1.1. Was sind Pointer

- **Pointer** (Zeiger) gehören zu den mächtigsten, aber auch komplexesten Konzepten der Programmiersprache C.
- Sie erlauben es, direkt auf Speicheradressen zuzugreifen und damit sehr flexibel und effizient zu programmieren.
- Gleichzeitig bergen sie viele Fehlerquellen.

## 1.2. Definition von Pointer-Typen

- Ein **Pointer-Typ** gibt an, auf welchen Datentyp ein Pointer zeigt.
- Jeder **Pointer** in C hat genau einen Typ, der bestimmt, wie der Speicherinhalt interpretiert wird, auf den der Pointer zeigt.

```c
int *ptr1;     // Pointer auf int
char *ptr2;    // Pointer auf char
float *ptr3;   // Pointer auf float
double *ptr4;  // Pointer auf double
```

> Der **Pointer-Typ** ist wichtig für Operationen wie Dereferenzierung (*ptr) und **Zeigerarithmetik**, da er bestimmt, wie viele Bytes bei einer Operation berücksichtigt werden.

### 1.2.1. Definition von Pointer-Variablen

Eine Pointer-Variable speichert die Adresse einer anderen Variablen.

```c
int zahl = 42;
int *ptr = &zahl;
```

- **`zahl`** ist eine normale int-Variable.
- **`&zahl`** liefert die Adresse dieser Variable.
- **`ptr`** ist ein Zeiger auf int, der die Adresse von zahl speichert.

### 1.2.2. Wozu dient das *-Zeichen?

Das *-Zeichen hat zwei verschiedene Bedeutungen, je nach Kontext:

- Bei der Deklaration: `int *ptr;`
- Bei der Dereferenzierung (Zugriff auf den Wert):
  - *p liest den Wert, auf den p zeigt.
  - Dies nennt man Dereferenzieren.
  
```c
int x = 10;
int *p = &x;
printf("%d", *p);  // gibt 10 aus
```

## 1.3. Adress-Operator &

Mit dem Adress-Operator **`&`** erhält man die Speicheradresse einer Variable.

```c
int zahl = 99;
int *ptr = &zahl;
```

---

## 1.4. Adressen und Zeiger

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

## 1.5. Call by Reference – Arrays an Funktionen

**Arrays** werden in C **immer als Zeiger** übergeben – Änderungen in der Funktion wirken auf das Original:

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

## 1.6. Referenzen (C++ Feature)

Arduino-C++ bietet **Referenzen** als einfachere Alternative zu Zeigern:

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

## 1.7. NULL-Pointer

- Ein NULL-Pointer zeigt auf nichts.
- Er ist nützlich, um anzuzeigen, dass ein Pointer aktuell ungültig oder leer ist.

```c
int *ptr = NULL;

if (ptr == NULL) {
    printf("Pointer zeigt auf nichts!\n");
}
```

n der <stddef.h>-Bibliothek ist NULL als (void *)0 definiert.

Warum NULL-Pointer verwenden?

- Um nicht initialisierte Pointer zu erkennen.
- Um Abstürze durch ungültigen Speicherzugriff zu vermeiden.
- Um auf besondere Zustände hinzuweisen (z. B. Ende einer Liste).

---

## 1.8. Häufige Zeiger-Fehler

> ⚠️ **Zeiger-Fallen in C**
>
| **Fehler**               | **Beschreibung**                              | **Lösung**              |
| ------------------------ | --------------------------------------------- | ----------------------- |
| Null-Zeiger              | `int *p = NULL;` → `*p` verwenden → Absturz!  | `if (p != NULL)` prüfen |
| Uninitialisierter Zeiger | `int *p;` → undefinierte Adresse!             | Immer initialisieren    |
| Array-Überlauf           | `arr[6]` bei `int arr[6]` → Buffer Overflow   | Grenzen immer prüfen    |
| Dangling Pointer         | Zeiger auf Variable, die nicht mehr existiert | Scope beachten          |

---

</br>

# 2. Aufgaben

## 2.1. Zeiger und Funktionen

| **Vorgabe**         | **Beschreibung**                                                       |
| :------------------ | :--------------------------------------------------------------------- |
| **Lernziele**       | Zeiger verstehen und für Funktionen mit mehreren Ausgabewerten nutzen. |
| **Sozialform**      | Einzelarbeit                                                           |
| **Auftrag**         | siehe unten                                                            |
| **Hilfsmittel**     |                                                                        |
| **Zeitbedarf**      | 60min                                                                  |
| **Lösungselemente** | Vollständiges Sketch                                                   |

1. Schreiben Sie eine Funktion `void tauschen(int *a, int *b)` (Zeiger-Version), die zwei Variablen vertauscht. Testen Sie: `int x = 10; int y = 20; tauschen(&x, &y);`
2. Implementieren Sie `void sortierenBubble(int arr[], int n)` mit dem Bubble-Sort-Algorithmus. Testen Sie mit einem unsortierten Array und geben Sie Vorher/Nachher im Serial Monitor aus.
3. Schreiben Sie `void statistik(float arr[], int n, float *minVal, float *maxVal, float *avg)`, die Min, Max und Durchschnitt in einem einzigen Funktionsaufruf berechnet.
4. **Bonus:** Implementieren Sie eine Funktion `int suchen(int arr[], int n, int ziel)`, die Binary Search auf einem sortierten Array ausführt und den Index zurückgibt (-1 wenn nicht gefunden).

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
