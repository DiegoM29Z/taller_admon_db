INSERT INTO salutation (id_salutation, salutation_desc) VALUES
(1, 'Ms.'),
(2, 'Mr.');

INSERT INTO client (id_client, full_names, physical_adress, salutation_id_salutation) VALUES
(101, 'Janet Jones', 'First Street Plot No 4', 1),
(102, 'Robert Phil', '3rd Street 34', 2),
(103, 'Robert Phil', '5th Avenue', 2);

INSERT INTO movie (id_movie, movie_title) VALUES
(1001, 'Pirates of the Caribbean'),
(1002, 'Clash of the Titans'),
(1003, 'Forgetting Sarah Marshal'),
(1004, 'Daddy''s Little Girls');

INSERT INTO rent_movies (id_rent_movies, client_id_client, movie_id_movie) VALUES
(201, 101, 1001),
(202, 101, 1002),
(203, 102, 1003),
(204, 102, 1004),
(205, 103, 1002);