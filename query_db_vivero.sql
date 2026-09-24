INSERT INTO location (location_code, location_name) VALUES
(11, 'Kirstenbosch Gardens'),
(12, 'Karbonkelberg Mountains');

INSERT INTO soil (soil_category, soil_description) VALUES
('A', 'Sandstone'),
('B', 'Sandstone/limestone'),
('C', 'Limestone');

INSERT INTO plant (plant_code, plant_name, soil_soil_category) VALUES
(431, 'Leucadendron', 'A'),
(446, 'Protea', 'B'),
(482, 'Erica', 'C'),
(449, 'Restio', 'B');

INSERT INTO location_plant (location_location_code, plant_plant_code) VALUES
(11, 431),
(11, 446),
(11, 482),
(12, 431),
(12, 449);