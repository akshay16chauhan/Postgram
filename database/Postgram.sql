create database if not exists Postgram;
use Postgram;

create table if not exists User (
    UserID INT PRIMARY KEY,
    Email VARCHAR(50) UNIQUE NOT NULL,
    Address_street VARCHAR(100) NOT NULL, -- address is a composite attribute having street, city, state & pincode
	Address_city VARCHAR(50) NOT NULL,
	Address_state VARCHAR(50) NOT NULL,
    Pincode INT NOT NULL,
    Mobile VARCHAR(20) UNIQUE 
);



create table if not exists Login (
    Login_id INT PRIMARY KEY,
    Login_username VARCHAR(10) UNIQUE NOT NULL,
    Login_password VARCHAR(20) NOT NULL,
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


create table if not exists User_Profile (
    UserProfileID INT PRIMARY KEY,
    UserID INT UNIQUE,
    Username VARCHAR(20) UNIQUE NOT NULL,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(20),
    DOB DATE,
    Age INT,
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);



create table if not exists User_Post (
    Post_id INT PRIMARY KEY,
    UserProfileID INT,
    Caption VARCHAR(50),
    Created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Modified_timestamp TIMESTAMP NULL,
    Image VARCHAR(20),
    Video VARCHAR(20),
    FOREIGN KEY (UserProfileID) REFERENCES User_Profile(UserProfileID)
);



create table if not exists Friendship (
    UserProfileID1 INT,
    UserProfileID2 INT,
    PRIMARY KEY (UserProfileID1, UserProfileID2),
    FOREIGN KEY (UserProfileID1) REFERENCES User_Profile(UserProfileID),
    FOREIGN KEY (UserProfileID2) REFERENCES User_Profile(UserProfileID)
);



create table if not exists Post_Like (
    Post_Like_ID INT PRIMARY KEY,
    Post_id INT,
    UserProfileID INT,
    Time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Post_id) REFERENCES User_Post(Post_id),
    FOREIGN KEY (UserProfileID) REFERENCES User_Profile(UserProfileID)
);



create table if not exists Post_Comment (
    Post_Comment_ID INT PRIMARY KEY,
    Post_id INT,
    UserProfileID INT,
    Text_commented varchar(150),
    Time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (Post_id) REFERENCES User_Post(Post_id),
    FOREIGN KEY (UserProfileID) REFERENCES User_Profile(UserProfileID)
);



create table if not exists Story (
    Story_ID INT PRIMARY KEY,
    UserProfileID INT,
    Upload_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Likes INT DEFAULT 0,
    Shares INT DEFAULT 0,
    Comments INT DEFAULT 0,
    FOREIGN KEY (UserProfileID) REFERENCES User_Profile(UserProfileID)
);

