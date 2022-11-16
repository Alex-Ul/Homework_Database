SELECT name_album, year_album FROM album
 WHERE year_album = 2018;
 
SELECT name_track, duration FROM tracks
 WHERE duration = (SELECT MAX(duration) FROM tracks);

SELECT name_track FROM tracks
 WHERE duration >= '00:03:30';
 
SELECT name_collection FROM music_collection
 WHERE year_collection BETWEEN 2018 AND 2020;
 
SELECT name_or_nickname FROM singer
 WHERE name_or_nickname NOT LIKE '% %';
 
 SELECT name_track FROM tracks
  WHERE name_track LIKE '% My %';