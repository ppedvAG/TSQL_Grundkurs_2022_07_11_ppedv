USE Northwind;

--COUNT(Spaltenname oder *): Gibt die Anzahl an Resultaten aus
SELECT COUNT(*) FROM Customers;

SELECT COUNT(*) FROM Customers WHERE Country = 'UK'; --7

SELECT COUNT(DISTINCT City) FROM Customers; --Anzahl Cities in der Tabelle

--GROUP BY: Gruppen erstellen anhand einer Spalte (hier Country-Gruppen: Argentinien Gruppe, Austria Gruppe, Brasilien Gruppe, ...)
--Aggregatsfunktionen können auf diese Gruppen angewandt werden
SELECT Country, COUNT(*) AS Anzahl FROM Customers GROUP BY Country;

SELECT Quantity, COUNT(*) AS Anzahl FROM [Order Details] GROUP BY Quantity ORDER BY Anzahl DESC; --Anzahl Bestellungen pro Menge ausgeben

SELECT 
MIN(Freight) AS BilligsteBestellung, --MIN: kleinster Wert der Spalte 
MAX(Freight) AS TeuersteBestellung, --MAX: größter Wert der Spalte
AVG(Freight) AS Durchschnittskosten, --AVG: Durchschnittlicher Wert der Spalte
SUM(Freight) AS Gesamtkosten --SUM: Summe der Spalte
FROM Orders;

SELECT TOP 1 Freight FROM Orders ORDER BY Freight; --MIN
SELECT TOP 1 Freight FROM Orders ORDER BY Freight DESC; --MAX

SELECT Country, City FROM Customers GROUP BY City, Country; --Alle Stadt/Land Kombinationen ausgeben

SELECT Country, City, COUNT(*) AS Anzahl FROM Customers GROUP BY City, Country ORDER BY Anzahl DESC; --Customer pro Land/Stadt Kombination ausgeben

SELECT EmployeeID, COUNT(*) AS AnzBestellungen FROM Orders GROUP BY EmployeeID; --Anzahl Bestellungen pro Employee ausgeben

SELECT EmployeeID, AVG(Freight) AS Durchschnittskosten FROM Orders GROUP BY EmployeeID ORDER BY Durchschnittskosten DESC; --Durchschnittskosten pro Employee ausgeben

SELECT EmployeeID, COUNT(*) AS AnzBestellungen, AVG(Freight) AS Durchschnitt, SUM(Freight) AS Gesamtkosten
FROM Orders
GROUP BY EmployeeID
ORDER BY AnzBestellungen; --Mehrere Aggregatsfunktionen gleichzeitig benutzen

--WHERE vs GROUP BY + HAVING
--WHERE filtert alle Daten bevor sie geholt werden
--HAVING holt alle Daten und filtert danach

--Alle Kunden die mindestens 10 Einkäufe getätigt haben
SELECT CustomerID, COUNT(*) AS AnzBestellungen
FROM Orders
GROUP BY CustomerID
HAVING COUNT(*) > 10;

--Alle Kunden die mindestens 1000$ Frachtkosten verursacht haben
SELECT CustomerID, COUNT(*) AS Anz, SUM(Freight) AS Gesamt
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000;

--ORDER BY mit Aliases von Aggregatsfunktionen
SELECT CustomerID, COUNT(*) AS Anz, SUM(Freight) AS Gesamt
FROM Orders
GROUP BY CustomerID
HAVING SUM(Freight) > 1000
ORDER BY Anz, Gesamt;

--GROUP BY mit mehreren Spalten, alle Spalten die im SELECT ausgegeben werden sollen müssen im GROUP BY stehen (außer Aggregatsfunktionen)
SELECT 
Customers.CustomerID,
Customers.CompanyName,
AVG(Orders.Freight) AS AvgFreight
FROM Orders 
INNER JOIN Customers 
ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, CompanyName;