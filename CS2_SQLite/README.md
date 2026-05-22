|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Datenbankanbindung mit SQLite in C#](#1-datenbankanbindung-mit-sqlite-in-c)
  - [1.1. Lernziele](#11-lernziele)
  - [1.2. Vorbereitung – NuGet-Paket installieren](#12-vorbereitung--nuget-paket-installieren)
    - [1.2.1. Projekt erstellen und Paket hinzufügen](#121-projekt-erstellen-und-paket-hinzufügen)
    - [1.2.2. Überprüfung der .csproj-Datei](#122-überprüfung-der-csproj-datei)
    - [1.2.3. Using-Direktive einbinden](#123-using-direktive-einbinden)
  - [1.3. Verbindungsaufbau – SqliteConnection](#13-verbindungsaufbau--sqliteconnection)
    - [1.3.1. Connection String](#131-connection-string)
    - [1.3.2. Verbindung öffnen und schliessen – using-Block](#132-verbindung-öffnen-und-schliessen--using-block)
  - [1.4. Tabelle erstellen – DDL mit SqliteCommand](#14-tabelle-erstellen--ddl-mit-sqlitecommand)
    - [1.4.1. Das Objekt SqliteCommand](#141-das-objekt-sqlitecommand)
    - [1.4.2. Ausführungsmethoden im Überblick](#142-ausführungsmethoden-im-überblick)
  - [1.5. CRUD-Operationen](#15-crud-operationen)
    - [1.5.1. CREATE – Datensatz einfügen](#151-create--datensatz-einfügen)
      - [1.5.1.1. Zuletzt eingefügte ID abrufen](#1511-zuletzt-eingefügte-id-abrufen)
    - [1.5.2. READ – Datensätze lesen](#152-read--datensätze-lesen)
      - [1.5.2.1. Spalten per Name statt Index ansprechen](#1521-spalten-per-name-statt-index-ansprechen)
      - [1.5.2.2. NULL-Werte behandeln](#1522-null-werte-behandeln)
      - [1.5.2.3. Einzelnen Wert lesen mit ExecuteScalar](#1523-einzelnen-wert-lesen-mit-executescalar)
    - [1.5.3. UPDATE – Datensatz aktualisieren](#153-update--datensatz-aktualisieren)
    - [1.5.4. DELETE – Datensatz löschen](#154-delete--datensatz-löschen)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Produktverwaltung](#21-produktverwaltung)
    - [2.1.1. Datenbankstruktur](#211-datenbankstruktur)
    - [2.1.2. Anforderungen](#212-anforderungen)
    - [2.1.3. Erwartete Ausgabe (Beispiel)](#213-erwartete-ausgabe-beispiel)
    - [2.1.4. Lösungshinweise](#214-lösungshinweise)

---

</br>

# 1. Datenbankanbindung mit SQLite in C\#

## 1.1. Lernziele

Nach dieser Lektion können die Studierenden:

- Das NuGet-Paket `Microsoft.Data.Sqlite` einbinden und verwenden
- Eine Verbindung zu einer SQLite-Datenbank aufbauen und sicher schliessen
- Tabellen programmatisch erstellen (`CREATE TABLE`)
- Datensätze einfügen, lesen, aktualisieren und löschen (CRUD)
- SQL-Injection durch parametrisierte Abfragen verhindern
- Ergebnismengen mit `SqliteDataReader` verarbeiten

---

## 1.2. Vorbereitung – NuGet-Paket installieren

### 1.2.1. Projekt erstellen und Paket hinzufügen

```bash
# Neues Konsolenprojekt anlegen
dotnet new console -n StudentenVerwaltung
cd StudentenVerwaltung

# SQLite-Paket über NuGet installieren
dotnet add package Microsoft.Data.Sqlite
```

> **Was ist NuGet?** NuGet ist der Paketmanager für .NET – vergleichbar mit `npm` für Node.js. Mit `dotnet add package` wird das Paket heruntergeladen und automatisch in der `.csproj`-Datei referenziert.

### 1.2.2. Überprüfung der .csproj-Datei

Nach der Installation erscheint der Eintrag in der Projektdatei:

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <OutputType>Exe</OutputType>
    <TargetFramework>net8.0</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.Data.Sqlite" Version="8.x.x" />
  </ItemGroup>
</Project>
```

### 1.2.3. Using-Direktive einbinden

Am Anfang jeder Datei, die Datenbankzugriffe enthält:

```csharp
using Microsoft.Data.Sqlite;
```

---

## 1.3. Verbindungsaufbau – SqliteConnection

### 1.3.1. Connection String

Der Connection String gibt an, wo die SQLite-Datenbankdatei gespeichert wird:

```csharp
// Datenbankdatei im aktuellen Verzeichnis
string connectionString = "Data Source=studenten.db";

// Absoluter Pfad
string connectionString = "Data Source=C:/Daten/studenten.db";

// In-Memory-Datenbank (nur für Tests, Daten gehen beim Beenden verloren)
string connectionString = "Data Source=:memory:";
```

> Existiert die Datei noch nicht, erstellt SQLite sie automatisch beim ersten Verbindungsaufbau.

### 1.3.2. Verbindung öffnen und schliessen – using-Block

Das korrekte Schliessen einer Datenbankverbindung ist kritisch. In C# verwendet man dafür das `using`-Statement, das die Verbindung **automatisch und garantiert** schliesst – auch wenn eine Exception auftritt.

```csharp
using Microsoft.Data.Sqlite;

string connectionString = "Data Source=studenten.db";

using (var verbindung = new SqliteConnection(connectionString))
{
    verbindung.Open();
    Console.WriteLine($"Verbindungsstatus: {verbindung.State}");
    // Datenbankoperationen hier...
} // verbindung.Close() wird hier automatisch aufgerufen
```

> **Warum `using`?** `SqliteConnection` implementiert das Interface `IDisposable`. Der `using`-Block ruft am Ende automatisch `Dispose()` auf, was intern `Close()` aufruft. Ohne `using` riskiert man offene Verbindungen und Ressourcenlecks.

---

## 1.4. Tabelle erstellen – DDL mit SqliteCommand

### 1.4.1. Das Objekt SqliteCommand

Ein `SqliteCommand` repräsentiert einen SQL-Befehl, der über eine bestehende Verbindung ausgeführt wird.

```csharp
using (var verbindung = new SqliteConnection("Data Source=studenten.db"))
{
    verbindung.Open();

    string sql = @"
        CREATE TABLE IF NOT EXISTS Studenten (
            Id      INTEGER PRIMARY KEY AUTOINCREMENT,
            Name    TEXT    NOT NULL,
            Klasse  TEXT    NOT NULL,
            Note    REAL
        )";

    using (var befehl = new SqliteCommand(sql, verbindung))
    {
        befehl.ExecuteNonQuery();
        Console.WriteLine("Tabelle erstellt.");
    }
}
```

### 1.4.2. Ausführungsmethoden im Überblick

| **Methode**         | **Verwendung**                               | Ergebnismengen mit `SqliteDataReader` verarbeiten |
| ------------------- | -------------------------------------------- | ------------------------------------------------- |
| `ExecuteNonQuery()` | `INSERT`, `UPDATE`, `DELETE`, `CREATE`       | Anzahl betroffener Zeilen                         |
| `ExecuteScalar()`   | Einzelner Rückgabewert (`COUNT`, `MAX`, ...) | `object` (erster Wert der ersten Zeile)           |
| `ExecuteReader()`   | `SELECT` mit mehreren Zeilen/Spalten         | `SqliteDataReader`                                |

---

## 1.5. CRUD-Operationen

### 1.5.1. CREATE – Datensatz einfügen

```csharp
using (var verbindung = new SqliteConnection("Data Source=studenten.db"))
{
    verbindung.Open();

    string sql = "INSERT INTO Studenten (Name, Klasse, Note) VALUES (@name, @klasse, @note)";

    using (var befehl = new SqliteCommand(sql, verbindung))
    {
        // Parameter werden sicher gebunden – niemals direkt im SQL-String
        befehl.Parameters.AddWithValue("@name", "Anna Müller");
        befehl.Parameters.AddWithValue("@klasse", "HF-INF-2024");
        befehl.Parameters.AddWithValue("@note", 5.2);

        int betroffeneZeilen = befehl.ExecuteNonQuery();
        Console.WriteLine($"{betroffeneZeilen} Datensatz eingefügt.");
    }
}
```

#### 1.5.1.1. Zuletzt eingefügte ID abrufen

```csharp
// Nach dem INSERT die neue ID ermitteln
befehl.ExecuteNonQuery();

befehl.CommandText = "SELECT last_insert_rowid()";
long neueId = (long)befehl.ExecuteScalar();
Console.WriteLine($"Neue ID: {neueId}");
```

---

### 1.5.2. READ – Datensätze lesen

```csharp
using (var verbindung = new SqliteConnection("Data Source=studenten.db"))
{
    verbindung.Open();

    string sql = "SELECT Id, Name, Klasse, Note FROM Studenten ORDER BY Name";

    using (var befehl = new SqliteCommand(sql, verbindung))
    using (var leser = befehl.ExecuteReader())
    {
        Console.WriteLine($"{"ID",-4} {"Name",-20} {"Klasse",-15} {"Note"}");
        Console.WriteLine(new string('-', 45));

        while (leser.Read())   // Jeder Aufruf springt zur nächsten Zeile
        {
            long   id     = leser.GetInt64(0);
            string name   = leser.GetString(1);
            string klasse = leser.GetString(2);
            double note   = leser.IsDBNull(3) ? 0.0 : leser.GetDouble(3);

            Console.WriteLine($"{id,-4} {name,-20} {klasse,-15} {note:F1}");
        }
    }
}
```

#### 1.5.2.1. Spalten per Name statt Index ansprechen

```csharp
while (leser.Read())
{
    string name = leser["Name"].ToString();
    // oder mit GetOrdinal für bessere Performance bei vielen Zeilen:
    int nameIndex = leser.GetOrdinal("Name");
    string name2  = leser.GetString(nameIndex);
}
```

#### 1.5.2.2. NULL-Werte behandeln

```csharp
// Vor dem Lesen immer auf NULL prüfen
double note = leser.IsDBNull(leser.GetOrdinal("Note"))
    ? 0.0
    : leser.GetDouble(leser.GetOrdinal("Note"));
```

#### 1.5.2.3. Einzelnen Wert lesen mit ExecuteScalar

```csharp
string sql = "SELECT COUNT(*) FROM Studenten WHERE Klasse = @klasse";

using (var befehl = new SqliteCommand(sql, verbindung))
{
    befehl.Parameters.AddWithValue("@klasse", "HF-INF-2024");
    long anzahl = (long)befehl.ExecuteScalar();
    Console.WriteLine($"Studierende in Klasse: {anzahl}");
}
```

---

### 1.5.3. UPDATE – Datensatz aktualisieren

```csharp
using (var verbindung = new SqliteConnection("Data Source=studenten.db"))
{
    verbindung.Open();

    string sql = "UPDATE Studenten SET Note = @note WHERE Id = @id";

    using (var befehl = new SqliteCommand(sql, verbindung))
    {
        befehl.Parameters.AddWithValue("@note", 5.5);
        befehl.Parameters.AddWithValue("@id", 1);

        int betroffeneZeilen = befehl.ExecuteNonQuery();

        if (betroffeneZeilen == 0)
            Console.WriteLine("Kein Datensatz gefunden.");
        else
            Console.WriteLine($"Note aktualisiert ({betroffeneZeilen} Zeile).");
    }
}
```

---

### 1.5.4. DELETE – Datensatz löschen

```csharp
using (var verbindung = new SqliteConnection("Data Source=studenten.db"))
{
    verbindung.Open();

    string sql = "DELETE FROM Studenten WHERE Id = @id";

    using (var befehl = new SqliteCommand(sql, verbindung))
    {
        befehl.Parameters.AddWithValue("@id", 3);
        int betroffeneZeilen = befehl.ExecuteNonQuery();
        Console.WriteLine($"{betroffeneZeilen} Datensatz gelöscht.");
    }
}
```

---

</br>

# 2. Aufgaben

## 2.1. Produktverwaltung

| **Vorgabe**         | **Beschreibung**                                                         |
| :------------------ | :----------------------------------------------------------------------- |
| **Lernziele**       | Eine Verbindung zu einer SQLite-Datenbank aufbauen und sicher schliessen |
|                     | Tabellen programmatisch erstellen                                        |
|                     | Datensätze einfügen, lesen, aktualisieren und löschen (CRUD)             |
|                     | Ergebnismengen mit `SqliteDataReader` verarbeiten                        |
| **Sozialform**      | Einzelarbeit                                                             |
| **Auftrag**         | siehe unten                                                              |
| **Hilfsmittel**     |                                                                          |
| **Zeitbedarf**      | 90min                                                                    |
| **Lösungselemente** | Funktionierendes Programm                                                |

Erstellen Sie eine Konsolenanwendung zur Verwaltung eines einfachen Produktkatalogs mit SQLite-Anbindung.

### 2.1.1. Datenbankstruktur

```sql
CREATE TABLE IF NOT EXISTS Produkte (
    Id          INTEGER PRIMARY KEY AUTOINCREMENT,
    Bezeichnung TEXT    NOT NULL,
    Kategorie   TEXT    NOT NULL,
    Preis       REAL    NOT NULL,
    Lagerbestand INTEGER NOT NULL DEFAULT 0
);
```

### 2.1.2. Anforderungen

**Pflichtteil – CRUD:**

1. Beim Programmstart wird die Tabelle erstellt (falls noch nicht vorhanden)
2. Ein Menü mit folgenden Optionen wird in einer Schleife angezeigt:

```console
=== Produktverwaltung ===
[1] Alle Produkte anzeigen
[2] Produkt hinzufügen
[3] Preis aktualisieren
[4] Produkt löschen
[0] Beenden
```

3. **Alle Produkte anzeigen:** Gibt alle Produkte formatiert als Tabelle aus (ID, Bezeichnung, Kategorie, Preis, Lagerbestand)
4. **Produkt hinzufügen:** Liest Bezeichnung, Kategorie, Preis und Lagerbestand von der Konsole ein und fügt den Datensatz ein. Ungültige Zahleneingaben werden abgefangen.
5. **Preis aktualisieren:** Fragt nach der ID und dem neuen Preis, prüft ob der Datensatz existiert
6. **Produkt löschen:** Fragt nach der ID, löscht den Datensatz und meldet, ob er gefunden wurde

**Erweiterung (für Schnelle):**

7. Option `[5] Produkte nach Kategorie filtern` – Eingabe der Kategorie, Ausgabe aller passenden Produkte
8. Option `[6] Lagerbestand auffüllen` – Für alle Produkte mit Lagerbestand = 0 wird ein neuer Bestand (Benutzereingabe) gesetzt. Alle Updates werden in **einer Transaktion** ausgeführt.
9. Am Ende der Ausgabe wird die **Gesamtanzahl** und der **Durchschnittspreis** aller Produkte angezeigt (mit `ExecuteScalar`)

### 2.1.3. Erwartete Ausgabe (Beispiel)

```console
=== Produktverwaltung ===
[1] Alle Produkte anzeigen
...
Auswahl: 1

ID   Bezeichnung          Kategorie    Preis    Lager
----------------------------------------------------------
1    Laptop Dell XPS      Elektronik   1299.00  5
2    Maus Logitech MX     Zubehör        89.90  12
3    USB-Hub 7-Port       Zubehör        34.50  0

3 Produkte | Durchschnittspreis: CHF 474.47
```

### 2.1.4. Lösungshinweise

```console
Schritt 1: Projekt anlegen, Paket installieren
           dotnet new console -n Produktverwaltung
           dotnet add package Microsoft.Data.Sqlite

Schritt 2: Menüschleife in Program.cs
           do { ... } while (auswahl != "0")

Schritt 3: Jede Menüoption als eigene Methode implementieren

Schritt 4: Erweiterungen ergänzen
```
