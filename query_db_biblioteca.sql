INSERT INTO customer (id_customer, customer_name, customer_email, customer_address) VALUES
(1, 'John Smith', 'john@email.com', '123 Main St, Boston, MA 02101'),
(2, 'Jane Doe', 'jane@email.com', '456 Oak Avenue, Portland, OR 97201'),
(3, 'Sarah Johnson', 'sarah.j@company.com', '789 Pine Street, Seattle, WA 98101');


INSERT INTO book (id_book, book_title, book_author, book_price) VALUES
(1, 'Database Design Principles', 'C.J. Date', 45.99),
(2, 'SQL Cookbook', 'Anthony Molinaro', 39.99),
(3, 'Advanced SQL Techniques', 'Joe Celko', 52.99);

INSERT INTO `order` (id_order, order_date, customer_id_customer1) VALUES
(1, '2024-01-15', 1),
(2, '2024-01-20', 1),
(3, '2024-01-18', 2),
(4, '2024-02-01', 1),
(5, '2024-02-03', 3);

INSERT INTO details_orders (quantity, book_id_book, order_id_order) VALUES
(2, 1, 1),
(1, 2, 1),
(1, 1, 2),
(1, 2, 3),
(1, 3, 4),
(3, 1, 5);