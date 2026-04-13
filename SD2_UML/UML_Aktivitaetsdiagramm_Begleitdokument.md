# UML Aktivitätsdiagramm
## Unterrichtsmaterial & Übungsaufgaben

|                    |                                     |
| ------------------ | ----------------------------------- |
| **Lehrgang**       | Informatiker/in HF                  |
| **Fach**           | Software Engineering / Modellierung |
| **Dauer**          | ca. 90 Minuten (inkl. Übungen)      |
| **Lernziel-Stufe** | Verstehen, Anwenden (Bloom 2–3)     |

---

## 1. Lernziele

Nach dieser Lektion können die Studierenden:

1. Den Sinn und Zweck von UML allgemein erläutern und in eigenen Worten beschreiben, warum modellbasierte Kommunikation in der Softwareentwicklung wichtig ist.
2. Die 10 Kernelemente eines Aktivitätsdiagramms benennen, beschreiben und korrekt zeichnen.
3. Ein vorgegebenes Aktivitätsdiagramm lesen, interpretieren und den beschriebenen Ablauf in Worte fassen.
4. Einen einfachen bis mittelschweren Ablauf mit Verzweigungen und Schleifen selbständig als Aktivitätsdiagramm modellieren.
5. Häufige Modellierungsfehler (fehlende Guards, falsches Endknoten-Symbol, unvollständige Pfade) erkennen und korrigieren.

---

## 2. Theorie: Was ist UML?

### 2.1 Definition und Geschichte

**UML** steht für **Unified Modeling Language** und ist eine grafische Modellierungssprache zur Beschreibung, Visualisierung und Dokumentation von Software-Systemen. Sie wurde von der Object Management Group (OMG) 1997 als Standard verabschiedet und liegt heute in **Version 2.5** vor.

Vor UML existierten zahlreiche konkurrierende Notationen (Booch, Rumbaugh/OMT, Jacobson/OOSE), was zu Kommunikationsproblemen in interdisziplinären Teams führte. UML vereinheitlichte diese Ansätze zu einer einzigen, standardisierten Sprache.

### 2.2 Warum UML in der Praxis?

- **Gemeinsame Sprache:** Entwickler, Architekten, Business-Analysten und Kunden verwenden dieselbe Notation – unabhängig von Programmiersprache oder Technologie.
- **Frühe Fehlererkennung:** Logikfehler werden im Modell sichtbar, bevor teurer Code geschrieben wird.
- **Dokumentation:** Anforderungen und Systemabläufe werden formal und nachvollziehbar festgehalten.
- **Abstraktion:** Technologie- und sprachunabhängige Kommunikation über Systemgrenzen hinweg.
- **Testbasis:** Aus Aktivitätsdiagrammen lassen sich systematisch Testfälle und Testpfade ableiten.

### 2.3 UML-Diagrammtypen

UML 2.5 definiert 14 Diagrammtypen, eingeteilt in zwei Kategorien:

| Strukturdiagramme (statisch) | Verhaltensdiagramme (dynamisch) |
| ---------------------------- | ------------------------------- |
| Klassendiagramm              | **Aktivitätsdiagramm ← heute!** |
| Objektdiagramm               | Use-Case-Diagramm               |
| Komponentendiagramm          | Sequenzdiagramm                 |
| Paketdiagramm                | Zustandsdiagramm                |
| Verteilungsdiagramm          | Kommunikationsdiagramm          |

---

## 3. Theorie: Das Aktivitätsdiagramm

### 3.1 Definition und Einsatzgebiete

> **Definition:** Ein Aktivitätsdiagramm beschreibt den Ablauf von Aktivitäten (Aktionen) innerhalb eines Systems. Es zeigt, **WIE** etwas abläuft – mit Verzweigungen, Schleifen und parallelen Pfaden.

Typische Einsatzgebiete:

- Geschäftsprozesse (z.B. Bestellabwicklung, Genehmigungsworkflow)
- Softwareabläufe und Algorithmen (z.B. Login-Logik, Datenbankzugriff)
- Use-Case-Realisierungen (Detaillierung von Anwendungsfällen)
- Ableitung von Testfällen (jeder Pfad = potentieller Testfall)

