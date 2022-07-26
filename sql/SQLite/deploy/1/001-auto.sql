--
-- Created by SQL::Translator::Producer::SQLite
-- Created on Sun Jul 24 19:37:27 2022
--

;
BEGIN TRANSACTION;
--
-- Table: artist
--
CREATE TABLE artist (
  artistid INTEGER PRIMARY KEY NOT NULL,
  name text NOT NULL
);
CREATE UNIQUE INDEX artist_name ON artist (name);
--
-- Table: cd
--
CREATE TABLE cd (
  cdid INTEGER PRIMARY KEY NOT NULL,
  artistid integer NOT NULL,
  title text NOT NULL,
  year datetime,
  FOREIGN KEY (artistid) REFERENCES artist(artistid) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX cd_idx_artistid ON cd (artistid);
CREATE UNIQUE INDEX cd_title_artistid ON cd (title, artistid);
--
-- Table: track
--
CREATE TABLE track (
  trackid INTEGER PRIMARY KEY NOT NULL,
  cdid integer NOT NULL,
  title text NOT NULL,
  FOREIGN KEY (cdid) REFERENCES cd(cdid) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX track_idx_cdid ON track (cdid);
CREATE UNIQUE INDEX track_title_cdid ON track (title, cdid);
COMMIT;
