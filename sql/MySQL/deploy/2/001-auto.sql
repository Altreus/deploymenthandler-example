--
-- Created by SQL::Translator::Producer::MySQL
-- Created on Sun Jul 24 19:46:55 2022
--
;
SET foreign_key_checks=0;
--
-- Table: `artist`
--
CREATE TABLE `artist` (
  `artistid` integer NOT NULL auto_increment,
  `name` text NOT NULL,
  PRIMARY KEY (`artistid`),
  UNIQUE `artist_name` (`name`)
) ENGINE=InnoDB;
--
-- Table: `cd`
--
CREATE TABLE `cd` (
  `cdid` integer NOT NULL auto_increment,
  `artistid` integer NOT NULL,
  `title` text NOT NULL,
  `year` datetime NULL,
  INDEX `cd_idx_artistid` (`artistid`),
  PRIMARY KEY (`cdid`),
  UNIQUE `cd_title_artistid` (`title`, `artistid`),
  CONSTRAINT `cd_fk_artistid` FOREIGN KEY (`artistid`) REFERENCES `artist` (`artistid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
--
-- Table: `track`
--
CREATE TABLE `track` (
  `trackid` integer NOT NULL auto_increment,
  `cdid` integer NOT NULL,
  `title` text NOT NULL,
  `length` integer NOT NULL,
  INDEX `track_idx_cdid` (`cdid`),
  PRIMARY KEY (`trackid`),
  UNIQUE `track_title_cdid` (`title`, `cdid`),
  CONSTRAINT `track_fk_cdid` FOREIGN KEY (`cdid`) REFERENCES `cd` (`cdid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
SET foreign_key_checks=1;
