-- Nutzer
CREATE TABLE user (
    id INT PRIMARY KEY,
    vorname VARCHAR(50),
    nachname VARCHAR(50),
    rolle ENUM('STUDENT', 'DOZENT'),
    email VARCHAR(100)
);

-- Kurskategorien
CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Kurse
CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    beschreibung TEXT,
    dozent_id INT,
    category_id INT,
    FOREIGN KEY (dozent_id) REFERENCES user(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
);

-- Kurs-Buchungen
CREATE TABLE enrollment (
    user_id INT,
    course_id INT,
    datum DATE,
    PRIMARY KEY(user_id, course_id),
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);

-- Bewertungen
CREATE TABLE rating (
    user_id INT,
    course_id INT,
    sterne INT CHECK (sterne BETWEEN 1 AND 5),
    kommentar TEXT,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (course_id) REFERENCES course(id)
);




