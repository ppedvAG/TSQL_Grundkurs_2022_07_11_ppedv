USE Northwind;

SELECT * FROM Customers WHERE Country LIKE 'A%'; --Alle Customer in Ländern die mit A anfangen

SELECT * FROM Customers WHERE Country LIKE 'a%'; --Case Insensitive (Groß- und Kleinschreibung wird ignoriert)

SELECT * FROM Customers WHERE Country LIKE '%a%'; --Argentinien immer noch enthalten da keine Zeichen im ersten Prozent

SELECT * FROM Customers WHERE Country LIKE '%a%a%'; --Argentinien, Austria, Canada

SELECT * FROM Customers WHERE City LIKE '_ünchen'; --Underscore: Ein beliebiges Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '____'; --Genau Vier beliebige Zeichen suchen

SELECT * FROM Customers WHERE PostalCode LIKE '1____' --Alle Postleitzahlen mit genau 5 Zeichen die mit einer 1 anfangen

SELECT * FROM Customers WHERE ContactName LIKE '[agn]%'; --Finde alle Kunden die mit A, G oder N anfangen

SELECT * FROM Orders WHERE EmployeeID LIKE '[124]'; --Suche Employees mit ID 1, 2 oder 4 (funktioniert nur bei einstelligen IDs)

SELECT * FROM Customers WHERE ContactName LIKE '[a-d]%'; --Alle Customer mit ContactName von A bis D

SELECT * FROM Customers WHERE ContactName LIKE '[^a-d]%' ORDER BY ContactName;

SELECT * FROM Customers WHERE ContactName LIKE '[a-c|x-z]%'; --Alle Customer von A-C oder X-Z (Mehrere Ranges gleichzeitig)

SELECT * FROM Customers WHERE PostalCode LIKE '[0-9][0-9][0-9][0-9]'; --PIN abfragen

SELECT * FROM Customers WHERE CompanyName LIKE '%[%]%'; --Sonderfall: Nach Prozent suchen

SELECT * FROM Customers WHERE CompanyName LIKE '%['']%'; --Sonderfall: Nach einzelnem Hochkomma suchen