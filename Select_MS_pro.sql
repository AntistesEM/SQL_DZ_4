-- Количество исполнителей в каждом жанре.
SELECT genres.name, count(performer_id) FROM genresperformer
LEFT JOIN genres ON genresperformer.genres_id = genres.genres_id  
GROUP BY genres.name;

-- Количество треков, вошедших в альбомы 2019–2020 годов.
SELECT count(track.track_id) FROM track
LEFT JOIN album ON track.album_id = album.album_id 
WHERE album.year_of_issue IN (2019, 2020);

-- Средняя продолжительность треков по каждому альбому.
SELECT album.name, avg(duration) FROM track 
LEFT JOIN album ON track.album_id = album.album_id
GROUP BY album.album_id;

-- Все исполнители, которые не выпустили альбомы в 2020 году.
SELECT  p.name FROM performer p 
	WHERE p.name NOT IN (
		SELECT DISTINCT p.name FROM performer p 
		LEFT JOIN performeralbum pa ON p.performer_id = pa.performer_id 
		LEFT JOIN album al ON al.album_id = pa.album_id 
		WHERE al.year_of_issue = 2020
		)
	ORDER BY p.name;

-- Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
SELECT collection."name" FROM collection
JOIN collectiontrack ON collectiontrack.collectiontrack_id = collection.collection_id 
JOIN track ON collectiontrack.track_id = track.track_id 
JOIN album ON album.album_id = track.album_id 
JOIN performeralbum ON performeralbum.album_id = album.album_id 
JOIN performer ON performer.performer_id = performeralbum.performer_id 
WHERE performer."name" = 'Adam';

-- Названия альбомов, в которых присутствуют исполнители более чем одного жанра.
SELECT album."name", count(genres."name") FROM album
JOIN performeralbum ON performeralbum.album_id = album.album_id 
JOIN performer ON performer.performer_id = performeralbum.performer_id
JOIN genresperformer ON genresperformer.performer_id = performer.performer_id 
JOIN genres ON genres.genres_id = genresperformer.genres_id 
GROUP BY album."name"
HAVING count(genres."name") > 1;

-- Наименования треков, которые не входят в сборники.
SELECT name FROM track t
LEFT JOIN collectiontrack ct ON ct.track_id = t.track_id 
WHERE ct.collectiontrack_id IS NULL;

-- Исполнитель или исполнители, написавшие самый короткий по продолжительности трек, — теоретически таких треков может быть несколько.
SELECT performer."name" FROM performer  
JOIN performeralbum p ON p.performer_id = performer.performer_id 
JOIN album a ON a.album_id = p.album_id 
JOIN track t ON t.album_id = a.album_id 
WHERE t.duration = (SELECT min(duration) FROM track);

-- Названия альбомов, содержащих наименьшее количество треков.
-- Вариант 1
SELECT album."name", count(track."name") FROM album
JOIN track ON track.album_id = album.album_id 
GROUP BY album."name" 
HAVING count(DISTINCT track.name) = (SELECT COUNT(DISTINCT track.name) FROM track 
	GROUP BY track.name
	ORDER BY count(DISTINCT track.name)
	LIMIT 1);

-- Вариант 2
SELECT album."name", count(track."name") FROM album
JOIN track ON track.album_id = album.album_id 
GROUP BY album."name" 
HAVING count(track."name") = (SELECT min(count) FROM (
	SELECT album."name", count(track."name") FROM album
	JOIN track ON album.album_id = track.album_id
	GROUP BY album."name") AS foo) ;
-- Просьба объяснить, что в них происходит в HAVING, что-то не пойму никак

