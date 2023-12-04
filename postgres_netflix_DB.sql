-- Author: James Laurence
-- Date: November 28th, 2023
-- DBAS3018 - Assignment 6 Netflix Database

CREATE DATABASE netflix_DB; -- create database

\c netflix_DB; -- use database

CREATE TABLE TITLE ( -- creates Title Table
    Title_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Title_Name VARCHAR(255),
    Title_ReleaseYear CHAR(4),
    Title_DateAdded DATE,
    Title_Description VARCHAR(255),
    Title_Rating_ID_fk INT, -- foreign key Rating.Rating_ID
    CONSTRAINT FK_Title_Rating_ID FOREIGN KEY (Title_Rating_ID_fk)
        REFERENCES RATING(Rating_ID) -- References the RATING Table
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE RATING ( -- creates RATING Table
    Rating_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Rating_Rating VARCHAR(20)
);

CREATE TABLE ACTOR_TITLE ( -- creates ACTOR_TITLE Table
    AT_Title_ID_fk INT, -- foreign key Title.Title_ID
    AT_Actor_ID_fk INT, -- foreign key Title.Title_ID
    CONSTRAINT AT_COMP_KEY PRIMARY KEY (AT_Actor_ID_fk, AT_Title_ID_fk) -- Composite primary key constraint
);

CREATE TABLE ACTOR ( -- creates Actor Table
    Actor_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Actor_FName VARCHAR(50),
    Actor_LName VARCHAR(50)
);

CREATE TABLE DIRECTOR_TITLE ( -- creates DIRECTOR_TITLE Table
    DT_Title_ID_fk INT, -- foreign key Title.Title_ID
    DT_Director_ID_fk INT, -- foreign key Director.Director_ID
    CONSTRAINT DT_COMP_KEY PRIMARY KEY (DT_Title_ID_fk, DT_Director_ID_fk) -- Composite primary key constraint
);

CREATE TABLE DIRECTOR ( -- creates Actor Table
    Director_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Director_FName VARCHAR(50),
    Director_LName VARCHAR(50)
);

CREATE TABLE COUNTRY_TITLE ( -- creates COUNTRY_TITLE Table
    CT_Title_ID_fk INT, -- foreign key Title.Title_ID
    CT_Country_ID_fk INT, -- foreign key Country.Country_ID
    CONSTRAINT CT_COMP_KEY PRIMARY KEY (CT_Title_ID_fk, CT_Country_ID_fk) -- Composite primary key constraint
);

CREATE TABLE COUNTRY ( -- creates COUNTRY Table
    Country_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Country_Name VARCHAR(255)
);

CREATE TABLE TITLE_GENRE ( -- creates TITLE_GENRE Table
    TG_Genre_ID_fk INT, -- foreign key Genre.Genre_ID
    TG_Title_ID_fk INT -- foreign key Title.Title_ID
);

CREATE TABLE GENRE ( -- creates GENRE Table
    Genre_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Genre_ListedIn VARCHAR(50)
);

CREATE TABLE TITLE_FORMAT ( -- creates TITLE_FORMAT Table
    TF_Title_ID_fk INT,  -- foreign key Title.Title_ID
    TF_Format_ID_fk INT,  -- foreign key Format.Format_ID
    CONSTRAINT TF_COMP_KEY PRIMARY KEY (TF_Title_ID_fk, TF_Format_ID_fk) -- Composite primary key constraint
);

CREATE TABLE FORMAT ( -- creates FORMAT Table
    Format_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Format_Type VARCHAR(10)
);

CREATE TABLE DURATION ( -- creates DURATION Table
    Duration_ID SERIAL PRIMARY KEY, -- Sets Primary Key with Auto Increment ID
    Duration_Format_ID_fk INT,  -- foreign key Format.Format_ID
    Duration_Duration VARCHAR(30)
);

-- Foreign Key Relationship DIRECTOR_TITLE Table
ALTER TABLE DIRECTOR_TITLE
ADD CONSTRAINT FK_DT_Director_ID FOREIGN KEY (DT_Director_ID_fk)
    REFERENCES DIRECTOR(Director_ID) -- References the DIRECTOR Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship DIRECTOR_TITLE Table
ALTER TABLE DIRECTOR_TITLE
ADD CONSTRAINT FK_DT_Title_ID FOREIGN KEY (DT_Title_ID_fk)
    REFERENCES TITLE(Title_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship ACTOR_TITLE Table
ALTER TABLE ACTOR_TITLE
ADD CONSTRAINT FK_AT_Title_ID FOREIGN KEY (AT_Title_ID_fk)
    REFERENCES TITLE(Title_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship ACTOR_TITLE Table
ALTER TABLE ACTOR_TITLE
ADD CONSTRAINT FK_AT_Actor_ID FOREIGN KEY (AT_Actor_ID_fk)
    REFERENCES ACTOR(Actor_ID) -- References the Actor Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Genre_ID FOREIGN KEY (TG_Genre_ID_fk)
    REFERENCES GENRE(Genre_ID) -- References the GENRE Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship TITLE_GENRE Table
ALTER TABLE TITLE_GENRE
ADD CONSTRAINT FK_TG_Title_ID FOREIGN KEY (TG_Title_ID_fk)
    REFERENCES TITLE(Title_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Title_ID FOREIGN KEY (TF_Title_ID_fk)
    REFERENCES TITLE(Title_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship TITLE_FORMAT Table
ALTER TABLE TITLE_FORMAT
ADD CONSTRAINT FK_TF_Format_ID FOREIGN KEY (TF_Format_ID_fk)
    REFERENCES FORMAT(Format_ID) -- References the FORMAT Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship DURATION Table
ALTER TABLE DURATION
ADD CONSTRAINT FK_Duration_Format_ID FOREIGN KEY (Duration_Format_ID_fk)
    REFERENCES FORMAT(Format_ID) -- References the FORMAT Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship COUNTRY_TITLE Table
ALTER TABLE COUNTRY_TITLE
ADD CONSTRAINT FK_CT_Title_ID FOREIGN KEY (CT_Title_ID_fk)
    REFERENCES TITLE(Title_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;

-- Foreign Key Relationship COUNTRY_TITLE Table
ALTER TABLE COUNTRY_TITLE
ADD CONSTRAINT FK_CT_Country_Title_ID FOREIGN KEY (CT_Country_ID_fk)
    REFERENCES COUNTRY(Country_ID) -- References the Title Table
    ON UPDATE CASCADE
    ON DELETE CASCADE;
