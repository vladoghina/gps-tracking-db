CREATE DATABASE monitorizare_gps;

USE monitorizare_gps;

-- 1. Utilizator
CREATE TABLE Utilizator (
    id_utilizator SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    parola VARCHAR(30) NOT NULL,
    telefon VARCHAR(15) UNIQUE,
    rol VARCHAR(20)
);

-- 2. Sofer
CREATE TABLE Sofer (
    id_sofer SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    telefon VARCHAR(15) NOT NULL UNIQUE,
    email VARCHAR(50) UNIQUE,
    ani_experienta TINYINT UNSIGNED
);

-- 3. Autoturism
CREATE TABLE Autoturism (
    id_autoturism SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_sofer SMALLINT UNSIGNED,
    id_utilizator SMALLINT UNSIGNED NOT NULL,
    numar_inmatriculare VARCHAR(15) NOT NULL UNIQUE,
    marca VARCHAR(30) NOT NULL,
    model VARCHAR(30) NOT NULL,
    CONSTRAINT fk_autoturism_sofer
        FOREIGN KEY (id_sofer)
        REFERENCES Sofer(id_sofer)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    CONSTRAINT fk_autoturism_utilizator
        FOREIGN KEY (id_utilizator)
        REFERENCES Utilizator(id_utilizator)
        ON DELETE RESTRICT
        ON UPDATE CASCADE
);

-- 4. Dispozitiv_GPS
CREATE TABLE Dispozitiv_GPS (
    id_dispozitiv SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_autoturism SMALLINT UNSIGNED NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_dispozitiv_autoturism
        FOREIGN KEY (id_autoturism)
        REFERENCES Autoturism(id_autoturism)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 5. Traseu
CREATE TABLE Traseu (
    id_traseu MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_autoturism SMALLINT UNSIGNED NOT NULL,
    data_ora_start DATETIME NOT NULL,
    data_ora_final DATETIME,
    locatie_start VARCHAR(100) NOT NULL,
    locatie_final VARCHAR(100),
    CONSTRAINT fk_traseu_autoturism
        FOREIGN KEY (id_autoturism)
        REFERENCES Autoturism(id_autoturism)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 6. Pozitie_GPS
CREATE TABLE Pozitie_GPS (
    id_pozitie INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_traseu MEDIUMINT UNSIGNED NOT NULL,
    latitudine DECIMAL(8,6) NOT NULL,
    longitudine DECIMAL(9,6) NOT NULL,
    viteza DECIMAL(5,2) UNSIGNED NOT NULL,
    data_ora DATETIME NOT NULL,
    CONSTRAINT fk_pozitie_traseu
        FOREIGN KEY (id_traseu)
        REFERENCES Traseu(id_traseu)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- 7. Alerta
CREATE TABLE Alerta (
    id_alerta MEDIUMINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_autoturism SMALLINT UNSIGNED NOT NULL,
    tip VARCHAR(50) NOT NULL,
    data_ora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_alerta_autoturism
        FOREIGN KEY (id_autoturism)
        REFERENCES Autoturism(id_autoturism)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
