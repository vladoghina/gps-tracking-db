USE monitorizare_gps;

-- 1. Vehicles with their driver and administrating user
SELECT
    Autoturism.id_autoturism,
    Autoturism.numar_inmatriculare,
    Autoturism.marca,
    Autoturism.model,
    Sofer.nume AS nume_sofer,
    Sofer.telefon AS telefon_sofer,
    Utilizator.nume AS nume_utilizator,
    Utilizator.rol
FROM Autoturism
JOIN Sofer ON Autoturism.id_sofer = Sofer.id_sofer
JOIN Utilizator ON Autoturism.id_utilizator = Utilizator.id_utilizator;

-- 2. Trips with vehicle and driver details
SELECT
    Traseu.id_traseu,
    Autoturism.numar_inmatriculare,
    Autoturism.marca,
    Autoturism.model,
    Sofer.nume AS nume_sofer,
    Traseu.data_ora_start,
    Traseu.data_ora_final,
    Traseu.locatie_start,
    Traseu.locatie_final
FROM Traseu
JOIN Autoturism ON Traseu.id_autoturism = Autoturism.id_autoturism
JOIN Sofer ON Autoturism.id_sofer = Sofer.id_sofer;

-- 3. GPS positions with their trip and vehicle, ordered by time
SELECT
    Pozitie_GPS.id_pozitie,
    Autoturism.numar_inmatriculare,
    Traseu.id_traseu,
    Pozitie_GPS.latitudine,
    Pozitie_GPS.longitudine,
    Pozitie_GPS.viteza,
    Pozitie_GPS.data_ora
FROM Pozitie_GPS
JOIN Traseu ON Pozitie_GPS.id_traseu = Traseu.id_traseu
JOIN Autoturism ON Traseu.id_autoturism = Autoturism.id_autoturism
ORDER BY Pozitie_GPS.data_ora;
