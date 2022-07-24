--
-- Created by SQL::Translator::Producer::PostgreSQL
-- Created on Sun Jul 24 19:46:55 2022
--
;
--
-- Table: artist
--
CREATE TABLE "artist" (
  "artistid" serial NOT NULL,
  "name" text NOT NULL,
  PRIMARY KEY ("artistid"),
  CONSTRAINT "artist_name" UNIQUE ("name")
);

;
--
-- Table: cd
--
CREATE TABLE "cd" (
  "cdid" serial NOT NULL,
  "artistid" integer NOT NULL,
  "title" text NOT NULL,
  "year" timestamp,
  PRIMARY KEY ("cdid"),
  CONSTRAINT "cd_title_artistid" UNIQUE ("title", "artistid")
);
CREATE INDEX "cd_idx_artistid" on "cd" ("artistid");

;
--
-- Table: track
--
CREATE TABLE "track" (
  "trackid" serial NOT NULL,
  "cdid" integer NOT NULL,
  "title" text NOT NULL,
  "length" integer NOT NULL,
  PRIMARY KEY ("trackid"),
  CONSTRAINT "track_title_cdid" UNIQUE ("title", "cdid")
);
CREATE INDEX "track_idx_cdid" on "track" ("cdid");

;
--
-- Foreign Key Definitions
--

;
ALTER TABLE "cd" ADD CONSTRAINT "cd_fk_artistid" FOREIGN KEY ("artistid")
  REFERENCES "artist" ("artistid") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
ALTER TABLE "track" ADD CONSTRAINT "track_fk_cdid" FOREIGN KEY ("cdid")
  REFERENCES "cd" ("cdid") ON DELETE CASCADE ON UPDATE CASCADE DEFERRABLE;

;
