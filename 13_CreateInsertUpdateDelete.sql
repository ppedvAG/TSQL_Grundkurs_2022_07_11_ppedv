USE Northwind;

--DROP TABLE <Name>: Tabelle l�schen
DROP TABLE Test;

--CREATE TABLE <Name> (<Spalte1> <Typ>, ...)
CREATE TABLE Test
(
	--primary key: Prim�rschl�ssel, eindeutige Spalte, kann nicht null sein, h�ufig IDs
	--identity: Erh�ht Spalte bei jedem INSERT um 1
	--identity(<Startwert>, <Inkrement>): Start bei 1, erh�he um 3
	ID int primary key identity, --(1, 3)
	Vorname varchar(20),
	Nachname varchar(20) not null --Werte k�nnen nicht NULL sein
);

--INSERT INTO <Name>(<Spalte1>, <Spalte2>, ...) VALUES (<Wert1>, <Wert2>), (<Wert1>, <Wert2>)
INSERT INTO Test(Vorname, Nachname) --Spalten angeben
VALUES ('Mustermann', 'Max'); --Werte angeben

--Mehrere Zeilen gleichzeitig einf�gen
INSERT INTO Test VALUES --Tabellenspalten weglassen (Reihenfolge beachten)
('Test', 'Test'),
('Max', 'Test');

INSERT INTO Test VALUES
('Mustermann', NULL); --nicht m�glich, da Nachname nicht nullable ist

INSERT INTO Test
EXEC p_Test; --Ergebnisse aus einer Prozedur in eine Tabelle einf�gen (funktioniert nur, wenn Spalten kompatibel sind)

--Ergebnisse aus SELECT in Tabelle einf�gen (Subselect)
INSERT INTO Test
SELECT FirstName, LastName FROM Employees;

--SELECT INTO: Ergebnis in eine NEUE Tabelle einf�gen
SELECT FirstName, LastName INTO Test
FROM Employees; --funktioniert nicht weil Test bereits existiert

--UPDATE <Name> SET <Spalte> = <Wert>;
UPDATE Test
SET Nachname = 'Test';

--WHERE unbedingt verwenden um nicht alle Daten zu ver�ndern
UPDATE Test
SET Nachname = 'Test'
WHERE LEN(Vorname) <= 5;

--Spaltenname nach =
UPDATE Test
SET Nachname = Nachname + 'Test'
WHERE LEN(Vorname) <= 5;

--CREATE SEQUENCE <Name> AD <Datentyp> (Numerischer Datentyp)
--Standardm��ig (1, 1)
CREATE SEQUENCE TestSeq AS int;

--Anpassbar mit START WITH <Zahl>, INCREMENT BY <Zahl>
CREATE SEQUENCE TestSeq AS int
START WITH 1
INCREMENT BY 3;

--N�chsten Wert aus der Sequenz entnehmen
SELECT NEXT VALUE FOR TestSeq;

--Bei INSERT n�chsten Wert abrufen
INSERT INTO Test VALUES
(CONVERT(varchar(20), NEXT VALUE FOR TestSeq), 'Test');

--Sequenz zur�cksetzen auf <Wert>
ALTER SEQUENCE TestSeq RESTART WITH 1;

--Sequenz l�schen
DROP SEQUENCE TestSeq;

--DELETE FROM <Tabelle>
--L�scht ALLE Daten ohne WHERE
DELETE FROM Test;

--WHERE zum Einschr�nken
DELETE FROM Test WHERE ID >= 20;

--TRUNCATE l�scht alle Daten aus der Tabelle genauso wie DELETE ohne WHERE
--WHERE nicht m�glich bei TRUNCATE
--Programmierer wollte explizit alle Daten l�schen und hat kein WHERE vergessen
TRUNCATE TABLE Test;

--ALTER: Etwas ver�ndern
--ALTER <Object> <Name> <Options>
ALTER TABLE Test ADD Seq int; --Spalte hinzuf�gen

ALTER TABLE Test DROP COLUMN Seq; --Spalte l�schen

SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' --alle Tabellen anzeigen, mit WHERE = 'BASE TABLE' Views exkludieren
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = '<Name>' --alle Spalten von allen Tabellen anzeigen, mit WHERE einschr�nken