*Wichtig: Das Aktivitätsdiagramm ist kein einfaches Flussdiagramm. Es ist formal standardisiert, objektorientiert und präziser in Notation und Semantik.*

### 3.2 Die 10 Kernelemente

| Symbol                    | Element                     | Beschreibung                                                                   |
| ------------------------- | --------------------------- | ------------------------------------------------------------------------------ |
| `●` (ausgefüllter Kreis)  | **Startknoten**             | Einziger Einstiegspunkt; genau 1 pro Diagramm; kein eingehender Pfeil          |
| `⊙` (Kreis mit Punkt)     | **Aktivitätsendknoten**     | Beendet den gesamten Ablauf; mehrere möglich                                   |
| `✕` (Kreis mit X)         | **Flussendknoten**          | Beendet nur einen Zweig, nicht den gesamten Ablauf                             |
| Abger. Rechteck           | **Aktion / Aktivität**      | Beschriftet mit Verb + Substantiv; 1 eingehend, 1 ausgehend                    |
| `◆` (mehrere ausgehend)   | **Entscheidungsknoten**     | Verzweigung; alle Pfeile tragen Guards `[...]`; Guards müssen vollständig sein |
| `◆` (mehrere eingehend)   | **Zusammenführung (Merge)** | Führt mehrere Pfade zusammen; keine Guards nötig                               |
| Dicker Balken (→ mehrere) | **Fork (Aufspaltung)**      | Startet parallele / nebenläufige Aktivitäten                                   |
| Dicker Balken (mehrere →) | **Join (Synchronisation)**  | Wartet auf alle parallelen Pfade; erst dann Fortsetzung                        |
| Pfeil `→`                 | **Kontrollfluss**           | Verbindet Elemente; Beschriftung optional; Guard bei Entscheidung              |
| Rechteck mit Trennlinie   | **Partition / Swim Lane**   | Zeigt Verantwortlichkeit (Rolle, System, Abteilung)                            |

### 3.3 Guards – Wächterbedingungen

An jedem Entscheidungsknoten (`◆`) werden die ausgehenden Pfeile mit **Guards** beschriftet. Guards stehen in eckigen Klammern und beschreiben die Bedingung, unter der dieser Pfad gewählt wird.

**Regeln für Guards:**

- Notation immer in eckigen Klammern: `[Bedingung]`
- **Vollständigkeit:** Alle möglichen Fälle müssen durch Guards abgedeckt sein
- **Disjunktheit:** Kein Fall darf durch zwei Guards gleichzeitig wahr sein
- `[else]` als Auffangbedingung für den Standardfall zulässig

**Beispiele:**
- `[Zahlung erfolgreich]` / `[Zahlung fehlgeschlagen]`
- `[Lagerbestand > 0]` / `[else]`
- `[korrekt]` / `[falsch & Versuche < 3]` / `[falsch & Versuche = 3]`

### 3.4 Verzweigungen: Decision und Merge

Beide Knoten verwenden das **gleiche Symbol `◆`** – der Unterschied liegt in der Anzahl der Pfeile:

|                       | Decision Node (Entscheidung) | Merge Node (Zusammenführung) |
| --------------------- | ---------------------------- | ---------------------------- |
| **Eingehende Pfeile** | 1                            | 2 oder mehr                  |
| **Ausgehende Pfeile** | 2 oder mehr                  | 1                            |
| **Guards**            | Pflicht an allen Ausgängen   | Nicht nötig                  |
| **Entspricht**        | `if / else if / else`        | Zusammenführung von Pfaden   |

```
Decision:          Merge:

    |               |    |
    ↓              ↓    ↓
    ◆               ◆
   / \              |
  ↓   ↓             ↓
```

### 3.5 Schleifen

Schleifen entstehen durch einen **Rückwärtspfeil** – ein Entscheidungsknoten leitet einen Pfad zurück zu einer früheren Stelle im Diagramm.

