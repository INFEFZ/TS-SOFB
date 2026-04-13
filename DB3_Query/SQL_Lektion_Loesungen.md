# SQL-Abfragen mit SQLite – Musterlösungen

> Alle Lösungen basieren auf der Bibliotheksdatenbank (`bibliothek_daten.sql`).
> Es kann mehrere korrekte Lösungswege geben – die hier gezeigten sind jeweils ein empfohlener Ansatz.

---

## Übung 1.1 – SELECT Grundstruktur

**Aufgabe:** Vorname und Nachname als eine Spalte `Autor`, Erscheinungsjahr, Preis +10% als `Neuer_Preis`, sortiert nach Erscheinungsjahr absteigend.

```sql
SELECT
    a.vorname || ' ' || a.nachname AS Autor,
    b.jahr                         AS Erscheinungsjahr,
    ROUND(b.preis * 1.10, 2)       AS Neuer_Preis
FROM buecher b
JOIN autoren a ON b.autor_id = a.id
WHERE b.autor_id IS NOT NULL
ORDER BY b.jahr DESC;
```

**Erwartetes Ergebnis (Auszug):**

| Autor           | Erscheinungsjahr | Neuer_Preis |
| --------------- | ---------------- | ----------- |
| Haruki Murakami | 2002             | 26.29       |
| Jo Nesbø        | 2007             | 24.09       |
| Stieg Larsson   | 2007             | 25.19       |
| ...             | ...              | ...         |

> 💡 **Hinweis:** `WHERE b.autor_id IS NOT NULL` schliesst das Buch ohne Autor aus.
> Alternativ: `INNER JOIN` statt `JOIN` – dann fällt das Buch ohne `autor_id` automatisch weg.

---

## Übung 2.1 – WHERE und Prädikate

### Aufgabe 1 – Bücher zwischen 2010 und 2023, Preis über 15 CHF

```sql
SELECT titel, jahr, preis
FROM buecher
WHERE jahr BETWEEN 2010 AND 2023
  AND preis > 15.00
ORDER BY jahr, preis;
```

**Erwartetes Ergebnis:**

| Titel          | Jahr | Preis |
| -------------- | ---- | ----- |
| Sieben Jahre   | 2009 | 21.50 |
| Der Schneemann | 2007 | 21.90 |
| Vergebung      | 2007 | 22.90 |

> 💡 **Hinweis:** `BETWEEN 2010 AND 2023` schliesst beide Grenzen ein.

---

### Aufgabe 2 – Kunden aus Zürich oder Bern

```sql
SELECT name, email, stadt
FROM kunden
WHERE stadt IN ('Zürich', 'Bern')
ORDER BY stadt, name;
```

**Alternativ mit OR:**

```sql
SELECT name, email, stadt
FROM kunden
WHERE stadt = 'Zürich' OR stadt = 'Bern'
ORDER BY stadt, name;
```

> 💡 **Hinweis:** `IN` ist bei mehreren Werten lesbarer als `OR`-Ketten.

---

### Aufgabe 3 – Buchtitel enthält das Wort «Welt»

```sql
SELECT titel, genre, jahr
FROM buecher
WHERE titel LIKE '%Welt%';
```

**Case-insensitiv (sicherer):**

```sql
SELECT titel, genre, jahr
FROM buecher
WHERE LOWER(titel) LIKE '%welt%';
```

> 💡 **Hinweis:** In der Beispieldatenbank gibt es keinen Treffer – das ist beabsichtigt!
> Die Abfrage ist trotzdem korrekt. Zum Testen: `LIKE '%Jahre%'` liefert «Hundert Jahre Einsamkeit».

---

### Aufgabe 4 – Autoren ohne bekanntes Geburtsland

```sql
SELECT vorname, nachname, geburtsjahr
FROM autoren
WHERE land IS NULL;
```

**Erwartetes Ergebnis:**

| Vorname   | Nachname | Geburtsjahr |
| --------- | -------- | ----------- |
| Unbekannt | Autor    | (NULL)      |

