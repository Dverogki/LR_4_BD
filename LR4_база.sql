DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS categories;


CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2),
    stock INT,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50),
    birth_date DATE,
    registered_at DATETIME
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


INSERT INTO categories (id, name) VALUES
(1, 'Электроника'), (2, 'Одежда'), (3, 'Книги'), (4, 'Дом и кухня'),
(5, 'Спорт'), (6, 'Красота'), (7, 'Игрушки'), (8, 'Продукты');

INSERT INTO products (id, name, price, stock, category_id) VALUES
(1, 'Беспроводная мышь', 25.99, 150, 1),
(2, 'Хлопковая футболка', 19.50, 300, 2),
(3, 'Руководство по Python', 45.00, 50, 3),
(4, 'Стальной чайник', 32.75, 80, 4),
(5, 'Коврик для йоги', 28.00, 120, 5),
(6, 'Увлажняющий крем', 15.25, 200, 6),
(7, 'Набор конструктора', 22.99, 90, 7),
(8, 'Кофейные зёрна', 12.50, 250, 8);

INSERT INTO customers (id, first_name, last_name, email, phone, city, birth_date, registered_at) VALUES
(1, 'Иван', 'Петров', 'ivan.petrov@mail.com', '+79161234567', 'Москва', '1990-05-15', '2023-01-10 10:30:00'),
(2, 'Мария', 'Сидорова', 'maria.s@mail.ru', '+79169876543', 'Санкт-Петербург', '1985-11-20', '2023-02-15 14:20:00'),
(3, 'Алексей', 'Иванов', 'alex.i@gmail.com', '+79165551122', 'Новосибирск', '1992-03-08', '2023-03-01 09:15:00'),
(4, 'Елена', 'Кузнецова', 'e.kuz@yandex.ru', '+79163334455', 'Казань', '1988-07-22', '2023-04-12 16:45:00'),
(5, 'Дмитрий', 'Смирнов', 'd.smirnov@mail.com', '+79167778899', 'Екатеринбург', '1995-01-30', '2023-05-05 11:00:00'),
(6, 'Анна', 'Волкова', 'anna.volkova@mail.ru', '+79162223344', 'Краснодар', '1991-09-14', '2023-06-18 13:30:00'),
(7, 'Сергей', 'Попов', 's.popov@gmail.com', '+79166665544', 'Самара', '1987-12-03', '2023-07-22 15:10:00'),
(8, 'Ольга', 'Новикова', 'o.novikova@yandex.ru', '+79161112233', 'Владивосток', '1993-04-17', '2023-08-30 10:05:00');

INSERT INTO orders (id, customer_id, order_date, status) VALUES
(1, 1, '2023-09-01 10:00:00', 'completed'),
(2, 2, '2023-09-02 11:30:00', 'shipped'),
(3, 3, '2023-09-03 14:00:00', 'pending'),
(4, 4, '2023-09-04 09:15:00', 'completed'),
(5, 5, '2023-09-05 16:45:00', 'cancelled'),
(6, 6, '2023-09-06 12:20:00', 'shipped'),
(7, 7, '2023-09-07 10:50:00', 'pending'),
(8, 8, '2023-09-08 15:30:00', 'completed');

INSERT INTO order_items (id, order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 2, 25.99),
(2, 1, 3, 1, 45.00),
(3, 2, 2, 3, 19.50),
(4, 3, 5, 1, 28.00),
(5, 4, 4, 2, 32.75),
(6, 5, 6, 1, 15.25),
(7, 6, 7, 4, 22.99),
(8, 8, 8, 5, 12.50);