**Pre-Check (while):** Entscheidung vor dem Schleifenkörper → Schleife kann 0-mal ausgeführt werden.

```
●
|
↓
◆ ──[Abbruch]──→ (●)
|
[weiter]
↓
╭──────────╮
│ Aktion   │
╰──────────╯
|
↑___________│  (Rückwärtspfeil)
```

**Post-Check (do-while):** Entscheidung nach dem Schleifenkörper → mindestens 1 Durchlauf garantiert.

```
●
|
↓
╭──────────╮
│ Aktion   │ ←──────┐
╰──────────╯         │
|                     │
↓                     │
◆                     │
|[weiter]    [fertig] │
│               ↓     │
│              (●)    │
└──────────────────────┘
```

### 3.6 Swim Lanes (Partitionen)

Swim Lanes unterteilen das Diagramm in Bereiche, die jeweils einer **Rolle, Abteilung oder einem System** zugeordnet sind. Sie zeigen, **WER** für welche Aktion verantwortlich ist.

- Notation: `«partition»` oberhalb des Bereichs angeben
- Kontrollflüsse können Swim-Lane-Grenzen überschreiten
- Ideal für Geschäftsprozesse mit mehreren Akteuren

---

## 4. Übungsaufgaben

Die folgenden Aufgaben sind nach dem Prinzip des **kompetenzorientierten Lernens** aufgebaut: von Lesen und Verstehen (A1) über Anwenden (A2, A3) bis zum kritischen Analysieren (A4).

---

### Aufgabe A1 – Diagramm lesen & interpretieren

|            |               |
| ---------- | ------------- |
| **Typ**    | Einzelarbeit  |
| **Zeit**   | 10 Minuten    |
| **Niveau** | ⭐ Grundlegend |

#### Aufgabenstellung

Betrachten Sie das folgende Aktivitätsdiagramm eines **E-Mail-Versandprozesses** und beantworten Sie die Fragen.

```
                    ●
                    |
                    ↓
          ╭───────────────────╮
          │  E-Mail verfassen  │
          ╰───────────────────╯
                    |
                    ↓
                    ◆
                   / \
      [Empfänger  /   \ [Empfänger
        gültig]  /     \  ungültig]
                ↓       ↓
   ╭──────────────╮  ╭──────────────╮
   │ E-Mail senden │  │Fehler anzeigen│
   ╰──────────────╯  ╰──────────────╯
          |                  |
          ↓                  ↓
 ╭────────────────────╮     (●)
 │Sendebericht speichern│  (Fehler-Ende)
 ╰────────────────────╯
          |
          ↓
         (●)
      (Erfolg-Ende)
```

#### Fragen

1. Wie viele **Aktionsknoten** enthält das Diagramm? Benennen Sie sie alle.

   _Antwort:_ _______________________________________________

2. Wie viele **Endknoten** hat das Diagramm und welchen Typ haben sie?

   _Antwort:_ _______________________________________________

3. Welche **Guards** sind an der Entscheidungsraute vorhanden? Sind sie vollständig? Begründen Sie.

   _Antwort:_ _______________________________________________

4. Was passiert, wenn der Empfänger **ungültig** ist?

   _Antwort:_ _______________________________________________

5. Enthält das Diagramm eine **Schleife**? Begründen Sie Ihre Antwort.

   _Antwort:_ _______________________________________________

---

### Aufgabe A2 – Aktivitätsdiagramm selbst zeichnen

|            |              |
| ---------- | ------------ |
| **Typ**    | Einzelarbeit |
| **Zeit**   | 20 Minuten   |
| **Niveau** | ⭐⭐ Mittel    |

#### Aufgabenstellung

Modellieren Sie den folgenden Ablauf als **vollständiges Aktivitätsdiagramm**. Verwenden Sie korrekte UML-Notation für alle Elemente.

