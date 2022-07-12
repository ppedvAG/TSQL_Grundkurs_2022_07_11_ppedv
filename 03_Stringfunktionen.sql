USE Northwind;

SELECT CompanyName, Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS Addresse FROM Customers;

SELECT CompanyName, CONCAT(Address, ' ', City, ', ', PostalCode, ' ', Country) AS [Volle Addresse] FROM Customers; --CONCAT statt einfache Stringverbindung mit +

SELECT CompanyName, CONCAT_WS(' ', Address, PostalCode, City, Country) FROM Customers; --CONCAT_WS: Concat With Seperator, alle Parameter mit dem Seperator verbinden

SELECT TRIM('    Test    '); --Schneidet Abstände links und rechts weg
SELECT RTRIM('   Test    '); --Schneidet Abstände nur rechts weg
SELECT LTRIM('      Test     '); --Schneidet Abstände nur links weg

SELECT LOWER('Test'); --Ganzer String lowercase
SELECT UPPER('Test'); --Ganzer String UPPERCASE

SELECT LEN('Test'); --Länge vom Input (4)
SELECT LEN('Test '); --Schneidet automatisch Abstände weg
SELECT DATALENGTH('  Test '); --7, schneidet Abstände nicht weg

SELECT REVERSE('Test'); --Dreht Input um

SELECT LEFT('Testtext', 5); --Nimm die X Zeichen von Links (5 -> Testt)
SELECT RIGHT('Testtext', 5); --ttext
SELECT SUBSTRING('Testtext', 2, 4); --Von der Mitte nehmen (von Zeichen 2: e, nimm 4 Zeichen -> estt)

SELECT STUFF('Testtext', 2, 0, '_Hallo_'); --Vor dem angegebenen Index den angegebenen Text einfügen
SELECT STUFF('Testtext', 2, 7, '_Hallo_'); --Überschreibe die nächsten 7 Zeichen

SELECT REPLICATE('xy', 4); --xyxyxyxy, Schreibe einen string X mal

SELECT REPLACE('abcdefgh', 'a', 'b'); --Suche a, Ersetze mit b
SELECT REPLACE('abcdefgh', 'A', 'B'); --Suche ist nicht Case-Sensitive, kleines a wird ersetzt

SELECT CHARINDEX('x', 'Testtext', 0); --Suche das x und gib den Index zurück wenn gefunden

SELECT REPLACE(CompanyName, 'a', 'b') FROM Customers; --Funktionen auf Spalten anwenden
SELECT LEFT(CompanyName, 4) FROM Customers;
SELECT UPPER(LEFT(CompanyName, 4)) FROM Customers; --Verschachtelte Funktionen werden von innen nach außen ausgeführt
SELECT CONCAT(UPPER(LEFT(CompanyName, 4)), RIGHT(CompanyName, 4)) FROM Customers;