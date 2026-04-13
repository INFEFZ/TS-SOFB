# UML Aktivitätsdiagramm
## Unterrichtspräsentation – HF Lehrgang Software Engineering

> **Lernziele:** Elemente kennen · Diagramme lesen & erstellen · Sinn und Zweck erläutern

---

## Lernpfad – Heutiger Unterricht

| #   | Thema               | Inhalt                     |
| --- | ------------------- | -------------------------- |
| 01  | Was ist UML?        | Sinn, Zweck & Geschichte   |
| 02  | Aktivitätsdiagramm  | Überblick & Einsatzgebiet  |
| 03  | Elemente & Notation | Alle Bausteine im Detail   |
| 04  | Verzweigungen       | Entscheidungen & Guards    |
| 05  | Schleifen           | Wiederholungen modellieren |
| 06  | Praxisbeispiel      | Bestellprozess komplett    |
| 07  | Übungsaufgaben      | Selbständig & in Gruppen   |

---

## 01 · Was ist UML?

### Definition

**UML** = **U**nified **M**odeling **L**anguage

- Grafische Modellierungssprache für Software-Systeme
- Standard der **Object Management Group (OMG)** seit 1997, aktuell Version 2.5
- **14 Diagrammtypen** in 2 Kategorien:
  - Strukturdiagramme (statisch)
  - Verhaltensdiagramme (dynamisch)
- Das **Aktivitätsdiagramm** ist ein Verhaltensdiagramm

### Warum UML in der Praxis?

| Nutzen                  | Beschreibung                                                 |
| ----------------------- | ------------------------------------------------------------ |
| 💬 Gemeinsame Sprache    | Entwickler, Architekten & Kunden verstehen dasselbe Diagramm |
| 📋 Dokumentation         | Anforderungen & Abläufe werden präzise festgehalten          |
| 🔍 Frühe Fehlererkennung | Logikfehler im Modell erkennen, bevor Code geschrieben wird  |
| 🔄 Abstraktion           | Technologie- und sprachunabhängige Kommunikation             |

---

## 02 · Aktivitätsdiagramm – Überblick

> **Definition:** Ein Aktivitätsdiagramm beschreibt den **Ablauf von Aktivitäten (Aktionen)** innerhalb eines Systems. Es zeigt, **WIE** etwas abläuft – mit Verzweigungen, Schleifen und parallelen Pfaden.

### Typische Einsatzgebiete

| Bereich              | Beispiele                                                      |
| -------------------- | -------------------------------------------------------------- |
| ⚙️ Geschäftsprozesse  | Bestellabwicklung, Genehmigungsworkflows, HR-Prozesse          |
| 💻 Software-Abläufe   | Use-Case-Realisierungen, Algorithmen, API-Interaktionen        |
| 🧪 Testfälle ableiten | Alle Pfade sichtbar machen → systematisch Testfälle generieren |

> 💡 **Merke:** Das Aktivitätsdiagramm ist **kein Flussdiagramm (Flowchart)** – es ist präziser, formal standardisiert und objektorientierten Prinzipien verpflichtet.

---

## 03 · Elemente & Notation – Übersicht

| Symbol                         | Element                     | Beschreibung                                     |
| ------------------------------ | --------------------------- | ------------------------------------------------ |
| `●` (ausgefüllter Kreis)       | **Startknoten**             | Einziger Einstiegspunkt · kein eingehender Pfeil |
| `⊙` (Kreis mit Punkt)          | **Aktivitätsendknoten**     | Beendet den gesamten Ablauf                      |
| `✕` (Kreis mit X)              | **Flussendknoten**          | Beendet nur einen Zweig                          |
| Abgerundetes Rechteck          | **Aktion / Aktivität**      | Beschriftet mit Verb + Substantiv                |
| `◆` (1 rein, mehrere raus)     | **Entscheidungsknoten**     | Verzweigung mit Guards `[Bedingung]`             |
| `◆` (mehrere rein, 1 raus)     | **Zusammenführung (Merge)** | Führt Pfade zusammen, keine Guards               |
| Dicker Balken (rein → mehrere) | **Fork (Aufspaltung)**      | Startet parallele Abläufe                        |
| Dicker Balken (mehrere → raus) | **Join (Synchronisation)**  | Wartet auf alle parallelen Pfade                 |
| `→` Pfeil                      | **Kontrollfluss**           | Verbindet Elemente; Beschriftung optional        |
| Rechteck mit Trennlinie        | **Swim Lane / Partition**   | Zeigt Verantwortlichkeit (Rolle, System)         |

---

## 03 · Elemente im Detail (1/2)

### Startknoten `●`

```
         ●          ← Ausgefüllter Kreis
         |
         ↓
  ╭─────────────╮
  │ Erste Aktion │
  ╰─────────────╯
```

