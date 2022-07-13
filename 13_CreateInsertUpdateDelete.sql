USE Northwind;

--DROP TABLE <Name>: Tabelle löschen
DROP TABLE Test;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Primärschlüssel, eindeutige Spalte, kann nicht null sein, häufig IDs
	--identity: Erhöht Spalte bei jedem INSERT um 1
	--identity(<Startwert>, <Inkrement>): Start bei 1, erhöhe um 3
	ID int primary key identity, --(1, 3)
	Vorname varchar(20),
	Nachname varchar(20) not null --Werte können nicht NULL sein
);

--INSERT INTO <Name>(<Spalte1>, <Spalte2>, ...) VALUES (<Wert1>, <Wert2>), (<Wert1>, <Wert2>)
INSERT INTO Test(Vorname, Nachname) --Spalten angeben
VALUES ('Mustermann', 'Max'); --Werte angeben

--Mehrere Zeilen gleichzeitig einfügen
INSERT INTO Test VALUES --Tabellenspalten weglassen (Reihenfolge beachten)
('Test', 'Test'),
('Max', 'Test');

INSERT INTO Test VALUES
('Mustermann', NULL); --nicht möglich, da Nachname nicht nullable ist

INSERT INTO Test
EXEC p_Test; --Ergebnisse aus einer Prozedur in eine Tabelle einfügen (funktioniert nur, wenn Spalten kompatibel sind)

--Ergebnisse aus SELECT in Tabelle einfügen (Subselect)
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis in eine NEUE Tabelle einfügen
SELECT FirstName, LastName INTO Test
FROM Employees; --funktioniert nicht weil Test bereits existiert

--UPDATE <Name> SET <Spalte> = <Wert>;
UPDATE Test
SET Nachname = 'Test';

--WHERE unbedingt verwenden um nicht alle Daten zu verändern
UPDATE Test
SET Nachname = 'Test'
WHERE LEN(Vorname) <= 5;

--Spaltenname nach =
UPDATE Test
SET Nachname = Nachname + 'Test'
WHERE LEN(Vorname) <= 5;

--CREATE SEQUENCE <Name> AD <Datentyp> (Numerischer Datentyp)
--Standardmäßig (1, 1)
CREATE SEQUENCE TestSeq AS int;

--Anpassbar mit START WITH <Zahl>, INCREMENT BY <Zahl>
CREATE SEQUENCE TestSeq AS int
START WITH 1
INCREMENT BY 3;

--Nächsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT nächsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test');

--Sequenz zurücksetzen auf <Wert>
ALTER SEQUENCE TestSeq RESTART WITH 1;

--Sequenz löschen
DROP SEQUENCE TestSeq;

--DELETE FROM <Tabelle>
--Löscht ALLE Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschränken
DELETE FROM Test WHERE ID >= 20;

--TRUNCATE löscht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht möglich bei TRUNCATE
--Programmierer wollte explizit alle Daten löschen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--ALTER: Etwas verändern
--ALTER <Object> <Name> <Options>
ALTER TABLE Test ADD Seq int; --Spalte hinzufügen

ALTER TABLE Test DROP COLUMN Seq; --Spalte löschen

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' --alle Tabellen anzeigen, mit WHERE = 'BASE TABLE' Views exkludieren
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '<Name>' --alle Spalten von allen Tabellen anzeigen, mit WHERE einschränken