> ⚠️ **Häufiger Fehler:** `WHERE land = NULL` – das funktioniert **nicht**!
> `NULL` kann nur mit `IS NULL` / `IS NOT NULL` verglichen werden.

---

### Aufgabe 5 – Ausverkaufte Bücher (Lagerbestand = 0)

```sql
SELECT titel, genre, preis
FROM buecher
WHERE lagerbestand = 0
ORDER BY titel;
```

**Erwartetes Ergebnis:**

| Titel     | Genre | Preis |
| --------- | ----- | ----- |
| Vergebung | Krimi | 22.90 |

---

## Übung 3.1 – Sortieren und Aggregieren

### Aufgabe 1 – Bücher pro Erscheinungsjahr

```sql
SELECT
    jahr,
    COUNT(*) AS Anzahl_Buecher
FROM buecher
WHERE jahr IS NOT NULL
GROUP BY jahr
ORDER BY jahr DESC;
```

**Erwartetes Ergebnis (Auszug):**

| Jahr | Anzahl_Buecher |
| ---- | -------------- |
| 2009 | 1              |
| 2007 | 2              |
| 2004 | 1              |
| 2002 | 1              |
| ...  | ...            |

> 💡 **Hinweis:** `WHERE jahr IS NOT NULL` schliesst das Buch ohne Jahreszahl aus.

---

### Aufgabe 2 – Genres mit Durchschnittspreis über 25 CHF

```sql
SELECT
    genre,
    COUNT(*)            AS Anzahl,
    ROUND(AVG(preis), 2) AS Avg_Preis
FROM buecher
GROUP BY genre
HAVING AVG(preis) > 25.00
ORDER BY Avg_Preis DESC;
```

**Erwartetes Ergebnis:**

| Genre | Anzahl | Avg_Preis |
| ----- | ------ | --------- |
| Roman | ...    | ...       |

> ⚠️ **Häufiger Fehler:** `WHERE AVG(preis) > 25` – das geht nicht!
> Aggregatfunktionen können nicht in `WHERE` stehen, nur in `HAVING`.

---

### Aufgabe 3 – Top 3 Städte nach Kundenanzahl

```sql
SELECT
    stadt,
    COUNT(*) AS Anzahl_Kunden
FROM kunden
GROUP BY stadt
ORDER BY Anzahl_Kunden DESC
LIMIT 3;
```

**Erwartetes Ergebnis:**

| Stadt  | Anzahl_Kunden |
| ------ | ------------- |
| Zürich | 8             |
| Bern   | 5             |
| Basel  | 3             |

---

### Aufgabe 4 – Bücher nach 2010, unter 20 CHF

```sql
SELECT COUNT(*) AS Anzahl
FROM buecher
WHERE jahr > 2010
  AND preis < 20.00;
```

> 💡 **Hinweis:** Hier braucht es kein `GROUP BY`, da wir einen einzelnen Gesamtwert wollen.

---

## Übung 4.1 – JOINs

### Aufgabe 1 – Bücher mit Autorenname und Land

```sql
SELECT
    b.titel,
    a.vorname || ' ' || a.nachname AS Autor,
    a.land,
    b.genre,
    b.preis
FROM buecher b
INNER JOIN autoren a ON b.autor_id = a.id
ORDER BY a.nachname, b.titel;
```

> 💡 **Hinweis:** `INNER JOIN` schliesst das Buch ohne Autor automatisch aus.
> Soll es mit erscheinen: `LEFT JOIN` verwenden und `COALESCE(a.vorname || ' ' || a.nachname, 'Unbekannt')`.

---

### Aufgabe 2 – Kunden, die noch nie ausgeliehen haben

**Lösung mit LEFT JOIN (Anti-Join):**

```sql
SELECT k.name, k.email, k.stadt
FROM kunden k
LEFT JOIN ausleihen a ON a.kunden_id = k.id
WHERE a.id IS NULL
ORDER BY k.name;
```

**Alternativ mit NOT EXISTS:**

