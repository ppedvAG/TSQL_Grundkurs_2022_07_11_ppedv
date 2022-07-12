USE Northwind;

SELECT * FROM Customers ORDER BY Country; --ORDER BY: Tabelle nach einer Spalte sortieren

SELECT * FROM Customers ORDER BY Country, City; --Bei ORDER BY kann nach mehreren Spalten sortiert werden, getrennt mit Beistrich. Primär nach der ersten Spalte, Sekundär nach der zweiten Spalte

SELECT * FROM Customers ORDER BY Country DESC, ContactName ASC; --ASC/DESC: Sortierrichtung vorgeben (DESC -> absteigend), standardmäßig ASC

SELECT CustomerID, Address, Phone, Country FROM Customers ORDER BY 4, 2; --Nach Spaltenindex sortieren (4: Country, 2: Address)

SELECT * FROM Customers ORDER BY 2; --Funktioniert auch bei *

SELECT CONCAT_WS(' ', TitleOfCourtesy, FirstName, LastName) AS FullName FROM Employees ORDER BY FullName; --Nach Spaltenalias sortieren, CONCAT_WS: Beliebig viele Strings verbinden mit Seperator

SELECT DISTINCT Country FROM Customers; --DISTINCT: Jeder Datensatz einzigartig, wird automatisch sortiert

SELECT DISTINCT City, Country FROM Customers; --Alle Kombinationen von City und Country

SELECT DISTINCT City, Country FROM Customers ORDER BY Country; --ORDER BY hier auch möglich

SELECT COUNT(*) FROM Customers; --Alle Datensätze zählen (91)

SELECT COUNT(DISTINCT Country) FROM Customers; --21 einzigartige Länder

SELECT TOP 10 * FROM Orders; --Obersten 10 Datensätze in der Tabelle

SELECT TOP 10 * FROM Orders ORDER BY Freight; --TOP macht nur mit WHERE/ORDER BY wirklich Sinn (10 billigsten Bestellungen)

SELECT TOP 10 * FROM Orders ORDER BY Freight DESC; --Top 10 teuerste Order

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight; --Top 2% billigste Order

SELECT TOP 2 PERCENT * FROM Orders ORDER BY Freight DESC; --Top 2% teuerste Order (17 Stück)

--Mit einzelnen Spalten statt *
SELECT TOP 5 PERCENT
c.CustomerID,
c.CompanyName,
c.ContactName,
c.Phone,
c.City
FROM Customers c
ORDER BY City;

--WITH TIES: Mit unentschieden (22 -> 69)
SELECT TOP 1 PERCENT WITH TIES *
FROM [Order Details]
ORDER BY Quantity;