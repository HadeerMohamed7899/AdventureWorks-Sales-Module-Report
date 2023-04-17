--Fact Table
ALTER VIEW vw_FactOrderDetails AS

SELECT od.SalesOrderID AS OrderID
      ,od.SalesOrderDetailID AS OrderDetailID 
      ,od.ProductID
      ,od.OrderQty
      ,od.UnitPrice 
      ,od.LineTotal 

	  ,CAST(FORMAT(o.OrderDate, 'yyyyMMdd') AS INT) OrderDateKey
      ,CAST(FORMAT(o.DueDate  , 'yyyyMMdd') AS INT) DueDateKey
      ,CAST(FORMAT(o.ShipDate , 'yyyyMMdd') AS INT) ShipDateKey

      ,o.[Status] StatusID
      ,o.OnlineOrderFlag
      ,o.CustomerID
      ,o.SalesPersonID
      ,o.TerritoryID 
      ,o.ShipMethodID 
      
      ,(CAST(od.[LineTotal] AS DECIMAL(18,5)) / o.SubTotal ) * o.TaxAmt AS TaxAmt
      ,(CAST(od.[LineTotal] AS DECIMAL(18,5)) / o.SubTotal ) * o.Freight AS Freight
      ,(CAST(od.[LineTotal] AS DECIMAL(18,5)) / o.SubTotal ) * o.TotalDue AS TotalDue 
FROM Sales.SalesOrderDetail od
LEFT JOIN Sales.SalesOrderHeader o ON o.SalesOrderID = od.SalesOrderID

--Dim Territories
ALTER VIEW vw_DimTerritories AS
SELECT TerritoryID
      ,[Name] Territory
      ,CountryRegionCode
      ,[Group]
FROM Sales.SalesTerritory

--Dim Statuses
ALTER VIEW vw_DimStatuses AS
SELECT 1 StatusID, 'In process'  [Status] UNION ALL
SELECT 2 StatusID, 'Approved'	 [Status] UNION ALL
SELECT 3 StatusID, 'Backordered' [Status] UNION ALL
SELECT 4 StatusID, 'Rejected'	 [Status] UNION ALL
SELECT 5 StatusID, 'Shipped'	 [Status] UNION ALL
SELECT 6 StatusID, 'Cancelled'	 [Status]

--Dim ShipMethods
ALTER VIEW vw_DimShipMethods AS 
SELECT ShipMethodID
      ,[Name] ShipMethod
FROM Purchasing.ShipMethod

--Dim SalesPersons
ALTER VIEW vw_DimSalesPersons AS
SELECT [BusinessEntityID] SalesPersonID
      ,[Title]  
      ,CONCAT([FirstName], ' ', [MiddleName] + '. ', [LastName]) FullName
      ,[JobTitle]
      ,[PhoneNumber]
      ,[PhoneNumberType]
      ,[EmailAddress]
      ,[AddressLine1]
      ,[City]
      ,[StateProvinceName]
      ,[PostalCode]
      ,[CountryRegionName]
      ,[TerritoryName] 
  FROM [AdventureWorks].[Sales].[vSalesPerson]

--Dim Products
ALTER VIEW vw_DimProducts AS 
SELECT p.[ProductID]
      ,p.[Name] Product
      ,ps.[Name] Subcategory
      ,pc.[Name] Category

	  ,p.Color
FROM Production.Product p
LEFT JOIN Production.ProductSubcategory ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
LEFT JOIN Production.ProductCategory pc ON pc.ProductCategoryID = ps.ProductCategoryID