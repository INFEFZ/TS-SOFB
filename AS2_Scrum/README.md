|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Einführung in Scrum](#1-einführung-in-scrum)
  - [1.1. Lernziele](#11-lernziele)
  - [1.2. Was ist Scrum?](#12-was-ist-scrum)
  - [1.3. Rollen und Verantwortlichkeiten in Scrum](#13-rollen-und-verantwortlichkeiten-in-scrum)
    - [1.3.1. 👤 Product Owner (PO)](#131--product-owner-po)
    - [1.3.2. 🛡️ Scrum Master (SM)](#132-️-scrum-master-sm)
    - [1.3.3. 💻 Developer (Entwicklungsteam)](#133--developer-entwicklungsteam)
  - [1.4. Die Artefakte in Scrum](#14-die-artefakte-in-scrum)
  - [1.5. Die fünf Scrum-Events](#15-die-fünf-scrum-events)
  - [1.6. Der Sprint-Zyklus im Überblick](#16-der-sprint-zyklus-im-überblick)
  - [1.7. Scrum in der Praxis](#17-scrum-in-der-praxis)
    - [1.7.1. Schätzungen mit Story Points](#171-schätzungen-mit-story-points)
      - [1.7.1.1. Fibonacci-Skala](#1711-fibonacci-skala)
    - [1.7.2. Das Kanban-Board](#172-das-kanban-board)
  - [1.8. Fazit](#18-fazit)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Datenbankprojekt mit SQLite](#21-datenbankprojekt-mit-sqlite)
  - [2.2. Wetterstation mit Arduino](#22-wetterstation-mit-arduino)

---

</br>

# 1. Einführung in Scrum

## 1.1. Lernziele

- den Zweck von Scrum erklären
- die drei Scrum-Rollen beschreiben
- die wichtigsten Scrum-Artefakte erklären
- den Ablauf eines Sprints beschreiben
- ein einfaches Scrum-Board erstellen und verwenden

---

## 1.2. Was ist Scrum?

**Scrum** ist eine agile Methode um ein Projekt zu managen und durchzuführen. Genauer gesagt ist Scrum ein **Framework – also Grundgerüst – zum Managen eines Prozesses**. Primär wurde Scrum in der Entwicklung von Software eingesetzt. Darüber hinaus kann und wird Scrum mittlerweile aber in den unterschiedlichsten Bereichen zum Projektmanagement genutzt – überall dort wo im Team an einem Produkt bzw. einer Dienstleistung gearbeitet wird. Ob im E-Commerce, der IT-Branche oder der agilen Hardwareentwicklung, findet agiles Projektmanagement nach Scrum mittlerweile Anwendung.

Statt, wie bisher in der klassischen Projekt- oder Produktplanung üblich, bis ins letzte Detail Vorgaben zu tätigen, **überträgt** man in Scrum viele Entscheidungen und damit einhergehend auch Verantwortung an das Team und die beteiligten Rollen. Diesem Vorgehen liegt zugrunde, dass man:

1. sich darüber bewusst ist, viel Unbekanntes vor sich zu haben und nicht jedes Problem vorhersagen zu können und
2. dem agilen Team eher zutraut aufkommende Probleme zu lösen. Aus dem selben Grund verpflichtet sich das Scrum Team im Sprint Planning Meeting zu einem Resultat für den Kunden und nicht zur Abarbeitung einer Liste von Aufgaben oder Anforderungen.

![Scrum-Framework](./scrum-framework.webp)

> Scrum ist eines der beliebtesten agilen Frameworks, das Teams dabei hilft, komplexe Projekte zu bewältigen, indem es die Arbeit in kleinere, iterative Zyklen, sogenannte Sprints, unterteilt

Scrum wird unter anderem von [Scrum.org](https://www.scrum.org/) verbreitet und weiterentwickelt.

[Scrum einfach erklärt](https://www.youtube.com/watch?v=4rBz9in_PsI)

**Zusammengefasst, Scrum hilft Teams:**

- komplexe Produkte zu entwickeln
- flexibel auf Änderungen zu reagieren
- kontinuierlich Fortschritte zu liefern

---

## 1.3. Rollen und Verantwortlichkeiten in Scrum

Die Scrum Methode bringt klar definierte **Rollen** mit, die wichtig sind, um den Projekterfolg sicherzustellen. Die Rollen umfassen:

### 1.3.1. 👤 Product Owner (PO)

- Verantwortlich für die Maximierung des **Produktwerts**
- Pflegt und priorisiert den **Product Backlog**
- Einzige Person, die Backlog-Einträge priorisiert
- Vertritt die Interessen der **Stakeholder**
- Muss verfügbar und entscheidungsfähig sein

### 1.3.2. 🛡️ Scrum Master (SM)

- **Servant Leader** – dient dem Team, nicht umgekehrt
- Entfernt **Impediments** (Hindernisse) für das Team
- Schützt das Team vor externen Störungen
- Fördert das Verständnis und die Anwendung von Scrum
- Moderiert alle **Scrum Events**

### 1.3.3. 💻 Developer (Entwicklungsteam)

- Setzt das Sprint Backlog um, erstellt das Increment
- **Selbstorganisierend**: Das Team entscheidet selbst, wie Arbeit erledigt wird
- **Cross-functional**: Alle nötigen Fähigkeiten im Team vorhanden
- Hält die **Definition of Done** ein
- Typisch 3–9 Personen

---

## 1.4. Die Artefakte in Scrum

Neben den Scrum Rollen, sind auch die Scrum **Artefakte** klar definiert. Sie dienen dazu, den Fortschritt im Projekt und die Zusammenarbeit des Scrum Teams zu unterstützen. Die drei Artefakte sind das Product Backlog, das Sprint Backlog und das Produktinkrement:

| **Artefakt**        | **Beschreibung**                                                                         | **Commitment**     |
| ------------------- | ---------------------------------------------------------------------------------------- | ------------------ |
| **Product Backlog** | Geordnete Liste aller Anforderungen an das Produkt. Vom PO gepflegt und priorisiert.     | Produktziel        |
| **Sprint Backlog**  | Auswahl aus dem Product Backlog für den aktuellen Sprint + Umsetzungsplan.               | Sprint-Ziel        |
| **Increment**       | Kumuliertes, potenziell auslieferbares Produkt am Sprint-Ende. Muss der DoD entsprechen. | Definition of Done |

---

## 1.5. Die fünf Scrum-Events

Neben der Struktur, die durch die Rollen und die Scrum-Artefakte gegeben wird, ist auch der Scrum-Prozess selbst durch einzelne **Ereignisse** strukturiert. Ein Scrum-Sprint umfasst verschiedene Ereignisse, die regelmäßig während eines Sprints stattfinden.
Der Scrum-Prozess besteht aus vier Ereignissen:

| **Event**           | **Max. Dauer** | **Zweck**                                                           |
| ------------------- | -------------- | ------------------------------------------------------------------- |
| **Sprint**          | 1–4 Wochen     | Container für alle anderen Events. Liefert ein Increment.           |
| **Sprint Planning** | 8 h            | Was wird im Sprint gemacht? Wie wird es umgesetzt?                  |
| **Daily Scrum**     | 15 Min./Tag    | Synchronisation: Was tat ich? Was tue ich? Hindernisse?             |
| **Sprint Review**   | 4 h            | Increment wird vorgestellt, Stakeholder-Feedback, Backlog angepasst |
| **Retrospektive**   | 3 h            | Team reflektiert Prozess: Was lief gut? Was verbessern wir?         |

## 1.6. Der Sprint-Zyklus im Überblick

```console
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

## 1.7. Scrum in der Praxis

### 1.7.1. Schätzungen mit Story Points

Story Points messen **relativen Aufwand** (nicht Zeit) und berücksichtigen Komplexität, Umfang und Risiko.

#### 1.7.1.1. Fibonacci-Skala

```console
1 · 2 · 3 · 5 · 8 · 13 · 21 · ?
```

- Relativ zur einfachsten Story des Teams
- **Planning Poker**: Alle schätzen gleichzeitig → Diskussion bei Abweichungen

### 1.7.2. Das Kanban-Board

Visualisiert den Fortschritt des Sprint Backlogs:

```console
┌─────────────┬─────────────┬───────────────┬─────────────┬─────────────┐
│  📋 Backlog │  🔜 To Do  │ ⚙️ InProgress│  🔍 Review  │  ✅ Done    │
├─────────────┼─────────────┼───────────────┼─────────────┼─────────────┤
│ Tasks       │ Login-      │ Task          │ Task        │ Startseite  │
│ exportieren │ Screen      │ erstellen     │ löschen     │             │
│             │ DB-Schema   │               │             │ Auth-Modul  │
└─────────────┴─────────────┴───────────────┴─────────────┴─────────────┘
```

![posit](./x_gitres/scrum-board-posit.webp)

> 💡 **Tools:** Jira, Azure DevOps, Trello, Notion oder ein physisches Whiteboard

---

## 1.8. Fazit

> **Die Stärke der Scrum-Methode liegt in ihrer strikten Prozess- und Rollenstruktur sowie der Möglichkeit, kurzfristige Änderungen vorzunehmen**

---

</br>

# 2. Aufgaben

## 2.1. [Datenbankprojekt mit SQLite](./Gruppenauftrag_LibTrack.md)

## 2.2. [Wetterstation mit Arduino](./Gruppenauftrag_Wetterstation.md)

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
