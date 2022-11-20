SELECT mg.genre, COUNT(singer_id) FROM genresinger g
JOIN music_genre mg ON mg.id = g.music_genre_id  
GROUP BY genre
ORDER BY genre;

SELECT COUNT(t.name_track) FROM album a 
LEFT JOIN tracks t ON a.id = t.album
WHERE year_album IN (2019, 2020);

SELECT a.name_album, AVG(t.duration) FROM album a
JOIN tracks t ON a.id = t.album
GROUP BY a.name_album;

SELECT s.name_or_nickname FROM singer s 
JOIN singeralbum sa ON s.id = sa.singer_id
JOIN album a ON a.id = sa.album_id
WHERE year_album != 2020;

SELECT mc.name_collection FROM singer s
JOIN singeralbum sa ON s.id = sa.singer_id
JOIN album a ON a.id = sa.album_id
JOIN tracks t ON sa.album_id = t.album
JOIN collectiontracks c ON t.id = c.track_id 
JOIN music_collection mc ON c.music_collection_id = mc.id
WHERE name_or_nickname = 'Elvis Presley';

SELECT a.name_album FROM album a 
JOIN singeralbum sa ON a.id = sa.album_id
JOIN singer s ON sa.singer_id = s.id 
JOIN genresinger g ON g.singer_id = s.id 
JOIN music_genre mg ON mg.id = g.music_genre_id
GROUP BY a.name_album
HAVING COUNT(genre) > 1;

SELECT t.name_track FROM tracks t 
LEFT JOIN collectiontracks c ON t.id = c.track_id
WHERE music_collection_id IS NULL;

SELECT s.name_or_nickname FROM singer s 
JOIN singeralbum sa ON s.id = sa.singer_id
JOIN album a ON a.id = sa.album_id
JOIN tracks t ON sa.album_id = t.album
WHERE duration = (SELECT MIN(duration) FROM tracks);

SELECT a.name_album FROM album a 
JOIN tracks t ON a.id = t.album
GROUP BY a.name_album
HAVING COUNT(t.name_track) = (
SELECT COUNT(t.name_track) FROM album a 
JOIN tracks t ON a.id = t.album
GROUP BY a.name_album
ORDER BY t.count
LIMIT 1);
