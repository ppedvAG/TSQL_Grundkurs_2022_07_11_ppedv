-- <, >, <=, >= kleiner, größer, kleiner-gleich, größer-gleich
-- =, !=, <> gleich, ungleich, ungleich (selbe Funktion)
-- IN, BETWEEN, LIKE -> IN: Liste für valide Werte angeben, BETWEEN: zwischen X und Y (Grenzen inkludiert)
-- AND, OR Bedingungen verknüpfen
-- NOT Bedingung invertieren

SELECT * FROM Orders WHERE Freight >= 50; --Orders mit Freight mindestens 50

SELECT * FROM Orders WHERE Freight >= 50 AND EmployeeID != 4; --Freight mindestens 50 UND nicht Mitarbeiter mit ID 4

SELECT * FROM Orders WHERE Freight >= 50 OR EmployeeID != 4; --Mindestens eine von beiden Bedingungen muss stimmen

SELECT * FROM Orders WHERE EmployeeID BETWEEN 1 AND 3; --EmployeeID zwischen 1 und 3 (1, 2, 3; Grenzen inkludiert)

SELECT * FROM Orders WHERE CONVERT(DATE, ShippedDate) BETWEEN '1997-01-01' AND '1997-12-31'; --Liegt mein Datum zwischen den zwei angegeben Daten?

SELECT * FROM Orders WHERE ShippedDate BETWEEN '19970101' AND '19971231'; --Datumsvergleiche ohne Bindestriche zwischen Jahr/Monat/Tag

SELECT * FROM Orders WHERE ShipCountry = 'Austria' OR ShipCountry = 'Germany' OR ShipCountry = 'Sweden'; --Lang und unübersichtlich#
SELECT * FROM Orders WHERE ShipCountry IN('Austria', 'Germany', 'Sweden'); --Einfacher und übersichtlicher mit IN(...), entspricht mein ShipCountry einem der drei angegebenen Länder

SELECT * FROM Orders WHERE EmployeeID IN(1, 2, 4); --Alle Order mit Employees 1, 2 oder 4

SELECT * FROM Customers WHERE Country = 'Germany'; --WHERE mit String

SELECT * FROM Customers WHERE Country = 'Germany' AND (City = 'Berlin' OR City = 'Köln'); --Klammern um rechten Ausdruck zuerst auszuwerten

SELECT * FROM Customers WHERE Country = 'Germany' ORDER BY PostalCode DESC; --Sortiere alle deutschen Customer nach PLZ (absteigend durch DESC)

SELECT * FROM Customers WHERE Country = 'Germany' AND Fax != NULL; --NULL Vergleiche funktionieren nicht mit = oder !=

SELECT * FROM Customers WHERE Country = 'Germany' AND Fax IS NOT NULL; --NULL Vergleiche immer mit IS NOT NULL oder IS NULL