INSERT INTO genres (name) VALUES 
	('hip hop'),
	('jazz'),
	('blues'),
	('rock'),
	('pop');

INSERT INTO performer (name) VALUES 
	('Margaret Howard'),
	('Adam'),
	('Christopher Dunn'),
	('Lee Campbell'),
	('Sharon Kim'),
	('Jerry Kennedy'),
	('Mary Ross'),
	('Emily Hoffman');

INSERT INTO	album (name, year_of_issue) VALUES
 	('Album-1', 1980),
	('Album-2', 1985),
	('Album-3', 1987),
 	('Album-4', 2000),
	('Album-5', 2005),
	('Album-6', 2010),
 	('Album-7', 2018),
	('Album-8', 2022),
	('Album-9', 2019),
	('Album-10', 2020);
	   
INSERT INTO track (name, duration, album_id) VALUES
	('Drink For Business', 300, 1), 
	('Ride Of Hell', 180, 1),
	('Drink For My Way', 150, 1), 
	('Love Of Fire', 220, 2),
	('With Past', 210, 2), 
	('She Said', 270, 2),
	('City Of Me', 250, 3), 
	('Wish', 150, 3),
	('Her Power', 170, 3), 
	('Vibes', 350, 4),
	('Close And Beauty', 290, 4), 
	('Get It Together', 235, 4),
	('Magic And Mind', 260, 5), 
	('Come On', 195, 5),
	('I Want You', 350, 5),
	('Ministry', 255, 9),
	('Honey, I Got It', 345, 10),
	('Best And Choice', 333, 9);
	
INSERT INTO collection (name, year_of_issue) VALUES 
	('Collection-1', 1982), 
	('Collection-2', 1987), 
	('Collection-3', 1991), 
	('Collection-4', 2001), 
	('Collection-5', 2006), 
	('Collection-6', 2011), 
	('Collection-7', 2019), 
	('Collection-8', 2023);
	
INSERT INTO genresperformer (genres_id, performer_id) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 4),
	(3, 8),
	(4, 5),
	(5, 6),
	(5, 7);
	
INSERT INTO performeralbum (performer_id, album_id) VALUES 
	(1, 1),
	(2, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8);
	
INSERT INTO collectiontrack (collection_id, track_id) VALUES
	(1, 1),
	(1, 2),
	(2, 3),
	(3, 4),
	(3, 5),
	(4, 6),
	(5, 7),
	(5, 8),
	(6, 9),
	(6, 10),
	(7, 11),
	(7, 12),
	(7, 13),
	(8, 14),
	(8, 15);
	
