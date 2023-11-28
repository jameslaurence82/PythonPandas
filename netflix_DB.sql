CREATE DATABASE netflix_DB
GO
USE netflix_DB
GO
CREATE TABLE TITLE (
    Title_ID int IDENTITY(1,1) PRIMARY KEY,
    Title_Name varchar(255),
    Title_ReleaseYear char(4),
    Title_DateAdded date,
    Title_Description varchar(255),
    Title_Rating_ID_fk int(10)
)
GO
CREATE TABLE RATING (
    Rating_ID int(10) PRIMARY KEY,
    Rating_Title_ID_fk int(10),
    Rating_Class varchar(30)
)
GO
CREATE TABLE CAST_ROLE (
    CR_Role_ID_fk int(10),
    CR_Cast_ID_fk int(10),
    CR_Title_ID_fk int(10),
    CONSTRAINT CR_COMP_KEY PRIMARY KEY (CR_Role_ID_fk, CR_Cast_ID_fk, CR_Title_ID_fk)
)
GO
CREATE TABLE ROLE (
    Role_ID int IDENTITY(1,1) PRIMARY KEY,
    Role_Job varchar(50),
)
GO
INSERT INTO ROLE (Role_Job)
VALUES ('Actor'),('Director')
GO
CREATE TABLE CAST (
    Cast_ID int IDENTITY(1,1) PRIMARY KEY,
    Cast_FName varchar(50),
    Cast_LName varchar(50)
)
GO
CREATE TABLE TITLE_COUNTRY (
    TC_Title_ID_fk int(10),
    TC_Country_ID_fk int(10),
    CONSTRAINT TC_COMP_KEY PRIMARY KEY (TC_Title_ID_fk, TC_Country_ID_fk)
)
GO
CREATE TABLE COUNTRY (
    Country_ID int IDENTITY(1,1) PRIMARY KEY,
    Country_Name varchar(255)
)
GO
CREATE TABLE TITLE_GENRE (
    TG_Genre_ID_fk int IDENTITY(1,1) PRIMARY KEY,
    TG_Title_ID_fk int(10)
)
GO
CREATE TABLE GENRE (
    Genre_ID int IDENTITY(1,1) PRIMARY KEY,
    Genre_Listed_In varchar(255)
)
GO
CREATE TABLE TITLE_FORMAT (
    TF_Title_ID_fk int(10),
    TF_Format_ID_fk int(10)
    CONSTRAINT TF_COMP_KEY PRIMARY KEY (TF_Title_ID_fk, TF_Format_ID_fk)
)
GO
CREATE TABLE FORMAT (
    Format_ID int IDENTITY(1,1) PRIMARY KEY,
    Format_Type varchar(10)
)
GO
CREATE TABLE FORMAT_DURATION (
    FD_Duration_ID_fk int(10),
    FD_Format_ID_fk int(10),
    FD_Length int(10)
    CONSTRAINT FD_COMP_KEY PRIMARY KEY (FD_Duration_ID_fk, FD_Format_ID_fk)
)
GO
CREATE TABLE DURATION (
    Duration_ID int IDENTITY(1,1) PRIMARY KEY,
    Duration_Format_ID_fk int(10),
    Duration_Duration varchar(255)
)
