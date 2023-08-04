-- Task 1: Вывести название и стоимость в USD одного самого дорогого проданного товара
SELECT ProductName,
       Price * 1.09 AS PriceUSD
FROM Products
ORDER BY Price DESC
    LIMIT 1

-- Task 2: Вывести два самых дорогих товара из категории Beverages из USA
SELECT *
FROM Products
JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID
WHERE
    CategoryName = 'Beverages'
  AND
    Country = 'USA'
ORDER BY Price DESC
    LIMIT 2

-- Task 3: Удалить товары с ценой от 5 до 25 EUR
DELETE
FROM Products
WHERE Price BETWEEN 5 AND 25

-- Task 4: Вывести список стран, которые поставляют морепродукты
SELECT DISTINCT Country
FROM Products
JOIN Categories
    ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID
WHERE
    CategoryName = 'Seafood'

-- Task 5: Очистить поле ContactName у всех клиентов не из China
UPDATE Customers
SET
    ContactName = ''
WHERE
    Country != 'China'

-- Task 6: Вывести информацию о товарах с ценой от 10 до 150 EUR, которые были поставлены из Japan:
-- название_товара
-- цена_товара
-- цена_со_скидкой_15_процентов
-- название_поставщика
SELECT ProductName,
       Price,
       Price * 0.85 AS Price_discount_15,
       SupplierName
FROM Products
JOIN Suppliers
    ON Products.SupplierID = Suppliers.SupplierID
WHERE
    Price BETWEEN 10 AND 150
  AND
    Country = 'Japan'

-- Task 7: Вывести заказы клиентов из USA, Germany, UK:
-- номер_заказа (Orders.OrderID)
-- полное_имя_клиента (Customers.CustomerName)
-- страна_клиента (Customers.Country)
-- имя_менеджера (Employees.FirstName)
-- фамилия_менеджера (Employees.LastName)
SELECT Orders.OrderID,
       Customers.CustomerName,
       Customers.Country,
       Employees.FirstName,
       Employees.LastName
FROM Orders
JOIN Customers
    ON Orders.CustomerID = Customers.CustomerID
JOIN Employees
    ON Orders.EmployeeID = Employees.EmployeeID
WHERE
    Customers.Country IN ('USA', 'Germany', 'UK')