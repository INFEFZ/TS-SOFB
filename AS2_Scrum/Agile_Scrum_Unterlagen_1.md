# Agile Softwareentwicklung & Scrum
## Unterlagen, Handout & Übungsaufgaben

**HF Lehrgang · Informatik**

---

> **Lernziele:** Sie kennen Sinn und Zweck agiler Softwareentwicklung · Sie können ein Projekt nach agilen Prinzipien planen · Sie kennen Rollen, Events und Artefakte von Scrum · Sie können ein Projekt selbstständig mit Scrum realisieren

---

# Teil I · Agile Grundlagen

## 1.1 Warum klassische Methoden oft scheitern

Das Wasserfallmodell folgt einem linearen Ablauf:

```
Anforderungen → Design → Implementierung → Test → Betrieb
```

Es funktioniert gut, wenn Anforderungen **vollständig und stabil** sind – in der Praxis selten erfüllt.

> ⚠️ **Probleme des Wasserfallmodells**
> - Änderungen sind teuer, je später sie im Projekt auftreten
> - Kundenrückmeldung erfolgt erst am Projektende
> - Fehler in Anforderungen werden spät erkannt – wenn sie am teuersten zu beheben sind
> - „Big Bang"-Lieferung: Alles oder nichts am Projektende
> - Laut Standish CHAOS Report: **66 % aller Projekte** zu spät oder zu teuer – 19 % scheitern ganz

---

## 1.2 Das Agile Manifest (2001)

