-- 1. Alle Kurse mit Dozentennamen
SELECT c.name AS kurs, u.vorname, u.nachname
FROM course c
JOIN user u ON c.dozent_id = u.id;

-- 2. Alle Bewertungen mit Kursnamen & Sterne
SELECT r.sterne, r.kommentar, c.name AS kursname
FROM rating r
JOIN course c ON r.course_id = c.id;

-- 3. Durchschnittliche Bewertung pro Kurs
SELECT course_id, AVG(sterne) AS durchschnitt
FROM rating
GROUP BY course_id;

-- 4. Anzahl gebuchter Kurse pro Nutzer
SELECT user_id, COUNT(*) AS buchungen
FROM enrollment
GROUP BY user_id;

-- 5. Alle Kurse eines bestimmten Users
SELECT c.name
FROM course c
JOIN enrollment e ON c.id = e.course_id
WHERE e.user_id = 1;

-- 6. Alle Kurse in der Kategorie „Programmieren“
SELECT c.name
FROM course c
JOIN category cat ON c.category_id = cat.id
WHERE cat.name = 'Programmieren';

-- 7. Alle Studenten, die keinen Kurs gebucht haben
SELECT u.vorname, u.nachname
FROM user u
WHERE rolle = 'STUDENT'
  AND id NOT IN (SELECT user_id FROM enrollment);

-- 8. Kurse mit mehr als 3 Bewertungen
SELECT course_id, COUNT(*) AS anzahl_bewertungen
FROM rating
GROUP BY course_id
HAVING COUNT(*) > 3;

-- 9. Durchschnittliche Bewertung pro Dozent
SELECT u.vorname, u.nachname, AVG(r.sterne) AS avg_bewertung
FROM course c
JOIN user u ON c.dozent_id = u.id
JOIN rating r ON c.id = r.course_id
GROUP BY u.id;

-- 10. Top 3 am besten bewertete Kurse
SELECT c.name, AVG(r.sterne) AS durchschnitt
FROM rating r
JOIN course c ON r.course_id = c.id
GROUP BY c.id
ORDER BY durchschnitt DESC
LIMIT 3;

-- 11. Nutzer mit gebuchten Kursen und Bewertungen
SELECT u.vorname, u.nachname, c.name AS kursname, r.sterne, r.kommentar
FROM user u
JOIN enrollment e ON u.id = e.user_id
JOIN course c ON e.course_id = c.id
LEFT JOIN rating r ON u.id = r.user_id AND c.id = r.course_id;

-- 12. Dozenten mit Anzahl ihrer angebotenen Kurse
SELECT u.vorname, u.nachname, COUNT(c.id) AS kurse
FROM user u
LEFT JOIN course c ON u.id = c.dozent_id
WHERE rolle = 'DOZENT'
GROUP BY u.id;

-- 13. Kurse ohne Bewertungen
SELECT c.name
FROM course c
LEFT JOIN rating r ON c.id = r.course_id
WHERE r.course_id IS NULL;

-- 14. Durchschnittliche Bewertung je Kategorie
SELECT cat.name AS kategorie, AVG(r.sterne) AS durchschnitt
FROM rating r
JOIN course c ON r.course_id = c.id
JOIN category cat ON c.category_id = cat.id
GROUP BY cat.name;

-- 15. Nutzer, die alle Kurse einer bestimmten Kategorie belegt haben
SELECT DISTINCT u.vorname, u.nachname
FROM user u
WHERE NOT EXISTS (
    SELECT c.id
    FROM course c
    JOIN category cat ON c.category_id = cat.id
    WHERE cat.name = 'Mathematik'
    AND c.id NOT IN (
        SELECT e.course_id
        FROM enrollment e
        WHERE e.user_id = u.id
    )
);