```sql
SELECT name, email, stadt
FROM kunden k
WHERE NOT EXISTS (
    SELECT 1 FROM ausleihen a WHERE a.kunden_id = k.id
)
ORDER BY name;
```

**Erwartetes Ergebnis:**

| Name           | Stadt  |
| -------------- | ------ |
| Vera Brändli   | Zürich |
| Walter Engel   | Bern   |
| Yannick Sutter | Luzern |
| Zoe Hartmann   | Zürich |

> 💡 **Hinweis:** Beide Lösungen sind korrekt. `NOT EXISTS` ist bei grossen Tabellen oft schneller.

---

### Aufgabe 3 – Die 5 beliebtesten Bücher

```sql
SELECT
    b.titel,
    b.genre,
    COUNT(a.id) AS Anzahl_Ausleihen
FROM buecher b
LEFT JOIN ausleihen a ON a.buch_id = b.id
GROUP BY b.id, b.titel, b.genre
ORDER BY Anzahl_Ausleihen DESC
LIMIT 5;
```

**Erwartetes Ergebnis:**

| Titel                                 | Genre    | Anzahl_Ausleihen |
| ------------------------------------- | -------- | ---------------- |
| Harry Potter und der Stein der Weisen | Fantasy  | 5                |
| 1984                                  | Dystopie | 3                |
| Und dann gabs keines mehr             | Krimi    | 3                |
| ...                                   | ...      | ...              |

> 💡 **Hinweis:** `LEFT JOIN` statt `INNER JOIN`, damit auch Bücher mit 0 Ausleihen erscheinen.
> `GROUP BY b.id` reicht in SQLite technisch, aber es ist Best Practice, alle SELECT-Spalten aufzuführen.

---

### Aufgabe 4 – Genres von Schweizer Autoren

```sql
SELECT DISTINCT b.genre
FROM buecher b
INNER JOIN autoren a ON b.autor_id = a.id
WHERE a.land = 'Schweiz'
ORDER BY b.genre;
```

**Erwartetes Ergebnis:**

| Genre |
| ----- |
| Drama |
| Roman |

---

## Übung 5.1 – Subqueries

### Aufgabe 1 – Bücher teurer als das teuerste «Roman»

```sql
SELECT titel, genre, preis
FROM buecher
WHERE preis > (
    SELECT MAX(preis)
    FROM buecher
    WHERE genre = 'Roman'
)
ORDER BY preis DESC;
```

**Zwischenwert:** `SELECT MAX(preis) FROM buecher WHERE genre = 'Roman'` → 29.90 CHF (Krieg und Frieden)

**Erwartetes Ergebnis:** Alle Bücher mit Preis > 29.90 CHF

> 💡 **Hinweis:** Die Unterabfrage wird einmal ausgewertet und ihr Ergebnis (ein einzelner Wert) wird im `WHERE` der äusseren Abfrage verwendet.

---

### Aufgabe 2 – Autoren mit überdurchschnittlich vielen Büchern

```sql
SELECT
    a.vorname || ' ' || a.nachname AS Autor,
    COUNT(b.id)                    AS Anzahl_Buecher
FROM autoren a
INNER JOIN buecher b ON b.autor_id = a.id
GROUP BY a.id, a.vorname, a.nachname
HAVING COUNT(b.id) > (
    SELECT AVG(buecher_pro_autor)
    FROM (
        SELECT COUNT(*) AS buecher_pro_autor
        FROM buecher
        WHERE autor_id IS NOT NULL
        GROUP BY autor_id
    )
)
ORDER BY Anzahl_Buecher DESC;
```

**Erwartetes Ergebnis:**

| Autor                  | Anzahl_Buecher |
| ---------------------- | -------------- |
| Max Frisch             | 3              |
| Friedrich Dürrenmatt   | 2              |
| Joanne K. Rowling      | 2              |
| Franz Kafka            | 2              |
| Thomas Mann            | 2              |
| Gabriel García Márquez | 2              |
| Leo Tolstoi            | 2              |
| Fjodor Dostojewski     | 2              |

