INSERT INTO customer (id_customer, customer_name) VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Alice Brown');

INSERT INTO product (id_product, desc_product) VALUES
(1, 'Laptop'),
(2, 'Mouse'),
(3, 'Tablet'),
(4, 'Keyboard'),
(5, 'Monitor'),
(6, 'Pen');

INSERT INTO purchase (customer_id_customer, product_id_product) VALUES
(101, 1),
(101, 2),
(102, 3),
(103, 4),
(103, 5),
(103, 6);