# Agile Softwareentwicklung & Scrum

**HF Lehrgang · Praxisorientiertes Unterrichtsmaterial**

---

## Lernziele

Nach diesem Lehrgang können die Studierenden …

| Kompetenz       | Beschreibung                                                |
| --------------- | ----------------------------------------------------------- |
| 🎯 **Verstehen** | Sinn und Zweck agiler Softwareentwicklung erklären          |
| 🔧 **Anwenden**  | Ein praktisches Projekt nach agilen Prinzipien realisieren  |
| 📋 **Kennen**    | Die Rollen, Events und Artefakte von Scrum benennen         |
| 🚀 **Umsetzen**  | Ein Projektvorhaben mit Scrum strukturieren und durchführen |

---

# Teil 1 · Agile Grundlagen

*Warum klassische Methoden oft scheitern – und was die Lösung ist*

---

## Das Wasserfallmodell – und seine Grenzen

```
Anforderungen → Design → Implementierung → Test → Betrieb
```

Das Modell funktioniert gut, wenn Anforderungen **vollständig und stabil** sind – eine Voraussetzung, die in der Praxis selten erfüllt wird.

> ⚠️ **Typische Probleme**
> - Änderungen sind teuer, je später sie auftreten
> - Kein Kundenfeedback während der Entwicklung
> - Fehler in Anforderungen werden spät erkannt
> - „Big Bang"-Lieferung: Alles oder nichts am Ende
>
> 📊 Laut Standish CHAOS Report: **66 % aller Projekte** werden zu spät oder zu teuer geliefert – 19 % scheitern ganz.

---

## Das Agile Manifest (2001)

Im Februar 2001 trafen sich 17 erfahrene Entwickler in Snowbird, Utah. Das Ergebnis: **vier Kernwerte und zwölf Prinzipien**.

### Die 4 Werte

| Linke Seite *(mehr Wert)*      | &nbsp; | Rechte Seite *(hat Wert)* |
| ------------------------------ | :----: | ------------------------- |
| **Individuen & Interaktionen** |  über  | Prozesse & Werkzeuge      |
| **Funktionierende Software**   |  über  | Umfassende Dokumentation  |
| **Kundenzusammenarbeit**       |  über  | Vertragsverhandlungen     |
| **Auf Änderungen reagieren**   |  über  | Einem Plan folgen         |

> 💡 Hinweis: Die rechte Seite hat Wert – die linke Seite hat **mehr** Wert.

---

## Die 12 Prinzipien des Agilen Manifests

1. Kundenzufriedenheit durch **frühzeitige und kontinuierliche Lieferung** wertvoller Software
2. **Veränderungen willkommen** heissen – auch spät im Projekt
3. Funktionierende Software **häufig liefern** (Wochen, nicht Monate)
4. **Enge Zusammenarbeit** zwischen Entwicklern und Fachleuten täglich
5. **Motivierte Individuen** fördern – Vertrauen schenken
6. **Face-to-Face Kommunikation** bevorzugen
7. **Funktionierende Software** = Hauptmass für Fortschritt
8. Nachhaltige Entwicklung – **gleichmässiges Tempo**
9. Technische Exzellenz und **gutes Design** fördern Agilität
10. **Einfachheit**: das Meiste nicht Erledigte maximieren
11. **Selbstorganisierende Teams** produzieren beste Ergebnisse
12. Regelmässige **Reflexion & Anpassung** des Vorgehens

---

## Agil vs. Wasserfall – Vergleich

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

# Teil 2 · Praxisübung: Agiles Arbeiten

*Gemeinsam ein Projekt agil planen und umsetzen*

---

## User Stories richtig schreiben

### Das Format

> **«Als [Rolle] möchte ich [Funktion/Ziel], damit [Nutzen/Begründung].»**

### Beispiele

✅ **Gut:**
> Als Kunde möchte ich meine Bestellung online aufgeben, damit ich nicht anrufen muss und die Bestellung jederzeit tätigen kann.

❌ **Schlecht:**
> Das System soll eine Datenbankanbindung für Bestellungen haben.

### Qualitätskriterien – INVEST