> 💡 **Hinweis:** Hier ist eine **verschachtelte Unterabfrage** nötig:
> Die innere berechnet die Bücher pro Autor, die äussere den Durchschnitt davon.

---

### Aufgabe 3 – Kunden ohne Krimi-Ausleihe

```sql
SELECT k.name, k.stadt
FROM kunden k
WHERE NOT EXISTS (
    SELECT 1
    FROM ausleihen a
    JOIN buecher b ON a.buch_id = b.id
    WHERE a.kunden_id = k.id
      AND b.genre = 'Krimi'
)
ORDER BY k.name;
```

**Alternativ mit NOT IN:**

```sql
SELECT name, stadt
FROM kunden
WHERE id NOT IN (
    SELECT DISTINCT a.kunden_id
    FROM ausleihen a
    JOIN buecher b ON a.buch_id = b.id
    WHERE b.genre = 'Krimi'
)
ORDER BY name;
```

> ⚠️ **Vorsicht mit `NOT IN`:** Falls `kunden_id` in der Unterabfrage `NULL`-Werte enthält,
> liefert `NOT IN` kein Ergebnis! `NOT EXISTS` ist in diesem Fall sicherer.

---

## Praxisprojekt – Musterlösungen

### Aufgabe A – Bestandsübersicht pro Genre

```sql
SELECT
    genre                        AS Genre,
    COUNT(*)                     AS Anzahl_Titel,
    SUM(lagerbestand)            AS Verfuegbar,
    ROUND(AVG(preis), 2)         AS Avg_Preis,
    MIN(preis)                   AS Guenstigstes,
    MAX(preis)                   AS Teuerstes
FROM buecher
WHERE genre IS NOT NULL
GROUP BY genre
HAVING COUNT(*) >= 2
ORDER BY Anzahl_Titel DESC;
```

**Erwartetes Ergebnis (Auszug):**

| Genre   | Anzahl_Titel | Verfuegbar | Avg_Preis | Guenstigstes | Teuerstes |
| ------- | ------------ | ---------- | --------- | ------------ | --------- |
| Roman   | 18           | 59         | 21.97     | 10.90        | 29.90     |
| Krimi   | 6            | 30         | 20.57     | 15.90        | 25.90     |
| Drama   | 3            | 18         | 12.77     | 11.90        | 13.50     |
| Fantasy | 2            | 21         | 24.90     | 24.90        | 24.90     |
| ...     | ...          | ...        | ...       | ...          | ...       |

---

### Aufgabe B – Top-Ausleiher Report

```sql
SELECT
    k.name                                    AS Name,
    k.stadt                                   AS Stadt,
    COUNT(a.id)                               AS Anzahl_Ausleihen,
    COUNT(CASE WHEN a.rueckgabe IS NULL
               THEN 1 END)                    AS Aktuell_Ausgeliehen
FROM kunden k
LEFT JOIN ausleihen a ON a.kunden_id = k.id
GROUP BY k.id, k.name, k.stadt
ORDER BY Anzahl_Ausleihen DESC;
```

**Erwartetes Ergebnis (Auszug):**

| Name           | Stadt  | Anzahl_Ausleihen | Aktuell_Ausgeliehen |
| -------------- | ------ | ---------------- | ------------------- |
| Kathrin Wolf   | Zürich | 5                | 1                   |
| Anna Müller    | Zürich | 5                | 1                   |
| Beat Schneider | Bern   | 3                | 0                   |
| Carmen Vogel   | Basel  | 3                | 1                   |
| ...            | ...    | ...              | ...                 |
| Zoe Hartmann   | Zürich | 0                | 0                   |

> 💡 **Hinweis:** `COUNT(CASE WHEN ... THEN 1 END)` ist ein nützliches Muster für
> **bedingte Aggregation** – es zählt nur Zeilen, bei denen die Bedingung zutrifft.

---

### Aufgabe C – Autoren-Performance

