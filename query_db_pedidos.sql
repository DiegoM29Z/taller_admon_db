
INSERT INTO estado (id_estado, nombre_estado) VALUES
(1, 'CA'),
(2, 'WI'),
(3, 'MI');


INSERT INTO cliente (id_cliente, nombre_cliente, estado_id_estado) VALUES
(101, 'MARTI', 1),
(107, 'HERMAN', 2),
(110, 'WE-SPORTS', 3);

INSERT INTO item (id_item, des_item, precio) VALUES
(3786, 'RED', 35.00),
(4011, 'RAQUETA', 65.00),
(9132, 'PAQ-3', 4.75),
(5794, 'PAQ-6', 5.00),
(3142, 'FUNDA', 10.00);


INSERT INTO ordenes (id_orden, fecha, cliente_id_cliente) VALUES
(2301, '2003-02-23', 101),
(2302, '2003-02-25', 107),
(2303, '2003-02-27', 110);


INSERT INTO ordenes_item (cantidad, item_id_item, ordenes_id_orden) VALUES
(3, 3786, 2301),
(6, 4011, 2301),
(8, 9132, 2301),
(4, 5794, 2302),
(2, 4011, 2303),
(2, 3142, 2303);