**Regeln:**
- Genau **EIN** Startknoten pro Diagramm
- **Kein** eingehender Kontrollfluss
- Immer ein ausgehender Pfeil zur ersten Aktion

### Aktion / Aktivität

```
  ╭─────────────────────╮
  │  Bestellung erfassen │   ← Verb + Substantiv
  ╰─────────────────────╯
           |
           ↓
  ╭─────────────────────╮
  │  Rechnung erstellen  │
  ╰─────────────────────╯
```

**Regeln:**
- **Abgerundetes Rechteck** als Notation
- Beschriftung immer im **aktiven Stil**: Verb + Substantiv
- Genau **1 eingehend**, **1 ausgehend** (Ausnahme: Fork/Join)

---

## 03 · Elemente im Detail (2/2)

### Entscheidungsknoten `◆`

```
           ↓
          ◆           ← Raute (Decision)
         / \
   [ja] /   \ [nein]
       ↓     ↓
   Pfad A   Pfad B
       \     /
        \   /
         ◆           ← Raute (Merge)
         |
         ↓
```

**Regeln:**
- Guards **immer** in eckigen Klammern: `[Bedingung]`
- Guards müssen **vollständig** (alle Fälle) und **disjunkt** (kein Überschneiden) sein
- `[else]` als Auffangbedingung für den Standardfall möglich

### Aktivitätsendknoten `⊙`

```
  ╭──────────────────╮
  │ Bestätigung senden│
  ╰──────────────────╯
           |
           ↓
          (●)         ← Kreis mit ausgefülltem Punkt innen
                        = Aktivitätsende
```

**Zwei Typen im Vergleich:**

| Symbol              | Typ                 | Wirkung                         |
| ------------------- | ------------------- | ------------------------------- |
| `⊙` Kreis mit Punkt | Aktivitätsendknoten | Beendet den **gesamten** Ablauf |
| `✕` Kreis mit X     | Flussendknoten      | Beendet nur **einen Zweig**     |

---

## 04 · Verzweigungen – Decision & Merge

### Beispiel: Login-Validierung

```
         ●
         |
         ↓
  ╭──────────────────╮
  │ Credentials prüfen│
  ╰──────────────────╯
         |
         ↓
         ◆
        / \
[gültig] / \ [ungültig]
        ↓   ↓
   ╭────╮  ╭──────────────╮
   │OK  │  │Fehler anzeigen│
   ╰────╯  ╰──────────────╯
        \   /
         \ /
          ◆           ← Merge (kein Guard nötig)
          |
         (●)
```

### Regeln: Decision vs. Merge

|                       | Decision Node `◆`                    | Merge Node `◆`             |
| --------------------- | ------------------------------------ | -------------------------- |
| **Eingehende Pfeile** | 1                                    | 2 oder mehr                |
| **Ausgehende Pfeile** | 2 oder mehr                          | 1                          |
| **Guards**            | Pflicht an allen ausgehenden Pfeilen | Nicht nötig                |
| **Entspricht**        | `if / else if / else`                | Zusammenführung von Pfaden |

> 💡 **Decision** und **Merge** verwenden dasselbe Symbol `◆` – der Unterschied liegt in der Anzahl der Pfeile!

---

## 05 · Schleifen in Aktivitätsdiagrammen

Schleifen entstehen durch einen **Rückwärtspfeil** – ein Entscheidungsknoten leitet einen Pfad zurück zu einer früheren Stelle.

### Pre-Check Schleife (entspricht `while`)

```
         ●
         |
         ↓
         ◆  ──────────────────────────┐
        / \                           │
 [OK] /   \ [Bed. nicht erfüllt]     │
      ↓    ↓                          │
   Aktion  ╭────────────╮             │
      |    │ Korrektur  │             │
      |    ╰────────────╯             │
      |         |                     │
      |         └─────────────────────┘
      ↓
     (●)
```

### Post-Check Schleife (entspricht `do-while`)

```
         ●
         |
         ↓
  ╭──────────────╮
  │  Aktion       │ ←──────────────┐
  ╰──────────────╯                 │
         |                         │
         ↓                         │
         ◆                         │
        / \                        │
 [OK] /   \ [wiederholen]          │
      ↓    └──────────────────────┘
     (●)
```

### Beispiel: Passwort-Eingabe (max. 3 Versuche)

```
         ●
         |
         ↓
         ◆  (Merge)
         |
         ↓
  ╭────────────────╮
  │ Passwort eingeben│
  ╰────────────────╯
         |
         ↓
         ◆
        / \
[korrekt]  [falsch & Versuche < 3]
      ↓         ↓
      |    ╭────────────────╮
      |    │ Fehlermeldung   │──→ (zurück zum Merge-Knoten oben)
      ↓    ╰────────────────╯
  ╭────────────────╮
  │ Zugang gewähren │
  ╰────────────────╯
         |
        (●)
```

---

## 06 · Praxisbeispiel: Online-Bestellprozess

