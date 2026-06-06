# Rechercheauftrag: Wie eine Wetter‑App REST‑Services nutzt

## Ziel der Aufgabe

Die Studierenden sollen verstehen, wie eine mobile oder Web‑WetterApp Wetterdaten über einen REST‑Service abruft, welche technischen Schritte dahinterstehen und in welchem Format die Daten bereitgestellt werden.

## Aufgabe

Recherchieren Sie anhand eines realen Wetter‑API‑Anbieters (z.B. OpenWeatherMap, MeteoSwiss, WeatherAPI oder ein Anbieter Ihrer Wahl) die folgenden Punkte:

1. Wie fordert eine Wetter‑App die Wetterdaten an?

- Untersuchen Sie insbesondere:
- Über welche **URL** bzw. welchen **Endpoint** werden die Daten angefragt
  - Welche **HTTP‑Methode** wird verwendet (typischerweise)
  - Welche **Parameter** müssen mitgegeben werden
    - (z.B. Stadtname, Koordinaten, API‑Key, Sprache, Einheitensystem)
  - Wie sieht eine vollständige **Request‑URL** aus (inkl. Query‑Parameter)

2. In welchem Format stellt der REST‑Service die Daten bereit?
   - Recherchieren Sie:
     - Welches **Datenformat** verwendet wird (z.B. JSON, XML)
     - Wie eine typische **Antwortstruktur** aussieht (z.B. Temperatur, Luftfeuchtigkeit, Wetterbeschreibung, Icon‑Code)
     - Welche **Felder** für eine einfache Wetter‑App besonders relevant sind
