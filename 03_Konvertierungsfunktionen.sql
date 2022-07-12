USE Northwind;

SELECT GETDATE();

SELECT CAST(GETDATE() AS date); --Nur Datum von Datetime abrufen

SELECT CAST(GETDATE() AS time); --Nur Zeit von Datetime abrufen

SELECT HireDate, CAST(HireDate AS date) FROM Employees; --CAST auf eine Spalte anwenden

SELECT '123' + 2; --Automatische Konvertierung

SELECT '123.4' + 3; --Keine automatische Konvertierung möglich

SELECT CAST('123.4' as float) + 3; --Expliziert konvertieren

SELECT CAST('123.4' as decimal(10, 3)) + 3; --DECIMAL: Dezimalzahl mit fixer Anzahl Vor- und Nachkommastellen

SELECT CAST(GETDATE() AS varchar); --Datum zu string konvertieren (etwas schönere Form)

SELECT CAST(GETDATE() AS varchar(11)); --Bei Konvertierung nur die ersten 11 Zeichen nehmen (nicht praktikabel)

SELECT CAST('04/21/2022' AS date); --Valides Datum nicht möglich da falsche Culture

SELECT CONVERT(DATE, GETDATE()); --CONVERT: selbiges wie Cast nur andere Schreibweise (Typ zuerst dann Wert)

--https://docs.microsoft.com/en-us/sql/t-sql/functions/cast-and-convert-transact-sql?view=sql-server-2017#date-and-time-styles
SELECT CONVERT(VARCHAR, GETDATE(), 104); --11.07.2022

SELECT CONVERT(VARCHAR, GETDATE(), 4); --11.07.22

/*
Intervalle:
    year, yyyy, yy = Year
    month, MM, M = month
    week, ww, wk = Week
    day, dd, d = Day
    hour, hh = hour
    minute, mi, n = Minute
    second, ss, s = Second
    millisecond, ms = Millisecond
	nanosecond, ns

    weekday, dw, w = Weekday (1-7)
    dayofyear, dy, y = Day of the year (1-366)
    quarter, qq, q = Quarter (1-4)
*/

SELECT FORMAT(GETDATE(), 'yyyy-MM-dd'); --Datumsformat sehr präzise angeben

SELECT FORMAT(GETDATE(), 'MMMM dddd'); --MMMM: Monat ausschreiben, dddd: Tag ausschreiben

SELECT FORMAT(GETDATE(), 'dddd, dd. MMMM yyyy hh:mm:ss'); --Schönes deutsches Datum

SELECT FORMAT(GETDATE(), 'D'); --Schönes Datum nur kurz

SELECT FORMAT(GETDATE(), 'd'); --Kurzform vom Datum (dd.MM.yyyy)

SELECT FORMAT(1234, '##/##'); --Rauten sind Platzhalter für das Format

SELECT FORMAT(1234, '#-#/#-#'); --Beliebig viele Zeichen dazwischen geben

SELECT FORMAT(1234, '#/#'); --Erste Raute nimmt Zeichen bis die restlichen Rauten jeweils ein Zeichen nehmen (123/4)

SELECT FORMAT(1234, '##/#'); --Erste: 12, Zweite: 3, Dritte: 4

SELECT FORMAT(HireDate, 'dd.MM.yyyy') FROM Employees; --Spalte in Tabelle formatieren

SELECT FORMAT(HireDate, 'd') FROM Employees; --Kurzform von oben

SELECT FORMAT(HireDate, 'D') FROM Employees;