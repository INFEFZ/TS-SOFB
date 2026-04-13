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

## 4.1 Projektbeschreibung – Task-Management-App

> **Projektziel:** Ihr entwickelt als Team eine Task-Management-App über drei simulierte Sprints. Die App kann als Konsolenanwendung, Web-App oder Desktop-App realisiert werden. Jeder Sprint entspricht einer Unterrichtseinheit. Alle Scrum-Events finden statt.

**Technologiewahl:** Das Team entscheidet selbst.
Empfehlungen: C# Konsole · ASP.NET Core API + Angular · Blazor · Node.js + React

---

## 4.2 Rollenverteilung

| Rolle             | Person | Hauptaufgaben                                                             |
| ----------------- | ------ | ------------------------------------------------------------------------- |
| **Product Owner** |        | Backlog pflegen, priorisieren, Akzeptanzkriterien definieren, akzeptieren |
| **Scrum Master**  |        | Events moderieren, Impediments entfernen, Team schützen                   |
| **Developer 1**   |        | Implementierung, Tests, Code Review                                       |
| **Developer 2**   |        | Implementierung, Tests, Code Review                                       |
| **Developer 3**   |        | Implementierung, Tests, Code Review                                       |

---

## Übung 3 · Sprint 1 – Grundfunktionen

⏱ **60 Minuten**

**Sprint-Ziel:** Die App kann Tasks erstellen, auflisten und löschen.

**Sprint Planning (15 Min.)**
1. Wählt User Stories aus dem Product Backlog (→ Anhang A)
2. Definiert das Sprint-Ziel als Team
3. Schätzt die Stories in Story Points (Planning Poker)
4. Erstellt euren Sprint Backlog (Board: To Do / In Progress / Review / Done)

**Entwicklung (35 Min.)**
5. Führt täglich (simuliert) einen Daily Scrum durch (3 Fragen, max. 5 Min.)
6. Dokumentiert Impediments sofort im Daily-Scrum-Protokoll
7. Developer implementieren – PO ist für Rückfragen verfügbar

**Sprint Review + Retrospektive (10 Min.)**
8. Zeigt das Increment dem Kurs (Demo)
9. Retrospektive: Was lief gut? Was verbessern wir in Sprint 2?

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

## Übung 4 · Sprint 2 – Erweiterte Features

⏱ **60 Minuten**

**Sprint-Ziel:** Die App unterstützt Prioritäten, Fälligkeitsdaten und Filterung.

**Zusatzaufgaben Sprint 2:**
- Sprint Planning anhand der Retrospektive-Erkenntnisse aus Sprint 1 durchführen
- Mindestens 1 aufgetretenes Impediment dokumentieren und lösen
- **Backlog Refinement** durchführen (20 Min.): Neue Stories diskutieren & schätzen
- **Burndown-Diagramm** für den Sprint erstellen

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

## Übung 5 · Sprint 3 – Abschluss & Präsentation

⏱ **60 Minuten**

**Sprint-Ziel:** Persistenz, finales UI, Dokumentation. Produktpräsentation vor der Klasse.

**Lieferobjekte Sprint 3:**
- Funktionierende App (Demo), die der Definition of Done entspricht
- Kurze technische Dokumentation (max. 1 Seite)
- Sprint Review: 5-minütige Produktpräsentation für die Klasse
- Abschlussdiskussion: Was würdet ihr beim nächsten Scrum-Projekt anders machen?

**Bewertungskriterien:**

| Kriterium                                                   | Gewichtung |
| ----------------------------------------------------------- | ---------- |
| Einhaltung des Scrum-Frameworks (Rollen, Events, Artefakte) | 25 %       |
| Qualität des Increments (Definition of Done)                | 30 %       |
| Qualität der Dokumentation (User Stories, Protokolle)       | 20 %       |
| Teamarbeit und Selbstorganisation                           | 15 %       |
| Präsentation und Reflexion                                  | 10 %       |

---

# Teil V · Referenz, Lösungshinweise & Glossar

## Anhang A – Beispiel Product Backlog: Task-Management-App

| #   | User Story                                                                                                 | MoSCoW |  SP   | Sprint |
| --- | ---------------------------------------------------------------------------------------------------------- | ------ | :---: | :----: |
| 1   | Als Nutzer möchte ich einen neuen Task erstellen, damit ich meine Aufgaben erfassen kann.                  | Must   |   3   |   S1   |
| 2   | Als Nutzer möchte ich alle Tasks anzeigen lassen, damit ich einen Überblick habe.                          | Must   |   2   |   S1   |
| 3   | Als Nutzer möchte ich einen Task als erledigt markieren, damit ich Fortschritt sehe.                       | Must   |   2   |   S1   |
| 4   | Als Nutzer möchte ich einen Task löschen, damit erledigte Tasks verschwinden können.                       | Must   |   1   |   S1   |
| 5   | Als Nutzer möchte ich Tasks priorisieren (Hoch/Mittel/Tief), damit ich wichtige Tasks zuerst sehe.         | Should |   3   |   S2   |
| 6   | Als Nutzer möchte ich ein Fälligkeitsdatum setzen, damit ich Deadlines im Blick behalte.                   | Should |   3   |   S2   |
| 7   | Als Nutzer möchte ich Tasks filtern (nach Status, Priorität), damit ich schnell die richtigen Tasks finde. | Should |   5   |   S2   |
| 8   | Als Nutzer möchte ich Tasks in Kategorien einteilen, damit ich verschiedene Projekte trennen kann.         | Could  |   5   |   S3   |
| 9   | Als Nutzer möchte ich meine Tasks lokal speichern, damit sie nach Neustart noch vorhanden sind.            | Must   |   5   |   S3   |
| 10  | Als Nutzer möchte ich Tasks als CSV exportieren, damit ich sie in Excel weiterbearbeiten kann.             | Could  |   8   |   —    |

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
