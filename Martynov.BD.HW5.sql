USE base_homework5;

CREATE TABLE Cars
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(45) NOT NULL,
    Cost INT DEFAULT 0
);

INSERT INTO Cars (Name, Cost)
VALUES ('Audi', 52642), ('Mercedes', 57127), ('Skoda', 9000), ('Volvo', 29000), 
('Bentley', 350000), ('Citroen', 21000), ('Hummer', 41400), ('Volkswagen', 21600);

SELECT * FROM Cars;

CREATE VIEW view1 AS
	SELECT * FROM cars
    WHERE Cost < 25000;

ALTER VIEW view1 AS
	SELECT * FROM cars
    WHERE Cost < 30000;

SELECT * FROM view1;

CREATE VIEW view2 AS
	SELECT * FROM cars
    WHERE Name = 'Skoda' OR Name = 'Audi';

SELECT * FROM view2;

CREATE TABLE rail
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    train_id INT NOT NULL,
    station VARCHAR(20) NOT NULL,
    station_time TIME NOT NULL
);

INSERT INTO rail (train_id, station, station_time)
VALUES ('110' ,'San Francisco', '10:00:00');

INSERT INTO rail (train_id, station, station_time)
VALUES ('110' ,'Redwood City', '10:54:00'), ('110' ,'Palo Alto', '11:02:00'), 
('110' ,'San Jose', '12:35:00'), ('120' ,'San Francisko', '11:00:00'),
('120' ,'Palo Alto', '12:49:00'), ('120' ,'San Jose', '13:30:00');

SELECT * FROM rail;

SELECT
	train_id,
    station,
    station_time,
    SUBTIME (LEAD (station_time) OVER (PARTITION BY train_id ORDER BY station_time), station_time) AS time_to_next_station
FROM rail;