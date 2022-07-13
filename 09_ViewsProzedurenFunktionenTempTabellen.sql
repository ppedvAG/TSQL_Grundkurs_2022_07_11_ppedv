USE Northwind;
GO

--CREATE VIEW <Name> AS <SQL-Statement> GO
--Statischer Snapshot eines Teils der Datendank
--v_ um Views von restlichen Objekten der Datenbank zu Differenzieren
--kein ORDER BY

DROP VIEW v_Countries; --View löschen
GO

CREATE VIEW v_Countries
AS
	SELECT DISTINCT Country FROM Customers;
GO

--View ansprechen
SELECT * FROM v_Countries;

--View mit WHERE
SELECT * FROM v_Countries
WHERE Country LIKE 'A%';

--View mit ORDER BY
SELECT * FROM v_Countries
ORDER BY Country DESC;

--View löschen
DROP VIEW v_Countries;

--Vorher prüfen ob die View existiert
DROP VIEW IF EXISTS v_Countries;
GO

--View mit JOIN
CREATE VIEW v_Chefs
AS
	SELECT
	e.EmployeeID,
	e.FirstName + ' ' + e.LastName AS FullName,
	chef.EmployeeID AS ChefID,
	chef.FirstName + ' ' + chef.LastName AS ChefName
	FROM Employees e
	LEFT JOIN Employees chef
	ON e.ReportsTo = chef.EmployeeID;
GO

SELECT * FROM v_Chefs;
GO

-------------------------------------------------------------

--Prozeduren: CREATE PROCEDURE <Name> AS <SQL-Statements> GO
--Fixes Verhalten auf Datenbankebene speichern (u.a. für andere Entwickler oder Clientsoftware)
CREATE PROCEDURE p_Test
AS
	SELECT DISTINCT Country FROM Customers;
	SELECT DISTINCT City FROM Customers;
GO

EXECUTE p_Test;
GO

--Prozedur mit Argument (@StartDate date -> @<Name> <Typ>)
--PROC statt PROCEDURE (Kurzform)
CREATE PROC p_OrdersByDate @StartDate date, @EndDate date
AS
	SELECT * FROM Orders WHERE ShippedDate BETWEEN @StartDate AND @EndDate ORDER BY ShippedDate;
GO

--Prozedur ausführen mit EXEC statt EXECUTE (Kurzform)
EXEC p_OrdersByDate @StartDate = '19970101', @EndDate = '19971231';
GO

--Prozedur einfach nur mit dem Namen aufrufen
p_Test;

--Prozedur löschen
DROP PROC p_OrdersByDate;
GO;

------------------------------------------------------------------------------------------------

--CREATE FUNCTION <Name> (@<Variablenname> <Typ>, ...) RETURN <Typ> AS BEGIN <Code> END
CREATE FUNCTION f_CreateFullName(@FirstName varchar(25), @LastName varchar(25))
RETURNS varchar(50)
AS
	BEGIN
		return @FirstName + ' ' + @LastName;
	END
GO

--Funktion löschen
DROP FUNCTION f_CreateFullName;
GO

--Funktion ausführen mit dbo.<Name>
SELECT dbo.f_CreateFullName(FirstName, LastName) FROM Employees;

------------------------------------------------------------------------------------------------

--SELECT INTO: Ergebnis einer Abfrage in eine neue Tabelle schreiben
SELECT CustomerID, Freight
INTO Test
FROM Orders;

--Neue Tabelle angreifen
SELECT * FROM Test;

--Ergebnis in eine Temporäre Tabelle einfügen (mit # am Anfang)
SELECT CustomerID, Freight
INTO #Test
FROM Orders;

--Temporäre Tabelle bleibt bestehen bis die Session beendet wird + ein paar Minuten
SELECT * FROM #Test;

--Globale Temporäre Tabelle (mit zwei #), kann jeder Datenbankbenutzer angreifen, wird gelöscht der Ersteller die Session beendet
SELECT CustomerID, Freight
INTO ##Test
FROM Orders;