INSERT INTO `Location` (`id`, `date_created`, `date_updated`, `Country`, `Longitude`, `Latitude`, `ProviceOrState`) VALUES
(1, NOW(), NOW(), 'USA', '-122.4194', '37.7749', 'California'),
(2, NOW(), NOW(), 'Canada', '-79.3832', '43.6532', 'Ontario'),
(3, NOW(), NOW(), 'UK', '-0.1276', '51.5074', 'England'),
(4, NOW(), NOW(), 'Germany', '13.4050', '52.5200', 'Berlin'),
(5, NOW(), NOW(), 'France', '2.3522', '48.8566', 'Île-de-France'),
(6, NOW(), NOW(), 'Australia', '151.2093', '-33.8688', 'New South Wales'),
(7, NOW(), NOW(), 'Japan', '139.6917', '35.6895', 'Tokyo'),
(8, NOW(), NOW(), 'India', '77.2090', '28.6139', 'Delhi'),
(9, NOW(), NOW(), 'Brazil', '-46.6333', '-23.5505', 'São Paulo'),
(10, NOW(), NOW(), 'South Africa', '18.4241', '-33.9249', 'Western Cape');

INSERT INTO `AirportOperator` (`id`, `date_created`, `date_updated`, `Name`) VALUES
(1, NOW(), NOW(), 'Global Air Services'),
(2, NOW(), NOW(), 'Skyline Aviation'),
(3, NOW(), NOW(), 'Blue Skies Airways'),
(4, NOW(), NOW(), 'International Flight Operators'),
(5, NOW(), NOW(), 'AeroTech Solutions'),
(6, NOW(), NOW(), 'Continental Airlines'),
(7, NOW(), NOW(), 'JetStream Aviation'),
(8, NOW(), NOW(), 'Altitude Air'),
(9, NOW(), NOW(), 'TransWorld Airlines'),
(10, NOW(), NOW(), 'Nimbus Airlines');

INSERT INTO `Airport` (`Name`, `AirportCode`, `PriorityOrder`, `AirportOperatorId`, `LocationId`)
VALUES
('John F. Kennedy International Airport', 'JFK', 1, 1, 1),
('Los Angeles International Airport', 'LAX', 2, 2, 2),
('Chicago O\Hare International Airport', 'ORD', 3, 3, 3),
('San Francisco International Airport', 'SFO', 4, 4, 4),
('Hartsfield-Jackson Atlanta International Airport', 'ATL', 5, 5, 5),
('Denver International Airport', 'DEN', 6, 6, 6),
('Dallas/Fort Worth International Airport', 'DFW', 7, 7, 7),
('Miami International Airport', 'MIA', 8, 8, 8),
('Phoenix Sky Harbor International Airport', 'PHX', 9, 9, 9),
('Orlando International Airport', 'MCO', 10, 10, 10);
