-- Author: James Laurence
-- Date: November 28th, 2023
-- DBAS3018 - Assignment 6 Netflix Database

CREATE DATABASE netflix_DB; -- create database
\c netflix_DB; -- use database

CREATE TABLE TITLE ( -- creates Title Table
    Title_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Title_Name varchar(255),
    Title_ReleaseYear char(4),
    Title_DateAdded date,
    Title_Description varchar(255),
    Title_Rating_ID_fk int -- foreign key Rating.Rating_ID
);

CREATE TABLE RATING ( -- creates RATING Table
    Rating_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Rating_Class varchar(30)
);

CREATE TABLE CAST_ROLE ( -- creates CAST_ROLE Table
    CR_Role_ID_fk int, -- foreign key Role.Role_ID
    CR_Cast_ID_fk int, -- foreign key "CAST".Cast_ID
    CR_Title_ID_fk int, -- foreign key TITLE.Title_ID
    CONSTRAINT CR_COMP_KEY PRIMARY KEY (CR_Role_ID_fk, CR_Cast_ID_fk, CR_Title_ID_fk) -- Composite primary key constraint
);

CREATE TABLE ROLE ( -- creates ROLE Table
    Role_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Role_Job varchar(50)
);

INSERT INTO ROLE (Role_Job) -- Inserts role types into role table
VALUES ('Actor'),('Director');

CREATE TABLE "CAST" ( -- creates CAST Table
    Cast_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Cast_FName varchar(50),
    Cast_LName varchar(50)
);

CREATE TABLE TITLE_COUNTRY ( -- creates TITLE_COUNTRY Table
    TC_Title_ID_fk int, -- foreign key TITLE.Title_ID
    TC_Country_ID_fk int, -- foreign key COUNTRY.Country_ID
    CONSTRAINT TC_COMP_KEY PRIMARY KEY (TC_Title_ID_fk, TC_Country_ID_fk) -- Composite primary key constraint
);

CREATE TABLE COUNTRY ( -- creates COUNTRY Table
    Country_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Country_Name varchar(255)
);

CREATE TABLE TITLE_GENRE ( -- creates TITLE_GENRE Table
    TG_Genre_ID_fk int, -- foreign key GENRE.Genre_ID
    TG_Title_ID_fk int -- foreign key TITLE.Title_ID
);

CREATE TABLE GENRE ( -- creates GENRE Table
    Genre_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Genre_Listed_In varchar(255)
);

CREATE TABLE TITLE_FORMAT ( -- creates TITLE_FORMAT Table
    TF_Title_ID_fk int,  -- foreign key TITLE.Title_ID
    TF_Format_ID_fk int,  -- foreign key FORMAT.Format_ID
    CONSTRAINT TF_COMP_KEY PRIMARY KEY (TF_Title_ID_fk, TF_Format_ID_fk) -- Composite primary key constraint
);

CREATE TABLE FORMAT ( -- creates FORMAT Table
    Format_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Format_Type varchar(10)
);

CREATE TABLE DURATION ( -- creates DURATION Table
    Duration_ID serial PRIMARY KEY, -- Sets Serial (Auto Increment ID)
    Duration_Format_ID_fk int,  -- foreign key FORMAT.Format_ID
    Duration_Duration varchar(255)
);

-- Foreign Key Relationships

ALTER TABLE TITLE
ADD CONSTRAINT FK_Rating_ID FOREIGN KEY (Title_Rating_ID_fk)
REFERENCES RATING(Rating_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_Role_ID FOREIGN KEY (CR_Role_ID_fk)
REFERENCES ROLE(Role_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_Cast_ID FOREIGN KEY (CR_Cast_ID_fk)
REFERENCES "CAST"(Cast_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_Title_ID FOREIGN KEY (CR_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_COUNTRY
ADD CONSTRAINT FK_Title_ID FOREIGN KEY (TC_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_COUNTRY
ADD CONSTRAINT FK_Country_ID FOREIGN KEY (TC_Country_ID_fk)
REFERENCES COUNTRY(Country_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_Genre_ID FOREIGN KEY (TG_Genre_ID_fk)
REFERENCES GENRE(Genre_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_Title_ID FOREIGN KEY (TG_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_Title_ID FOREIGN KEY (TF_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_Format_ID FOREIGN KEY (TF_Format_ID_fk)
REFERENCES FORMAT(Format_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;

ALTER TABLE DURATION
ADD CONSTRAINT FK_Format_ID FOREIGN KEY (Duration_Format_ID_fk)
REFERENCES FORMAT(Format_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;