> **Szenario: Geldautomat (ATM) – Bargeld abheben**
>
> 1. Bankkarte einstecken
> 2. PIN eingeben
> 3. PIN prüfen:
>    - Korrekt → weiter mit Schritt 4
>    - Falsch → Fehlermeldung anzeigen
>      - Versuche < 3 → zurück zu Schritt 2 (Schleife!)
>      - Versuche = 3 → Karte einziehen → **ENDE** (Sperrung)
> 4. Betrag eingeben
> 5. Kontodeckung prüfen:
>    - Ausreichend → Bargeld ausgeben → Karte zurückgeben → **ENDE** (Erfolg)
>    - Nicht ausreichend → Fehlermeldung → Karte zurückgeben → **ENDE**

#### Hinweise zur Bearbeitung

- Beginnen Sie mit dem Startknoten und arbeiten Sie sich schrittweise durch den Ablauf.
- Markieren Sie alle Guards an den Entscheidungsknoten deutlich in eckigen Klammern.
- Achten Sie auf die **Schleife** bei falscher PIN (Rückwärtspfeil einzeichnen).
- Verwenden Sie **unterschiedliche Endknoten** für Sperrung, Erfolg und fehlende Deckung.

#### Zeichenfläche

```
(Hier Diagramm zeichnen)




```

*(mind. A4 Papier oder Whiteboard verwenden)*

#### Bewertungskriterien

| Kriterium                                               | Max. Punkte | Erreicht |
| ------------------------------------------------------- | ----------- | -------- |
| Startknoten und Endknoten korrekt (Typen, Anzahl)       | 2           |          |
| Alle Aktionsknoten korrekt benannt (Verb + Substantiv)  | 3           |          |
| Entscheidungsknoten mit vollständigen Guards            | 3           |          |
| Schleife für falsche PIN-Eingabe korrekt modelliert     | 3           |          |
| Kontrollflüsse korrekt eingezeichnet (Richtung, Guards) | 2           |          |
| Lesbarkeit und korrekte UML-Notation                    | 2           |          |
| **Total**                                               | **15**      |          |

---

### Aufgabe A3 – Komplexer Prozess (Gruppenaufgabe)

|            |                              |
| ---------- | ---------------------------- |
| **Typ**    | Gruppenarbeit (2–3 Personen) |
| **Zeit**   | 25 Minuten                   |
| **Niveau** | ⭐⭐⭐ Anspruchsvoll            |

#### Aufgabenstellung

Modellieren Sie gemeinsam den folgenden **Online-Retouren-Prozess** als Aktivitätsdiagramm **mit Swim Lanes**. Verteilen Sie die Rollen innerhalb der Gruppe.

> **Szenario: Retouren-Prozess**
> *(3 Swim Lanes: Kunde / System / Lager)*
>
> **Kunde:** Retoure online anmelden → Retourengrund angeben
>
> **System:** Retoure registrieren → Retourenlabel generieren → Label per E-Mail senden
>
> **Kunde:** Paket verpacken → Paket absenden
>
> **System:** Paketeingang prüfen:
> - Paket eingegangen → Ware prüfen (weiter zum Lager)
> - Nicht eingegangen (nach 14 Tagen) → Mahnung versenden → nochmals prüfen (Schleife, max. 2×)
>
> **Lager:** Ware prüfen:
> - Ware einwandfrei → Rückbuchung durchführen → **ENDE**
> - Ware beschädigt → Schadensprotokoll erstellen → Rückbuchung ablehnen → **ENDE**

#### Gruppenrollen

- **Person 1 (Modellierung):** Zeichnet das Diagramm
- **Person 2 (Review):** Prüft Guards, Vollständigkeit und Korrektheit der Notation
- **Person 3 (Präsentation):** Erklärt das Ergebnis der Klasse (5 Minuten)

#### Zeichenfläche

*(A3-Papier oder Whiteboard verwenden – Swim Lanes horizontal aufteilen)*

```
«partition» Retouren-Prozess
┌────────────────┬────────────────┬────────────────┐
│    Kunde       │    System      │     Lager      │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
│                │                │                │
└────────────────┴────────────────┴────────────────┘
```

#### Diskussionsfragen nach der Präsentation

1. Warum wurden drei Swim Lanes gewählt? Welche Alternative gäbe es?

   _Antwort:_ _______________________________________________

