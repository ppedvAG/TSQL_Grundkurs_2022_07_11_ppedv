USE Northwind;

SELECT 'Test1', 'Test2'; --Zwei Spalten

--Einzelne Spalte dank UNION
SELECT 'Test1'
UNION
SELECT 'Test2'

--AS hier nur möglich beim ersten SELECT, ansonsten funktioniert es nicht
SELECT 'Test1' AS Spalte
UNION
SELECT 'Test2';

SELECT * FROM Customers;
SELECT * FROM Suppliers;

--CompanyNames fusionieren
SELECT CompanyName FROM Customers
UNION
SELECT CompanyName FROM Suppliers;

--Spalten müssen nicht den selben Namen haben
SELECT CompanyName FROM Customers
UNION
SELECT Address FROM Suppliers;

--Unterschiedliche Spalte können kombiniert werden mit CONVERT/CAST
SELECT CustomerID as ID, CompanyName, ContactName, Phone FROM Customers
UNION
SELECT CONVERT(nchar, SupplierID), CompanyName, ContactName, Phone FROM Suppliers;

--Beide Tabellen müssen gleich viele Spalte hergeben
SELECT CompanyName, Phone FROM Customers;
UNION
SELECT CompanyName FROM Suppliers;

--Typen müssen auch gleich sein
SELECT CompanyName FROM Customers
UNION
SELECT EmployeeID FROM Employees;

--Mehr als 2 Tabellen fusionieren
SELECT Phone FROM Customers
UNION
SELECT Phone FROM Suppliers
UNION
SELECT HomePhone FROM Employees;

--UNION ALL um Duplikate zu behalten
SELECT CompanyName, ContactName, Phone FROM Customers
UNION ALL
SELECT CompanyName, ContactName, Phone FROM Suppliers;

--Duplikat: besteht aus allen Spalten zusammengefügt
SELECT CompanyName, Phone FROM Customers
UNION
SELECT CompanyName, '' FROM Customers;

--Duplikate behalten (182 Rows statt 91)
SELECT CompanyName, Phone FROM Customers
UNION ALL
SELECT CompanyName, Phone FROM Customers;

--ORDER BY mit UNION
SELECT CompanyName, Phone FROM Customers
UNION
SELECT CompanyName, Phone FROM Suppliers
ORDER BY Phone;

--WHERE nur gültig für einzelne SELECTs
SELECT CompanyName, Phone FROM Customers
--WHERE CompanyName LIKE 'A%'
UNION
SELECT CompanyName, Phone FROM Suppliers
WHERE CompanyName LIKE 'A%'

--Alle Umsatzdaten abrufen von 2019-2021
select * From Umsatz2019
union
select * from Umsatz2020
union
select * from Umsatz2021
order by datum;
GO;

--Umsatzkombinationen in eine VIEW schreiben
CREATE VIEW Umsatz2019_2020_2021
AS
select * From Umsatz2019
union
select * from Umsatz2020
union
select * from Umsatz2021

SELECT * FROM Umsatz2019_2020_2021
ORDER BY datum;

--INTERSECT um nur Daten zu finden die in beiden Tabellen enthalten sind
SELECT * FROM Umsatz2019_2020_2021
INTERSECT
SELECT * FROM Umsatz2020
ORDER BY datum;

--Daten filtern mittels EXCEPT, nur Daten anzeigen die nicht in der zweiten Tabelle enthalten sind (Umsätze 2020 filtern)
SELECT * FROM Umsatz2019_2020_2021
EXCEPT
SELECT * FROM Umsatz2020
ORDER BY datum;