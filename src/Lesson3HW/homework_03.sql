-- Task#1 Завершить описание схемы БД "соц/сеть" с помощью инструмента онлайн-проектирования
-- Link: https://dbdiagram.io/d/64d3626e02bd1c4a5e7da60b

-- Task#2 Вывести ко-во заказов от клиентов из Germany
SELECT
    COUNT(*) AS number_of_Germany_orders

FROM Orders

JOIN Customers ON Orders.CustomerID = Customers.CustomerID

WHERE
    Customers.Country = 'Germany'

-- Task#3 Вывести среднюю стоимость проданного в Germany товара
SELECT
    AVG (Products.Price*OrderDetails.Quantity) AS average_sale_price_inGermany

FROM OrderDetails

JOIN Orders ON Orders.OrderID = OrderDetails.OrderID
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Products.ProductID = OrderDetails.ProductID

WHERE
    Customers.Country = 'Germany'

-- Task#4 Вывести ко-во и сред/стоимость товаров из `USA`
SELECT
    COUNT(*) AS numbers_of_productes,
    AVG(Price) AS avg_price_for_products_from_USA

FROM Products

JOIN Suppliers ON Products.SupplierID = Products.SupplierID

WHERE
    Suppliers.Country = 'USA'

-- Task#5 Вывести стоимость и название двух самых дешевых товаров из `Germany`
SELECT Products.Price, Products.ProductName
FROM Products

JOIN Suppliers ON Products.SupplierID = Products.SupplierID

WHERE
    Suppliers.Country = 'Germany'

ORDER BY Price ASC
LIMIT 2

-- Task#6 Применить наценку в 15% ко всем товарам из категории `4`
SELECT *,
    Price*1.15 AS new_Price_15_higher

FROM Products

WHERE
    Products.CategoryID = 4

-- комментарий: Наценка — это часть стоимости продукта,
-- которая составляет разницу между конечной ценой товара и его себестоимостью.
-- Следовательно, Т.к. у нас нет себестоимости товара, задача не выполнима