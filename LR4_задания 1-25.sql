-- 1 Все столбцы из products
SELECT * FROM products;

-- 2 Только имя, фамилия, email из customers
SELECT first_name, last_name, email FROM customers;

-- 3 Товары дороже 1000
SELECT * FROM products WHERE price > 1000;

-- 4 Клиенты из Москвы или Санкт-Петербурга
SELECT * FROM customers WHERE city IN ('Москва', 'Санкт-Петербург');

-- 5 Товары с остатком от 10 до 50
SELECT * FROM products WHERE stock BETWEEN 10 AND 50;

-- 6 Клиенты без телефона
SELECT * FROM customers WHERE phone IS NULL;

-- 7 Фамилия начинается на «И»
SELECT * FROM customers WHERE last_name LIKE 'И%';

-- 8 Уникальные города
SELECT DISTINCT city FROM customers;



-- 9 Товары по цене (убывание)
SELECT * FROM products ORDER BY price DESC;

-- 10 5 самых дорогих товаров
SELECT * FROM products ORDER BY price DESC LIMIT 5;

-- 11 10 последних зарегистрированных клиентов
SELECT * FROM customers ORDER BY registered_at DESC LIMIT 10;



-- 12 Общее количество клиентов
SELECT COUNT(*) AS total_customers FROM customers;

-- 13 Средняя цена товара
SELECT AVG(price) AS avg_price FROM products;

-- 14 Минимальный и максимальный остаток
SELECT MIN(stock) AS min_stock, MAX(stock) AS max_stock FROM products;

-- 15 Количество оплаченных заказов
SELECT COUNT(*) AS paid_orders FROM orders WHERE status = 'paid';



-- 16 Количество товаров в каждой категории
SELECT category_id, COUNT(*) AS product_count FROM products GROUP BY category_id;

-- 17 Средняя цена по категориям
SELECT category_id, AVG(price) AS avg_price FROM products GROUP BY category_id;

-- 18 Клиенты с более чем 3 заказами
SELECT c.id, c.first_name, c.last_name, COUNT(o.id) AS order_count 
FROM customers c 
LEFT JOIN orders o ON c.id = o.customer_id 
GROUP BY c.id 
HAVING COUNT(o.id) > 3;

-- 19 Категории с более чем 10 товарами
SELECT category_id, COUNT(*) AS cnt FROM products GROUP BY category_id HAVING cnt > 10;

-- 20 Общая сумма каждого заказа
SELECT order_id, SUM(quantity * unit_price) AS total_sum 
FROM order_items GROUP BY order_id;



-- 21 Товары с названием категории (INNER JOIN)
SELECT p.name, c.name AS category_name 
FROM products p JOIN categories c ON p.category_id = c.id;

-- 22 Все клиенты и их заказы (LEFT JOIN)
SELECT c.first_name, c.last_name, o.id AS order_id 
FROM customers c LEFT JOIN orders o ON c.id = o.customer_id;

-- 23 Товары, которые ни разу не покупали
SELECT p.* FROM products p 
LEFT JOIN order_items oi ON p.id = oi.product_id 
WHERE oi.id IS NULL;

-- 24 Позиции заказов с товаром и клиентом (3 таблицы)
SELECT c.first_name, p.name AS product, oi.quantity 
FROM order_items oi
JOIN orders o ON oi.order_id = o.id
JOIN customers c ON o.customer_id = c.id
JOIN products p ON oi.product_id = p.id;

-- 25 Категории и общее количество проданных товаров
SELECT c.name AS category, SUM(oi.quantity) AS total_sold 
FROM categories c
JOIN products p ON c.id = p.category_id
JOIN order_items oi ON p.id = oi.product_id
GROUP BY c.id;