2. Wie viele mögliche Pfade (Testfälle) hat das Diagramm mindestens?

   _Antwort:_ _______________________________________________

3. Was passiert, wenn das Paket nach der 2. Mahnung noch immer nicht eingegangen ist – fehlt hier etwas im Diagramm?

   _Antwort:_ _______________________________________________

---

### Aufgabe A4 – Fehler im Diagramm finden & korrigieren

|            |                            |
| ---------- | -------------------------- |
| **Typ**    | Einzel- oder Partnerarbeit |
| **Zeit**   | 15 Minuten                 |
| **Niveau** | ⭐⭐ Mittel                  |

#### Aufgabenstellung

Das folgende Aktivitätsdiagramm enthält **5 Modellierungsfehler**. Finden und benennen Sie alle Fehler und beschreiben Sie die korrekte Lösung.

```
Fehlerhaftes Diagramm – Passwort zurücksetzen:

         ●
         |
         ↓
╭─────────────────╮
│ E-Mail eingeben  │
╰─────────────────╯
         |
         ↓
         ◆
        / \
  [ja] /   \ [nein]
      ↓     ↓
╭──────────────╮   (kein weiterer Pfad  ← FEHLER?)
│Best.-mail    │    angegeben)
│senden        │
╰──────────────╯
      |
      ↓
╭──────────────╮
│Neues Passwort│ ← (taucht ein zweites Mal auf, ohne Merge-Knoten)
│eingeben      │
╰──────────────╯
      |
      ↓
      ◆
     / \                     ← (Guards fehlen)
    ↓   ↓
╭──────────────╮  ╭──────────────╮
│Passwort      │  │Passwort      │  ← (beide Pfade führen zum selben Ergebnis?)
│speichern     │  │speichern     │
╰──────────────╯  ╰──────────────╯

(Kein Endknoten vorhanden)          ← FEHLER?
```

#### Fehler dokumentieren

| #   | Beschreibung des Fehlers | Korrekte Lösung | Betroffenes Element |
| --- | ------------------------ | --------------- | ------------------- |
| 1   |                          |                 |                     |
| 2   |                          |                 |                     |
| 3   |                          |                 |                     |
| 4   |                          |                 |                     |
| 5   |                          |                 |                     |

---

## 5. Kurzreferenz (Spickzettel)

### Alle Elemente auf einen Blick

| Symbol                   | Element             | Schlüsselregel                                            |
| ------------------------ | ------------------- | --------------------------------------------------------- |
| `●`                      | Startknoten         | Genau 1 pro Diagramm; kein eingehender Pfeil              |
| `⊙`                      | Aktivitätsendknoten | Beendet den gesamten Ablauf                               |
| `✕`                      | Flussendknoten      | Beendet nur einen Zweig                                   |
| `╭──╮` (abger. Rechteck) | Aktion              | Verb + Substantiv; 1 ein, 1 aus                           |
| `◆` (1 rein, n raus)     | Decision            | Guards `[...]` an allen Ausgängen; vollständig & disjunkt |
| `◆` (n rein, 1 raus)     | Merge               | Keine Guards; führt Pfade zusammen                        |
| `━━━━━` (1 rein, n raus) | Fork                | Startet Parallelabläufe                                   |
| `━━━━━` (n rein, 1 raus) | Join                | Synchronisiert Parallelabläufe                            |
| `→`                      | Kontrollfluss       | Verbindet Elemente; Guard in `[...]` bei Decision         |
| Swim Lane                | Partition           | `«partition»` als Bezeichnung; zeigt Verantwortlichkeit   |

### Checkliste – Fertig ist das Diagramm, wenn:

- [ ] Genau 1 Startknoten vorhanden
- [ ] Mindestens 1 Endknoten vorhanden (Typ beachten!)
- [ ] Alle Entscheidungsknoten haben vollständige Guards in `[...]`
- [ ] Alle Aktionen mit Verb + Substantiv benannt
- [ ] Alle Pfeile haben eine klare Richtung (keine Ambiguität)
- [ ] Decision- und Merge-Knoten korrekt unterschieden (Anzahl der Pfeile!)
- [ ] Schleifen haben einen Rückwärtspfeil mit Guard für den Abbruch

