/*Create Database*/
--CREATE DATABASE friends;

/*Use Database*/
--USE friends;

/*Create Tables (friends_login and friends_list)*/
--CREATE TABLE friends_login (id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, name VARCHAR(50) NOT NULL, phone VARCHAR(10) NOT NULL UNIQUE, pwd BINARY(64) NOT NULL);
--CREATE TABLE friends_list (id INT NOT NULL IDENTITY(1,1) PRIMARY KEY, fname VARCHAR(50) NOT NULL, lname VARCHAR(50) NOT NULL, phone VARCHAR(10) NOT NULL, email NVARCHAR(320) NOT NULL, userID int FOREIGN KEY REFERENCES friends_login(id));

/*Insert data into tables*/
--INSERT INTO friends_login VALUES ('Full Name', 'number', HASHBYTES('SHA2_512', 'password'));
--INSERT INTO friends_list VALUES ('Fname', 'Lname', 'number', 'email', foreign key(id) of logged in user);

/*Display Tables Data*/
--SELECT * FROM friends_login;
--SELECT * FROM friends_list;

/*Delete data from tables*/
--DELETE FROM friends_list;
--DELETE FROM friends_login;

/*Drop tables*/
--DROP TABLE friends_login;
--DROP TABLE friends_list;