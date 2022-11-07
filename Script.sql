CREATE TABLE IF NOT EXISTS Music_genre (
	id SERIAL PRIMARY KEY,
	genre VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name_or_nickname VARCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS GenreSinger (
	music_genre_id INTEGER REFERENCES Music_genre(id),
	singer_id INTEGER REFERENCES Singer(id),
	CONSTRAINT pk PRIMARY KEY (music_genre_id, singer_id)
);

CREATE TABLE IF NOT EXISTS Album (
	id SERIAL PRIMARY KEY,
	name_album VARCHAR NOT NULL,
	year_album INTEGER
);

CREATE TABLE IF NOT EXISTS SingerAlbum (
	singer_id INTEGER REFERENCES Singer(id),
	album_id INTEGER REFERENCES Album(id),
	CONSTRAINT sa PRIMARY KEY (singer_id, album_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
	id SERIAL PRIMARY KEY,
	name_track VARCHAR NOT NULL,
	duration TIME NOT NULL,
	album INTEGER REFERENCES Album(id)
	);
	
CREATE TABLE IF NOT EXISTS Music_Collection (
	id SERIAL PRIMARY KEY,
	name_collection VARCHAR NOT NULL,
	year_collection INTEGER
);

CREATE TABLE IF NOT EXISTS CollectionTracks (
	music_collection_id INTEGER REFERENCES Music_Collection(id),
	track_id INTEGER REFERENCES Tracks(id),
	CONSTRAINT ct PRIMARY KEY (music_collection_id, track_id) 
);