| Buchstabe | Bedeutung                                    |
| --------- | -------------------------------------------- |
| **I**     | Independent – unabhängig von anderen Stories |
| **N**     | Negotiable – verhandelbar, kein Vertrag      |
| **V**     | Valuable – bringt dem Nutzer Mehrwert        |
| **E**     | Estimable – schätzbar im Aufwand             |
| **S**     | Small – klein genug für einen Sprint         |
| **T**     | Testable – testbar mit klaren Kriterien      |

---

## Übung 1 · Agile Planung – «Pizzeria App»

**Szenario:** Ihr seid ein 3–4-köpfiges Entwicklungsteam. Eine lokale Pizzeria möchte eine Online-Bestellapp. Der Inhaber weiss nur: *„Die Leute rufen ständig an und wir vergessen Bestellungen."*

| Schritt                   | Zeit    | Aufgabe                                              |
| ------------------------- | ------- | ---------------------------------------------------- |
| 📝 **1 – User Stories**    | 10 Min. | Mindestens 8 User Stories im INVEST-Format schreiben |
| 🎯 **2 – MoSCoW**          | 10 Min. | Priorisierung: Must / Should / Could / Won't have    |
| 📋 **3 – Sprint Planning** | 10 Min. | Sprint 1 planen, Stories in Story Points schätzen    |
| 🗣️ **4 – Präsentation**    | 5 Min.  | Sprint Backlog vorstellen, Entscheidungen begründen  |

---

# Teil 3 · Einführung in Scrum

*Das meistgenutzte agile Framework im Detail*

---

## Was ist Scrum?

Scrum ist ein **leichtgewichtiges Framework**, das Teams hilft, komplexe Probleme adaptiv zu lösen und Produkte höchstmöglichen Wertes zu entwickeln.

