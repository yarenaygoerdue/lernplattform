# 📚 Lernplattform – Relationale SQL-Datenbank

Dieses Projekt modelliert eine vereinfachte Online-Lernplattform mit relationalen SQL-Strukturen und typischen Abfragen.  
Es wurde mit dem Ziel entwickelt, praxisnahe Datenbankmodellierung und Abfragekenntnisse zu demonstrieren.

---

## 🧱 Struktur der Datenbank

Die Datenbank umfasst fünf zentral strukturierte Tabellen:

- **`user`** – Speicherung von Nutzerdaten (Lernende und Dozenten)
- **`category`** – Kurskategorien wie „Programmieren“, „Mathematik“ etc.
- **`course`** – Kurse mit Beschreibung, Kategorie und zugehörigem Dozenten
- **`enrollment`** – Verknüpfungstabelle zur Darstellung von Kursbuchungen (n:m)
- **`rating`** – Bewertungen von Kursen (Sterne + Kommentar)

Alle Tabellen sind relational verknüpft über **Primär- und Fremdschlüssel** und beinhalten einfache Integritätsbedingungen (z. B. `CHECK` auf Sterne-Bewertungen).

---

## 🔍 Enthaltene Beispielabfragen

Einige der enthaltenen SQL-Abfragen zur Demonstration:

- ✅ Alle Kurse mit Namen der Dozenten
- ✅ Alle Bewertungen inkl. Kursname und Kommentar
- ✅ Durchschnittliche Bewertung pro Kurs
- ✅ Anzahl gebuchter Kurse pro Nutzer
- ✅ Kurse eines bestimmten Users

Diese Abfragen beinhalten grundlegende **`JOIN`-Konstrukte**, **Aggregation (`GROUP BY`)**, sowie einfache **Filter**.

---

## ⚙️ Technologien

- Plain SQL (MySQL-ähnliche Syntax)
- Nutzung von ENUMs, CHECKs, JOINs, Aggregation
- Entwickelt und getestet in DBeaver / SQL-Workbench-ähnlicher Umgebung (2023)

---

## 📌 Verbesserungspotenzial

Dieses Projekt bildet eine solide Grundlage für relationale Modellierung, lässt sich aber weiterentwickeln durch:

- 📦 **Daten-INSERTs** zur besseren Testbarkeit
- 🔐 **Verstärkte Constraints** (z. B. `NOT NULL`, `UNIQUE`, `DEFAULT`)
- 🔄 **TRIGGER oder STORED PROCEDURES** zur Automatisierung
- 📊 **Mehrdimensionale Abfragen** (z. B. mit `NOT EXISTS`, Subqueries, Window Functions)

Diese Punkte sind bewusst offen gehalten, um im weiteren Lernverlauf oder bei Bewerbungsprojekten gezielt erweitert werden zu können.

---

## 👩‍💻 Autorin

**Yaren Aygördü**    
📫 yarenaygoerdue@outlook.de