```sql
SELECT
    a.vorname || ' ' || a.nachname          AS Autor,
    a.land                                  AS Land,
    COUNT(DISTINCT b.id)                    AS Anzahl_Buecher,
    COUNT(au.id)                            AS Gesamtausleihen,
    ROUND(AVG(b.preis), 2)                  AS Avg_Preis,
    (
        SELECT b2.titel
        FROM buecher b2
        LEFT JOIN ausleihen au2 ON au2.buch_id = b2.id
        WHERE b2.autor_id = a.id
        GROUP BY b2.id
        ORDER BY COUNT(au2.id) DESC
        LIMIT 1
    )                                       AS Beliebtestes_Buch
FROM autoren a
INNER JOIN buecher b  ON b.autor_id  = a.id
LEFT  JOIN ausleihen au ON au.buch_id = b.id
GROUP BY a.id, a.vorname, a.nachname, a.land
ORDER BY Gesamtausleihen DESC;
```

**Erwartetes Ergebnis (Auszug):**

| Autor             | Land            | Anzahl_Buecher | Gesamtausleihen | Avg_Preis | Beliebtestes_Buch                     |
| ----------------- | --------------- | -------------- | --------------- | --------- | ------------------------------------- |
| Joanne K. Rowling | Grossbritannien | 2              | 9               | 24.90     | Harry Potter und der Stein der Weisen |
| Agatha Christie   | Grossbritannien | 2              | 7               | 16.40     | Und dann gabs keines mehr             |
| Max Frisch        | Schweiz         | 3              | 6               | 16.10     | Homo Faber                            |
| ...               | ...             | ...            | ...             | ...       | ...                                   |

> 💡 **Hinweis:** Die korrelierte Unterabfrage im `SELECT` wird für **jede Zeile** des äusseren
> Resultats ausgeführt. Das ist praktisch, aber bei sehr grossen Tabellen auf die Performance achten.

---

## Allgemeine Hinweise für Dozierende

### Häufige Fehler der Lernenden

| Fehler               | Ursache                         | Lösung                                   |
| -------------------- | ------------------------------- | ---------------------------------------- |
| `WHERE land = NULL`  | NULL-Vergleich mit `=`          | `IS NULL` verwenden                      |
| `WHERE COUNT(*) > 5` | Aggregat in WHERE               | `HAVING COUNT(*) > 5`                    |
| Fehlende Gruppierung | Spalten in SELECT ohne GROUP BY | Alle Nicht-Aggregat-Spalten in GROUP BY  |
| `SELECT *` bei JOINs | Mehrdeutige Spalten             | Tabellenaliase und qualifizierte Spalten |
| `NOT IN` mit NULL    | NULL in Unterabfrage            | `NOT EXISTS` bevorzugen                  |

### Erweiterungsaufgaben (für schnelle Lernende)

```sql
-- 1. Monatliche Ausleihstatistik (SQLite Datumsfunktionen)
SELECT
    strftime('%Y-%m', ausleihdatum) AS Monat,
    COUNT(*)                        AS Ausleihen
FROM ausleihen
GROUP BY Monat
ORDER BY Monat;

-- 2. Durchschnittliche Ausleihdauer in Tagen
SELECT
    ROUND(AVG(
        julianday(rueckgabe) - julianday(ausleihdatum)
    ), 1) AS Avg_Tage
FROM ausleihen
WHERE rueckgabe IS NOT NULL;

-- 3. Bücher, die öfter ausgeliehen als zurückgegeben wurden
-- (aktuelle Ausleihen pro Buch)
SELECT
    b.titel,
    COUNT(CASE WHEN a.rueckgabe IS NULL THEN 1 END) AS Offen,
    COUNT(a.id)                                      AS Gesamt
FROM buecher b
LEFT JOIN ausleihen a ON a.buch_id = b.id
GROUP BY b.id, b.titel
HAVING COUNT(CASE WHEN a.rueckgabe IS NULL THEN 1 END) > 0
ORDER BY Offen DESC;
```