| Fakten        |                                                       |
| ------------- | ----------------------------------------------------- |
| 📅 Entstehung  | 1995 · Ken Schwaber & Jeff Sutherland                 |
| 📄 Grundlage   | [Scrum Guide](https://scrumguides.org) – kostenlos    |
| 🏭 Verbreitung | Meistgenutztes agiles Framework weltweit              |
| 🎯 Kernidee    | **Inspect & Adapt** – regelmässig prüfen und anpassen |
| ⏱️ Rhythmus    | Sprints von 1–4 Wochen (meist 2 Wochen)               |
| 👥 Teamgrösse  | Typisch 3–9 Personen                                  |

### Die drei Scrum-Säulen

```
Transparenz → Überprüfung (Inspection) → Anpassung (Adaptation)
```

### Die fünf Scrum-Werte

**Commitment · Mut · Fokus · Offenheit · Respekt**

---

## Die drei Scrum-Rollen

### 👤 Product Owner (PO)
- Verantwortlich für die Maximierung des **Produktwerts**
- Pflegt und priorisiert den **Product Backlog**
- Einzige Person, die Backlog-Einträge priorisiert
- Vertritt die Interessen der **Stakeholder**
- Muss verfügbar und entscheidungsfähig sein

### 🛡️ Scrum Master (SM)
- **Servant Leader** – dient dem Team, nicht umgekehrt
- Entfernt **Impediments** (Hindernisse) für das Team
- Schützt das Team vor externen Störungen
- Fördert das Verständnis und die Anwendung von Scrum
- Moderiert alle **Scrum Events**

### 💻 Developer (Entwicklungsteam)
- Setzt das Sprint Backlog um, erstellt das Increment
- **Selbstorganisierend**: Das Team entscheidet selbst, wie Arbeit erledigt wird
- **Cross-functional**: Alle nötigen Fähigkeiten im Team vorhanden
- Hält die **Definition of Done** ein
- Typisch 3–9 Personen

---

## Die drei Scrum-Artefakte

| Artefakt            | Beschreibung                                                                             | Commitment         |
| ------------------- | ---------------------------------------------------------------------------------------- | ------------------ |
| **Product Backlog** | Geordnete Liste aller Anforderungen an das Produkt. Vom PO gepflegt und priorisiert.     | Produktziel        |
| **Sprint Backlog**  | Auswahl aus dem Product Backlog für den aktuellen Sprint + Umsetzungsplan.               | Sprint-Ziel        |
| **Increment**       | Kumuliertes, potenziell auslieferbares Produkt am Sprint-Ende. Muss der DoD entsprechen. | Definition of Done |

---

## Die fünf Scrum-Events

| Event               | Max. Dauer  | Zweck                                                               |
| ------------------- | ----------- | ------------------------------------------------------------------- |
| **Sprint**          | 1–4 Wochen  | Container für alle anderen Events. Liefert ein Increment.           |
| **Sprint Planning** | 8 h         | Was wird im Sprint gemacht? Wie wird es umgesetzt?                  |
| **Daily Scrum**     | 15 Min./Tag | Synchronisation: Was tat ich? Was tue ich? Hindernisse?             |
| **Sprint Review**   | 4 h         | Increment wird vorgestellt, Stakeholder-Feedback, Backlog angepasst |
| **Retrospektive**   | 3 h         | Team reflektiert Prozess: Was lief gut? Was verbessern wir?         |

---

## Der Sprint-Zyklus im Überblick

```
Product Backlog
      │
      ▼
Sprint Planning
      │
      ▼
Sprint Backlog ──► Sprint (1–4 Wochen) ──► Increment
                        │
                        ├── Daily Scrum (täglich, 15 Min.)
                        ├── Sprint Review (Ende Sprint)
                        └── Retrospektive (Ende Sprint)
```

> 🔁 **Inspect & Adapt**: Nach jedem Sprint wird das Produkt (Review) und der Prozess (Retro) angepasst.

---

## Definition of Done (DoD)

Die DoD ist eine gemeinsam vereinbarte Liste von Qualitätskriterien, die ein Increment erfüllen **muss** – bevor es als „fertig" gilt.

### Beispiel-DoD für ein Web-Projekt

- ✅ Code wurde reviewed (Peer Review)
- ✅ Unit Tests geschrieben & alle grün
- ✅ Integration Tests bestanden
- ✅ Akzeptanzkriterien der User Story erfüllt
- ✅ Keine offenen P1-Bugs
- ✅ Dokumentation aktualisiert
- ✅ Code in main-Branch gemergt
- ✅ Auf Test-Umgebung deployed & getestet

> 💡 **Tipp:** Die DoD gilt für das gesamte Team – nicht für einzelne Stories. Sie wird im Sprint Planning nicht neu verhandelt.

---

# Teil 4 · Scrum in der Praxis

*Ihr setzt ein Projekt mit Scrum um*

---

## Schätzungen mit Story Points

Story Points messen **relativen Aufwand** (nicht Zeit) und berücksichtigen Komplexität, Umfang und Risiko.

### Fibonacci-Skala

```
1 · 2 · 3 · 5 · 8 · 13 · 21 · ?
```

- Relativ zur einfachsten Story des Teams
- **Planning Poker**: Alle schätzen gleichzeitig → Diskussion bei Abweichungen

### Velocity

Die durchschnittlich abgeschlossenen Story Points pro Sprint. Hilft bei der Planung – **kein KPI für Druck**.

---

## Das Kanban-Board

Visualisiert den Fortschritt des Sprint Backlogs:

```
┌─────────────┬─────────────┬───────────────┬─────────────┬─────────────┐
│  📋 Backlog │  🔜 To Do  │ ⚙️ In Progress│  🔍 Review  │  ✅ Done    │
├─────────────┼─────────────┼───────────────┼─────────────┼─────────────┤
│ Tasks       │ Login-      │ Task          │ Task        │ Startseite  │
│ exportieren │ Screen      │ erstellen     │ löschen     │             │
│             │ DB-Schema   │               │             │ Auth-Modul  │
└─────────────┴─────────────┴───────────────┴─────────────┴─────────────┘
```

> 💡 **Tools:** Jira, Azure DevOps, Trello, Notion oder ein physisches Whiteboard

---

## Retrospektiven – Formate & Methoden

### Start / Stop / Continue

> Was sollen wir **anfangen**? Was **aufhören**? Was **beibehalten**?

### 4 Ls

> **Liked** – Was mochten wir?  
> **Learned** – Was haben wir gelernt?  
> **Lacked** – Was fehlte uns?  
> **Longed for** – Was wünschen wir uns?

### Segelboot / Speedboat

> **Wind** (hilft uns) vs. **Anker** (bremst uns) – visualisiert Treiber und Hindernisse

**Ablauf:**
```
1. Daten sammeln → 2. Erkenntnisse gewinnen → 3. Massnahmen planen → 4. Schliessen
```

---

## Übung 2 · Scrum-Projekt «Task-Management-App»

**Projektziel:** Ihr entwickelt eine Task-Management-App über 3 simulierte Sprints.

| Sprint       | Ziel                                                | Scrum-Events                                     |
| ------------ | --------------------------------------------------- | ------------------------------------------------ |
| **Sprint 1** | Grundfunktionen: Tasks erstellen, anzeigen, löschen | Planning, 3× Daily Scrum, Review, Retro          |
| **Sprint 2** | Prioritäten, Fälligkeitsdaten, Filterung            | Planning, Daily Scrum, Refinement, Review, Retro |
| **Sprint 3** | Persistenz, UI-Verbesserungen, Präsentation         | Planning, Daily Scrum, Review, Retro, Demo       |

> Alle Scrum-Rollen werden im Team verteilt. Alle Events finden statt!

---

# Teil 5 · Häufige Fehler & Best Practices

---

## Häufige Scrum-Antipatterns

| Antipattern                   | Problem                                                                  |
| ----------------------------- | ------------------------------------------------------------------------ |
| 🔇 **SM als Projektleiter**    | Gibt Aufgaben vor statt zu coachen → Selbstorganisation wird untergraben |
| 📝 **Story Points als KPI**    | Velocity wird zum Leistungsmass → Teams inflationieren Schätzungen       |
| 🏃 **Sprint als Frist**        | Stories werden am letzten Tag „fertig gemacht" – Qualität leidet         |
| 🚫 **Kein echter PO**          | PO nicht erreichbar → Backlog stagniert, keine Entscheidungen            |
| 📋 **Überfüllter Backlog**     | Hunderte Stories, keine Priorisierung → Team verliert Fokus              |
| 🔄 **Häufige Sprint-Abbrüche** | Destabilisieren das Team und untergraben das Framework                   |

---

## Best Practices für erfolgreiches Scrum

- Sprint-Ziel klarer formulieren als nur eine Storyliste
- **Backlog Refinement** regelmässig durchführen (~10 % der Kapazität)
- Team-Commitment statt individueller Verpflichtungen
- **Definition of Done** konsequent einhalten
- Impediments sofort und sichtbar machen
- **Technical Debt** aktiv im Backlog führen
- Stakeholder früh und regelmässig einbinden (Sprint Review)
- **Retrospektive-Massnahmen** nachverfolgen
- Teamkonstanz – keine ständigen Personalwechsel
- **Psychologische Sicherheit** im Team aufbauen

---

## Zusammenfassung

1. Agile Entwicklung antwortet auf die Grenzen klassischer Methoden
2. Das Agile Manifest: **4 Werte, 12 Prinzipien**
3. Scrum: **3 Rollen · 3 Artefakte · 5 Events**
4. Sprints liefern regelmässig wertvolle Increments
5. **Inspect & Adapt** ist der Kern – Teams lernen kontinuierlich
6. Praktische Erfahrung ist der beste Lehrmeister

> *«The best architectures, requirements and designs emerge from self-organizing teams.»*  
> — Agile Manifesto

---

## Weiterführende Ressourcen

**Primärquellen**
- [scrumguides.org](https://scrumguides.org) – Der offizielle Scrum Guide (gratis, DE verfügbar)
- [agilemanifesto.org](https://agilemanifesto.org) – Das Agile Manifest

**Bücher**
- *Scrum: The Art of Doing Twice the Work in Half the Time* – Jeff Sutherland
- *User Story Mapping* – Jeff Patton
- *Agile Estimating and Planning* – Mike Cohn

**Tools (kostenlos / Freemium)**
- **Jira** (Atlassian) – umfassendes Scrum-Tool
- **Azure DevOps** – ideal für .NET-Teams
- **Trello** – einfaches Kanban-Board

**Zertifizierungen**
- Professional Scrum Master (PSM I) – [scrum.org](https://scrum.org)
- Certified ScrumMaster (CSM) – ScrumAlliance
