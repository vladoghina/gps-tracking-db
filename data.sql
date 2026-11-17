USE monitorizare_gps;

-- Sample data (test values only)

INSERT INTO Utilizator (nume, email, parola, telefon, rol)
VALUES
('Admin Principal', 'admin.principal@firma.ro', 'admin123', '0793841256', 'administrator'),
('Dispecer Central', 'dispecer.central@firma.ro', 'disp123', '0782057361', 'dispecer'),
('Manager Flota', 'manager.flota@firma.ro', 'manager123', '0774916283', 'manager');

INSERT INTO Sofer (nume, telefon, email, ani_experienta)
VALUES
('Popescu Mihai', '0700000002', 'mihai.popescu@email.ro', 7),
('Dumitrescu Radu', '0764182935', 'radu.dumitrescu@email.ro', 4),
('Stan Alexandru', '0782059146', 'alexandru.stan@email.ro', 9);

INSERT INTO Autoturism (id_sofer, id_utilizator, numar_inmatriculare, marca, model)
VALUES
(1, 1, 'B123ABC', 'Dacia', 'Logan'),
(2, 2, 'B456DEF', 'Renault', 'Clio'),
(3, 3, 'B789GHI', 'Volkswagen', 'Golf');

INSERT INTO Dispozitiv_GPS (id_autoturism, status)
VALUES
(1, 'activ'),
(2, 'activ'),
(3, 'inactiv');

INSERT INTO Traseu (id_autoturism, data_ora_start, data_ora_final, locatie_start, locatie_final)
VALUES
(1, '2026-05-12 08:00:00', '2026-05-12 09:30:00', 'Bucuresti', 'Ploiesti'),
(2, '2026-05-12 10:00:00', '2026-05-12 11:15:00', 'Bucuresti', 'Pitesti'),
(3, '2026-05-12 12:00:00', NULL, 'Brasov', NULL);

INSERT INTO Pozitie_GPS (id_traseu, latitudine, longitudine, viteza, data_ora)
VALUES
(1, 44.426800, 26.102500, 50.25, '2026-05-12 08:10:00'),
(1, 44.500000, 26.200000, 72.50, '2026-05-12 08:30:00'),
(1, 44.940000, 26.030000, 65.00, '2026-05-12 09:10:00'),
(2, 44.426800, 26.102500, 45.00, '2026-05-12 10:10:00'),
(2, 44.600000, 25.900000, 80.75, '2026-05-12 10:40:00'),
(2, 44.856500, 24.869200, 70.20, '2026-05-12 11:05:00'),
(3, 45.657900, 25.601200, 35.50, '2026-05-12 12:10:00'),
(3, 45.700000, 25.650000, 40.00, '2026-05-12 12:30:00');

INSERT INTO Alerta (id_autoturism, tip, data_ora)
VALUES
(1, 'depasire viteza', '2026-05-12 08:30:00'),
(2, 'depasire viteza', '2026-05-12 10:40:00'),
(3, 'lipsa semnal GPS', '2026-05-12 12:35:00');
