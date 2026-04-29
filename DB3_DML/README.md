|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. DML – Data Manipulation Language](#1-dml--data-manipulation-language)
  - [1.1. Lernziele](#11-lernziele)
  - [1.2. Einführung: Was ist DML?](#12-einführung-was-ist-dml)
    - [1.2.1. Die Beispiel-Datenbank](#121-die-beispiel-datenbank)
  - [1.3. INSERT INTO – Daten einfügen](#13-insert-into--daten-einfügen)
    - [1.3.1. Syntax](#131-syntax)
    - [1.3.2. Beispiele](#132-beispiele)
  - [1.4. UPDATE – Daten ändern](#14-update--daten-ändern)
    - [1.4.1. Syntax](#141-syntax)
    - [1.4.2. Beispiele](#142-beispiele)
    - [1.4.3. Best Practice: Erst SELECT, dann UPDATE](#143-best-practice-erst-select-dann-update)
  - [1.5. DELETE – Daten löschen](#15-delete--daten-löschen)
    - [1.5.1. Syntax](#151-syntax)
    - [1.5.2. Beispiele](#152-beispiele)
    - [1.5.3. DELETE vs. DROP TABLE – der Unterschied](#153-delete-vs-drop-table--der-unterschied)
    - [1.5.4. Fremdschlüssel-Abhängigkeiten beachten](#154-fremdschlüssel-abhängigkeiten-beachten)
  - [1.6. Transaktionen – Sicherheitsnetz bei DML](#16-transaktionen--sicherheitsnetz-bei-dml)
    - [1.6.1. Syntax](#161-syntax)
    - [1.6.2. Praxisbeispiel: Guthaben-Transfer](#162-praxisbeispiel-guthaben-transfer)
- [2. Übungsaufgaben](#2-übungsaufgaben)
  - [2.1. Mutationen Kundendaten](#21-mutationen-kundendaten)
  - [2.2. Mutationen Blumendaten](#22-mutationen-blumendaten)
  - [2.3. Mutationen Schulverwaltung](#23-mutationen-schulverwaltung)

---

</br>

# 1. DML – Data Manipulation Language

## 1.1. Lernziele

- Daten mit `INSERT INTO` in eine Tabelle einfügen (einzeln & mehrfach)
- Bestehende Datensätze mit `UPDATE` gezielt verändern
- Datensätze mit `DELETE` selektiv oder vollständig löschen
- Die `WHERE`-Klausel korrekt einsetzen, um ungewollte Massenoperationen zu vermeiden
- Typische Fehler und Best Practices bei DML-Operationen benennen

---

## 1.2. Einführung: Was ist DML?

**SQL (Structured Query Language)** gliedert sich in verschiedene Unterbereiche. Die **Data Manipulation Language (DML)** umfasst alle Befehle, die den *Inhalt* von Tabellen verändern – also das Einfügen, Ändern und Löschen von Datensätzen.

| **SQL-Bereich**                | **Abkürzung** | **Wichtigste Befehle**           | **Zweck**              |
| ------------------------------ | ------------- | -------------------------------- | ---------------------- |
| Data Query Language            | DQL           | `SELECT`                         | Daten lesen/abfragen   |
| **Data Manipulation Language** | **DML**       | **`INSERT`, `UPDATE`, `DELETE`** | **Daten verändern**    |
| Data Definition Language       | DDL           | `CREATE`, `ALTER`, `DROP`        | Struktur definieren    |
| Data Control Language          | DCL           | `GRANT`, `REVOKE`                | Berechtigungen steuern |

In diesem Theorieblock fokussieren wir uns auf die drei zentralen DML-Befehle: `INSERT INTO`, `UPDATE` und `DELETE`.

---

### 1.2.1. Die Beispiel-Datenbank

Alle Codebeispiele arbeiten mit folgender Tabelle einer fiktiven Buchhändlerei:

| **Spaltenname** | **Datentyp** | **Constraint**              | **Beschreibung** |
| --------------- | ------------ | --------------------------- | ---------------- |
| `kunden_id`     | `INTEGER`    | `PRIMARY KEY AUTOINCREMENT` | Eindeutige ID    |
| `vorname`       | `TEXT`       | `NOT NULL`                  | Vorname          |
| `nachname`      | `TEXT`       | `NOT NULL`                  | Nachname         |
| `email`         | `TEXT`       | `UNIQUE`                    | E-Mail-Adresse   |
| `guthaben`      | `REAL`       | `DEFAULT 0.00`              | Kontostand CHF   |

```sql
-- Tabelle erstellen (DDL – zur Referenz)
CREATE TABLE kunden (
    kunden_id  INTEGER  PRIMARY KEY AUTOINCREMENT,
    vorname    TEXT     NOT NULL,
    nachname   TEXT     NOT NULL,
    email      TEXT     UNIQUE,
    guthaben   REAL     DEFAULT 0.00
);
```

---

</br>

## 1.3. INSERT INTO – Daten einfügen

Der Befehl `INSERT INTO` fügt **einen oder mehrere neue Datensätze (Zeilen)** in eine bestehende Tabelle ein.

### 1.3.1. Syntax

```sql
-- Variante A: Alle Spalten (Reihenfolge muss exakt stimmen!)
INSERT INTO tabellenname
VALUES (wert1, wert2, wert3, ...);

-- Variante B: Explizite Spaltenangabe (empfohlen!)
INSERT INTO tabellenname (spalte1, spalte2, spalte3)
VALUES (wert1, wert2, wert3);

-- Variante C: Mehrere Zeilen auf einmal (ab SQLite 3.7.11)
INSERT INTO tabellenname (spalte1, spalte2)
VALUES
    (wert1a, wert2a),
    (wert1b, wert2b),
    (wert1c, wert2c);
```

> **Empfehlung:** Immer **Variante B** verwenden! Durch die explizite Spaltenangabe ist der Code robuster gegenüber späteren Schemaänderungen und sofort lesbar – man sieht direkt, welcher Wert wohin gehört.

### 1.3.2. Beispiele

**Einzelnen Datensatz einfügen:**

```sql
-- Einen neuen Kunden einfügen
INSERT INTO kunden (vorname, nachname, email, guthaben)
VALUES ('Anna', 'Meier', 'anna.meier@beispiel.ch', 50.00);

-- kunden_id wird automatisch vergeben (AUTOINCREMENT)
```

**Mehrere Datensätze einfügen:**

```sql
-- Drei Kunden in einem Befehl einfügen
INSERT INTO kunden (vorname, nachname, email, guthaben)
VALUES
    ('Beat',   'Huber',  'beat.huber@beispiel.ch',   0.00),
    ('Corina', 'Schmid', 'corina.schmid@beispiel.ch', 120.50),
    ('David',  'Keller', 'david.keller@beispiel.ch',  15.75);
```

**Einfügen mit DEFAULT-Wert:**

```sql
-- guthaben weglassen → DEFAULT 0.00 wird verwendet
INSERT INTO kunden (vorname, nachname, email)
VALUES ('Eva', 'Brunner', 'eva.brunner@beispiel.ch');
```

---

</br>

## 1.4. UPDATE – Daten ändern

Mit `UPDATE` werden **bestehende Datensätze** in einer Tabelle geändert. Die `WHERE`-Klausel bestimmt, welche Zeilen betroffen sind.

> **Gefahr ohne WHERE:** Wird `UPDATE` ohne `WHERE` ausgeführt, werden **alle** Zeilen der Tabelle geändert!
>
> ```sql
> UPDATE kunden SET guthaben = 0;  -- Alle Kunden haben plötzlich CHF 0.00!
> ```
>
> Immer zuerst mit `SELECT` prüfen, welche Zeilen betroffen wären.

### 1.4.1. Syntax

```sql
UPDATE tabellenname
  SET spalte1 = neuer_wert1,
      spalte2 = neuer_wert2
  WHERE bedingung;
```

### 1.4.2. Beispiele

**Einzelnen Wert ändern:**

```sql
-- E-Mail von Kundin Anna Meier aktualisieren
UPDATE kunden
  SET email = 'a.meier@neuedomain.ch'
  WHERE kunden_id = 1;
```

**Mehrere Felder gleichzeitig ändern:**

```sql
-- Nachname und E-Mail nach Heirat aktualisieren
UPDATE kunden
  SET nachname = 'Huber-Meier',
      email    = 'anna.huber-meier@beispiel.ch'
  WHERE kunden_id = 1;
```

**Berechnung auf bestehenden Wert:**

```sql
-- Guthaben um CHF 20.00 erhöhen (relativer Wert)
UPDATE kunden
  SET guthaben = guthaben + 20.00
  WHERE kunden_id = 3;

-- Alle Guthaben um 5% erhöhen (kein WHERE = alle Zeilen betroffen!)
UPDATE kunden
  SET guthaben = guthaben * 1.05;
```

**Update mit komplexer WHERE-Bedingung:**

```sql
-- Nur Kunden mit negativem Guthaben auf 0 zurücksetzen
UPDATE kunden
  SET guthaben = 0.00
  WHERE guthaben < 0;

-- Bestimmten Kunden anhand E-Mail suchen
UPDATE kunden
  SET guthaben = guthaben + 50.00
  WHERE email = 'beat.huber@beispiel.ch';
```

### 1.4.3. Best Practice: Erst SELECT, dann UPDATE

Vor jedem UPDATE empfiehlt es sich, mit `SELECT` zu prüfen, welche Zeilen betroffen sein werden:

```sql
-- Schritt 1: Prüfen welche Zeilen betroffen sind
SELECT * FROM kunden
  WHERE guthaben < 0;

-- Schritt 2: Erst wenn das Ergebnis stimmt, UPDATE ausführen
UPDATE kunden
  SET guthaben = 0.00
  WHERE guthaben < 0;
```

---

</br>

## 1.5. DELETE – Daten löschen

Mit `DELETE FROM` werden Datensätze aus einer Tabelle entfernt. Das Löschen ist permanent und – ohne Transaktion – nicht rückgängig zu machen.

> **Gefahr ohne WHERE:** `DELETE` ohne `WHERE` löscht **alle** Zeilen der Tabelle – die Tabellenstruktur bleibt erhalten, aber alle Daten sind weg!
>
> ```sql
> DELETE FROM kunden;  -- Alle Kunden sind weg!
> ```

### 1.5.1. Syntax

```sql
-- Bestimmte Zeilen löschen
DELETE FROM tabellenname
  WHERE bedingung;

-- Alle Zeilen löschen (Tabellenstruktur bleibt erhalten)
DELETE FROM tabellenname;
```

### 1.5.2. Beispiele

**Einzelnen Datensatz löschen:**

```sql
-- Kunden mit ID 5 löschen
DELETE FROM kunden
  WHERE kunden_id = 5;
```

**Mehrere Datensätze löschen:**

```sql
-- Alle Kunden ohne E-Mail-Adresse löschen
DELETE FROM kunden
  WHERE email IS NULL;

-- Alle Kunden mit Guthaben unter CHF 1.00 löschen
DELETE FROM kunden
  WHERE guthaben < 1.00;
```

**Alle Zeilen einer Tabelle löschen:**

```sql
-- Alle Datensätze entfernen, Tabellenstruktur bleibt
DELETE FROM kunden;

-- Hinweis: TRUNCATE gibt es in SQLite nicht.
-- DROP TABLE + CREATE TABLE löscht die Tabelle neu
-- und setzt dabei auch den AUTOINCREMENT-Zähler zurück.
```

### 1.5.3. DELETE vs. DROP TABLE – der Unterschied

|                        | `DELETE FROM kunden`   | `DROP TABLE kunden` |
| ---------------------- | ---------------------- | ------------------- |
| **Was wird gelöscht?** | Nur die Zeilen (Daten) | Die gesamte Tabelle |
| **Struktur**           | Bleibt erhalten        | Weg                 |
| **SQL-Bereich**        | DML                    | DDL                 |
| **WHERE möglich?**     | Ja                     | Nein                |
| **Rückgängig?**        | Mit Transaktion ja     | In SQLite schwierig |

### 1.5.4. Fremdschlüssel-Abhängigkeiten beachten

SQLite ignoriert Fremdschlüssel standardmässig – sie müssen explizit aktiviert werden:

```sql
-- Fremdschlüsselprüfung aktivieren (muss pro Session gesetzt werden)
PRAGMA foreign_keys = ON;

-- Beispiel: Tabelle bestellungen mit Fremdschlüssel auf kunden
-- CREATE TABLE bestellungen (
--     bestell_id INTEGER PRIMARY KEY AUTOINCREMENT,
--     kunden_id  INTEGER NOT NULL REFERENCES kunden(kunden_id),
--     artikel    TEXT    NOT NULL
-- );

-- Mit aktivierten Fremdschlüsseln schlägt das Löschen fehl,
-- wenn Kunde ID 1 noch Bestellungen hat:
DELETE FROM kunden WHERE kunden_id = 1;  -- FOREIGN KEY constraint failed!
```

> **Lösungsstrategien bei Fremdschlüsseln:**
>
> 1. Zuerst abhängige Datensätze löschen: `DELETE FROM bestellungen WHERE kunden_id = 1;`
> 2. Dann den Hauptdatensatz: `DELETE FROM kunden WHERE kunden_id = 1;`
> 3. Oder: `ON DELETE CASCADE` beim Erstellen der Tabelle definieren

---

</br>

## 1.6. Transaktionen – Sicherheitsnetz bei DML

**Transaktionen** fassen mehrere DML-Befehle zu einer **atomaren Einheit** zusammen: Entweder werden alle ausgeführt, oder keiner. Das ist das zentrale Sicherheitsnetz bei Datenmanipulationen.

### 1.6.1. Syntax

```sql
BEGIN TRANSACTION;  -- Transaktion starten

    -- DML-Befehle hier ausführen
    UPDATE kunden SET guthaben = guthaben - 100 WHERE kunden_id = 1;
    UPDATE kunden SET guthaben = guthaben + 100 WHERE kunden_id = 2;

COMMIT;    -- Alle Änderungen dauerhaft speichern
-- oder:
ROLLBACK;  -- Alle Änderungen rückgängig machen
```

### 1.6.2. Praxisbeispiel: Guthaben-Transfer

Ein typischer Anwendungsfall: Betrag von Konto A nach Konto B übertragen. Wenn einer der Schritte scheitert, soll nichts geändert werden.

```sql
BEGIN TRANSACTION;

-- Schritt 1: Betrag abziehen
UPDATE kunden
SET guthaben = guthaben - 100.00
WHERE kunden_id = 1;

-- Schritt 2: Betrag gutschreiben
UPDATE kunden
SET guthaben = guthaben + 100.00
WHERE kunden_id = 2;

-- Nur wenn beide Schritte ohne Fehler verlaufen: speichern
COMMIT;
```

> **ACID-Prinzip:** Transaktionen folgen dem ACID-Prinzip:
>
> - **A**tomicity – Alles oder nichts
> - **C**onsistency – Datenbank bleibt in einem gültigen Zustand
> - **I**solation – Transaktionen beeinflussen sich nicht gegenseitig
> - **D**urability – Gespeicherte Daten bleiben dauerhaft erhalten

---

</br>

# 2. Übungsaufgaben

## 2.1. Mutationen Kundendaten

| **Vorgabe**             | **Beschreibung**                                         |
| :---------------------- | :------------------------------------------------------- |
| **Lernziele**           | Kann SQL DDL und DML-Befehle ausführen                   |
|                         | Kann Daten in eine Tabelle einfügen, ändern und löschen. |
|                         | Kann Daten in einer Tabelle abfragen                     |
| **Sozialform**          | Einzelarbeit                                             |
| **Auftrag**             | siehe unten                                              |
| **Hilfsmittel**         |                                                          |
| **Erwartete Resultate** |                                                          |
| **Zeitbedarf**          | 20 min                                                   |
| **Lösungselemente**     | SQL Skript File                                          |

Erstellen Sie die Tabelle `kunden` und lösen Sie folgende Aufgaben in der SQLite-Shell oder in DB Browser for SQLite.

```sql
-- Tabelle erstellen (DDL – zur Referenz)
CREATE TABLE kunden (
    kunden_id  INTEGER  PRIMARY KEY AUTOINCREMENT,
    vorname    TEXT     NOT NULL,
    nachname   TEXT     NOT NULL,
    email      TEXT     UNIQUE,
    guthaben   REAL     DEFAULT 0.00
);
```

**Aufgabe 1 – INSERT INTO:**

**a)** Fügen Sie folgende drei Kunden **einzeln** ein:

- Franziska Gross, <franziska.gross@hf.ch>, Guthaben 75.00
- Marco Brun, <marco.brun@hf.ch>, Guthaben 0.00
- Selina Vogel (keine E-Mail), Guthaben 200.00

**b)** Fügen Sie alle drei Kunden in einem **einzigen** `INSERT`-Befehl ein.

---

**Aufgabe 2 – UPDATE:**

**a)** Erhöhen Sie das Guthaben von Franziska Gross um CHF 25.00.

**b)** Ändern Sie die E-Mail von Marco Brun auf: `m.brun@neuedomain.ch`

**c)** Setzen Sie das Guthaben **aller** Kunden mit einem Guthaben unter CHF 50.00 auf CHF 50.00.

**d)** Führen Sie zuerst einen `SELECT` aus, um zu prüfen, welche Kunden betroffen wären.

---

**Aufgabe 3 – DELETE:**

**a)** Löschen Sie den Kunden mit der ID 2.

**b)** Löschen Sie alle Kunden ohne E-Mail-Adresse (`WHERE email IS NULL`).

**c)** Versuchen Sie, alle Datensätze zu löschen – nutzen Sie dafür eine Transaktion und führen Sie anschliessend ein `ROLLBACK` durch.

---

**Aufgabe 4 – Transaktion (Bonusaufgabe):**

Führen Sie einen Guthaben-Transfer von CHF 50.00 von Kunde 1 zu Kunde 3 durch:

1. Starten Sie eine Transaktion.
2. Ziehen Sie CHF 50.00 von Kunde 1 ab.
3. Schreiben Sie CHF 50.00 Kunde 3 gut.
4. Prüfen Sie das Ergebnis mit `SELECT`.
5. Erst dann: `COMMIT`.

---

## 2.2. Mutationen Blumendaten

| **Vorgabe**             | **Beschreibung**                                         |
| :---------------------- | :------------------------------------------------------- |
| **Lernziele**           | Kann SQL DDL und DML-Befehle ausführen                   |
|                         | Kann Daten in eine Tabelle einfügen, ändern und löschen. |
|                         | Kann Daten in einer Tabelle abfragen                     |
| **Sozialform**          | Einzelarbeit                                             |
| **Auftrag**             | siehe unten                                              |
| **Hilfsmittel**         | Kursunterlagen, SQL-Management Studio                    |
| **Erwartete Resultate** |                                                          |
| **Zeitbedarf**          | 20 min                                                   |
| **Lösungselemente**     | Vollständige SQL-Skript-Datei                            |

Erstelle zu den nachfolgenden Aufgaben die korrekten und vollständigen SQL-Befehle. Die
Lösungen müssen mit Aufgabentext in einer SQL-Skriptdatei abgespeichert werden.

**A1:** Kreiere mit SQL-Statements eine Tabelle BLUME mit den Attributen:

```sql
ID    INT NOT       NULL ➔ PK 
Name  VARCHAR(50)   NOT NULL 
Preis DECIMAL(8,2)  NOT NULL 
```

**A2:** Füge zwei Datensätze zu mit den Werten:

```sql
10,   Nelke,  2.35 
11,   Rose,   4.50
```

**A3:** Überprüfe diese Einträge mit einem `SELECT`-Statement.

**A4:** Erhöhe den Preis der Rose um 10%.

**A5:** Überprüfe das Update in 4) mit einem `SELECT`-Statement.

**A6:** Lösche den Datensatz mit der **Nelke**

**A7:** Erweitere die `BLUME` Tabelle mit Spalte SORTE (VARCHAR(20)).

**A8:** Stelle sicher, dass nicht zweimal derselbe Blumenname eingetragen werden kann.

**A9:** Stelle sicher, dass der Blumenpreis immer > 0 sein muss.

**A10:** Entferne die gesamte Tabelle `BLUME`, inklusive Metadaten.

---

## 2.3. Mutationen Schulverwaltung

| **Vorgabe**             | **Beschreibung**                                         |
| :---------------------- | :------------------------------------------------------- |
| **Lernziele**           | Kann SQL DDL und DML-Befehle ausführen                   |
|                         | Kann Daten in eine Tabelle einfügen, ändern und löschen. |
|                         | Kann Daten in einer Tabelle abfragen                     |
| **Sozialform**          | Einzelarbeit                                             |
| **Auftrag**             | siehe unten                                              |
| **Hilfsmittel**         |                                                          |
| **Erwartete Resultate** |                                                          |
| **Zeitbedarf**          | 30 min                                                   |
| **Lösungselemente**     | Fehlerfreie SQL-Skriptdateien                            |
|                         | `sv_insert_data.sql`                                     |

**Ausgangssituation:**

- Sie verwenden das Datenbank Modell vorangegangener Aufgabe.

Fügen Sie per SQL Befehl (insert into …) alle Datenzeilen aus der Tabelle unten in Ihre Datenbank ein.

```sql
INSERT INTO [user.]tabelle [ (column [,column] ...) ]
VALUES (value [,value] ...)
```

---

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
