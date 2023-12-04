-- Author: James Laurence
-- Date: November 28th, 2023
-- DBAS3018 - Assignment 6 Netflix Database

CREATE DATABASE netflix_DB -- create database
GO
USE netflix_DB -- use database
GO
CREATE TABLE TITLE ( -- creates Title Table
    Title_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Title_Name varchar(255),
    Title_ReleaseYear char(4),
    Title_DateAdded date NULL,
    Title_Description varchar(255),
    Title_Rating_ID_fk int -- foreign key Rating.Rating_ID
)
GO
CREATE TABLE RATING ( -- creates RATING Table
    Rating_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Rating_Rating varchar(20) NULL
)
GO
CREATE TABLE ACTOR_TITLE ( -- creates ACTOR_TITLE Table
    AT_Title_ID_fk int, -- foreign key Title.Title_ID
	AT_Actor_ID_fk int, -- foreign key Title.Title_ID
    CONSTRAINT AT_COMP_KEY PRIMARY KEY (AT_Actor_ID_fk, AT_Title_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE ACTOR ( -- creates Actor Table -- Cast is a built in function so has to be in quotes
    Actor_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Actor_FName varchar(50) NULL,
    Actor_LName varchar(50) NULL
)
GO
CREATE TABLE DIRECTOR_TITLE ( -- creates DIRECTOR_TITLE Table
    DT_Title_ID_fk int, -- foreign key Title.Title_ID
	DT_Director_ID_fk int, -- foreign key Director.Director_ID
    CONSTRAINT DT_COMP_KEY PRIMARY KEY (DT_Title_ID_fk, DT_Director_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE DIRECTOR ( -- creates Actor Table -- Cast is a built in function so has to be in quotes
    Director_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Director_FName varchar(50) NULL,
    Director_LName varchar(50) NULL
)
GO
CREATE TABLE COUNTRY_TITLE ( -- creates COUNTRY_TITLE Table
    CT_Title_ID_fk int, -- foreign key Title.Title_ID
    CT_Country_ID_fk int, -- foreign key Country.Country_ID
    CONSTRAINT CT_COMP_KEY PRIMARY KEY (CT_Title_ID_fk, CT_Country_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE COUNTRY ( -- creates COUNTRY Table
    Country_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Country_Name varchar(255) NULL
)
GO
CREATE TABLE TITLE_GENRE ( -- creates TITLE_GENRE Table
    TG_Genre_ID_fk int, -- foreign key Genre.Genre_ID
    TG_Title_ID_fk int -- foreign key Title.Title_ID
)
GO
CREATE TABLE GENRE ( -- creates GENRE Table
    Genre_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Genre_ListedIn varchar(50)
)
GO
CREATE TABLE TITLE_FORMAT ( -- creates TITLE_FORMAT Table
    TF_Title_ID_fk int,  -- foreign key Title.Title_ID
    TF_Format_ID_fk int  -- foreign key Format.Format_ID
    CONSTRAINT TF_COMP_KEY PRIMARY KEY (TF_Title_ID_fk, TF_Format_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE FORMAT ( -- creates FORMAT Table
    Format_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Format_Type varchar(10)
)
GO
CREATE TABLE DURATION ( -- creates DURATION Table
    Duration_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Duration_Format_ID_fk int,  -- foreign key Format.Format_ID
    Duration_Duration varchar(30)
)
GO
-- Foreign Key Relationship TITLE Table
ALTER TABLE TITLE
ADD CONSTRAINT FK_Title_Rating_ID FOREIGN KEY (Title_Rating_ID_fk)
REFERENCES RATING(Rating_ID) -- References the RATING Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship DIRECTOR_TITLE Table
ALTER TABLE DIRECTOR_TITLE
ADD CONSTRAINT FK_DT_Director_ID FOREIGN KEY (DT_Director_ID_fk)
REFERENCES DIRECTOR(Director_ID) -- References the DIRECTOR Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship DIRECTOR_TITLE Table
ALTER TABLE DIRECTOR_TITLE
ADD CONSTRAINT FK_DT_Title_ID FOREIGN KEY (DT_Title_ID_fk)
REFERENCES TITLE(Title_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship ACTOR_TITLE Table
ALTER TABLE ACTOR_TITLE
ADD CONSTRAINT FK_AT_Title_ID FOREIGN KEY (AT_Title_ID_fk)
REFERENCES TITLE(Title_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship ACTOR_TITLE Table
ALTER TABLE ACTOR_TITLE
ADD CONSTRAINT FK_AT_Actor_ID FOREIGN KEY (AT_Actor_ID_fk)
REFERENCES ACTOR(Actor_ID) -- References the Actor Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Genre_ID FOREIGN KEY (TG_Genre_ID_fk)
REFERENCES GENRE(Genre_ID) -- References the GENRE Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Title_ID FOREIGN KEY (TG_Title_ID_fk)
REFERENCES TITLE(Title_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Title_ID FOREIGN KEY (TF_Title_ID_fk)
REFERENCES TITLE(Title_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Format_ID FOREIGN KEY (TF_Format_ID_fk)
REFERENCES FORMAT(Format_ID) -- References the FORMAT Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship DURATION Table
ALTER TABLE DURATION
ADD CONSTRAINT FK_Duration_Format_ID FOREIGN KEY (Duration_Format_ID_fk)
REFERENCES FORMAT(Format_ID) -- References the FORMAT Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship COUNTRY_TITLE Table
ALTER TABLE COUNTRY_TITLE
ADD CONSTRAINT FK_CT_Title_ID FOREIGN KEY (CT_Title_ID_fk)
REFERENCES TITLE(Title_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship COUNTRY_TITLE Table
ALTER TABLE COUNTRY_TITLE
ADD CONSTRAINT FK_CT_Country_Title_ID FOREIGN KEY (CT_Country_ID_fk)
REFERENCES COUNTRY(Country_ID) -- References the Title Table
ON UPDATE CASCADE
ON DELETE CASCADE
