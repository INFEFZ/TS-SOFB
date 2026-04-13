-- ============================================================
-- Bibliotheksdatenbank – Beispieldaten
-- SQLite 3 | Höhere Fachschule Unterrichtslektion
-- ============================================================
-- Reihenfolge: autoren → buecher → kunden → ausleihen
-- ============================================================

-- ------------------------------------------------------------
-- TABELLEN ERSTELLEN (falls noch nicht vorhanden)
-- ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS autoren (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    vorname     TEXT NOT NULL,
    nachname    TEXT NOT NULL,
    land        TEXT,
    geburtsjahr INTEGER
);

CREATE TABLE IF NOT EXISTS buecher (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    titel        TEXT NOT NULL,
    autor_id     INTEGER REFERENCES autoren(id),
    genre        TEXT,
    jahr         INTEGER,
    preis        REAL,
    lagerbestand INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS kunden (
    id    INTEGER PRIMARY KEY AUTOINCREMENT,
    name  TEXT NOT NULL,
    email TEXT UNIQUE,
    stadt TEXT
);

CREATE TABLE IF NOT EXISTS ausleihen (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    kunden_id    INTEGER REFERENCES kunden(id),
    buch_id      INTEGER REFERENCES buecher(id),
    ausleihdatum TEXT,
    rueckgabe    TEXT
);


-- ------------------------------------------------------------
-- AUTOREN (20 Einträge)
-- Bewusst gemischt: verschiedene Länder, ein Autor ohne Land,
-- ein Autor ohne Geburtsjahr → ideal für IS NULL Übungen
-- ------------------------------------------------------------

INSERT INTO autoren (vorname, nachname, land, geburtsjahr) VALUES
    ('Max',        'Frisch',        'Schweiz',      1911),
    ('Friedrich',  'Dürrenmatt',    'Schweiz',      1921),
    ('Peter',      'Stamm',         'Schweiz',      1963),
    ('Joanne K.',  'Rowling',       'Grossbritannien', 1965),
    ('George',     'Orwell',        'Grossbritannien', 1903),
    ('Franz',      'Kafka',         'Österreich',   1883),
    ('Thomas',     'Mann',          'Deutschland',  1875),
    ('Günter',     'Grass',         'Deutschland',  1927),
    ('Umberto',    'Eco',           'Italien',      1932),
    ('Gabriel',    'García Márquez','Kolumbien',    1927),
    ('Leo',        'Tolstoi',       'Russland',     1828),
    ('Fjodor',     'Dostojewski',   'Russland',     1821),
    ('Ernest',     'Hemingway',     'USA',          1899),
    ('Mark',       'Twain',         'USA',          1835),
    ('Agatha',     'Christie',      'Grossbritannien', 1890),
    ('Donna',      'Leon',          'USA',          1942),
    ('Jo',         'Nesbø',         'Norwegen',     1960),
    ('Stieg',      'Larsson',       'Schweden',     1954),
    ('Haruki',     'Murakami',      'Japan',        1949),
    ('Unbekannt',  'Autor',         NULL,           NULL);  -- für IS NULL Übungen


-- ------------------------------------------------------------
-- BÜCHER (35 Einträge)
-- Verschiedene Genres, Preise, Jahrzehnte, Lagerstände
-- Einige mit lagerbestand = 0 → "ausverkauft"-Übungen
-- Ein Buch ohne Autor (autor_id = NULL) → LEFT JOIN Übungen
-- ------------------------------------------------------------

INSERT INTO buecher (titel, autor_id, genre, jahr, preis, lagerbestand) VALUES
    -- Schweizer Autoren
    ('Homo Faber',                      1,    'Roman',      1957, 18.90,  5),
    ('Stiller',                         1,    'Roman',      1954, 16.50,  3),
    ('Andorra',                         1,    'Drama',      1961, 12.90,  8),
    ('Der Besuch der alten Dame',       2,    'Drama',      1956, 13.50,  6),
    ('Die Physiker',                    2,    'Drama',      1962, 11.90,  4),
    ('Agnes',                           3,    'Roman',      1998, 19.90,  7),
    ('Sieben Jahre',                    3,    'Roman',      2009, 21.50,  2),

    -- Britische Autoren
    ('Harry Potter und der Stein der Weisen', 4, 'Fantasy', 1997, 24.90, 12),
    ('Harry Potter und die Kammer des Schreckens', 4, 'Fantasy', 1998, 24.90, 9),
    ('1984',                            5,    'Dystopie',   1949, 15.90,  6),
    ('Farm der Tiere',                  5,    'Satire',     1945, 13.50,  4),

    -- Deutschsprachige Autoren
    ('Die Verwandlung',                 6,    'Erzählung',  1915, 10.90,  8),
    ('Der Prozess',                     6,    'Roman',      1925, 17.90,  3),
    ('Buddenbrooks',                    7,    'Roman',      1901, 22.50,  2),
    ('Der Zauberberg',                  7,    'Roman',      1924, 26.90,  1),
    ('Die Blechtrommel',                8,    'Roman',      1959, 23.90,  5),

    -- Internationale Klassiker
    ('Der Name der Rose',               9,    'Krimi',      1980, 25.90,  7),
    ('Das Foucaultsche Pendel',         9,    'Roman',      1988, 27.50,  3),
    ('Hundert Jahre Einsamkeit',       10,    'Roman',      1967, 21.90,  6),
    ('Liebe in den Zeiten der Cholera',10,    'Roman',      1985, 19.90,  4),
    ('Krieg und Frieden',              11,    'Roman',      1869, 29.90,  2),
    ('Anna Karenina',                  11,    'Roman',      1878, 24.90,  3),
    ('Schuld und Sühne',               12,    'Roman',      1866, 22.90,  4),
    ('Der Idiot',                      12,    'Roman',      1869, 24.50,  2),

    -- Amerikanische Autoren
    ('Der alte Mann und das Meer',     13,    'Erzählung',  1952, 14.90,  9),
    ('In einem anderen Land',          13,    'Roman',      1929, 18.90,  3),
    ('Die Abenteuer des Tom Sawyer',   14,    'Roman',      1876, 12.90,  5),

    -- Krimis
    ('Und dann gabs keines mehr',      15,    'Krimi',      1939, 16.90,  8),
    ('Tod auf dem Nil',                15,    'Krimi',      1937, 15.90,  6),
    ('Commissario Brunetti – Sanft entschlafen', 16, 'Krimi', 2004, 19.90, 5),
    ('Der Schneemann',                 17,    'Krimi',      2007, 21.90,  4),
    ('Vergebung',                      18,    'Krimi',      2007, 22.90,  0),  -- ausverkauft

    -- Japanische Literatur
    ('Kafka am Strand',                19,    'Roman',      2002, 23.90,  5),
    ('Naokos Lächeln',                 19,    'Roman',      1987, 21.90,  3),

    -- Buch ohne Autor (für LEFT JOIN / IS NULL Übungen)
    ('Anonyme Gedichte der Antike',   NULL,   'Lyrik',      NULL,  9.90,  2);


-- ------------------------------------------------------------
-- KUNDEN (25 Einträge)
-- Verteilt auf verschiedene Schweizer Städte
-- Bewusst unterschiedlich aktiv → für Auswertungsübungen
-- ------------------------------------------------------------

INSERT INTO kunden (name, email, stadt) VALUES
    ('Anna Müller',       'anna.mueller@gmail.com',      'Zürich'),
    ('Beat Schneider',    'beat.schneider@bluewin.ch',   'Bern'),
    ('Carmen Vogel',      'carmen.vogel@hotmail.com',    'Basel'),
    ('David Keller',      'david.keller@gmail.com',      'Zürich'),
    ('Elena Fischer',     'elena.fischer@outlook.com',   'Luzern'),
    ('Felix Weber',       'felix.weber@gmail.com',       'Zürich'),
    ('Gisela Meier',      'gisela.meier@bluewin.ch',     'Winterthur'),
    ('Hans Zimmermann',   'hans.zimm@gmail.com',         'Bern'),
    ('Irene Huber',       'irene.huber@yahoo.com',       'Genf'),
    ('Jonas Steiner',     'jonas.steiner@gmail.com',     'St. Gallen'),
    ('Kathrin Wolf',      'kathrin.wolf@bluewin.ch',     'Zürich'),
    ('Lukas Brunner',     'lukas.brunner@hotmail.com',   'Basel'),
    ('Maria Gerber',      'maria.gerber@gmail.com',      'Bern'),
    ('Nico Lehmann',      'nico.lehmann@outlook.com',    'Zürich'),
    ('Olivia Baumann',    'olivia.baumann@gmail.com',    'Luzern'),
    ('Patrick Schmid',    'patrick.schmid@bluewin.ch',   'Winterthur'),
    ('Rahel Lüthi',       'rahel.luethi@gmail.com',      'Bern'),
    ('Stefan Graf',       'stefan.graf@yahoo.com',       'Zürich'),
    ('Tanja Moser',       'tanja.moser@gmail.com',       'Basel'),
    ('Urs Widmer',        'urs.widmer@bluewin.ch',       'St. Gallen'),
    ('Vera Brändli',      'vera.braendli@gmail.com',     'Zürich'),
    ('Walter Engel',      'walter.engel@hotmail.com',    'Bern'),
    ('Xenia Roth',        'xenia.roth@gmail.com',        'Genf'),
    ('Yannick Sutter',    'yannick.sutter@outlook.com',  'Luzern'),
    ('Zoe Hartmann',      'zoe.hartmann@gmail.com',      'Zürich');  -- hat nie ausgeliehen → für NOT EXISTS


-- ------------------------------------------------------------
-- AUSLEIHEN (50 Einträge)
-- rueckgabe = NULL → Buch noch nicht zurückgegeben
-- Verschiedene Datumsformate bewusst vermieden (ISO 8601)
-- Kunde 25 (Zoe Hartmann) hat keine Ausleihen → Übung
-- ------------------------------------------------------------

INSERT INTO ausleihen (kunden_id, buch_id, ausleihdatum, rueckgabe) VALUES
    -- Anna Müller (viel aktiv)
    (1,  8,  '2024-01-05', '2024-01-19'),
    (1,  10, '2024-02-10', '2024-02-24'),
    (1,  17, '2024-04-01', '2024-04-15'),
    (1,  28, '2024-06-03', '2024-06-17'),
    (1,  33, '2024-09-10', NULL),          -- noch ausgeliehen

    -- Beat Schneider
    (2,  1,  '2024-01-15', '2024-01-29'),
    (2,  4,  '2024-03-20', '2024-04-03'),
    (2,  19, '2024-07-01', '2024-07-15'),

    -- Carmen Vogel
    (3,  28, '2024-02-01', '2024-02-15'),
    (3,  29, '2024-02-16', '2024-03-01'),
    (3,  30, '2024-05-10', NULL),          -- noch ausgeliehen

    -- David Keller
    (4,  8,  '2024-01-20', '2024-02-03'),
    (4,  9,  '2024-02-05', '2024-02-19'),
    (4,  10, '2024-03-01', '2024-03-15'),

    -- Elena Fischer
    (5,  19, '2024-01-08', '2024-01-22'),
    (5,  20, '2024-04-14', '2024-04-28'),

    -- Felix Weber
    (6,  12, '2024-02-20', '2024-03-05'),
    (6,  13, '2024-03-10', '2024-03-24'),
    (6,  6,  '2024-05-01', NULL),          -- noch ausgeliehen

    -- Gisela Meier
    (7,  15, '2024-01-25', '2024-02-08'),
    (7,  16, '2024-06-10', '2024-06-24'),

    -- Hans Zimmermann
    (8,  1,  '2024-03-05', '2024-03-19'),
    (8,  2,  '2024-04-20', '2024-05-04'),
    (8,  3,  '2024-07-15', '2024-07-29'),

    -- Irene Huber
    (9,  33, '2024-02-14', '2024-02-28'),
    (9,  34, '2024-05-20', '2024-06-03'),

    -- Jonas Steiner
    (10, 17, '2024-01-30', '2024-02-13'),
    (10, 18, '2024-06-15', NULL),          -- noch ausgeliehen

    -- Kathrin Wolf (häufige Leserin)
    (11, 8,  '2024-01-10', '2024-01-24'),
    (11, 9,  '2024-02-01', '2024-02-15'),
    (11, 10, '2024-03-05', '2024-03-19'),
    (11, 28, '2024-07-20', '2024-08-03'),
    (11, 31, '2024-09-01', NULL),          -- noch ausgeliehen

    -- Lukas Brunner
    (12, 21, '2024-04-10', '2024-04-24'),
    (12, 22, '2024-08-05', '2024-08-19'),

    -- Maria Gerber
    (13, 4,  '2024-02-25', '2024-03-10'),
    (13, 5,  '2024-05-15', '2024-05-29'),

    -- Nico Lehmann
    (14, 10, '2024-01-18', '2024-02-01'),
    (14, 26, '2024-06-20', '2024-07-04'),

    -- Olivia Baumann
    (15, 33, '2024-03-15', '2024-03-29'),
    (15, 19, '2024-07-08', NULL),          -- noch ausgeliehen

    -- Patrick Schmid
    (16, 1,  '2024-04-05', '2024-04-19'),
    (16, 6,  '2024-08-10', '2024-08-24'),

    -- Rahel Lüthi
    (17, 28, '2024-05-25', '2024-06-08'),
    (17, 29, '2024-09-15', NULL),          -- noch ausgeliehen

    -- Stefan Graf
    (18, 17, '2024-02-08', '2024-02-22'),
    (18, 18, '2024-07-25', '2024-08-08'),

    -- Tanja Moser
    (19, 8,  '2024-06-01', '2024-06-15'),

    -- Urs Widmer
    (20, 23, '2024-03-25', '2024-04-08'),

    -- Xenia Roth
    (23, 9,  '2024-08-20', '2024-09-03');

-- Kunden 21 (Vera Brändli), 22 (Walter Engel), 24 (Yannick Sutter),
-- 25 (Zoe Hartmann) haben keine Ausleihen → ideal für LEFT JOIN / NOT EXISTS Übungen


-- ------------------------------------------------------------
-- KONTROLLABFRAGEN
-- Führt diese aus, um die Daten zu verifizieren
-- ------------------------------------------------------------

-- Anzahl pro Tabelle
SELECT 'autoren'  AS Tabelle, COUNT(*) AS Anzahl FROM autoren
UNION ALL
SELECT 'buecher',  COUNT(*) FROM buecher
UNION ALL
SELECT 'kunden',   COUNT(*) FROM kunden
UNION ALL
SELECT 'ausleihen',COUNT(*) FROM ausleihen;

-- Aktuell ausgeliehene Bücher
SELECT k.name, b.titel, a.ausleihdatum
FROM ausleihen a
JOIN kunden  k ON a.kunden_id = k.id
JOIN buecher b ON a.buch_id   = b.id
WHERE a.rueckgabe IS NULL
ORDER BY a.ausleihdatum;

-- Kunden ohne Ausleihe
SELECT k.name, k.stadt
FROM kunden k
LEFT JOIN ausleihen a ON a.kunden_id = k.id
WHERE a.id IS NULL;