### Häufige Fehler

| Fehler                                       | Korrekte Lösung                                              |
| -------------------------------------------- | ------------------------------------------------------------ |
| Guards fehlen an Entscheidungsknoten         | Alle Ausgänge mit `[Bedingung]` beschriften                  |
| Guards unvollständig (nicht alle Fälle)      | `[else]` als Auffang-Guard hinzufügen                        |
| Kein Endknoten                               | Jeden Pfad mit einem Endknoten abschliessen                  |
| Aktion mit Substantiv benannt (`"Rechnung"`) | Verb + Substantiv: `"Rechnung erstellen"`                    |
| Decision und Merge verwechselt               | Decision: 1 rein, mehrere raus · Merge: mehrere rein, 1 raus |
| Mehrere Startknoten                          | Genau 1 Startknoten; Zusammenführung via Merge               |

---

## 6. Lösungshinweise (für Dozierende)

### Musterlösung A1 – E-Mail Versandprozess

1. **3 Aktionsknoten:** E-Mail verfassen, E-Mail senden, Sendebericht speichern
2. **2 Endknoten**, beide vom Typ Aktivitätsendknoten `⊙`
3. **Guards:** `[Empfänger gültig]` und `[Empfänger ungültig]` → vollständig, da beide Fälle abgedeckt und disjunkt
4. Bei ungültigem Empfänger: Fehler anzeigen → Aktivitätsende (Abbruch)
5. **Keine Schleife** – es gibt keinen Rückwärtspfeil; jeder Pfad führt direkt zu einem Endknoten

### Erwartete Elemente im Diagramm A2 – Geldautomat

- 1 Startknoten
- **Aktionen:** Bankkarte einstecken, PIN eingeben, Fehlermeldung anzeigen, Karte einziehen, Betrag eingeben, Bargeld ausgeben, Karte zurückgeben
- **2 Entscheidungsknoten:** PIN prüfen `[korrekt]/[falsch]`, Kontodeckung `[ausreichend]/[nicht ausreichend]`
- **1 Merge-Knoten** nach der PIN-Schleife (führt ersten Durchlauf und Schleifendurchläufe zusammen)
- **Schleife:** `[falsch]` + `[Versuche < 3]` → zurück zu "PIN eingeben"
- **Zusätzlicher Guard:** `[Versuche = 3]` → Karte einziehen
- **3 Endknoten:** Erfolg (Bargeld ausgegeben), Sperrung (Karte eingezogen), kein Geld (Deckung fehlt)

### Musterlösung A4 – 5 Fehler

| #   | Fehler                                                                               | Lösung                                                                                |
| --- | ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------- |
| 1   | Fehlender Endknoten im `[nein]`-Zweig nach "Fehlermeldung"                           | Endknoten `⊙` nach "Fehler anzeigen" ergänzen                                         |
| 2   | Guards am Entscheidungsknoten (Passwörter) fehlen                                    | `[identisch]` und `[nicht identisch]` beschriften                                     |
| 3   | `[nicht identisch]` führt ebenfalls zu "Passwort speichern" statt zurück zur Eingabe | Pfad `[nicht identisch]` als Schleife zurück zu "Neues Passwort eingeben"             |
| 4   | Fehlender Endknoten am Ende des Diagramms                                            | Endknoten `⊙` nach "Passwort speichern" hinzufügen                                    |
| 5   | "Neues Passwort eingeben" erscheint zweimal ohne korrekten Merge-Knoten              | Merge-Knoten `◆` einfügen, der Bestätigungs-Pfad und ggf. Schleifenpfad zusammenführt |

*Hinweis: Leicht unterschiedliche aber gleichermassen korrekte Lösungen sind möglich. Wichtig ist die korrekte Verwendung aller Elemente.*

---

*HF Lehrgang · Software Engineering · UML Aktivitätsdiagramm*
