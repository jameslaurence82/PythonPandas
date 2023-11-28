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
    Title_DateAdded date,
    Title_Description varchar(255),
    Title_Rating_ID_fk int -- foreign key Rating.Rating_ID
)
GO
CREATE TABLE RATING ( -- creates RATING Table
    Rating_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Rating_Rating varchar(20) NULL
)
GO
CREATE TABLE CAST_ROLE ( -- creates CAST_ROLE Table
    CR_Role_ID_fk int, -- foreign key Role.Role_ID
    CR_Cast_ID_fk int, -- foreign key Cast.Cast_ID
    CR_Title_ID_fk int, -- foreign key Title.Title_ID
    CONSTRAINT CR_COMP_KEY PRIMARY KEY (CR_Role_ID_fk, CR_Cast_ID_fk, CR_Title_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE ROLE ( -- creates ROLE Table
    Role_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Role_Job varchar(50),
)
GO
INSERT INTO ROLE (Role_Job) -- Inserts role types into role table
VALUES ('Actor'),('Director')
GO
CREATE TABLE "CAST" ( -- creates CAST Table -- Cast is a built in function so has to be in quotes
    Cast_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Cast_FName varchar(50),
    Cast_LName varchar(50)
)
GO
CREATE TABLE TITLE_COUNTRY ( -- creates TITLE_COUNTRY Table
    TC_Title_ID_fk int, -- foreign key Title.Title_ID
    TC_Country_ID_fk int, -- foreign key Country.Country_ID
    CONSTRAINT TC_COMP_KEY PRIMARY KEY (TC_Title_ID_fk, TC_Country_ID_fk) -- Composite primary key constraint
)
GO
CREATE TABLE COUNTRY ( -- creates COUNTRY Table
    Country_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Country_Name varchar(255)
)
GO
CREATE TABLE TITLE_GENRE ( -- creates TITLE_GENRE Table
    TG_Genre_ID_fk int, -- foreign key Genre.Genre_ID
    TG_Title_ID_fk int -- foreign key Title.Title_ID
)
GO
CREATE TABLE GENRE ( -- creates GENRE Table
    Genre_ID int IDENTITY(1,1) PRIMARY KEY, -- Sets Primary Key with Auto Increment ID (start 1, step 1)
    Genre_Listed_In varchar(50)
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
REFERENCES RATING(Rating_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship CAST_ROLE Table
ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_CR_Role_ID FOREIGN KEY (CR_Role_ID_fk)
REFERENCES ROLE(Role_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship CAST_ROLE Table
ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_CR_Cast_ID FOREIGN KEY (CR_Cast_ID_fk)
REFERENCES CAST(Cast_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship CAST_ROLE Table
ALTER TABLE CAST_ROLE
ADD CONSTRAINT FK_CR_Title_ID FOREIGN KEY (CR_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_COUNTRY Table
ALTER TABLE TITLE_COUNTRY
ADD CONSTRAINT FK_TC_Title_ID FOREIGN KEY (TC_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_COUNTRY Table
ALTER TABLE TITLE_COUNTRY
ADD CONSTRAINT FK_TC_Country_ID FOREIGN KEY (TC_Country_ID_fk)
REFERENCES COUNTRY(Country_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Genre_ID FOREIGN KEY (TG_Genre_ID_fk)
REFERENCES GENRE(Genre_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Title_ID FOREIGN KEY (TG_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Title_ID FOREIGN KEY (TF_Title_ID_fk)
REFERENCES TITLE(Title_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Format_ID FOREIGN KEY (TF_Format_ID_fk)
REFERENCES FORMAT(Format_ID)
ON UPDATE CASCADE
ON DELETE CASCADE
GO
-- Foreign Key Relationship DURATION Table
ALTER TABLE DURATION
ADD CONSTRAINT FK_Duration_Format_ID FOREIGN KEY (Duration_Format_ID_fk)
REFERENCES FORMAT(Format_ID)
ON UPDATE CASCADE
ON DELETE CASCADE