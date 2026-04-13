|                      |                           |                               |
| -------------------- | ------------------------- | ----------------------------- |
| **HF Systemtechnik** | **Softwareentwicklung B** | ![logo](../x_gitres/logo.png) |

- [1. Datenbank - Datenmodellierung](#1-datenbank---datenmodellierung)
  - [1.1. ERM – Entity Relationship Modell](#11-erm--entity-relationship-modell)
  - [1.2. Grundbegriffe der Datenmodellierung](#12-grundbegriffe-der-datenmodellierung)
    - [1.2.1. Entität](#121-entität)
    - [1.2.2. Definitionen Entität](#122-definitionen-entität)
    - [1.2.3. Entitätsmenge](#123-entitätsmenge)
    - [1.2.4. Definitionen Entitätsmenge](#124-definitionen-entitätsmenge)
  - [1.3. ERM - Konstruktionselemente](#13-erm---konstruktionselemente)
    - [1.3.1. Beziehungen modellieren](#131-beziehungen-modellieren)
    - [1.3.2. Relationship](#132-relationship)
      - [1.3.2.1. Assoziation](#1321-assoziation)
      - [1.3.2.2. Beispiel (Abbildung oben)](#1322-beispiel-abbildung-oben)
    - [1.3.3. Beziehung](#133-beziehung)
    - [1.3.4. Kardinalität](#134-kardinalität)
      - [1.3.4.1. Definition](#1341-definition)
      - [1.3.4.2. Beispiel](#1342-beispiel)
    - [1.3.5. ERM - Notationsformen](#135-erm---notationsformen)
    - [1.4. ERM - Beispiel](#14-erm---beispiel)
  - [1.5. Relationales Datenbank Modell](#15-relationales-datenbank-modell)
    - [1.5.1. Vom ERM zum Relationen Modell](#151-vom-erm-zum-relationen-modell)
    - [1.5.2. Primary Key](#152-primary-key)
    - [1.5.3. Foreign Key](#153-foreign-key)
      - [1.5.3.1. Referentielle Integrität](#1531-referentielle-integrität)
  - [1.6. Vom ERM zum Relationen Modell - Vorgehen](#16-vom-erm-zum-relationen-modell---vorgehen)
    - [1.6.1. Schritt 1](#161-schritt-1)
    - [1.6.2. Schritt 2](#162-schritt-2)
    - [1.6.3. Schritt 3](#163-schritt-3)
    - [1.6.4. Kreuztabellen](#164-kreuztabellen)
    - [1.6.5. Regeln und Ablauf](#165-regeln-und-ablauf)
  - [1.7. Datennormalisierung](#17-datennormalisierung)
    - [1.7.1. Normalisieren von Relationen](#171-normalisieren-von-relationen)
    - [1.7.2. Wissenswertes](#172-wissenswertes)
    - [1.7.3. Definition: Unnormalisierte Relation](#173-definition-unnormalisierte-relation)
    - [1.7.4. Normalform (1NF)](#174-normalform-1nf)
    - [1.7.5. Definition 1.NF](#175-definition-1nf)
    - [1.7.6. Vorgehen](#176-vorgehen)
    - [1.7.7. Normalform](#177-normalform)
    - [1.7.8. Definition 2.NF](#178-definition-2nf)
    - [1.7.9. Normalform 3.NF](#179-normalform-3nf)
    - [1.7.10. Definition 3.NF](#1710-definition-3nf)
- [2. Aufgaben](#2-aufgaben)
  - [2.1. Beziehungen ermitteln und modellieren](#21-beziehungen-ermitteln-und-modellieren)
  - [2.2. ERM/RM erstellen (Herstellung)](#22-ermrm-erstellen-herstellung)
  - [2.3. Datenmodelle erstellen (Aufgabensammlung)](#23-datenmodelle-erstellen-aufgabensammlung)

</br>

# 1. Datenbank - Datenmodellierung

</br

## 1.1. ERM – Entity Relationship Modell

![ERM](./x_gitres/erm.png)

Die Datenmodellierung legt fest, wie die Daten einer Anwendung konzeptionell strukturiert sind. In diesem Vorgang müssen verschiedene, zum Teil widersprüchliche Zielsetzungen und Bedürfnisse befriedigt werden , z.B.

- Das Datenmodell muss die notwendigen Informationen der Anwendung vollständig darstellen können, dabei ist die Bestimmung der Systemgrenze wichtig.
- Mit den gespeicherten Informationen im Datenmodell müssen sämtliche Geschäftsprozesse der Anwendung ausführbar sein. Eine Modellierung ohne jegliche Kenntnis der grundsätzlich gewünschten Funktionalität der Anwendung kann daher kein zweckmässiges Datenmodell liefern.
- Das Modell soll derart gebildet werden, dass auch zukünftige Bedürfnisse befriedigt werden können.

Das Erstellen eines Datenmodells kann daher kein fest vorgegebener, streng mathematischer Ablauf sein. Es ist vielmehr ein kreativer Prozess, in welchem die Abstraktion eine wichtige Rolle spielt, in welchem immer und immer wieder die Vor– und Nachteile unterschiedlicher Lösungsansätze verglichen werden. Der Datenmodellierer muss daher über Kreativität, Abstraktionsvermögen, Ausdauer und Erfahrung verfügen.

> **Aus den vorhergehenden Erläuterungen geht auch hervor, dass es kein Standardmodell geben kann, welches die Bedürfnisse einer bestimmten Branche unternehmensspezifisch abdeckt.**

Entity-Relationship-Model (dt. Entitäten-Beziehungs-Modell)

- Das ERM ist speziell gut geeignet um Sachverhalte für Datenbankanwendungen zu modellieren.
- Das ERM gehört zum konzeptionellen Schema.
- Der Begriff ERD wird auch häufig verwendet. D steht für Diagramm. Gemeint ist dasselbe wie ERM.
- Das ERM wird oft auch als semantischen Modell bezeichnet.

**Das ERM besteht auf folgenden Komponenten:**

- **Entität** mit Attributen
- **Entitätsmenge**
- **Beziehung** (Relationship)

**Charakteristiken von Modellen:**

- Ein Modell ist eine zweckorientierte, vereinfachte und strukturgleiche Abbildung der Wirklichkeit.
- Die Beziehung zwischen Modell und Wirklichkeit ist die Analogie.
- Ein Modell konzentriert sich auf das Wesentliche und reduziert so die Komplexität der Wirklichkeit.
- Ein Modell grenzt Unwesentliches aus -> Informationsverlust
- Ein Modell hat eine Systemgrenze. Da diese praktische nie gegeben ist, muss sie festgelegt werden. Wie die Systemgrenze gesetzt wird, ist eine Frage der Zweckmässigkeit.

## 1.2. Grundbegriffe der Datenmodellierung

### 1.2.1. Entität

![Entität](./x_gitres/entity.png)

### 1.2.2. Definitionen Entität

- Eine Entität ist ein individuelles und identifizierbares Exemplar einer Sache, einer Person oder eines Begriffs aus der realen oder gedachten Vorstellungswelt.
- Eine Entität ist eine eigenständige Einheit, die im Rahmen des zu betrachteten Modells eindeutig identifiziert werden kann. Dieses Idenitifizierungsmerkmal wird als Schlüssel ( engl. Key ) bezeichnet.
- Eine Entität ist ein Objekt der realen oder der Vorstellungswelt, über das Informationen zu speichern sind

Eine Entität kann folgendes sein:

- ein Gegenstand, z.B. eine Auto
- eine Person, z.B. ein Mitarbeiter einer Firma
- ein Ereignis, z.B. ein Fussballmatch
- eine abstrakte Grösse, etc.

**Merke:**

- Eine Entität wird durch eine Menge von Eigenschaften ( Attributen ) beschrieben.
- Eine Eigenschaft hat einen Bezeichner und einen Wert.
- Die Eigenschaften einer Entität können geändert werden.

### 1.2.3. Entitätsmenge

![Entitätsmenge](./x_gitres/entityset.png)

Bei der Modellierung werden nicht die einzelnen Entitäten selbst dargestellt, sondern es werden Mengen aus Entitäten gleicher Art gebildet, sogenannte Entitätsmengen ( engl. entity set ).

### 1.2.4. Definitionen Entitätsmenge

- Eine Entitätsmenge ist eine eindeutig benannte Kollektion von Entitäten gleichen Typs.
- Eine Entitätsmenge entspricht einer zweidimensionalen Tabelle mit einem Primary Key.

**Beispiele:**

- Die Menge aller zu einem festen Zeitpunkt in einem Unternehmen angestellten Mitarbeiter.
- Die Menge aller Studenten an einer Schule bilden eine Entitätsmenge.

**Merke:**

- Die Anzahl der Elemente einer Entitätsmenge ist zu jedem Zeitpunkt durch die tatsächlich vorhandenen Entitäten gegeben – diese Menge kann sich zu jedem Zeitpunkt ändern.
- Die Reihenfolge der Entitäten innerhalb der Entitätsmenge ist irrelevant.
- Als Symbol für eine Entitätsmenge wird in den meisten Notationen ein Rechteck verwendet.
- Eine Entitätsmenge ist eine Kernentitätsmenge, wenn es möglich ist, Entitäten hinzuzufügen, ohne dass auf andere Entitätsmengen geachtet werden muss, d.h. die Entitätsmenge darf keinen Fremdschlüssel enthalten.

---

## 1.3. ERM - Konstruktionselemente

![Konstruktionselemente](./x_gitres/erm-construction.png)

Grundlegende Komponenten:

- **Entitäten**
  - Individuell identifizierbares Objekt der Wirklichkeit, z.B. Auto, Projekt etc.
- **Beziehung (Relationship)**
  - Verknüpfung / Zusammenhang zwischen zwei oder mehreren Entitäten
- **Attribut**
  - Typisierung gleichartiger Eigenschaften, z. B. Nachname, Vorname.

### 1.3.1. Beziehungen modellieren

**Beziehung (Raute)**: Als Beziehungstyp zwischen Entitätstypen wird einen kurzen Text, meist ein **Verb** verwendet.

![Beziehung](./x_gitres/erm-construction-relationship.png)

### 1.3.2. Relationship

![Relationship](./x_gitres/relationship.png)

Die einzelnen Entitätsmengen einer Datenbasis dürfen nicht isoliert betrachtet werden, da zwischen ihnen diverse Beziehungen bestehen können. Die Anzahl der möglichen Beziehungstypen ist beschränkt und ergibt sich aus der Kombination der möglichen Assoziationstypen.

**Definition:** Eine Beziehung (engl. relationship) **assoziiert** wechselseitig mindestens **zwei Entitäten**.

**Merke:**

- Eine Beziehung wird durch eine Linie dargestellt.
- Auf der Linie ist die Bezeichnung der Beziehung enthalten. Auf diese Benennung der Beziehung kann verzichtet werden, falls sie aus dem Zusammenhang eindeutig ersichtlich ist, muss aber immer dann erfolgen, wenn diese nicht a priori klar ist.

#### 1.3.2.1. Assoziation

Assoziation bedeutet, dass eine Entität eine andere Entität kennt und mit ihr in Wechselwirkung steht.
Für jede Beziehung wird angegeben, in welchem Mengenverhältnis die Entitätsmengen zueinander stehen.

#### 1.3.2.2. Beispiel (Abbildung oben)

- Ein **Student** besucht mehrere **Vorlesungen** (natürlich nicht gleichzeitig).
- Ein **Dozent** liest mehrere **Vorlesungen**.
- Eine **Vorlesung** wird von genau einem **Dozenten** gehalten, aber von mehreren **Studenten** besucht.

### 1.3.3. Beziehung

Jede Assoziation (Tabelle A zu Tabelle B) besitzt auch eine Gegenassoziation (Tabelle B zu Tabelle A). Kombiniert man diese zwei **Assoziationen** miteinander, so spricht man von einer **Beziehung**.

### 1.3.4. Kardinalität

![Kardinalität](./x_gitres/cardinality.png)

#### 1.3.4.1. Definition

- Die Kardinalität dient einer genaueren Bestimmung der Mengenverhältnisse zwischen 2 Entitätsmengen.
- Sie legt für jede Richtung fest, wie viele Entitäten an einer Beziehung teilnehmen (müssen).
- Dies geschieht über die Angabe eines Minimums ( 0 oder 1 ) und eines Maximums( 1 oder n ).

#### 1.3.4.2. Beispiel

- Leserichtung **Auftrag -> Kunde**: Ein Auftrag hat genau einen Kunden (min=1, max=1)
- Leserichtung **Kunde -> Auftrag**: Ein Kunde kann beliebig viele Aufträge haben (min=1, max=n)

---

### 1.3.5. ERM - Notationsformen

![Notation](./x_gitres/erm-notation.png)

### 1.4. ERM - Beispiel

![UNI](./x_gitres/erm-uni.png)

---

## 1.5. Relationales Datenbank Modell

![Relationen Modell](./x_gitres/relation-model.png)

Das Relationen Modell dient zum **Überführen** eines Entity-Relationship-Modells in eine **Datenbank**. Diese Form ist für Computer "**verständlicher**". Im Relationen Modell verwendet man **Tabellen**, statt einer grafischen Darstellung. Der Titel der Tabelle ist dabei der Name des darzustellenden Objekts (Entitys). Die Eigenschaften (Attribute) des Entitys (Objekts) sind Spalten dieser Tabelle.

**Beispiel:**

Man möchte **Personen** mit folgenden Eigenschaften darstellen: `Personalausweisnummer`, `Vorname`, `Nachname`, `Geburtsdatum` und `Adresse`. Man bezeichnet die **Personen** in diesem Beispiel auch als Entitätstypen, also Objekte (Entitys) vom **Typ Person**.

Die Tabelle heisst folglich "`Person`" und hat die **5 Spalten:** `Personalausweisnummer, Vorname, Nachname, Geburtsdatum und Adresse`.

### 1.5.1. Vom ERM zum Relationen Modell

![ERM nach RM](./x_gitres/erm-rm.png)

- Ein gutes Konzept zum Entwurf einer Datenbank besteht in der Verbindung der Methoden des **Entity-Relationship-Models** und des **relationalen Datenbankmodells**.
- Das **ERM** eignet sich vor allem zur Bildung eines Datenmodells aus der Realität.
- Mit den **Methoden** des relationalen Datenbankmodells können die aus dem ERM gewonnenen Strukturen auf Redundanz untersucht werden.

### 1.5.2. Primary Key

![Primärschlüssel](./x_gitres/primary-key.png)

Zum Verarbeiten und zur Erstellung der Beziehungen zwischen den Daten muss sichergestellt sein, dass jede Entität **eindeutig** identifiziert werden kann. Es muss daher festgelegt sein, welches Attribut eine einzelne Entität **eindeutig identifiziert**. Dieses Attribut wird **Primary Key** genannt. In einer Entitätsmenge können sich durchaus mehrere Attribute oder Attributskombinationen als PK eignen.

**Synonyme:** Identifikationsschlüssel, Entitätenschlüssel, Schlüsselattribut, Primärschlüssel, PK

**Merkmale:**

- einfach, kurz, möglichst nur ein Attribut
- eindeutig
- Wert darf nie NULL sein
- Integer ist besser als Zeichenfolge
- unveränderbar

> Im Datenbanksystem muss der **PK** explizit definiert sein, damit das DBS sicherstellen kann, dass nur eineindeutige Werte für diese Schlüsselattribut zugewiesen werden (Sicherstellung der Entitätsintegrität).

### 1.5.3. Foreign Key

![Foreign Key](./x_gitres/foreign-key.png)

Im **ERM** erfolgt die **Verknüpfung** zwischen Entitätsmengen über Werte. Es gibt nun aber keine vordefinierten Verknüpfungspfade zwischen Entitätsmengen. Diese Verknüpfungspfade können und müssen vom Datenmodellierer definiert werden.

- Im ERM wird der **Foreign Key** zur Erstellung der Beziehungen zwischen den Entitätsmengen verwendet.
- Der **Fremdschlüssel** verbindet seine Entitätsmenge mit einer andern Entitätsmenge über dessen **Primary Key**.
- Diejenigen Datensätze mit exakt identischen Werten in **Foreign Key** und **Primary Key** gehören logisch zusammen. Im obigen Beispiel gehört `Meier` zu den `Datenbanken`  und `Schulze/Ibsen` gehören zu `Unix X`.

#### 1.5.3.1. Referentielle Integrität

Für jeden von `NULL` verschiedenen **Fremdschlüsselwert** muss ein entsprechender Entitätenschlüsselwert der **referenzierten Tabelle** existieren. Das DBS überwacht diese Integrität.

---

## 1.6. Vom ERM zum Relationen Modell - Vorgehen

![ERM nach RM](./x_gitres/erm-to-rm.png)

### 1.6.1. Schritt 1

![Schritt 1](./x_gitres/rm-step1.png)

Jede Entitätsmenge muss als eigenständige Tabelle mit einem eindeutigen Primärschlüssel definiert werden.

### 1.6.2. Schritt 2

![Schritt 2](./x_gitres/rm-step2.png)

Eine einfach-komplexe Beziehungsmenge kann ohne eigenständige Tabelle ausgedrückt werden.

### 1.6.3. Schritt 3

![Schritt 3](./x_gitres/rm-step3.png)

Jede komplex-komplexe (viele zu viele) Beziehungsmenge muss als eigenständige Tabelle definiert werden.

### 1.6.4. Kreuztabellen

![Kreuztabelle](./x_gitres/kreuztabelle.png)

### 1.6.5. Regeln und Ablauf

1. Der Name der Entitätsmenge wird zum Namen der Relation.
2. Attribute der Entitätsmenge werden zu Attributen der Relation.
3. Die Beziehungen und Kardinalitäten zwischen den Relationen werden aus dem ERM übernommen.
4. 1 : 1 Beziehungen können in eine Relation überführt werden.
5. n : n Beziehungen erhalten eine Zwischentabelle, die sogenannte Kreuztabelle.
6. Die Kreuztabelle erhält die Kardinalitäten über`s Kreuz,  die zwei referenzierten Relationen erhalten die Kardinalität 1,1.

---

## 1.7. Datennormalisierung

![Unnormalisierte Form](./x_gitres/nf-unnormalisiert.png)

### 1.7.1. Normalisieren von Relationen

Unter der **Normalisierung** versteht man ein **systematisches Untersuchen** einer Relation mit dem Zweck, **eine qualitativ hochwertige Relation** zu erhalten. Eine Relation ist dann normalisiert, wenn sie folgende Eigenschaften aufweist:

- **Redundanzfreiheit, "One Fact one Place» Prinzip"**
- **keine Inkonsistenzen bei Einfüge-, Veränderungs- und Löschoperationen**

### 1.7.2. Wissenswertes

- Beim **Normalisieren** steigt gleichzeitig die Verständlichkeit der Datenstruktur.
- Die **Normalisierung** findet auf der konzeptionellen Ebene statt.
- In der **Normalisierung** sind mehrere Normalformen bekannt. Jede Normalform stellt sicher, dass die Daten bestimmte Bedingungen einhalten. **Am bekanntesten sind die 1. 2. und 3. Normalform (NF)**.
- In der Regel treten beim Erstellen des konzeptionellen Modells durch einen erfahrenen Modellierer gar keine **Redundanzen** auf.
- Verletzungen der Normalformen treten nur auf, falls inhaltlich unabhängige Entitäten in eine gemeinsame Entitätsmenge gepackt werden.

### 1.7.3. Definition: Unnormalisierte Relation

- Eine Relation ist dann **unnormalisiert**, wenn am Kreuzungspunkt einer Spalte und einer Zeile **kein einzelner Wert** steht, sondern eine Gruppe oder Liste mehrerer Werte.
- Diese Form ist schlecht zu handhaben und in den meisten DBS gar nicht verarbeitbar. Da solch eine Relation Redundanz enthält, ist sie auch anfällig auf Anomalien beim Verändern von Datensätzen.

**Beispiel:**
Eine **unnormalisierte Form** ist nicht a priori schlecht, sie ist einfach in relationalen DBS nicht verarbeitbar. Aber der Mensch kann sie in geeigneter Darstellung recht gut lesen, das beste Beispiel dafür ist das Telefonbuch.

### 1.7.4. Normalform (1NF)

![1.NF](./x_gitres/nf-1nf.png)

### 1.7.5. Definition 1.NF

Eine Relation ist dann in der **ersten Normalform (1NF)**, wenn sie an den Kreuzungspunkten der Tupel und der Attribute jederzeit höchstens einen Wert aufweist.

### 1.7.6. Vorgehen

1. Eine Relation wird in die **1NF** gebracht, indem jedes Tupel, das in einem Attribut eine Werteliste hat, auf mehrere Tupel verteilt wird.
2. Nach dieser Mehrfacheintragung ist allerdings der bisherige **Primary Key** in aller Regel nicht mehr eindeutig, daher muss dieser um geeignete Attribute erweitert werden:
   1. **Beispiel oben:** neuer Primary Key `ID`
   2. **Variante unten:** zusammengesetzter Primary Key `MiNr`, `ProNr`

> Eine Relation in der **1NF** ist immer noch für **Defekte** anfällig, weil sie Redundanzen aufweisen kann

### 1.7.7. Normalform

![2.NF](./x_gitres/nf-2nf.png)

### 1.7.8. Definition 2.NF

Eine Relation befindet sich dann in der **2NF** , wenn sie in der **1NF** ist  und zudem jedes Nichtschlüsselattribut vom gesamten Primärschlüssel abhängig ist, nicht aber von Schlüsselteilen.

Die **2NF** kann daher nur verletzt sein, falls sich der Primärschlüssel aus mehreren Attributen zusammensetzt und der Datensatz Nichtschlüsselattribute enthält.

Sind **Nichtschlüsselattribute** vorhanden, die nur **von einem Teil** des zusammengesetzten Schlüssels bestimmt sind, so müssen diese in eine neue Relation ausgelagert werden. In unserer Variante ist `name` (Nichtschlüsselattribut) nur von `MiNr` abhängig. `Projekt` ist nur von `ProNr` abhängig. In den meisten Fällen ist die Teilung der Entitätsmengen intuitiv klar und einfach.

> Auch ein Relation in der zweiten Normalform ist **nicht unbedingt frei von Redundanz** und somit anfällig für Defekte.
> Solche Redundanzen in der zweiten Normalform entstehen, wenn Nichtschlüsslattribute der Relation von anderen Nichtschlüsselattributen anhängig sind.
> Diese Art der Abhängigkeit nennt man **transitive Abhängigkeit**.
> Daher ist es notwendig eine weitere Normalform einzuführen, die **3NF**.

### 1.7.9. Normalform 3.NF

![3.NF](./x_gitres/nf-3nf.png)

### 1.7.10. Definition 3.NF

Eine Relation befindet sich in der **3NF**, wenn sie in der 2NF ist und keine transitiven Abhängigkeiten aufweist (keine Abhängigkeiten zwischen Nichtschlüsselattributen).

---

</br>

# 2. Aufgaben

## 2.1. Beziehungen ermitteln und modellieren

| **Vorgabe**             | **Beschreibung**                                                              |
| :---------------------- | :---------------------------------------------------------------------------- |
| **Lernziele**           | Können sinnvolle Beziehungen zwischen zwei Entitäten erkennen und modellieren |
|                         | Können die Kardinalität von Beziehungen mit min,max Notation festlegen        |
| **Sozialform**          | Einzelarbeit                                                                  |
| **Auftrag**             | siehe unten                                                                   |
| **Hilfsmittel**         |                                                                               |
| **Erwartete Resultate** |                                                                               |
| **Zeitbedarf**          | 15 min                                                                        |
| **Lösungselemente**     | Vollständige Lösung mit Kardinalität auf Papier oder als DIA Datei            |

- Füge sinnvolle Beziehungen zwischen den folgenden Entitäten ein.
- Verwenden Sie dabei die Min, Max Notation ([1,1], [1,n] etc.)

- ![A1](./x_gitres/a-erm-relationship-1.png)
  - Jede Mutter hat mindestens ein oder mehrere Kinder geboren. Jedes Kind wurde von genau einer Mutter geboren
- ![A2](./x_gitres/a-erm-relationship-2.png)
  - In einer Firma kann jeder Mitarbeiter ein Firmen-Handy haben, muss es aber nicht. Jedes Firmen-Handy ist entweder einem oder keinem Mitarbeiter zugeordnet. Handys ohne Zuordnung können z.B. bei Bedarf verliehen werden
- ![A3](./x_gitres/a-erm-relationship-3.png)
  - Jeder Mentor unterstützt einen oder mehrere Künstler. Jeder Künstler kann einen oder keinen Mentor haben
- ![A4](./x_gitres/a-erm-relationship-4.png)
  - In jeden See können kein oder ein Fluss oder mehrere Flüsse münden. Jeder Fluss kann in genau einen See münden, muss es aber nicht
- ![A5](./x_gitres/a-erm-relationship-5.png)
  - Jeder Student nimmt an mindestens einer Vorlesung oder aber mehreren Vorlesungen teil. An jeder Vorlesung nimmt mindestens ein Student oder nehmen mehrere Studenten teil
- ![A6](./x_gitres/a-erm-relationship-6.png)
  - Jeder Artikel kann in keinen, einer oder mehreren Bestellungen vorkommen. Jede Bestellung beinhaltet einen oder mehrere Artikel.
- ![A7](./x_gitres/a-erm-relationship-7.png)
  - Ein Artikel kann in keinem oder einem Lager oder mehreren Lagern gelagert sein. In jedem Lager können kein, ein oder mehrere Artikel lagern. Es wird berücksichtigt, dass Artikel ausverkauft sein können und dass Lagergebäude saniert werden müssen.
  
---

## 2.2. ERM/RM erstellen (Herstellung)

| **Vorgabe**             | **Beschreibung**                                              |
| :---------------------- | :------------------------------------------------------------ |
| **Lernziele**           | Können ein ERM mit korrekten Konstruktionselementen erstellen |
|                         | Können im ERM Entitäten und Beziehungen modellieren           |
| **Sozialform**          | Einzelarbeit                                                  |
| **Auftrag**             | siehe unten                                                   |
| **Hilfsmittel**         |                                                               |
| **Erwartete Resultate** |                                                               |
| **Zeitbedarf**          | 30 min                                                        |
| **Lösungselemente**     | ERM und Relationen Modell auf Papier oder DIA                 |

Ein ERM und relationales Datenmodell aus vorgegebenen Regeln ableiten und vollständig mit korrekten Konstruktionselementen (Entität, Beziehung, Attribut) modellieren.

**Die Regeln:**

1. Ein Mitarbeiter hat einen Namen
2. Ein Mitarbeiter hat einen Wohnort
3. Ein Mitarbeiter arbeitet in einer Abteilung
4. Ein Mitarbeiter ist an der Herstellung mehrerer Produkte beteiligt
5. Die Herstellung erfordert pro Mitarbeiter eine bestimmte Zeit
6. Eine Abteilung hat einen Namen
7. Jedes Produkt hat eine Nummer und einen Namen
8. In einer Abteilung sind mehrere Mitarbeiter angestellt
9. Die Herstellung eines Produktes erfordert mehrere Mitarbeiter

**Auftrag:**

**a) Entity-Relationship-Modell:** Stelle den obigen Sachverhalt im Entity-Relationship-Modell (ERM) auf einem Blatt Papier oder elektronisch (dia) dar.

**b) Relationen Modell erstellen:** Überführen Sie das obige ERM in ein Relationen Modell.

---

## 2.3. Datenmodelle erstellen (Aufgabensammlung)

| **Vorgabe**             | **Beschreibung**                                              |
| :---------------------- | :------------------------------------------------------------ |
| **Lernziele**           | Können ein ERM mit korrekten Konstruktionselementen erstellen |
|                         | Können im ERM Entitäten und Beziehungen modellieren           |
| **Sozialform**          | Einzelarbeit                                                  |
| **Auftrag**             | siehe unten                                                   |
| **Hilfsmittel**         |                                                               |
| **Erwartete Resultate** |                                                               |
| **Zeitbedarf**          | 50 min                                                        |
| **Lösungselemente**     | ERM und Relationen Modell auf Papier oder DIA                 |

Erstelle zu den nachfolgenden Aufgaben ein ERM und relationales Datenmodell.

**Aufgabe 1:**

- In einem Ort befinden sich mehrere Strassen.
- Eine Strasse befindet sich genau in einem Ort.
- An einer Strasse befinden sich mehrere Häuser.
- Ein Haus befindet sich genau an einer Strasse.

**Aufgabe 2:**

- In jeder Filiale der Pizza-Kette XY arbeiten mehrere Mitarbeiter
- Jeder Mitarbeiter gehört zu genau einer Filiale.
- Jede Filiale verfügt über mehrere Auslieferfahrzeuge.
- Jedes Fahrzeug gehört zu genau einer Filiale

**Aufgabe 3:**

- In einem Museum A gibt es verschiedene Räume, in denen wiederum verschiedene Gegenstände ausgestellt werden.
- Jeder Gegenstand gehört zu genau einer Kategorie (z.B. Bild, Holzgegenstand, Metallgegenstand usw.).
- Für jeden Raum ist genau ein Mitarbeiter zuständig.
- Auch für jede Kategorie ist genau in Mitarbeiter zuständig.

---

© 2026 Lukas Müller – Licensed under CC BY-NC-ND 4.0
See [LICENSE](..\license.md) file for details.
