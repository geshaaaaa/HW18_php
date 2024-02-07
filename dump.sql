CREATE TABLE `playlists`
(
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(255) NOT NULL,
    `vibe` CHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `deleted_at` TIMESTAMP DEFAULT NULL
);
CREATE TABLE `singers`
(
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name` CHAR(250) NOT NULL,
    `old` YEAR DEFAULT NULL,
    `gender` CHAR(50) NOT NULL
);


CREATE TABLE `songs`
(
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `song_name` CHAR(250) NOT NULL ,
    `song_type` CHAR(250) DEFAULT NULL,
    `song_year` YEAR DEFAULT NULL,
    `singer_id` INT UNSIGNED,
    FOREIGN KEY (`singer_id`) REFERENCES `singers`(`id`)
);

CREATE TABLE `playlists_songs`
(
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `song_id` INT UNSIGNED,
    `playlist_id` INT UNSIGNED,
    FOREIGN KEY  (`song_id`) REFERENCES `songs`(`id`),
    FOREIGN KEY  (`playlist_id`) REFERENCES `playlists`(`id`)
);


INSERT INTO `playlists` (name, vibe) VALUES
                                         ('Playlist for walk', 'Sad'),
                                         ('Playlist for games', 'Relax'),
                                         ('Playlist for everyday');

INSERT INTO `singers` (name, old, gender) VALUES
                                              ('Rihanna',1988,'female'),
                                              ('Travis Scott', 1991,'male'),
                                              ('Lana Del Rey',1985, 'female'),
                                              ('Aurora', 1996, 'female'),
                                              ('Black Eyed Peas','male'),
                                              ('Britney Spears',1981,'female');


INSERT INTO `songs` (song_name,song_type,song_year,singer_id) VALUES ('Diamonds', 'POP', 2012,1), ('Work','POP',2016,1);
INSERT INTO `songs` (song_name,song_year,singer_id) VALUES ('Umbrella', 2007,1);

INSERT INTO `songs` (song_name,song_type,song_year,singer_id) VALUES
                                                                  ('SICKO MODE','Rap',2018,2),
                                                                  ('HIGHEST IN THE ROOM','Rap',2019,2),
                                                                  ('goosebumps','Rap',2016,2);


INSERT INTO `songs` (song_name,song_type,song_year,singer_id) VALUES ('Summertime Sadness','Pop',2012,3);

INSERT INTO `songs` (song_name,singer_id) VALUE
    ('Young and Beautiful',3),
    ('Born to Die',3);

INSERT INTO `songs` (song_name,song_type,song_year,singer_id) VALUES
                                                                  ('Runaway','POP',2015,4), ('Gimme more','POP',2007,6);

INSERT INTO `playlists_songs` (song_id, playlist_id)  VALUES
                                                          (18,1) ,(19,1), (20,1), (21,1),(12,1);
INSERT INTO `playlists_songs` (song_id, playlist_id)  VALUES
                                                          (21,2), (12,2), (20,2), (17,2),(14,2);
INSERT INTO `playlists_songs` (song_id, playlist_id)  VALUES
                                                          (13,3),(13,3),(15,3),(16,3),(22,3);


SELECT playlists.name as playlists_name FROM playlists;

SELECT songs.song_name as songs_name, songs.song_year  as song_year FROM songs
WHERE song_year > 2010
ORDER BY song_year;

SELECT playlists_songs.playlist_id as playlist_id, playlists_songs.song_id as song_id FROM playlists_songs
WHERE playlist_id = 1;

SELECT singers.name as name, singers.old as old FROM singers;

SELECT songs.song_name as song_name, singer_id as singer_id
FROM songs
WHERE singer_id = 1;

SELECT singers.name as name, singers.old as old FROM singers WHERE old BETWEEN 1980 AND 1990;

UPDATE `singers` SET name = 'Jacques Berman Webster' WHERE name = 'Travis Scott';

DELETE FROM singers WHERE name = 'Black Eyed Peas';