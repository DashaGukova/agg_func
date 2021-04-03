USE AdventureWorks2019
GO
SELECT COUNT(*) AS GroupCount, d.GroupName
FROM HumanResources.Department AS d
GROUP BY d.GroupName;

----------------------------

SELECT e.BusinessEntityID, e.JobTitle, MAX(h.Rate) AS MaxRate
FROM HumanResources.Employee AS e
JOIN HumanResources.EmployeePayHistory AS h 
	ON e.BusinessEntityID = h.BusinessEntityID
GROUP BY e.JobTitle, e.BusinessEntityID

---------------------------------------

SELECT s.Name, MIN(d.UnitPrice) AS MinPrice
FROM Sales.SalesOrderDetail AS d
JOIN Production.Product AS p
	ON p.ProductID = d.ProductID
JOIN Production.ProductSubcategory AS s
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
GROUP BY s.Name

----------------------------------------

SELECT c.Name, COUNT(s.Name) AS Amount
FROM Production.ProductCategory AS c
JOIN Production.ProductSubcategory AS s
	ON c.ProductCategoryID = s.ProductCategoryID
GROUP BY c.Name

---------------------------------

SELECT s.Name, AVG(LineTotal) AS AvgSum
FROM Sales.SalesOrderDetail AS d
JOIN Production.Product AS p
	ON p.ProductID = d.ProductID
JOIN Production.ProductSubcategory AS s
	ON p.ProductSubcategoryID = s.ProductSubcategoryID
GROUP BY s.Name

------------------------------

SELECT h.BusinessEntityID, h.Rate, MAX(h.RateChangeDate) AS Appointment
FROM HumanResources.EmployeePayHistory AS h
GROUP BY h.BusinessEntityID, h.Rate
HAVING h.Rate = (SELECT MAX(h.Rate) 
				 FROM HumanResources.EmployeePayHistory AS h)