--Kommentar, wird nicht ausgeführt

/*
Mehrzeiliger
Kommentar
*/

USE Northwind; --Datenbank auswählen

SELECT 100;

SELECT 'Test'; --Strg + E: Markierten Code ausführen

SELECT 100*3; --Berechnung

SELECT '100*3'; --Strg + R: Ergebnisansicht schließen

SELECT 'Test' AS Name; --AS: Text als Spaltenname verwenden

SELECT 100, 'Test' AS Test, 'weiterer Test'; --Mehrere Werte selektieren

SELECT 10.50; --Kommazahlen mit Punkt statt mit Beistrich

--Strg + K, C: Ausgewählte Zeilen auskommentieren
--Strg + K, U: Ausgewählte Zeilen einkommentieren

--Alt + Pfeiltaste (Up, Down): Ausgewählte Zeilen verschieben

SELECT * FROM Customers; --*: Alles

SELECT CompanyName FROM Customers; --Einzelne Spalten selektieren

SELECT Freight, Freight % 5 AS Mod5 FROM Orders; --Modulo Operator: Rest einer Division

SELECT CompanyName, Address + City + PostalCode + Country AS Addresse FROM Customers; --Strings verbinden (unschön)

SELECT CompanyName, Address + ' ' + City + ', ' + PostalCode + ' ' + Country AS Addresse FROM Customers; --Strings verbinden mit extra Abständen

SELECT Country FROM Customers; --Alle Länder finden in denen Customers existieren

SELECT DISTINCT Country FROM Customers; --Alle Länder einzigartig

SELECT cust.CompanyName FROM Customers cust; --Tabellenalias

SELECT * FROM Customers ORDER BY Country DESC; --ORDER BY: Nach Tabellenspalte sortieren, ASC/DESC um Richtung zu bestimmen