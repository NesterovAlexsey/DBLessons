--Task1: Найти мин/стоимость товаров для каждой категории
SELECT
    CategoryID,
    MIN(Price) AS minimal_Category_price
FROM Products

GROUP BY CategoryID

--Task2: Вывести ТОП-3 стран по количеству доставленных заказов
--Комментарий: предполагаем, что заказы в таблице заказов доставлены
SELECT
    Customers.Country AS top_country_by_orders
FROM Orders

LEFT JOIN Customers ON Orders.CustomerID = Customers.CustomerID

GROUP BY Customers.Country

ORDER BY COUNT(Orders.OrderId) DESC
LIMIT 3

--Task3: Вывести названия категорий, в которых более 10 товаров
SELECT
    Categories.CategoryName
FROM Products

LEFT JOIN Categories ON Products.CategoryID = Categories.CategoryID

GROUP BY Categories.CategoryID

HAVING COUNT(ProductID) >= 10

--Task4: Очистить тел/номер поставщикам из USA
UPDATE Suppliers

SET Phone = ''

WHERE Country = 'USA'

--Task5: Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15
SELECT
    Employees.FirstName,
    Employees.LastName,
    COUNT(Orders.OrderID) AS number_of_orders
FROM Orders

LEFT JOIN Employees USING(EmployeeID)

GROUP BY Employees.EmployeeID

HAVING number_of_orders <= 15

ORDER BY number_of_orders

--Task6: Вывести товар, который находится на втором месте по ко-ву заказов
--Комментарий: предположим, что при равном количестве продаж, нас интересует более дорогой товар.
SELECT
    Products.*
FROM OrderDetails

LEFT JOIN Products USING(ProductID)

GROUP BY Products.ProductID

ORDER BY COUNT(OrderDetailID) DESC, Products.Price DESC

LIMIT 1 OFFSET 1