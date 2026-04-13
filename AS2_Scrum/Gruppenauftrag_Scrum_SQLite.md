# Gruppenauftrag · Agiles Datenbankprojekt mit SQLite

**HF Lehrgang Informatik · Agile Softwareentwicklung & Scrum**

---

> **Fokus:** Dieser Auftrag bewertet primär das **agile Vorgehen** – nicht die technische Perfektion. Ein Team, das Scrum konsequent lebt und einen kleinen Scope sauber liefert, schneidet besser ab als ein Team mit viel Code, aber chaotischem Prozess.

---

## Übersicht

| | |
|---|---|
| **Projektname** | Bibliotheksverwaltung «LibTrack» |
| **Technologie** | SQLite · Python (oder C# / Node.js nach Wahl) |
| **Teamgrösse** | 3–4 Personen |
| **Sprints** | 3 Sprints à 1 Unterrichtseinheit (simuliert) |
| **Abschluss** | Sprint Review + Abschlusspräsentation (15 Min. pro Team) |
| **Bewertung** | 70 % Prozess (Scrum) · 30 % Produkt (SQLite-Anwendung) |

---

## Ausgangslage – der Kunde

Die fiktive **Stadtbibliothek Musterstadt** verwaltet ihren Buchbestand aktuell in einer Excel-Tabelle. Die Bibliotheksleiterin, Frau Keller, hat folgende Probleme:

> *„Wir wissen nie genau, welche Bücher ausgeliehen sind. Manchmal suchen wir ein Buch, das gar nicht mehr da ist. Und wenn eine Kundin fragt, ob wir einen bestimmten Autor haben, müssen wir ewig suchen."*

Ihr Team wurde beauftragt, eine einfache Datenbankanwendung zu entwickeln, die diese Probleme löst. **Frau Keller ist eure Product Ownerin** (Rolle wird von einem Teammitglied gespielt).

---

## Zielvorgaben

### Pflichtziele (Must – alle Teams)

- ✅ SQLite-Datenbank mit mindestens **3 Tabellen** und sinnvollen Beziehungen
- ✅ **CRUD-Operationen** für Bücher und Ausleihen (Create, Read, Update, Delete)
- ✅ Mindestens **2 aussagekräftige SQL-Abfragen** (JOIN, Aggregation)
- ✅ Alle **3 Scrum-Sprints** vollständig durchgeführt und dokumentiert
- ✅ **Product Backlog** mit priorisierten User Stories (MoSCoW)
- ✅ **Definition of Done** vom Team gemeinsam erstellt
- ✅ **3 Sprint Backlogs** (je eines pro Sprint, mit Story Points)
- ✅ **3 Retrospektiven** dokumentiert (je eine pro Sprint)
- ✅ **Abschlusspräsentation** mit Live-Demo (15 Min.)

### Erweiterungsziele (Should/Could – je nach Kapazität)

- 📈 Burndown-Diagramm für mindestens einen Sprint
- 🔍 Suchfunktion (Titel, Autor, Genre)
- 📊 Statistikabfragen (meistausgeliehene Bücher, überfällige Ausleihen)
- 🔔 Überfälligkeitsprüfung (Rückgabedatum überschritten)
- 🖥️ Einfaches CLI-Menü oder Web-UI

---

## Technische Rahmenbedingungen

### Datenbankschema – Ausgangsbasis

Das folgende Schema ist ein **Vorschlag**. Euer Team kann und soll es im Verlauf der Sprints weiterentwickeln und anpassen – genau wie im echten agilen Vorgehen.

```sql
-- Sprint 1: Kerntabellen
CREATE TABLE Buch (
    BuchID    INTEGER PRIMARY KEY AUTOINCREMENT,
    ISBN      TEXT    UNIQUE NOT NULL,
    Titel     TEXT    NOT NULL,
    Autor     TEXT    NOT NULL,
    Genre     TEXT,
    Erscheinungsjahr INTEGER,
    Exemplare INTEGER DEFAULT 1
);

CREATE TABLE Mitglied (
    MitgliedID  INTEGER PRIMARY KEY AUTOINCREMENT,
    Vorname     TEXT    NOT NULL,
    Nachname    TEXT    NOT NULL,
    Email       TEXT    UNIQUE,
    Eintrittsdatum TEXT DEFAULT (date('now'))
);

CREATE TABLE Ausleihe (
    AusleiheID    INTEGER PRIMARY KEY AUTOINCREMENT,
    BuchID        INTEGER NOT NULL REFERENCES Buch(BuchID),
    MitgliedID    INTEGER NOT NULL REFERENCES Mitglied(MitgliedID),
    Ausleihdatum  TEXT    DEFAULT (date('now')),
    Rueckgabedatum TEXT,
    ZurueckGegeben INTEGER DEFAULT 0  -- 0 = ausgeliehen, 1 = zurückgegeben
);
```

### Technologiestack (Team wählt eine Option)

| Option | Sprache | Bibliothek |
|--------|---------|-----------|
| **A** (empfohlen) | Python | `sqlite3` (Standard), `tabulate` für Ausgabe |
| **B** | C# | `Microsoft.Data.Sqlite` NuGet |
| **C** | Node.js | `better-sqlite3` npm |

### Entwicklungsumgebung

- SQLite Browser ([DB Browser for SQLite](https://sqlitebrowser.org)) zur Dateninspektion
- Git-Repository (GitHub / GitLab) für gemeinsamen Code
- Kanban-Board: GitHub Projects, Trello oder physisches Whiteboard

---

## Scrum-Vorgehen

### Rollenverteilung

| Rolle | Verantwortlichkeit im Datenbankprojekt |
|-------|----------------------------------------|
| **Product Owner** | Spielt Frau Keller – priorisiert Backlog, definiert Akzeptanzkriterien, nimmt Stories ab |
| **Scrum Master** | Moderiert alle Events, führt Protokoll, entfernt Impediments |
| **Developer 1** | Datenbankdesign (Schema, Migrations-Skript, Testdaten) |
| **Developer 2** | Anwendungslogik (SQL-Abfragen, CRUD-Funktionen) |
| **Developer 3** | Benutzerschnittstelle (CLI-Menü, Ausgabe-Formatierung) |

> 💡 Bei 3 Personen im Team: Developer 1 übernimmt zusätzlich Developer-3-Aufgaben oder teilt sie auf. Rollen können zwischen Sprints rotieren.

---

### Definition of Done (Vorlage – Team ergänzt)

Die DoD wird im **Sprint Planning Sprint 1** gemeinsam als Team festgelegt und gilt für alle Sprints.

**Pflicht-Einträge (werden vorgegeben):**

- ✅ SQL-Statements sind getestet und liefern korrekte Ergebnisse
- ✅ Code ist im gemeinsamen Git-Repository eingecheckt
- ✅ Akzeptanzkriterien der User Story sind erfüllt und vom PO abgenommen
- ✅ Keine offenen Bugs in der abgelieferten Funktion
- ✅ Kurze Beschreibung der Funktion im README ergänzt

**Team ergänzt mindestens 3 weitere Kriterien:**

| # | Kriterium | Festgelegt von |
|---|-----------|---------------|
| 6 | | |
| 7 | | |
| 8 | | |

---

## Die drei Sprints

### Sprint 1 · Datenbankfundament

**Sprint-Ziel:** Die Datenbank ist aufgesetzt. Bücher und Mitglieder können erfasst und angezeigt werden.

**Sprint Planning (20 Min.)**

1. Team liest alle User Stories aus Anhang A
2. PO erklärt und priorisiert (MoSCoW) – Rückfragen erlaubt!
3. Team schätzt in Story Points (Planning Poker)
4. Team wählt Stories für Sprint 1 und definiert das Sprint-Ziel
5. Kanban-Board aufsetzen (physisch oder digital)

**Entwicklung**

6. DB-Schema als `.sql`-Datei erstellen und einchecken
7. Testdaten-Skript mit mindestens 10 Büchern und 5 Mitgliedern
8. CRUD-Funktionen für Buch: Hinzufügen, Alle anzeigen
9. Daily Scrum (simuliert, 5 Min.) nach der Hälfte der Entwicklungszeit

**Sprint Review (10 Min.)**

10. Live-Demo: Buch erfassen, alle Bücher anzeigen
11. PO (Frau Keller) nimmt Stories ab oder gibt Feedback
12. Backlog wird auf Basis des Feedbacks angepasst

**Retrospektive (10 Min.) – Methode: 4 Ls**

| Liked | Learned | Lacked | Longed for |
|-------|---------|--------|------------|
| | | | |
| | | | |

**Massnahmen Sprint 2:**

| Massnahme | Wer | Bis |
|-----------|-----|-----|
| | | |
| | | |

---

### Sprint 2 · Ausleihe & Abfragen

**Sprint-Ziel:** Das Ausleihsystem funktioniert. Ausgeliehene und verfügbare Bücher können unterschieden und abgefragt werden.

**Sprint Planning (15 Min.)**

- Retrospektive-Erkenntnisse aus Sprint 1 berücksichtigen
- Stories aus Product Backlog für Sprint 2 auswählen
- Backlog Refinement: Neue Stories, die aus Sprint-1-Feedback entstanden sind, schätzen

**Entwicklung**

- Ausleihe erfassen (Buch + Mitglied verknüpfen)
- Rückgabe verarbeiten (Status aktualisieren)
- Verfügbarkeit prüfen (`Exemplare - aktive Ausleihen > 0`)
- Mindestens 2 JOIN-Abfragen implementieren:

```sql
-- Beispiel: Alle aktuell ausgeliehenen Bücher mit Mitglied
SELECT b.Titel, b.Autor, m.Vorname || ' ' || m.Nachname AS Mitglied,
       a.Ausleihdatum
FROM Ausleihe a
JOIN Buch b    ON a.BuchID    = b.BuchID
JOIN Mitglied m ON a.MitgliedID = m.MitgliedID
WHERE a.ZurueckGegeben = 0
ORDER BY a.Ausleihdatum;

-- Beispiel: Anzahl Ausleihen pro Buch
SELECT b.Titel, COUNT(*) AS AnzahlAusleihen
FROM Ausleihe a
JOIN Buch b ON a.BuchID = b.BuchID
GROUP BY b.BuchID
ORDER BY AnzahlAusleihen DESC;
```

**Daily Scrum Protokoll Sprint 2:**

| Person | Gestern | Heute | Impediments |
|--------|---------|-------|-------------|
| | | | |
| | | | |
| | | | |

**Impediment-Log:**

| # | Beschreibung | Gemeldet von | Gelöst durch | Status |
|---|-------------|-------------|-------------|--------|
| 1 | | | | ☐ offen ☐ gelöst |
| 2 | | | | ☐ offen ☐ gelöst |

**Sprint Review (10 Min.)**
- Demo: Buch ausleihen, Rückgabe buchen, Ausleihliste anzeigen
- PO prüft: Entspricht die Ausgabe dem, was Frau Keller erwartet hat?

**Retrospektive (10 Min.) – Methode: Start / Stop / Continue**

| 🟢 Start | 🔴 Stop | 🔵 Continue |
|----------|---------|------------|
| | | |
| | | |

**Burndown-Diagramm Sprint 2:**

```
SP  ×
    │ \   ← Ideallinie
    │  \
    │   \      ●  ← tatsächlicher Fortschritt
    │    \   ●
    │     ●
    └────────────────
    Tag 1  Tag 2  Tag 3
```

| Tag | Ideal (SP) | Tatsächlich (SP) |
|-----|:----------:|:----------------:|
| Start | | |
| Tag 1 | | |
| Tag 2 | | |
| Ende | 0 | |

---

### Sprint 3 · Suche, Statistik & Abschluss

**Sprint-Ziel:** Die Anwendung bietet Suchfunktionen und Statistikauswertungen. Die Wetterstation – äh, die Bibliotheksanwendung – ist präsentationsbereit und vollständig dokumentiert.

**Sprint Planning (15 Min.)**

- Verbleibende Stories priorisieren
- Scope bewusst begrenzen: Was ist realistisch in der verbleibenden Zeit?
- Präsentation vorbereiten einplanen (mindestens 15 Story Points Puffer)

**Entwicklung**

- Suchfunktion (nach Titel, Autor oder Genre)
- Statistikabfragen (meistausgeliehen, Ausleihen pro Monat, o. ä.)
- Überfälligkeitsprüfung (optional):

```sql
-- Überfällige Ausleihen (> 14 Tage)
SELECT b.Titel, m.Vorname || ' ' || m.Nachname AS Mitglied,
       a.Ausleihdatum,
       CAST(julianday('now') - julianday(a.Ausleihdatum) AS INTEGER) AS TageAusgeliehen
FROM Ausleihe a
JOIN Buch b     ON a.BuchID     = b.BuchID
JOIN Mitglied m ON a.MitgliedID = m.MitgliedID
WHERE a.ZurueckGegeben = 0
  AND julianday('now') - julianday(a.Ausleihdatum) > 14
ORDER BY TageAusgeliehen DESC;
```

- README finalisieren
- Präsentation vorbereiten

**Retrospektive Sprint 3 (10 Min.) – Methode: Segelboot**

```
        🌬️ Wind (was hat uns vorangetrieben?)
        ___________________________________
        |                                 |
        |   ⛵                            |
        |___________________________________
        ⚓ Anker (was hat uns gebremst?)
```

| ⚓ Anker – hat uns gebremst | 🌬️ Wind – hat uns vorangetrieben |
|----------------------------|----------------------------------|
| | |
| | |

---

## Abschlusspräsentation

**Dauer:** 15 Minuten pro Team + 5 Minuten Fragen

**Struktur (zwingend einzuhalten):**

### Teil A · Scrum-Prozess (8 Min.) – Hauptbewertungsteil

| Thema | Inhalt | Zeit |
|-------|--------|------|
| **Rollenverteilung** | Wer hat welche Rolle übernommen? Was bedeutete das konkret? | 1 Min. |
| **Product Backlog** | Zeigt euren priorisierten Backlog. Wie hat er sich über die Sprints verändert? | 2 Min. |
| **Sprint-Verläufe** | Je 1 Folie pro Sprint: Ziel, was wurde abgeliefert, was nicht und warum? | 3 Min. |
| **Retrospektiven** | Was habt ihr in den Retros gelernt? Welche Massnahme hatte den grössten Effekt? | 2 Min. |

### Teil B · Produkt-Demo (5 Min.)

| Thema | Inhalt |
|-------|--------|
| **Datenbankschema** | ER-Diagramm zeigen und kurz erklären |
| **Live-Demo** | Buch erfassen → Ausleihe → Suche → Statistik |
| **SQL-Highlights** | Eine interessante Abfrage zeigen und erklären |

### Teil C · Reflexion (2 Min.)

- Was war der grösste Unterschied zu einem klassischen Vorgehen?
- Was würdet ihr beim nächsten agilen Projekt anders machen?
- Was hat Scrum in eurem Team konkret verbessert?

---

## Abgabeartefakte

Alle Artefakte werden am Präsentationstag abgegeben (digital, als ZIP oder Git-Link).

| # | Artefakt | Format | Pflicht |
|---|---------|--------|:-------:|
| 1 | Product Backlog (initial + alle Änderungen) | Markdown / Excel / Foto | ✅ |
| 2 | Definition of Done | Markdown / Foto | ✅ |
| 3 | Sprint Backlog Sprint 1, 2, 3 | Markdown / Foto Board | ✅ |
| 4 | Daily Scrum Protokolle (alle Sprints) | Dieses Dokument ausgefüllt | ✅ |
| 5 | Retrospektiven-Protokolle (alle Sprints) | Dieses Dokument ausgefüllt | ✅ |
| 6 | Impediment-Log | Dieses Dokument ausgefüllt | ✅ |
| 7 | Datenbankschema (`.sql`-Datei) | SQL | ✅ |
| 8 | Anwendungscode | Python / C# / JS | ✅ |
| 9 | README mit Installationsanleitung | Markdown | ✅ |
| 10 | Präsentation | PDF / PPTX | ✅ |
| 11 | Burndown-Diagramm (min. 1 Sprint) | Bild / Excel | Should |
| 12 | ER-Diagramm | Bild / Draw.io | Should |

---

## Bewertungsraster

### Teil 1 · Scrum-Prozess (70 Punkte)

#### Product Backlog & Planung (20 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Product Backlog vollständig, mit MoSCoW-Priorisierung und Story Points | 8 | |
| Sprint-Ziele klar formuliert (nicht nur Storyliste) | 6 | |
| Backlog wurde aufgrund von Feedback angepasst (nachweisbar) | 6 | |
| **Subtotal** | **20** | |

#### Sprint-Durchführung (25 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Alle 3 Sprint Backlogs vorhanden und vollständig | 9 | |
| Daily Scrum protokolliert (min. 1 pro Sprint) | 6 | |
| Impediments dokumentiert und Lösungen festgehalten | 5 | |
| Burndown-Diagramm für min. 1 Sprint vorhanden | 5 | |
| **Subtotal** | **25** | |

#### Retrospektiven & Verbesserungen (15 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Alle 3 Retrospektiven durchgeführt und dokumentiert | 9 | |
| Konkrete Massnahmen formuliert (nicht nur «besser kommunizieren») | 3 | |
| Verbesserungen aus Retros sind im nächsten Sprint nachweisbar | 3 | |
| **Subtotal** | **15** | |

#### Präsentation Scrum-Prozess (10 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Scrum-Teil der Präsentation strukturiert und vollständig | 5 | |
| Kritische Reflexion: ehrliche Beurteilung, nicht nur Highlights | 5 | |
| **Subtotal** | **10** | |

---

### Teil 2 · SQLite-Produkt (30 Punkte)

#### Datenbankdesign (10 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Min. 3 Tabellen mit sinnvollen Beziehungen (Fremdschlüssel) | 5 | |
| Schema ist normalisiert (keine unnötigen Redundanzen) | 3 | |
| ER-Diagramm vorhanden und korrekt | 2 | |
| **Subtotal** | **10** | |

#### Funktionalität (15 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| CRUD für Bücher funktioniert korrekt | 5 | |
| Ausleih- und Rückgabeprozess funktioniert | 5 | |
| Min. 2 sinnvolle SQL-Abfragen (JOIN + Aggregation) | 5 | |
| **Subtotal** | **15** | |

#### Code & Dokumentation (5 Punkte)

| Kriterium | Max. Punkte | Erreicht |
|-----------|:-----------:|:--------:|
| Code in Git, sauber strukturiert | 3 | |
| README verständlich (Voraussetzungen, Start, Nutzung) | 2 | |
| **Subtotal** | **5** | |

---

### Gesamtbewertung

| Teil | Max. Punkte | Erreicht |
|------|:-----------:|:--------:|
| Scrum-Prozess | 70 | |
| SQLite-Produkt | 30 | |
| **Total** | **100** | |

| Punkte | Note |
|--------|------|
| 90–100 | 6.0 |
| 80–89 | 5.5 |
| 70–79 | 5.0 |
| 60–69 | 4.5 |
| 50–59 | 4.0 |
| 40–49 | 3.5 |
| < 40 | 3.0 |

---

## Anhang A · Initialer Product Backlog «LibTrack»

> Dieser Backlog ist der Ausgangspunkt. Der PO kann und soll ihn im Verlauf des Projekts anpassen, ergänzen und neu priorisieren – das ist agiles Arbeiten.

| # | User Story | Akzeptanzkriterien | MoSCoW | SP (Team) | Sprint |
|---|-----------|-------------------|--------|:---------:|:------:|
| 1 | Als Bibliothekarin möchte ich ein neues Buch erfassen, damit der Bestand vollständig ist. | ISBN, Titel, Autor Pflicht · Duplikat-Prüfung via ISBN | Must | | S1 |
| 2 | Als Bibliothekarin möchte ich alle Bücher auflisten, damit ich einen Überblick habe. | Tabelle mit Titel, Autor, Genre, Exemplare · sortierbar | Must | | S1 |
| 3 | Als Bibliothekarin möchte ich ein Mitglied erfassen, damit ich Ausleihen zuordnen kann. | Vorname, Nachname, E-Mail Pflicht · keine Duplikat-E-Mails | Must | | S1 |
| 4 | Als Bibliothekarin möchte ich alle Mitglieder anzeigen, damit ich Ausleihen Personen zuordnen kann. | Liste mit Name und Eintrittsdatum | Must | | S1 |
| 5 | Als Bibliothekarin möchte ich eine Ausleihe erfassen, damit ich weiss, wer welches Buch hat. | Buch + Mitglied per ID auswählen · Datum automatisch | Must | | S2 |
| 6 | Als Bibliothekarin möchte ich eine Rückgabe verbuchen, damit das Buch wieder verfügbar wird. | Status auf «zurückgegeben» setzen · Datum festhalten | Must | | S2 |
| 7 | Als Bibliothekarin möchte ich sehen, welche Bücher aktuell ausgeliehen sind, damit ich Anfragen beantworten kann. | JOIN-Abfrage: Buch + Mitglied + Datum · nur offene Ausleihen | Must | | S2 |
| 8 | Als Bibliothekarin möchte ich prüfen, ob ein Buch verfügbar ist, damit ich keine Ausleihe doppelt buche. | Verfügbare Exemplare = Exemplare − aktive Ausleihen | Must | | S2 |
| 9 | Als Bibliothekarin möchte ich ein Buch nach Titel oder Autor suchen, damit ich schnell Auskunft geben kann. | Teilsuche (LIKE) · Gross-/Kleinschreibung egal | Should | | S3 |
| 10 | Als Bibliothekarin möchte ich die meistausgeliehenen Bücher sehen, damit ich den Bestand besser plane. | TOP-5-Liste mit Ausleihhäufigkeit | Should | | S3 |
| 11 | Als Bibliothekarin möchte ich überfällige Ausleihen sehen (> 14 Tage), damit ich Mitglieder erinnern kann. | Liste mit Tagen überfällig · absteigend sortiert | Should | | S3 |
| 12 | Als Bibliothekarin möchte ich ein Buch bearbeiten oder löschen können, damit Fehler korrigiert werden können. | Update: alle Felder · Delete nur wenn nicht ausgeliehen | Should | | S3 |
| 13 | Als Bibliothekarin möchte ich Ausleihen nach Monat filtern, damit ich Statistiken erstellen kann. | Monatsauswahl → Anzahl Ausleihen + Liste | Could | | — |
| 14 | Als Bibliothekarin möchte ich Daten als CSV exportieren, damit ich Berichte in Excel erstellen kann. | Bücher-Export und Ausleihen-Export | Could | | — |

---

## Anhang B · Arbeitsblätter

### Arbeitsblatt 1 – Product Backlog (Team ausgefüllt)

**Team:** __________________________________ **Datum:** __________________

**Produktziel:** *In einem Satz – was soll die Anwendung am Ende können?*

```
___________________________________________________________________________

___________________________________________________________________________
```

| # | User Story | MoSCoW | SP | Sprint | Status |
|---|-----------|--------|:--:|:------:|--------|
| 1 | | | | | |
| 2 | | | | | |
| 3 | | | | | |
| 4 | | | | | |
| 5 | | | | | |
| 6 | | | | | |
| 7 | | | | | |
| 8 | | | | | |
| 9 | | | | | |
| 10 | | | | | |
| 11 | | | | | |
| 12 | | | | | |

---

### Arbeitsblatt 2 – Definition of Done

**Festgelegt am:** __________________ **Von:** __________________________________

| # | DoD-Kriterium | Gilt ab Sprint |
|---|--------------|:--------------:|
| 1 | SQL-Statements getestet und korrekte Ergebnisse | S1 |
| 2 | Code in Git eingecheckt (commit mit sinnvoller Message) | S1 |
| 3 | Akzeptanzkriterien vom PO abgenommen | S1 |
| 4 | Keine offenen Bugs in der Funktion | S1 |
| 5 | README-Eintrag für neue Funktion ergänzt | S1 |
| 6 | *(Team)* | |
| 7 | *(Team)* | |
| 8 | *(Team)* | |

---

### Arbeitsblatt 3 – Sprint Backlogs

#### Sprint 1 Backlog

**Sprint-Ziel:** ________________________________________________________________

**Zeitraum:** __________________ **Velocity-Ziel:** ______ SP

| Story # | Beschreibung (kurz) | SP | Status |
|---------|--------------------|----|--------|
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |

**Abgeschlossene SP:** ______ / ______ geplant

---

#### Sprint 2 Backlog

**Sprint-Ziel:** ________________________________________________________________

**Zeitraum:** __________________ **Velocity-Ziel:** ______ SP

| Story # | Beschreibung (kurz) | SP | Status |
|---------|--------------------|----|--------|
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |

**Abgeschlossene SP:** ______ / ______ geplant

---

#### Sprint 3 Backlog

**Sprint-Ziel:** ________________________________________________________________

**Zeitraum:** __________________ **Velocity-Ziel:** ______ SP

| Story # | Beschreibung (kurz) | SP | Status |
|---------|--------------------|----|--------|
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |
| | | | ☐ To Do ☐ In Progress ☐ Done |

**Abgeschlossene SP:** ______ / ______ geplant

---

### Arbeitsblatt 4 – Velocity-Übersicht

| Sprint | Geplante SP | Abgeschlossene SP | Nicht abgeschlossen (und warum) |
|--------|:-----------:|:-----------------:|---------------------------------|
| Sprint 1 | | | |
| Sprint 2 | | | |
| Sprint 3 | | | |
| **Total** | | | |

**Durchschnittliche Velocity:** ______ SP/Sprint

**Was beeinflusste unsere Velocity am stärksten?**

```
___________________________________________________________________________

___________________________________________________________________________
```

---

### Arbeitsblatt 5 – Gesamtreflexion (individuell)

**Name:** __________________________________ **Team:** ______________________

Beantworte die folgenden Fragen in 3–5 Sätzen **auf eigene Faust** (nicht in der Gruppe besprechen – eigene Meinung ist gefragt).

**1. Was hat Scrum in eurer Gruppe konkret verbessert, verglichen mit einem klassischen Vorgehen?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

**2. Was war das grösste Impediment in eurem Projekt? Wie wurde es gelöst – oder warum nicht?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

**3. Welche Scrum-Rolle hat dich am meisten überrascht? Was hast du dabei über Zusammenarbeit gelernt?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

**4. Was würdest du beim nächsten Datenbankprojekt agil anders angehen?**

```
___________________________________________________________________________

___________________________________________________________________________

___________________________________________________________________________
```

---

## Anhang C · Hilfreiche SQL-Snippets

### Datenbankverbindung in Python

```python
import sqlite3

# Verbindung herstellen (erstellt DB falls nicht vorhanden)
conn = sqlite3.connect("libtrack.db")
conn.row_factory = sqlite3.Row   # Ergebnis als Dict abrufbar
conn.execute("PRAGMA foreign_keys = ON")  # Fremdschlüssel aktivieren!
cur = conn.cursor()

# Schema einlesen und anlegen
with open("schema.sql", "r") as f:
    conn.executescript(f.read())

conn.commit()
```

### Buch hinzufügen

```python
def buch_hinzufuegen(conn, isbn, titel, autor, genre, jahr, exemplare=1):
    sql = """
        INSERT INTO Buch (ISBN, Titel, Autor, Genre, Erscheinungsjahr, Exemplare)
        VALUES (?, ?, ?, ?, ?, ?)
    """
    try:
        conn.execute(sql, (isbn, titel, autor, genre, jahr, exemplare))
        conn.commit()
        print(f"✅ Buch '{titel}' erfasst.")
    except sqlite3.IntegrityError:
        print(f"❌ Fehler: ISBN {isbn} bereits vorhanden.")
```

### Verfügbarkeit prüfen

```python
def ist_verfuegbar(conn, buch_id):
    sql = """
        SELECT b.Exemplare - COUNT(a.AusleiheID) AS Verfuegbar
        FROM Buch b
        LEFT JOIN Ausleihe a ON b.BuchID = a.BuchID AND a.ZurueckGegeben = 0
        WHERE b.BuchID = ?
        GROUP BY b.BuchID
    """
    row = conn.execute(sql, (buch_id,)).fetchone()
    return row["Verfuegbar"] > 0 if row else False
```

### Einfaches CLI-Menü (Ausgangsbasis)

```python
def hauptmenue():
    while True:
        print("\n=== LibTrack ===")
        print("1) Buch erfassen")
        print("2) Alle Bücher anzeigen")
        print("3) Ausleihe erfassen")
        print("4) Rückgabe buchen")
        print("5) Aktuelle Ausleihen anzeigen")
        print("6) Suche")
        print("0) Beenden")

        wahl = input("Auswahl: ").strip()
        if   wahl == "1": buch_erfassen(conn)
        elif wahl == "2": buecher_anzeigen(conn)
        elif wahl == "3": ausleihe_erfassen(conn)
        elif wahl == "4": rueckgabe_buchen(conn)
        elif wahl == "5": ausleihen_anzeigen(conn)
        elif wahl == "6": suche(conn)
        elif wahl == "0": break
        else: print("Ungültige Eingabe.")
```

### Testdaten einspielen

```sql
INSERT INTO Buch (ISBN, Titel, Autor, Genre, Erscheinungsjahr, Exemplare) VALUES
  ('978-3-16-148410-0', 'Clean Code', 'Robert C. Martin', 'Informatik', 2008, 2),
  ('978-0-13-468599-1', 'The Pragmatic Programmer', 'David Thomas', 'Informatik', 2019, 1),
  ('978-3-86490-552-0', 'Scrum', 'Jeff Sutherland', 'Management', 2015, 3),
  ('978-0-06-112008-4', 'To Kill a Mockingbird', 'Harper Lee', 'Roman', 1960, 1),
  ('978-0-7432-7356-5', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Roman', 1925, 2);

INSERT INTO Mitglied (Vorname, Nachname, Email) VALUES
  ('Anna', 'Meier', 'anna.meier@example.ch'),
  ('Beat', 'Keller', 'beat.keller@example.ch'),
  ('Claudia', 'Widmer', 'claudia.widmer@example.ch');
```

---

*HF Lehrgang · Informatik · Agile Softwareentwicklung & Scrum · Gruppenauftrag SQLite*