```
                ●
                |
                ↓
       ╭─────────────────╮
       │ Produkt wählen   │
       ╰─────────────────╯
                |
                ↓
       ╭─────────────────╮
       │In Warenkorb legen│
       ╰─────────────────╯
                |
                ↓
                ◆
               / \
  [Warenkorb  /   \ [bereit]
    leer]    /     \
            ↓       ↓
  ╭──────────────╮  |
  │Weiter einkaufen│  |
  ╰──────────────╯  |
       ↑             |
       └─────────────┘ (Loop)
                     ↓
            ╭─────────────────╮
            │ Bestellung aufgeben│
            ╰─────────────────╯
                     |
                     ↓
                     ◆
                    / \
        [Zahlung  /   \ [Zahlung
           OK]   /     \  fehlg.]
                ↓       ↓
       ╭──────────────╮ ╭──────────────╮
       │Best. senden  │ │Fehler melden │
       ╰──────────────╯ ╰──────────────╯
                |               |
               (●)             (●)
            (Erfolg)          (Fehler)
```

**Analyse des Diagramms:**

| Element               | Vorkommen | Details                            |
| --------------------- | --------- | ---------------------------------- |
| Startknoten           | 1         | Einziger Einstiegspunkt            |
| Entscheidungsknoten   | 2         | Warenkorb-Check + Zahlungs-Check   |
| Aktionen              | 5         | Alle mit Verb + Substantiv benannt |
| Endknoten             | 2         | Erfolg (Bestätigung) + Fehler      |
| Rückwärtspfeil (Loop) | 1         | Warenkorb leer → weiter einkaufen  |

---

## Bonus · Swim Lanes (Partitionen)

Swim Lanes zeigen, **WER** für welche Aktion zuständig ist.

```
«partition» Online-Shop Bestellung
┌────────────────┬────────────────┬────────────────┐
│    Kunde       │    System      │     Lager      │
├────────────────┼────────────────┼────────────────┤
│                │                │                │
│  ╭──────────╮  │                │                │
│  │Bestellung│  │                │                │
│  │ aufgeben │  │                │                │
│  ╰──────────╯  │                │                │
│       |        │                │                │
│       └────────→  ╭──────────╮  │                │
│                │  │ Zahlung  │  │                │
│                │  │verarbeiten│  │                │
│                │  ╰──────────╯  │                │
│                │       |        │                │
│                │       └────────→  ╭──────────╮  │
│                │                │  │ Artikel  │  │
│                │                │  │kommisson.│  │
│                │                │  ╰──────────╯  │
│                │                │       |        │
│                │  ╭──────────╮  │       │        │
│                │  │Versandlbl│ ←─────────┘        │
│                │  │erstellen │  │                │
│                │  ╰──────────╯  │                │
│                │       |        │                │
│  ╭──────────╮  │       │        │                │
│  │Versandbe-│ ←─────────┘        │                │
│  │stätigung │  │                │                │
│  ╰──────────╯  │                │                │
└────────────────┴────────────────┴────────────────┘
```

---

## 07 · Übungsaufgaben – Überblick

| Aufgabe                                  | Typ            | Zeit   | Niveau            |
| ---------------------------------------- | -------------- | ------ | ----------------- |
| **A1** – Diagramm lesen & analysieren    | Einzelarbeit   | 10 Min | ⭐ Grundlegend     |
| **A2** – Einfachen Ablauf zeichnen       | Einzelarbeit   | 20 Min | ⭐⭐ Mittel         |
| **A3** – Komplexer Prozess mit Schleifen | Gruppenarbeit  | 25 Min | ⭐⭐⭐ Anspruchsvoll |
| **A4** – Fehler im Diagramm finden       | Einzel/Partner | 15 Min | ⭐⭐ Mittel         |

→ Details und Aufgabenstellungen im **Begleitdokument**.

---

## Zusammenfassung

| #    | Thema                       | Kernaussage                                                                                      |
| ---- | --------------------------- | ------------------------------------------------------------------------------------------------ |
| 🎯    | UML = gemeinsame Sprache    | Standard-Notation; unabhängig von Programmiersprache oder Technologie                            |
| ▭    | Aktivitätsdiagramm = Ablauf | Beschreibt WIE etwas abläuft – mit Aktionen, Entscheidungen und parallelen Pfaden                |
| ●→◆⊙ | 10 Kernelemente             | Start · Aktion · Entscheidung · Merge · Fork · Join · Fluss · Ende · Swim Lane                   |
| ◆    | Verzweigung = Guards        | Guards in `[...]`, vollständig & disjunkt; Decision und Merge nutzen dasselbe Symbol             |
| ↩    | Schleifen = Rückwärtspfeil  | Pre-Check (while) und Post-Check (do-while) durch Position der Entscheidungsraute unterscheidbar |

---

*HF Lehrgang · Software Engineering · UML Aktivitätsdiagramm*