Im Februar 2001 trafen sich 17 erfahrene Entwickler in Snowbird, Utah. Das Ergebnis: vier Kernwerte und zwölf Prinzipien, veröffentlicht auf [agilemanifesto.org](https://agilemanifesto.org).

### Die 4 Werte

| Linke Seite *(mehr Wert)*         |       | Rechte Seite *(hat Wert)* |
| --------------------------------- | :---: | ------------------------- |
| **Individuen und Interaktionen**  | über  | Prozesse und Werkzeuge    |
| **Funktionierende Software**      | über  | Umfassende Dokumentation  |
| **Zusammenarbeit mit dem Kunden** | über  | Vertragsverhandlungen     |
| **Reagieren auf Veränderung**     | über  | Das Befolgen eines Plans  |

> 💡 Beide Seiten haben Wert – die linke Seite hat **mehr** Wert.

### Die 12 Prinzipien

1. Kundenzufriedenheit durch frühzeitige und kontinuierliche Lieferung wertvoller Software
2. Veränderungen in Anforderungen willkommen heissen – auch spät im Prozess
3. Funktionierende Software häufig liefern – alle paar Wochen oder Monate
4. Fachleute und Entwickler müssen täglich zusammenarbeiten
5. Projekte rund um motivierte Individuen errichten; ihnen Vertrauen schenken
6. Die effizienteste Kommunikation ist das direkte Gespräch von Angesicht zu Angesicht
7. Funktionierende Software ist das wichtigste Fortschrittsmass
8. Agile Prozesse fördern nachhaltige Entwicklung und ein gleichmässiges Tempo
9. Ständige Aufmerksamkeit auf technische Exzellenz und gutes Design
10. Einfachheit – die Kunst, den Umfang nicht getaner Arbeit zu maximieren
11. Die besten Architekturen und Entwürfe entstehen in selbstorganisierenden Teams
12. Das Team reflektiert regelmässig sein Vorgehen und passt es an

---

## 1.3 Agil vs. Wasserfall – Vergleich

| Kriterium         | Wasserfall            | Agil                     |
| ----------------- | --------------------- | ------------------------ |
| Planung           | Vollständig am Anfang | Iterativ, rollend        |
| Anforderungen     | Fest definiert        | Veränderbar, priorisiert |
| Lieferung         | Am Projektende        | Regelmässig (Sprints)    |
| Kundenbeteiligung | Anfang & Ende         | Kontinuierlich           |
| Risiko            | Hoch (spät erkannt)   | Gering (früh erkannt)    |
| Dokumentation     | Umfangreich           | So viel wie nötig        |
| Teamstruktur      | Hierarchisch          | Selbstorganisiert        |

---

# Teil II · Praxisübungen – Agiles Arbeiten

---

## Übung 1a · User Stories schreiben – «Pizzeria App»

⏱ **35 Minuten** · Gruppenarbeit (3–4 Personen)

**Szenario:** Ihr seid ein Entwicklungsteam. Eine lokale Pizzeria möchte eine Online-Bestellapp. Der Inhaber weiss nur: *„Die Leute rufen ständig an und wir vergessen Bestellungen."*

**Schritt 1 – User Stories schreiben (10 Min.)**

Schreibt mindestens 8 User Stories im folgenden Format:

> **«Als [Benutzerrolle] möchte ich [Funktion/Ziel], damit [Nutzen/Begründung].»**

Mögliche Rollen: Kunde, Mitarbeiter, Pizzabote, Inhaber, Gast (nicht eingeloggt)

**Schritt 2 – MoSCoW-Priorisierung (10 Min.)**

Ordnet jede Story einer der vier Kategorien zu:

| Kategorie       | Bedeutung                                      |
| --------------- | ---------------------------------------------- |
| **Must have**   | Zwingend erforderlich – ohne dies kein Release |
| **Should have** | Wichtig, aber notfalls verzichtbar             |
| **Could have**  | Nett zu haben, wenn Zeit vorhanden             |
| **Won't have**  | Explizit ausgeschlossen (this time)            |

**Schritt 3 – Sprint-Planung (10 Min.)**

Entscheidet, welche Stories in Sprint 1 passen (2 Wochen, 4 Entwickler). Schätzt den Aufwand in Story Points (1 / 2 / 3 / 5 / 8).

**Schritt 4 – Präsentation (5 Min.)**

Stellt euren Sprint Backlog der Klasse vor. Begründet eure Priorisierungen.

---

### Arbeitsblatt 1a – User Stories

**Team:** __________________________________________ **Datum:** __________________

| #   | User Story | MoSCoW | Story Points |
| --- | ---------- | ------ | :----------: |
| 1   |            |        |              |
| 2   |            |        |              |
| 3   |            |        |              |
| 4   |            |        |              |
| 5   |            |        |              |
| 6   |            |        |              |
| 7   |            |        |              |
| 8   |            |        |              |
| 9   |            |        |              |
| 10  |            |        |              |

**Sprint-Ziel Sprint 1:**

```
___________________________________________________________________________

___________________________________________________________________________
```

**Ausgewählte Stories für Sprint 1 (Total Story Points: ______):**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

---

## Übung 1b · Reflexion – Agile Planung

⏱ **10 Minuten** · 5 Min. Einzelarbeit, 5 Min. Teamdiskussion

**Was war überraschend oder schwieriger als erwartet beim Schreiben von User Stories?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

**Wie habt ihr euch bei der MoSCoW-Priorisierung geeinigt? Gab es Konflikte?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

**Was würdet ihr im nächsten Sprint anders machen?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

---

# Teil III · Einführung in Scrum

## 3.1 Was ist Scrum?

Scrum ist ein leichtgewichtiges Framework, das Teams hilft, komplexe Probleme adaptiv zu lösen und Produkte höchstmöglichen Wertes zu entwickeln. Scrum wurde 1995 von Ken Schwaber und Jeff Sutherland entwickelt.

> **Scrum in einem Satz:** Scrum nutzt kurze Iterationen (Sprints), um regelmässig funktionierende Software zu liefern, Feedback einzuholen und den Prozess kontinuierlich zu verbessern.

**Die drei Scrum-Säulen:**
- **Transparenz:** Alle Aspekte des Prozesses müssen für alle sichtbar sein
- **Überprüfung (Inspection):** Artefakte und Fortschritt werden regelmässig geprüft
- **Anpassung (Adaptation):** Bei Abweichungen wird der Prozess oder das Artefakt angepasst

**Die fünf Scrum-Werte:** Commitment · Mut · Fokus · Offenheit · Respekt

---

## 3.2 Die Scrum-Rollen

### 👤 Product Owner (PO)
- Verantwortlich für die Maximierung des Produktwerts
- Pflegt und priorisiert den Product Backlog
- Einzige Person, die Backlog-Einträge priorisiert
- Vertritt die Interessen der Stakeholder
- Muss verfügbar und entscheidungsfähig sein

### 🛡️ Scrum Master (SM)
- **Servant Leader** – dient dem Team, nicht umgekehrt
- Entfernt Impediments (Hindernisse) für das Entwicklungsteam
- Schützt das Team vor externen Störungen
- Fördert das Verständnis und die Anwendung von Scrum
- Moderiert alle Scrum Events

### 💻 Developer (Entwicklungsteam)
- Setzt das Sprint Backlog um und erstellt das Increment
- **Selbstorganisierend:** Das Team entscheidet selbst, wie Arbeit erledigt wird
- **Cross-functional:** Alle nötigen Fähigkeiten im Team vorhanden
- Hält die Definition of Done ein
- Typisch 3–9 Personen

---

## 3.3 Die Scrum-Artefakte

| Artefakt            | Beschreibung                                                            | Commitment         |
| ------------------- | ----------------------------------------------------------------------- | ------------------ |
| **Product Backlog** | Geordnete Liste aller bekannten Anforderungen. Lebt und verändert sich. | Produktziel        |
| **Sprint Backlog**  | Auswahl aus dem Product Backlog + Umsetzungsplan für den Sprint.        | Sprint-Ziel        |
| **Increment**       | Kumuliertes, potenziell auslieferbares Produkt am Sprint-Ende.          | Definition of Done |

---

## 3.4 Die Scrum-Events

| Event                    | Max. Dauer  | Zweck                                                                 |
| ------------------------ | ----------- | --------------------------------------------------------------------- |
| **Sprint**               | 1–4 Wochen  | Container für alle anderen Events. Liefert ein Increment.             |
| **Sprint Planning**      | 8 h         | Was wird im Sprint gemacht? Wie wird es umgesetzt?                    |
| **Daily Scrum**          | 15 Min./Tag | Synchronisation der Developer: Was tat ich? Was tue ich? Hindernisse? |
| **Sprint Review**        | 4 h         | Increment wird vorgestellt, Feedback eingeholt, Backlog angepasst     |
| **Sprint Retrospektive** | 3 h         | Team reflektiert Prozess und plant konkrete Verbesserungen            |

### Der Sprint-Zyklus

```
Product Backlog
      │
      ▼
Sprint Planning ──────────────────────────────────────────┐
      │                                                    │
      ▼                                                    │
Sprint Backlog                                             │
      │                                                    │
      ▼                                                    │
Sprint (1–4 Wochen)                                        │
  ├── Daily Scrum (täglich, 15 Min.)                       │
  ├── Sprint Review ──► Stakeholder-Feedback               │
  └── Retrospektive ──► Prozessverbesserung ───────────────┘
      │
      ▼
Increment (potenziell auslieferbar)
```

---

## 3.5 Definition of Done (DoD)

Die DoD ist eine gemeinsam vereinbarte Liste von Qualitätskriterien, die ein Increment erfüllen **muss**. Sie wird vom Team definiert und gilt für den gesamten Sprint – nicht für einzelne Stories.

**Beispiel-DoD für ein Web-Projekt:**
- ✅ Code wurde reviewed (Peer Review)
- ✅ Unit Tests geschrieben & alle grün
- ✅ Integration Tests bestanden
- ✅ Akzeptanzkriterien der User Story erfüllt
- ✅ Keine offenen P1-Bugs
- ✅ Dokumentation aktualisiert
- ✅ Code in main-Branch gemergt
- ✅ Auf Test-Umgebung deployed & getestet

---

## Übung 2 · Scrum-Rollen zuordnen

⏱ **15 Minuten** · Einzelarbeit, dann Klassendiskussion

Lest die folgenden Situationen und beantwortet: Wer ist verantwortlich – **Product Owner**, **Scrum Master** oder **Developer**? Begründet eure Antwort.

**Situation A:** Das Team hat eine Story nicht fertiggestellt, weil ein externes System nicht verfügbar war. Wer kümmert sich darum, dieses Impediment zu lösen?

```
Verantwortlich: ___________________

Begründung: _______________________________________________________________________
```

**Situation B:** Zwei Stakeholder haben widersprüchliche Anforderungen an ein Feature. Wer entscheidet, welche Anforderung im Sprint umgesetzt wird?

```
Verantwortlich: ___________________

Begründung: _______________________________________________________________________
```

**Situation C:** Das Team stellt fest, dass eine User Story doppelt so aufwendig ist wie geschätzt. Wer entscheidet, ob die Story im Sprint verbleibt oder herausgenommen wird?

```
Verantwortlich: ___________________

Begründung: _______________________________________________________________________
```

**Situation D:** Der Daily Scrum dauert regelmässig 45 Minuten statt 15. Wer ist für die Verbesserung verantwortlich?

```
Verantwortlich: ___________________

Begründung: _______________________________________________________________________
```

**Situation E:** Die Codequalität hat stark abgenommen. Das Team will mehr Zeit in Code-Reviews investieren, der PO will mehr Features. Wer entscheidet?

```
Verantwortlich: ___________________

Begründung: _______________________________________________________________________
```

---

# Teil IV · Scrum Praxis-Projekt

## 4.1 Projektbeschreibung – Arduino Wetterstation

> **Projektziel:** Ihr entwickelt als Team eine **Arduino-basierte Wetterstation** über drei simulierte Sprints. Das System misst Temperatur und Luftfeuchtigkeit, zeigt die Werte auf einem Display an und gibt bei Grenzwertüberschreitung einen Alarm aus. Jeder Sprint entspricht einer Unterrichtseinheit. Alle Scrum-Events finden statt.

### Systemübersicht

```
┌─────────────────────────────────────────────────────────┐
│                  Arduino Wetterstation                   │
│                                                         │
│  [DHT22 Sensor] ──► [Arduino Uno] ──► [LCD 16x2]        │
│  [LDR Sensor]   ──►      │       ──► [RGB LED]          │
│                          │       ──► [Buzzer]            │
│                          └───────► [Serial Monitor]      │
└─────────────────────────────────────────────────────────┘
```

### Benötigte Hardware (pro Team)

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

### Technologie-Stack

| Schicht                | Technologie                                 |
| ---------------------- | ------------------------------------------- |
| Mikrocontroller        | Arduino C++ (Arduino IDE)                   |
| Bibliotheken           | `DHT.h`, `LiquidCrystal_I2C.h`              |
| Serielle Kommunikation | Arduino Serial Monitor / Python-Script      |
| Optionale Erweiterung  | Python + `pyserial` für Datenlogging auf PC |

---

## 4.2 Rollenverteilung

| Rolle                     | Person | Hauptaufgaben im Arduino-Projekt                                                              |
| ------------------------- | ------ | --------------------------------------------------------------------------------------------- |
| **Product Owner**         |        | Backlog pflegen, Akzeptanzkriterien definieren (z. B. «Sensor liest alle 2 s»), Demo abnehmen |
| **Scrum Master**          |        | Events moderieren, Impediments lösen (z. B. fehlende Bauteile), Team schützen                 |
| **Developer HW**          |        | Schaltung aufbauen, Sensoren anschliessen, Verkabelung dokumentieren                          |
| **Developer SW**          |        | Arduino-Sketch schreiben, Bibliotheken einbinden, testen                                      |
| **Developer Integration** |        | HW + SW zusammenführen, Serial-Output, optionales Python-Logging                              |

> 💡 In kleinen Teams (3 Personen) übernimmt der PO auch Entwicklungsaufgaben. Die Rollen können pro Sprint rotieren.

---

## Übung 3 · Sprint 1 – Sensor auslesen & Display anzeigen

⏱ **60 Minuten**

**Sprint-Ziel:** Der DHT22-Sensor ist angeschlossen und zeigt Temperatur & Luftfeuchtigkeit alle 2 Sekunden auf dem LCD-Display an.

**Sprint Planning (15 Min.)**
1. Wählt User Stories aus dem Product Backlog (→ Anhang A)
2. Definiert das Sprint-Ziel als Team
3. Schätzt die Stories in Story Points (Planning Poker)
4. Erstellt euren Sprint Backlog (Board: To Do / In Progress / Review / Done)

**Entwicklung (35 Min.)**
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

### Sprint 1 – Daily Scrum Protokoll

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

### Sprint 1 – Retrospektive

**Methode: Start / Stop / Continue**

| 🟢 Start (anfangen) | 🔴 Stop (aufhören) | 🔵 Continue (beibehalten) |
| ------------------ | ----------------- | ------------------------ |
|                    |                   |                          |
|                    |                   |                          |
|                    |                   |                          |

**Massnahmen für Sprint 2:**

| Massnahme | Verantwortlich | Bis wann |
| --------- | -------------- | -------- |
|           |                |          |
|           |                |          |

---

## Übung 4 · Sprint 2 – Grenzwerte, Alarm & Helligkeitsmessung

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

### Burndown-Diagramm Sprint 2

Tragt täglich den verbleibenden Aufwand in Story Points ein:

```
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

## Übung 5 · Sprint 3 – Datenlogging, Kalibrierung & Präsentation

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

---

# Teil V · Referenz, Lösungshinweise & Glossar

## Anhang A – Beispiel Product Backlog: Arduino Wetterstation

| #   | User Story                                                                                                                        | MoSCoW |  SP   | Sprint |
| --- | --------------------------------------------------------------------------------------------------------------------------------- | ------ | :---: | :----: |
| 1   | Als Nutzer möchte ich, dass der DHT22-Sensor die Temperatur ausliest, damit ich aktuelle Messwerte erhalte.                       | Must   |   2   |   S1   |
| 2   | Als Nutzer möchte ich, dass die Luftfeuchtigkeit ebenfalls gemessen wird, damit ich das Raumklima beurteilen kann.                | Must   |   1   |   S1   |
| 3   | Als Nutzer möchte ich die Messwerte auf dem LCD-Display sehen, damit ich sie ohne PC ablesen kann.                                | Must   |   3   |   S1   |
| 4   | Als Nutzer möchte ich, dass die Werte alle 2 Sekunden aktualisiert werden, damit die Anzeige stets aktuell ist.                   | Must   |   2   |   S1   |
| 5   | Als Nutzer möchte ich, dass die RGB LED bei normaler Temperatur grün leuchtet, damit ich den Status auf einen Blick erkenne.      | Should |   2   |   S2   |
| 6   | Als Nutzer möchte ich, dass die LED bei Temperatur > 25 °C gelb wird, damit ich früh gewarnt werde.                               | Should |   2   |   S2   |
| 7   | Als Nutzer möchte ich, dass der Buzzer bei Temperatur > 28 °C Alarm schlägt, damit ich auch ohne Sichtkontakt gewarnt werde.      | Must   |   3   |   S2   |
| 8   | Als Nutzer möchte ich die Helligkeit im Raum per LDR messen und auf dem Display sehen, damit ich das Gesamtklima beurteilen kann. | Could  |   3   |   S2   |
| 9   | Als Nutzer möchte ich, dass Messwerte über die serielle Schnittstelle ausgegeben werden, damit ich sie auf dem PC loggen kann.    | Should |   2   |   S3   |
| 10  | Als Entwickler möchte ich einen Python-Logger, der Messwerte in eine CSV-Datei schreibt, damit Verläufe analysiert werden können. | Could  |   5   |   S3   |
| 11  | Als Nutzer möchte ich konfigurierbare Grenzwerte (Warn/Alarm), damit die Station für verschiedene Räume anpassbar ist.            | Could  |   5   |   S3   |
| 12  | Als Nutzer möchte ich einen Schaltplan der gesamten Station, damit das System reproduzierbar aufgebaut werden kann.               | Must   |   3   |   S3   |

---

## Anhang B – Lösungshinweise Übung 2

**Situation A → Scrum Master**
Der SM ist verantwortlich, Impediments zu identifizieren, sichtbar zu machen und zu lösen. Externe Blockaden (wie nicht verfügbare Systeme) fallen direkt in seine Verantwortung.

**Situation B → Product Owner**
Der PO ist die einzige Person, die über Anforderungen und deren Priorisierung entscheidet. Bei widersprüchlichen Stakeholder-Anforderungen trifft er die Entscheidung.

**Situation C → Developer (Schätzung) + Product Owner (Scope)**
Das Team schätzt den Aufwand. Der PO entscheidet dann gemeinsam mit dem Team, ob die Story im Sprint verbleibt, verkleinert oder herausgenommen wird.

**Situation D → Scrum Master**
Der SM sorgt für die effektive Durchführung der Scrum Events. Ein Daily Scrum, der aus dem Ruder läuft, ist ein typisches Coaching-Thema für den SM.

**Situation E → Developer (Qualität ist nicht verhandelbar) + PO (Backlog)**
Die DoD und technische Qualität werden nicht verhandelt. Technical Debt muss als explizite Story im Backlog sichtbar gemacht und vom PO priorisiert werden.

---

## Anhang C – Glossar

| Begriff                | Erklärung                                                                                                 |
| ---------------------- | --------------------------------------------------------------------------------------------------------- |
| **Backlog Refinement** | Regelmässige Pflege des Product Backlogs: Stories klären, schätzen, priorisieren (ca. 10 % der Kapazität) |
| **Burndown Chart**     | Diagramm, das verbleibenden Aufwand vs. verbleibende Zeit im Sprint zeigt                                 |
| **Definition of Done** | Gemeinsam vereinbarte Liste von Qualitätskriterien für ein fertiges Increment                             |
| **Epic**               | Grosse User Story, die in kleinere Stories aufgeteilt werden muss                                         |
| **Impediment**         | Hindernis, das das Team beim Fortschritt blockiert                                                        |
| **Increment**          | Potenziell auslieferbares Produktergebnis am Sprint-Ende – Summe aller bisherigen Increments              |
| **Kanban Board**       | Visuelles Board zur Darstellung des Arbeitsfortschritts (To Do / In Progress / Done)                      |
| **Planning Poker**     | Schätztechnik, bei der alle Developer gleichzeitig ihre Schätzung aufdecken                               |
| **Product Backlog**    | Geordnete, lebende Liste aller Anforderungen an das Produkt                                               |
| **Product Owner**      | Verantwortliche Person für Produktwert und Product Backlog                                                |
| **Scrum Master**       | Servant Leader, der Team und Organisation bei der Anwendung von Scrum unterstützt                         |
| **Sprint**             | Zeitboxed Iteration (1–4 Wochen), die ein fertiges Increment liefert                                      |
| **Sprint Goal**        | Kurzes, messbares Ziel, das den Sprint fokussiert                                                         |
| **Story Point**        | Relative Masseinheit für den Aufwand einer User Story (nicht Stunden!)                                    |
| **User Story**         | Kurze Beschreibung einer Anforderung aus Nutzerperspektive                                                |
| **Velocity**           | Durchschnittlich abgeschlossene Story Points pro Sprint – Planungsgrösse, kein KPI                        |

---

*HF Lehrgang · Agile Softwareentwicklung & Scrum · Unterrichtsmaterial*
