--zadanie1
BEGIN
	SELECT AVG(hreph.Rate) AS sr_stawka FROM AdventureWorks2017.HumanResources.EmployeePayHistory hreph;
	SELECT hre.*, hreph.Rate FROM AdventureWorks2017.HumanResources.Employee hre, AdventureWorks2017.HumanResources.EmployeePayHistory hreph
	WHERE hre.BusinessEntityID = hreph.BusinessEntityID AND hreph.Rate < (SELECT AVG(hreph.Rate) FROM AdventureWorks2017.HumanResources.EmployeePayHistory hreph);
END;

--zadanie2
CREATE FUNCTION data_zamowienia(
@ID_Zamowienia INT)
RETURNS TABLE 
AS 
RETURN 
(
	SELECT ppoh.ShipDate 
	FROM AdventureWorks2017.Purchasing.PurchaseOrderHeader ppoh 
	WHERE ppoh.PurchaseOrderID = @ID_Zamowienia
);
SELECT * FROM data_zamowienia(5);

--zadanie3
CREATE PROCEDURE Produkt_Dane @Nazwa VARCHAR(30)
AS 
BEGIN
	SELECT pp.ProductID, pp.ProductNumber, pp.SafetyStockLevel 
	FROM AdventureWorks2017.Production.Product pp
	WHERE pp.Name=@Nazwa;
END;
EXEC Produkt_Dane @Nazwa = 'Reflector';

--zadanie4
CREATE FUNCTION nr_karty(
@ID_Zamowienia INT)
RETURNS TABLE
AS
RETURN
(
	SELECT scc.CardNumber 
	FROM AdventureWorks2017.Sales.CreditCard scc
	INNER JOIN AdventureWorks2017.Sales.SalesOrderHeader ssoh
	ON ssoh.CreditCardID = scc.CreditCardID
	AND ssoh.SalesOrderID = @ID_Zamowienia
);
SELECT *FROM nr_karty(43682);

--zadanie5
CREATE PROCEDURE dzielenie(@num1 FLOAT, @num2 FLOAT)
AS 
BEGIN
	DECLARE @iloraz FLOAT

	IF @num1 < @num2
	BEGIN
		PRINT 'Niewlasciwie zdefiniowales dane wejsciowe'
	END

	ELSE

	BEGIN 
		SELECT @iloraz = @num1 / @num2;
		PRINT 'Wynik: '
		PRINT @iloraz
	END

END;
EXEC dzielenie @num1 = 10.0, @num2 = 5.0;