--zadanie1
CREATE FUNCTION ciag_Fibonacciego (@numer INT)
RETURNS @fibonacci TABLE (ciag_f INT)

BEGIN
	DECLARE @num1 INT =1;
	DECLARE @num2 INT =1;
	DECLARE @ilosc INT =1;
	DECLARE @f INT =0;

	WHILE @numer >= @ilosc
	BEGIN
		IF @ilosc = 1 OR @ilosc = 2
			BEGIN
				SET @f = 1;
				INSERT INTO @fibonacci
				SELECT @f;
			END;

		ELSE
			BEGIN
				SET @f = @num1 + @num2;
				SET @num1 = @num2;
				SET @num2 = @f;
				INSERT INTO @fibonacci
					SELECT @f;
			END;
		SET @ilosc = @ilosc + 1;
		END;
	RETURN;
END;

CREATE PROCEDURE Fibonacci @numer INT 
AS SELECT * FROM dbo.ciag_Fibonacciego(@numer);

EXEC Fibonacci @numer = 8;


--zadanie2
CREATE TRIGGER trigger_dml
ON Person.Person
FOR UPDATE AS
UPDATE Person.Person SET LastName=UPPER(LastName)
UPDATE Person.Person SET FirstName='Kevin' WHERE BusinessEntityID = 7;

SELECT * FROM Person.Person;


--zadanie3
CREATE TRIGGER taxRateMonitoringo ON Sales.SalesTaxRate
AFTER UPDATE AS
BEGIN
	DECLARE @po_zmianie FLOAT = (SELECT TaxRate FROM INSERTED);
	DECLARE @przed_zmiana FLOAT = (SELECT TaxRate FROM DELETED);
IF (@po_zmianie < @przed_zmiana - 0.3 * @przed_zmiana) OR (@po_zmianie > @przed_zmiana + 0.3 * @przed_zmiana)
	BEGIN
		PRINT 'Uwaga! Wartosc w polu TaxRate zostala zmieniona o wiecej niz 30%.'
		ROLLBACK;
	END
END;

SELECT * FROM Sales.SalesTaxRate;
UPDATE Sales.SalesTaxRate SET TaxRate = '10' WHERE SalesTaxRateID = 7;
SELECT * FROM Sales.SalesTaxRate WHERE SalesTaxRateID = 7;