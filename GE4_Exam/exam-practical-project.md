|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Prüfung Praxisarbeit](#1-prüfung-praxisarbeit)
  - [1.1. Organisation](#11-organisation)
  - [1.2. Ausgangssituation](#12-ausgangssituation)
  - [1.3. Ziel der Praxisarbeit](#13-ziel-der-praxisarbeit)
  - [1.4. Rahmenbedingungen](#14-rahmenbedingungen)
  - [1.5. Gesamtarchitektur](#15-gesamtarchitektur)
    - [1.5.1. Lösung mit serieller Schnittstelle (C#/Python)](#151-lösung-mit-serieller-schnittstelle-cpython)
    - [1.5.2. Lösung mit WebAPI (C#)](#152-lösung-mit-webapi-c)
  - [1.6. Projektanforderungen (für alle Szenarien)](#16-projektanforderungen-für-alle-szenarien)
    - [1.6.1. Datenbank (SQLite)](#161-datenbank-sqlite)
    - [1.6.2. Programmierung (C mit Arduino)](#162-programmierung-c-mit-arduino)
    - [1.6.3. Integration](#163-integration)
  - [1.7. Mögliche Themen (Team wählt eines)](#17-mögliche-themen-team-wählt-eines)
    - [1.7.1. Szenario 1: Parkplatz-Überwachungssystem](#171-szenario-1-parkplatz-überwachungssystem)
    - [1.7.2. Szenario 2: Raumklima-Monitoring](#172-szenario-2-raumklima-monitoring)
    - [1.7.3. Szenario 3 – Smart-Home Lichtsteuerung](#173-szenario-3--smart-home-lichtsteuerung)
    - [1.7.4. Szenario 4 – Lagerverwaltung mit Sensorunterstützung](#174-szenario-4--lagerverwaltung-mit-sensorunterstützung)
  - [1.8. Dokumentation](#18-dokumentation)
  - [1.9. Präsentation](#19-präsentation)
  - [1.10. Abgabe](#110-abgabe)
- [2. Bewertung](#2-bewertung)
  - [2.1. Notenskala](#21-notenskala)

</br>

# 1. Prüfung Praxisarbeit

## 1.1. Organisation

|                     |                                     |
| ------------------- | ----------------------------------- |
| **Lernziele**       | siehe Ziel der Praxisarbeit         |
| **Sozialform**      | Teamarbeit (max. 1-2 Mitglieder)    |
| **Auftrag**         | siehe unten                         |
| **Hilfsmittel**     | Internet                            |
| **Zeitbedarf**      | 12-20h                              |
| **Lösungselemente** | Code + Dokumentation + Präsentation |

---

## 1.2. Ausgangssituation

Die Firma **TechSolutions GmbH** entwickelt innovative Lösungen im Bereich **IoT (Internet of Things)** für kleine und mittlere Unternehmen. Ziel ist es, einfache physische Prozesse durch digitale Systeme zu erfassen, auszuwerten und teilweise zu automatisieren.

Ein Kunde der **TechSolutions GmbH** möchte einen ersten Prototypen für eine solche Lösung realisieren. Dabei sollen **Sensordaten** oder **Zustände von Geräten** vor Ort erfasst, über eine **serielle Verbindung oder Netzwerk** übertragen und zentral gespeichert und ausgewertet werden.

Aktuell existiert jedoch noch keine geeignete Softwarelösung. Die Datenerfassung erfolgt teilweise manuell oder gar nicht, wodurch wichtige Informationen verloren gehen. Zudem fehlt eine zentrale Übersicht über die erfassten Daten.

---

## 1.3. Ziel der Praxisarbeit

Ihr Team wurde beauftragt, einen **funktionalen Prototypen** zu entwickeln, der folgende Anforderungen erfüllt:

- Ein Mikrocontroller (Arduino) erfasst Daten oder Zustände (z.B. Sensorwerte oder Ereignisse)
- Die Daten werden seriell, als Datei (CSV, XML, JSON) oder über das Netzwerk (WebAPI) an eine zentrale Schnittstelle übertragen
- Die Daten werden in einer relationalen Datenbank (SQLite) gespeichert
- Die gespeicherten Daten können abgefragt und ausgewertet werden

> **Ziel ist es, die im Unterricht behandelten Grundlagen praktisch anzuwenden und zu verbinden.**

---

## 1.4. Rahmenbedingungen

- Der Prototyp soll mit einfachen Mitteln und begrenzter Zeit umgesetzt werden
- Der Fokus liegt auf einem **funktionierenden Gesamtsystem**, nicht auf Perfektion
- Einzelne Komponenten dürfen vereinfacht oder simuliert werden

---

## 1.5. Gesamtarchitektur

### 1.5.1. Lösung mit serieller Schnittstelle (C#/Python)

```console
Arduino (Sensor/Aktor + WiFi)
        ↓ seriell
Datei (CSV)
        ↓ import
SQLite Datenbank
```

### 1.5.2. Lösung mit WebAPI (C#)

```console
Arduino (Sensor/Aktor + WiFi)
        ↓ HTTP (JSON)
ASP.NET Core WebAPI
        ↓
SQLite Datenbank
```

---

## 1.6. Projektanforderungen (für alle Szenarien)

### 1.6.1. Datenbank (SQLite)

- Mindestens 2 Tabellen
- Verwendung von:
  - Primär- und Fremdschlüsseln
  - Beziehungen (1:n, optional n:m)
- Mindestens:
  - 5 Datensätze pro Tabelle
  - 3 SELECT-Abfragen (inkl. JOIN)
  - 1 INSERT, 1 UPDATE, 1 DELETE

### 1.6.2. Programmierung (C mit Arduino)

- Verwendung von:
  - Variablen, Kontrollstrukturen (if, loop)
  - mindestens 1 Funktion
- Einbindung von:
  - Sensor(en) oder Aktor(en)
- Serielle oder WebAPI Kommunikation (z. B. mit PC)

### 1.6.3. Integration

- Austausch von Daten zwischen:
  - Arduino ↔ PC-Anwendung oder
  - Arduino → Datei → SQLite oder
  - Arduino → WIFI → WebAPI → SQLite
- Beispiel:
  - Messwerte speichern
  - Steuerbefehle aus DB senden

## 1.7. Mögliche Themen (Team wählt eines)

Jedes Team darf eines der folgenden Szenarien auswählen – oder **ein eigenes Thema** vorschlagen:

### 1.7.1. Szenario 1: Parkplatz-Überwachungssystem

**Beschreibung:** Ein System zur Überwachung von Parkplätzen mittels Sensoren.

**Funktionalität:**

- Arduino erkennt:
  - Parkplatz belegt / frei (z.B. Ultraschall oder IR)
  - sendet Status seriell oder via WiFi an API
- Daten werden gespeichert:
  - Zeit, Status, Parkplatz-ID
- SQLite verwaltet:
  - Parkplätze
  - Belegungen
  - Zeitverlauf
- Abfragen:
  - Aktuell freie Plätze
  - Historie

### 1.7.2. Szenario 2: Raumklima-Monitoring

**Beschreibung:** Messung und Speicherung von Umgebungsdaten.

**Funktionalität:**

- Arduino misst:
  - Temperatur / Luftfeuchtigkeit
  - sendet periodisch Daten
- Speicherung in SQLite:
  - Zeit, Sensor, Werte
- Auswertung:
  - Durchschnittswerte
  - Grenzwertüberschreitungen

### 1.7.3. Szenario 3 – Smart-Home Lichtsteuerung

**Beschreibung:** Steuerung von LEDs über eine Datenbank.

**Funktionalität:**

- SQLite speichert:
  - Räume, Geräte, Status, Aktionen
- Arduino:
  - schaltet LEDs ein/aus
  - sendet Status
- Steuerung:
  - via serielle Befehle oder WebAPI
- Optional
  - Zeitsteuerung

### 1.7.4. Szenario 4 – Lagerverwaltung mit Sensorunterstützung

**Beschreibung:** Verwaltung eines kleinen Lagers mit Unterstützung durch Arduino.

**Funktionalität:**

- SQLite:
  - Produkte, Lagerbestand, Buchungen
- Arduino:
  - erkennt Bewegung oder Scans (simuliert)
  - sendet Events
- Aktionen:
  - Bestand erhöhen/verringern
- Abfragen:
  - Bestand, Nachbestellungen

---

## 1.8. Dokumentation

- Systemübersicht (Diagramm)
  - Systemarchitektur
  - Technologie Stack
  - Voraussetzungen
  - Eingesetzte Tools und Komponenten mit Versionen
- Datenbankmodell (ERD oder Tabellenübersicht)
  - ERM
  - Datenmodell
- Software Design
  - UML (Aktivitätsdiagram)
  - Datenfluss
  - Modularisierung u. Funktionen
- Reflexion
  - Stolpersteine
  - Lesson learned
  - Fazit

---

## 1.9. Präsentation

- Vorstellung des Projekts
- Live-Demo (falls möglich)
- Reflexion:
  - Herausforderungen
  - Learnings

---

## 1.10. Abgabe

Das Team gibt ab:

- Technische Artefakte
  - Arduino-Code (.ino)
  - SQL-Skripte:
    - schema.sql
    - insert.sql
- Optional:
  - kleines PC-Programm (z.B. C#/Python)
  - WebAPI (C#) Projekt

---

</br>

# 2. Bewertung

| **Bewertung**                                           | **Punkte** |
| ------------------------------------------------------- | :--------: |
| **Arduino**                                             |            |
| Verwendung von Sensor/Aktor oder Simulation             |     3      |
| Sauberer Code (Strukturen, Funktionen)                  |     3      |
| Serielle/WLAN-Verbindung funktioniert                   |     3      |
|                                                         |            |
| **Datenbankdesign (SQLite)**                            |            |
| Mindestens 4 Tabellen                                   |     2      |
| Sinnvolle Struktur & Normalisierung                     |     2      |
| Verwendung von PK/FK und Beziehungen                    |     2      |
| Beispielabfragen (JOIN etc.)                            |     2      |
|                                                         |            |
| **Integration & Architektur**                           |            |
| Gesamtsystem funktioniert (alle Komponenten integriert) |     3      |
| Datenfluss ist logisch und nachvollziehbar              |     3      |
| Architektur ist sinnvoll aufgebaut                      |     3      |
|                                                         |            |
| **Scrum / Vorgehen**                                    |            |
| Product Backlog vorhanden                               |     2      |
| Sprintplanung durchgeführt                              |     2      |
| Reflexion (Review/Retrospektive)                        |     2      |
|                                                         |            |
| **Dokumentation**                                       |            |
| Dokumentation vollständig & verständlich                |     3      |
| Architekturdiagramm vorhanden                           |     3      |
|                                                         |            |
| **Präsentation**                                        |            |
| Struktur, Verständlichkeit                              |     2      |
| Live‑Demo & Ergebnisdarstellung                         |     2      |
| Teamarbeit & Professionalität                           |     2      |
| Fazit / Reflexion                                       |     2      |
|                                                         |            |
| **Total**                                               |   **46**   |

## 2.1. Notenskala

> Erreichte Punktzahl x 5 / Max. Punktzahl + 1 = Note (auf 1/10 Noten gerundet)
