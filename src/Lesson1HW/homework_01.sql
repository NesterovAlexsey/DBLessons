-- Task 2: Вывести название и стоимость товаров от 20 EUR
SELECT ProductName, Price
FROM [Products]
WHERE
    Price >= 20

-- Task 3: Вывести страны поставщиков
SELECT DISTINCT Country
FROM [Suppliers]

-- Task 4: В упорядоченном по стоимости виде вывести название и стоимость товаров со скидкой в 9% от всех поставщиков,
-- кроме поставщика 1.
SELECT ProductName,
       Price * .91 AS Price_down
FROM Products
WHERE NOT SupplierID = 1
ORDER BY Price

-- Task 5: Вывести контактные имена клиентов, кроме тех, что из France и USA.
SELECT ContactName
FROM [Customers]
WHERE Country NOT IN ('France', 'USA')