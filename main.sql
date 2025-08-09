-- code for table creation 

 Create Table Artist_Type(
 Type_Id Int Primary Key,
 Type_Name Varchar(25)
 );
 Create Table Language(
 Language_Id Int Primary Key,
 Language_Name Varchar(25)
 );
 Create Table Artist(
 Artist_Id Int Primary Key,
 Artist_Type Int,
 Artist_Name Varchar(25),
 State1 Varchar(25) Not Null,
 Nationality Varchar(25) Not Null,
 Gender Varchar(1) Not Null,
 Age Int Not Null,
 Foreign Key(Artist_Type) References Artist_Type(Type_Id)
 );
 Create Table Lyricist (
 Writing_Style Varchar(100),
 Artist_Id Int Primary Key,
 Foreign Key (Artist_Id) References Artist(Artist_Id)
 );
 Create Table Music_Composer (
 Artist_Id Int Primary Key,
 Music_Style Varchar(100),
Instrumentation Varchar(100),
 Foreign Key (Artist_Id) References Artist(Artist_Id)
 );
 Create Table Singer (
 Artist_Id Int Primary Key,
 Vocal_Type Varchar(100),
 Singing_Style Varchar(100),
 Foreign Key (Artist_Id) References Artist(Artist_Id)
 );
 Create Table Genre(
 Genre_Id Int Primary Key,
 Genre_Name Varchar(25) Not Null
 );
 Create Table Song (
 Song_Id Int Primary Key,
 Song_Name Varchar(25),
 Song_Language Int,
 Singer_Id Int,
 Lyricist_Id Int,
 Music_Composer_Id Int,
 Genre Int,
 Mp3_Song_Index Varchar(30),-- this will be index to original file where the actual song will be stored
 Lyrics Clob,
 Date_Of_Upload Timestamp,
 Foreign Key (Song_Language) References Language(Language_Id),
 Foreign Key (Singer_Id) References Singer(Artist_Id),
 Foreign Key (Lyricist_Id) References Lyricist(Artist_Id),
 Foreign Key (Music_Composer_Id) References Music_Composer(Artist_Id),
 Foreign Key (Genre) References Genre(Genre_Id)
 );
 Create Table User_Details(
User_Id Int Primary Key,
 User_Name Varchar(100),
 User_Selected_Language Int,
 User_Age Int Not Null,
 State Varchar(100),
 Nation Varchar(100),
 Foreign Key (User_Selected_Language) References Language(Language_Id)
 );
 Create Table Playlist (
 Playlist_Id Int Primary Key,
 Creator_Id Int,
 Playlist_Name Varchar(100),
 Foreign Key (Creator_Id) References User_Details(User_Id)
 );
 Create Table Playlist_Songs (
 Playlist_Id Int,
 Song_Id Int,
 Primary Key (Playlist_Id,Song_Id),
 Foreign Key (Playlist_Id) References Playlist(Playlist_Id),
 Foreign Key (Song_Id) References Song(Song_Id)
 );
 Create Table Liked_Song (
 User_Id Int,
 Song_Id Int,
 Primary Key (User_Id, Song_Id),
 Foreign Key (User_Id) References User_Details(User_Id),
 Foreign Key (Song_Id) References Song(Song_Id)
 );
 Create Table Liked_Playlist (
 Playlist_Id Int,
 User_Id Int ,
 Primary Key (Playlist_Id,User_Id),
Foreign Key (Playlist_Id) References Playlist(Playlist_Id),
 Foreign Key (User_Id) References User_Details(User_Id)
 );
 Create Table Played_History (
 Song_Id Int,
 User_Id Int,
 Date_And_Time Timestamp,
 Primary Key (Song_Id,User_Id,Date_And_Time),
 Foreign Key (Song_Id) References Song(Song_Id),
 Foreign Key (User_Id) References User_Details(User_Id)
 );
 Create Table Subscription_Plan (
 Subscription_Plan_Id Int Primary Key,
 Plan_Duration Int,--in months
 Plan_Type Varchar(25),
 Plan_Amount Decimal(6,2)
 );
 Create Table User_Subscription_Plan (
 User_Id Int,
 Subscription_Plan_Id Int,
 Start_Date Date ,
 Primary Key (User_Id,Subscription_Plan_Id,Start_Date),
 Foreign Key (User_Id) References User_Details(User_Id),
 Foreign Key (Subscription_Plan_Id) References Subscription_Plan
 (Subscription_Plan_Id)
 );
 Create Table Payment_History (
 Payment_Id Int,
 Paid_Amount Decimal(10, 2),
 User_Id Int,
 Payment_Date Date,
 Mode_Of_Payment Varchar(100),
 Primary Key (Payment_Id,User_Id),
Foreign Key (User_Id) References User_Details(User_Id)
 );
 Create Table Customer_Services (
 Service_Id Int,
 User_Id Int,
 Date_Of_Service Date,
 Problem Varchar(100),
 Primary Key (Service_Id,User_Id),
 Foreign Key (User_Id) References User_Details(User_Id)
 );
 Create Table Contact_Details(
 User_Id Int,
 Mob_NoNumber(10) Not Null,
 Primary Key (User_Id,Mob_No),
 Foreign Key (User_Id) References User_Details(User_Id)
 );
 Create Table Duration(
 Subscription_Plan_Id Int,
 Start_Date Date,
 End_Date Date,
 Primary Key (Subscription_Plan_Id,Start_Date),
 Foreign Key (Subscription_Plan_Id) References Subscription_Plan(
 Subscription_Plan_Id)
 );


--- DATA INSERTION Queries

--- ARTIST TYPE

 INSERT INTO ARTIST_TYPE VALUES(1,'SINGER');
 INSERT INTO ARTIST_TYPE VALUES(2,'MUSIC_COMPOSER');
 INSERT INTO ARTIST_TYPE VALUES(3,'LYRICIST');
 SELECT * FROM ARTIST_TYPE;
 DESC ARTIST_TYPE;--- GENRE
 INSERT INTO GENRE VALUES (1,'CLASSICAL MUSIC');
 INSERT INTO GENRE VALUES (2,'INDIAN FOLK');
 INSERT INTO GENRE VALUES (3,'INDIE');
 INSERT INTO GENRE VALUES (4,'ROMANTIC');
 INSERT INTO GENRE VALUES (5,'PARTY MUSIC');
 INSERT INTO GENRE VALUES (6,'WESTERN');
 INSERT INTO GENRE VALUES (7,'BOLLYWOOD');
 INSERT INTO GENRE VALUES (8,'TOLLYWOOD MUSIC');
 INSERT INTO GENRE VALUES (9,'POPULAR MUSIC');
 SELECT * FROM GENRE;
 DESC GENRE;
---- LANGUAGES
 INSERT INTO LANGUAGE VALUES (1,'ENGLISH');
 INSERT INTO LANGUAGE VALUES (2,'TELGU');
 INSERT INTO LANGUAGE VALUES (3,'HINDI');
 INSERT INTO LANGUAGE VALUES (4,'MARATHI');
 INSERT INTO LANGUAGE VALUES (5,'RAJASTHANI');
 INSERT INTO LANGUAGE VALUES (6,'PUNJABI');
 INSERT INTO LANGUAGE VALUES (7,'TAMIL');
 INSERT INTO LANGUAGE VALUES (8,'HARYANVI');
 INSERT INTO LANGUAGE VALUES (9,'URDU');
 INSERT INTO LANGUAGE VALUES (10,'BENGALI');
 SELECT * FROM LANGUAGE;
 DESC LANGUAGE;

--- ARTIST

 INSERT INTO ARTIST VALUES(1,1,'ARIJIT SINGH','WEST
 BENGAL','INDIA','M',38);
 INSERT INTO ARTIST VALUES(2,2,'ANIRUDH RAVICHANDER','TAMIL
 NADU','INDIA','M',35);
 INSERT INTO ARTIST VALUES(3,1,'DEVI SHREE PRASAD','ANDHRA
 PRADESH','INDIA','M',44);
 INSERT INTO ARTIST VALUES(4,1,'NEHA
 KAKKAR','UTTARAKHAND','INDIA','F',35);
 INSERT INTO ARTIST VALUES (5,1,'LATA MANGESHKAR','MADHYA
 PRADESH','INDIA','F',92);
 INSERT INTO ARTIST VALUES (6,3,'PRADEEP
 KUMAR','MAHARAHSTRA','INDIA','M',82);
 INSERT INTO ARTIST VALUES (7,2,'C.
 RAMCHANDRA','MAHARAHSTRA','INDIA','M',63);
INSERT INTO ARTIST VALUES (8,2,'AJAY ATUL','MAHARAHSTRA','INDIA','M',30);
 INSERT INTO ARTIST VALUES (9,2,'A.R.REHMAN','GUJRAT','INDIA','M',43);
 INSERT INTO ARTIST VALUES (10,3,'GULZAR','PUNJAB','INDIA','M',60);
 INSERT INTO ARTIST VALUES (11,3,'AMITABH
 BHATACHARYA','UP','INDIA','M',35);
 INSERT INTO ARTIST VALUES (12,1,'TAYLOR
 SWIFT','PENNSYLVANIA','US','F',34);
 INSERT INTO ARTIST VALUES (13,1,'VIKRAM','PUNJAB','PAKISTHAN','M',20);
 INSERT INTO ARTIST VALUES (14,2,'SHEKHAR','YORKSHIRE','ENGLAND','M',25);
 INSERT INTO ARTIST VALUES (15,3,'HERAMB','HAWAII','US','M',30);
 SELECT * FROM ARTIST;
 DESC ARTIST;

--- LYRICIST
 INSERT INTO LYRICIST VALUES ('ARTISTIC WRITING SONG AND POEM',6);
 INSERT INTO LYRICIST VALUES ('JAZZ AND ROCK MUSIC LYRICS',15);
 INSERT INTO LYRICIST VALUES ('FILM MUSIC LYRICS',11);
 INSERT INTO LYRICIST VALUES ('POETRY AND DEEP MEANING LYRICS',10);
 SELECT * FROM LYRICIST;
 DESC LYRICIST;

---SINGER
 INSERT INTO SINGER VALUES (1,'SOPRANO','BOLLYWOOD HINDI MUSIC AND
 CALMSONGS');
 INSERT INTO SINGER VALUES (3,'TENOR','FILM MUSIC');
 INSERT INTO SINGER VALUES (4,'CONTRALTO','BOLLYWOOD HINDI MUSIC
 ANDCALMSONGS');
 INSERT INTO SINGER VALUES (5,'SOPRANO','ALL TYPE OF MUSIC');
 INSERT INTO SINGER VALUES (13,'TENOR','LOUD AND ROCK');
 INSERT INTO SINGER VALUES (12,'CONTRALTO','SINGS INDIE SONGS...
 FAMOUSWORLDWIDE');
 SELECT * FROM SINGER;
 DESC SINGER;

---- MUSIC COMPOSER
 INSERT INTO MUSIC_COMPOSER VALUES (2,'HIGH INSTRUMENTAL AND FILM
 MUSIC','ALL');
 INSERT INTO MUSIC_COMPOSER VALUES (7,'FILM MUSIC','ALL');
 INSERT INTO MUSIC_COMPOSER VALUES (9,'FILM MUSIC , CLASSICAL AND
 MODERNMUSIC','ALL');
 INSERT INTO MUSIC_COMPOSER VALUES (8,'FILM MUSIC MARATHI AND
 OTHER LANGMUSIC','ALL');
 INSERT INTO MUSIC_COMPOSER VALUES (14,'INDIE COMPOSER','ALL');
 SELECT * FROM MUSIC_COMPOSER;
 DESC MUSIC_COMPOSER;


---- SONG
 INSERT INTO SONGVALUES(1,'AE MERE WATTAN KE LOGO',3,5,6,7,1,'1','AYE
 MERE VATANKELOGON,ZARAAANKHMEINBHARLOPAANI,JOSHAHEEDHUE
 HAIN UNKI,ZARA YAAD KAROQURBAANI',TO_TIMESTAMP('1963-01-26 12:30:45',
 'YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Song VALUES (2, 'Channa Mereya', 3, 3, 6, 7, 2, 'index2.mp3', 'Lyrics
 for Channa Mereya...', TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(3, 'Kal Ho Naa Ho', 3, 4, 11, 9, 4, 'index3.mp3', 'Lyrics
 for Kal Ho Naa Ho...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(4, 'Tere Bina', 3, 5, 10, 8, 1, 'index4.mp3', 'Lyrics for
 Tere Bina...', TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(5, 'Tera Ban Jaunga', 3, 13, 15, 14, 1, 'index5.mp3',
 'Lyrics for Tera Ban Jaunga...', TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(6, 'Jeene Laga Hoon', 3, 1, 10,8, 1 ,'index6.mp3',
 'Lyrics for Jeene Laga Hoon...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES (7, 'Raabta', 3, 4, 15, 2, 1 ,'index7.mp3', 'Lyrics for
 Raabta...', TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(8, 'Tera Hone Laga Hoon', 3, 1, 10,8, 7, 'index8.mp3',
 'Lyrics for Tera Hone Laga Hoon...', TO_TIMESTAMP('2024-02-28','YYYY-MM-DD'));
 INSERT INTO Song VALUES(9, 'Tum Se Hi', 3, 5, 11, 2, 9, 'index9.mp3', 'Lyrics for
 Tum Se Hi...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(10, 'Agar Tum Saath Ho', 3, 1, 15, 8, 1, 'index10.mp3',
 'Lyrics for Tera Ghata...', TO_TIMESTAMP('2024-02-13','YYYY-MM-DD'));
 INSERT INTO Song VALUES(11, 'Tum Mile', 3, 3, 15, 7, 2, 'index11.mp3', 'Lyrics for
 Tum Mile...', TO_TIMESTAMP('2023-02-08','YYYY-MM-DD'));
 INSERT INTO Song VALUES(12, 'Tum Jo Aaye', 3, 12, 11, 14, 3, 'index12.mp3',
 'Lyrics for Tum Jo Aaye...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(13, 'Tera Yaar Hoon Main', 3, 12, 15, 7, 4,
 'index13.mp3', 'Lyrics for Tera Yaar Hoon Main...',
 TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(14, 'Tum Se Hi', 3, 4, 11, 7, 5, 'index14.mp3', 'Lyrics
 for Tum Se Hi...', TO_TIMESTAMP('1998-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(15, 'Tera Zikr', 3, 5, 11, 14, 6, 'index15.mp3', 'Lyrics for
 Tera Zikr...', TO_TIMESTAMP('2000-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(16, 'Flowers', 1, 1, 6, 2, 1, 'index16.mp3', 'Lyrics for
 Flowers...', TO_TIMESTAMP('2002-01-30','YYYY-MM-DD'));
INSERT INTO Song VALUES(17, 'Popular', 1, 3, 15, 7, 2, 'index17.mp3', 'Lyrics for
 Popular...', TO_TIMESTAMP('2008-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(18, 'One Of The Girls', 1, 12, 15, 9, 4, 'index18.mp3',
 'Lyrics for One Of The Girls...', TO_TIMESTAMP('2010-02-02','YYYY-MM-DD'));
 INSERT INTO Song VALUES(19, 'The Nights', 1, 5, 10, 8, 5, 'index19.mp3', 'Lyrics
 for Love Like This...', TO_TIMESTAMP('2007-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(20, 'Paint The Town Red', 1, 13, 15, 9, 6,
 'index20.mp3', 'Lyrics for Paint The Town Red...',
 TO_TIMESTAMP('2006-08-18','YYYY-MM-DD'));
 INSERT INTO Song VALUES(21, 'Enchanted ', 1, 12, 11, 14, 3, 'index21.mp3', 'Lyrics
 for Enchanted...', TO_TIMESTAMP('2002-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(22, 'Kannaa Nidurinchara', 2, 1, 6, 2, 1,
 'index22.mp3', 'Telugu song1 lyrics...', TO_TIMESTAMP('2023-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(23, 'Telugusong2', 2, 3, 6, 7, 2, 'index23.mp3', 'Telugu
 song2 lyrics...', TO_TIMESTAMP('2022-12-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(24, 'Telugusong3', 2, 4, 11, 9, 4, 'index24.mp3',
 'Telugu song3 lyrics...', TO_TIMESTAMP('2020-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(25, 'Telugusong4', 2, 5, 10, 8, 5, 'index25.mp3',
 'Telugu song4 lyrics...', TO_TIMESTAMP('2022-04-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(26, 'Telugusong5', 2, 13, 15, 14, 6, 'index26.mp3',
 'Telugu song5 lyrics...', TO_TIMESTAMP('2021-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(27, 'Telugusong6', 2, 3, 15, 7, 7, 'index27.mp3', 'Telugu
 song6 lyrics...', TO_TIMESTAMP('2020-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(28, 'Rajasthani song1', 5, 1, 6, 2, 1, 'index28.mp3',
 'Rajasthani song1 lyrics...', TO_TIMESTAMP('2023-04-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(29, 'Rajasthani song2', 5, 3, 6, 7, 2, 'index29.mp3',
 'Rajasthani song2 lyrics...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(30, 'ZINGAAT', 4, 1, 6, 2, 1, 'index30.mp3', 'Marathi
 song1 lyrics...', TO_TIMESTAMP('2024-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(31, 'Tum Hi Ho', 3, 1, 6, 2, 1, 'index1.mp3', 'Lyrics for
 Tum Hi Ho...', TO_TIMESTAMP('2024-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(32, 'COCKTAIL', 3, 1, 6, 2, 1, 'index1.mp3', 'Lyrics for
 COCKTAIL...', TO_TIMESTAMP('2018-01-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(33, 'MAIN KOI AISA GEET GAAO', 3, 1, 6, 2, 1,
 'index1.mp3', 'Lyrics for MAIN KOI ...',
 TO_TIMESTAMP('1992-03-30','YYYY-MM-DD'));
INSERT INTO Song VALUES(34, 'AJAB SI', 3, 1, 6, 2, 1, 'index1.mp3', 'AJAB SI',
 TO_TIMESTAMP('2004-03-30','YYYY-MM-DD'));
 INSERT INTO Song VALUES(35, 'SATHIYA', 3, 1, 6, 2, 1, 'index1.mp3', 'Lyrics
 SATHIYA...', TO_TIMESTAMP('2006-03-30','YYYY-MM-DD'));
 SELECT * FROM SONG;
 DESC SONG;--- USER DETAILS
 INSERT INTO USER_DETAILS VALUES
 (101,'KARTIK',1,20,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (102,'SHEKHAR',5,24,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES (103,'HERAMB',2,18,'ANDRA
 PRADESH','INDIA');
 INSERT INTO USER_DETAILS VALUES (104,'TEJA',2,22,'TELANGANA','INDIA');
 INSERT INTO USER_DETAILS VALUES (105,'PRAHANT',3,35,'BIHAR','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (106,'SUYASH',4,42,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (107,'DEVENDRA',4,26,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (108,'JIGNESH',6,22,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (109,'PRATHAMESH',1,50,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (110,'GANYA',4,32,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (111,'VIGHNESH',4,29,'MAHARASHTRA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (112,'ANUBHAV',3,25,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (113,'ANIKET',3,24,'MAHARASHTRA','INDIA');
INSERT INTO USER_DETAILS VALUES (114,'TANMAY',5,16,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES (115,'GIRISH',1,33,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES (116,'KPK',1,26,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES (117,'SONI',5,25,'RAJSTHAN','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (118,'NIKESH',2,34,'TELANGANA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (119,'SAICHARAN',2,22,'TELANGANA','INDIA');
 INSERT INTO USER_DETAILS VALUES (120,'VINAY',2,24,'TELANGANA','INDIA');
 INSERT INTO USER_DETAILS VALUES (121,'DHANUSH',2,18,'ANDRA
 PRADESH','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (122,'VAISHANAVI',1,19,'KARNATAKA','INDIA');
 INSERT INTO USER_DETAILS VALUES (123,'NEHA',2,17,'BIHAR','INDIA');
 INSERT INTO USER_DETAILS VALUES (124,'KIRTI',3,28,'BIHAR','INDIA');
 INSERT INTO USER_DETAILS VALUES (125,'MONYA',2,32,'BIHAR','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (126,'SHRAVANI',4,19,'KARNATAKA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (127,'AKSHAY',3,12,'KARNATAKA','INDIA');
 INSERT INTO USER_DETAILS VALUES
 (128,'SALMAN',2,19,'KARNATAKA','INDIA');
 INSERT INTO USER_DETAILS VALUES (129,'ALEXA',1,19,'CALIFORNIA','US');
 INSERT INTO USER_DETAILS VALUES (130,'JOHN',1,29,'LOS ANJELES','US');
 INSERT INTO USER_DETAILS VALUES (131,'A B
 DEVILLIERS',1,25,'PRETORIA','SOUTH AFRICA');
 INSERT INTO USER_DETAILS VALUES
 (132,'MERRY',3,35,'LAHORE','PAKISTHAN');
 INSERT INTO USER_DETAILS VALUES (133,'John
 Smith',1,45,'TORONTO','CANADA');
 INSERT INTO USER_DETAILS VALUES (134,'Emma
 Johnson',1,25,'VANCOUVER','CANADA');
 INSERT INTO USER_DETAILS VALUES (135,'Michael
 Brown',1,19,'SYDNEY','AUSTRALIA');
 INSERT INTO USER_DETAILS VALUES (136,'Sophia
 Martin',1,20,'PARIS','FRANCE');
INSERT INTO USER_DETAILS VALUES (137,'William
 Garcia',1,50,'BERLIN','GERMANY');
 INSERT INTO USER_DETAILS VALUES (138,'Olivia
 Martinez',1,17,'MUNICH','FRANCE');
 INSERT INTO USER_DETAILS VALUES (139,'James Taylor',1,35,'LYON','FRANCE');
 INSERT INTO USER_DETAILS VALUES (140,'VISHAL',4,25,'LYON','FRANCE');
 SELECT * FROM USER_DETAILS;
 DESC USER_DETAILS;


---- played history
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (17,
 115, TO_TIMESTAMP('2024-03-15 09:23:15','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (2,
 112, TO_TIMESTAMP('2024-03-03 14:45:32','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 118, TO_TIMESTAMP('2024-03-11 18:12:50','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (22,
 128, TO_TIMESTAMP('2024-03-01 22:37:04','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (1,
 120, TO_TIMESTAMP('2024-03-25 08:59:21','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 127, TO_TIMESTAMP('2024-02-21 16:28:39','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (32,
 116, TO_TIMESTAMP('2024-02-29 11:07:55','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (1,
 106, TO_TIMESTAMP('2024-02-25 19:34:17','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (1,
 109, TO_TIMESTAMP('2024-03-10 13:49:28','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (33,
 115, TO_TIMESTAMP('2024-02-19 20:05:36','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (18,
 101, TO_TIMESTAMP('2024-02-24 09:17:42','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (22,
 116, TO_TIMESTAMP('2024-03-05 15:56:58','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (15,
 125, TO_TIMESTAMP('2024-02-28 23:28:10','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (30, 107, TO_TIMESTAMP('2024-03-12 07:33:27','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (19,
 129, TO_TIMESTAMP('2024-02-17 17:09:43','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (13,
 117, TO_TIMESTAMP('2024-03-21 10:25:51','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (19,
 123, TO_TIMESTAMP('2024-03-03 20:47:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (31,
 108, TO_TIMESTAMP('2024-02-14 12:16:19','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (19,
 112, TO_TIMESTAMP('2024-02-29 06:55:34','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 129, TO_TIMESTAMP('2024-02-17 18:23:48','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 113, TO_TIMESTAMP('2024-02-21 09:41:05','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 131, TO_TIMESTAMP('2024-02-14 21:12:17','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (2,
 111, TO_TIMESTAMP('2024-03-03 13:38:32','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (19,
 130, TO_TIMESTAMP('2024-02-19 16:57:49','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (16,
 110, TO_TIMESTAMP('2024-03-10 10:02:05','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (20, 125, TO_TIMESTAMP('2024-03-01 17:08:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (21,
 125, TO_TIMESTAMP('2024-03-06 21:08:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 121, TO_TIMESTAMP('2024-03-08 05:44:20','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (2,
 119, TO_TIMESTAMP('2024-02-25 14:51:52','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (22,
 130, TO_TIMESTAMP('2024-03-01 19:39:21','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 129, TO_TIMESTAMP('2024-03-19 09:36:48','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 129, TO_TIMESTAMP('2018-07-15 09:23:15','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (20, 127, TO_TIMESTAMP('2019-09-03 14:45:32','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (5,
 125, TO_TIMESTAMP('2020-05-11 18:12:50','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (30, 123, TO_TIMESTAMP('2022-08-01 22:37:04','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 124, TO_TIMESTAMP('2021-11-25 08:59:21','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (17,
 130, TO_TIMESTAMP('2020-03-21 16:28:39','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (30, 113, TO_TIMESTAMP('2019-02-29 11:07:55','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (22,
 131, TO_TIMESTAMP('2019-12-25 19:34:17','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (12,
 126, TO_TIMESTAMP('2023-03-10 13:49:28','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 131, TO_TIMESTAMP('2023-04-19 20:05:36','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (7,
 127, TO_TIMESTAMP('2018-06-24 09:17:42','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (17,
 129, TO_TIMESTAMP('2021-01-05 15:56:58','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (1,
 128, TO_TIMESTAMP('2019-07-28 23:28:10','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (16,
 124, TO_TIMESTAMP('2018-10-12 07:33:27','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (14, 130, TO_TIMESTAMP('2022-04-17 17:09:43','YYYY-MM-DD HH24:MI:SS'));
INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (13,
 122, TO_TIMESTAMP('2021-02-21 10:25:51','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (9,
 132, TO_TIMESTAMP('2019-03-03 20:47:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 124, TO_TIMESTAMP('2023-06-14 12:16:19','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (7,
 114, TO_TIMESTAMP('2018-12-29 06:55:34','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (15,
 116, TO_TIMESTAMP('2020-07-17 18:23:48','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (11,
 129, TO_TIMESTAMP('2019-11-21 09:41:05','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (17,
 123, TO_TIMESTAMP('2020-02-14 21:12:17','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 112, TO_TIMESTAMP('2021-08-19 16:57:49','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (22,
 128, TO_TIMESTAMP('2018-04-10 10:02:05','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (4,
 130, TO_TIMESTAMP('2019-11-01 17:08:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (18,
 126, TO_TIMESTAMP('2022-03-06 21:08:03','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (3,
 125, TO_TIMESTAMP('2018-08-10 18:40:17','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (17,
 131, TO_TIMESTAMP('2021-05-11 13:56:29','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES (19,
 118, TO_TIMESTAMP('2020-12-03 14:34:28','YYYY-MM-DD HH24:MI:SS'));
 INSERT INTO Played_History (Song_Id, User_Id, Date_And_Time) VALUES
 (10, 115, TO_TIMESTAMP('2019-08-22 05:57:40','YYYY-MM-DD HH24:MI:SS'));
 select * from Played_History;
 DESC Played_History;


------ SUBSCRIPTION PLAN
 INSERT INTO SUBSCRIPTION_PLAN VALUES(1, 12, 'SILVER', 99.99);
 INSERT INTO SUBSCRIPTION_PLAN VALUES (2, 6, 'GOLD', 149.99);
 INSERT INTO SUBSCRIPTION_PLAN VALUES (3, 3, 'PLATINUM', 199.99);
 INSERT INTO SUBSCRIPTION_PLAN VALUES (4, 1, 'BASIC', 49.99);
 INSERT INTO SUBSCRIPTION_PLAN VALUES (5, 24, 'PREMIUM', 299.99);
 select * from SUBSCRIPTION_PLAN;
 DESC SUBSCRIPTION_PLAN;---- USER SUBSCRIBED PLANS
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (101, 1,
 TO_DATE('2024-03-29','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (105, 2,
 TO_DATE('2024-03-29','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (119, 3,
 TO_DATE('2024-03-29','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (128, 3,
 TO_DATE('2022-02-23','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (111, 1,
 TO_DATE('2024-01-29','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (111, 4,
 TO_DATE('2023-12-13','YYYY-MM-DD'));
 INSERT INTO USER_SUBSCRIPTION_PLAN VALUES (112, 5,
 TO_DATE('2024-01-24','YYYY-MM-DD'));
 SELECT * FROM USER_SUBSCRIPTION_PLAN;
 DESC USER_SUBSCRIPTION_PLAN;


--playlist
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (1, 101,
 'Chill Vibes');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (2, 106,
 'Workout Jams');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (3, 123,
 'desi bollywood');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (4, 121,
 'geet');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (5, 123,
 'rock songs');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (6, 123,
 'party mood');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (7, 102,
 'all at once');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (8, 101,
 'English popular');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (9, 111,
 'indian indie');
 INSERT INTO Playlist (Playlist_id, Creator_id, Playlist_name) VALUES (10, 122,
 'poetic');
 SELECT * FROM PLAYLIST;
 DESC Playlist;


--- playlist songs
 INSERT INTO playlist_songs VALUES (1,2);INSERT INTO playlist_songs VALUES
 (8,19);
 INSERT INTO playlist_songs VALUES (1,11);INSERT INTO playlist_songs
 VALUES (8,8);
 INSERT INTO playlist_songs VALUES (1,12);INSERT INTO playlist_songs
 VALUES (8,15);
INSERT INTO playlist_songs VALUES (1,21);INSERT INTO playlist_songs
 VALUES (8,25);
 INSERT INTO playlist_songs VALUES (1,27);INSERT INTO playlist_songs
 VALUES (8,31);
 INSERT INTO playlist_songs VALUES (2,21);INSERT INTO playlist_songs
 VALUES (9,10);
 INSERT INTO playlist_songs VALUES (2,12);INSERT INTO playlist_songs
 VALUES (9,11);
 INSERT INTO playlist_songs VALUES (3,5);INSERT INTO playlist_songs VALUES
 (9,12);
 INSERT INTO playlist_songs VALUES (3,6);INSERT INTO playlist_songs VALUES
 (9,13);
 INSERT INTO playlist_songs VALUES (3,8);INSERT INTO playlist_songs VALUES
 (9,14);
 INSERT INTO playlist_songs VALUES (4,1);INSERT INTO playlist_songs VALUES
 (9,17);
 INSERT INTO playlist_songs VALUES (4,9);INSERT INTO playlist_songs VALUES
 (9,19);
 INSERT INTO playlist_songs VALUES (5,2);INSERT INTO playlist_songs VALUES
 (10,10);
 INSERT INTO playlist_songs VALUES (5,9);INSERT INTO playlist_songs VALUES
 (10,31);
 INSERT INTO playlist_songs VALUES (6,22);INSERT INTO playlist_songs
 VALUES (10,29);
 INSERT INTO playlist_songs VALUES (6,17);INSERT INTO playlist_songs
 VALUES (10,28);
 INSERT INTO playlist_songs VALUES (6,16);INSERT INTO playlist_songs
 VALUES (7,20);
 INSERT INTO playlist_songs VALUES (6,8);INSERT INTO playlist_songs VALUES
 (7,21);
 INSERT INTO playlist_songs VALUES (7,6);INSERT INTO playlist_songs VALUES
 (7,23);
 INSERT INTO playlist_songs VALUES (7,10);INSERT INTO playlist_songs
 VALUES (7,29);
 SELECT * FROM playlist_songs;
 DESC playlist_songs;


--- LIKED SONG;
 INSERT INTO liked_song (user_id, song_id) VALUES (101,1);INSERT INTO
 liked_song (user_id, song_id) VALUES (102,1);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,13);INSERT INTO
 liked_song (user_id, song_id) VALUES (102,12);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,17);INSERT INTO
 liked_song (user_id, song_id) VALUES (106,19);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,20);INSERT INTO
 liked_song (user_id, song_id) VALUES (131,16);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,3);INSERT INTO
 liked_song (user_id, song_id) VALUES (123,14);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,26);INSERT INTO
 liked_song (user_id, song_id) VALUES (115,18);
 INSERT INTO liked_song (user_id, song_id) VALUES (101,30);INSERT INTO
 liked_song (user_id, song_id) VALUES (116,19);
 INSERT INTO liked_song (user_id, song_id) VALUES (118,12);INSERT INTO
 liked_song (user_id, song_id) VALUES (121,18);
 INSERT INTO liked_song (user_id, song_id) VALUES (119,4);INSERT INTO
 liked_song (user_id, song_id) VALUES (121,1);
 INSERT INTO liked_song (user_id, song_id) VALUES (120,31);INSERT INTO
 liked_song (user_id, song_id) VALUES (110,17);
 INSERT INTO liked_song (user_id, song_id) VALUES (121,11);INSERT INTO
 liked_song (user_id, song_id) VALUES (119,12);
 INSERT INTO liked_song (user_id, song_id) VALUES (113,13);INSERT INTO
 liked_song (user_id, song_id) VALUES (117,1);
 INSERT INTO liked_song (user_id, song_id) VALUES (132, 11); INSERT INTO
 liked_song (user_id, song_id) VALUES (123, 17);
 INSERT INTO liked_song (user_id, song_id) VALUES (111, 28); INSERT INTO
 liked_song (user_id, song_id) VALUES (107, 24);
 INSERT INTO liked_song (user_id, song_id) VALUES (130, 31); INSERT INTO
 liked_song (user_id, song_id) VALUES (117, 6);
 INSERT INTO liked_song (user_id, song_id) VALUES (129, 7); INSERT INTO
 liked_song (user_id, song_id) VALUES (120, 9);
 INSERT INTO liked_song (user_id, song_id) VALUES (117, 1); INSERT INTO
 liked_song (user_id, song_id) VALUES (128, 8);
INSERT INTO liked_song (user_id, song_id) VALUES (127, 15); INSERT INTO
 liked_song (user_id, song_id) VALUES (126, 23);
 INSERT INTO liked_song (user_id, song_id) VALUES (125, 16); INSERT INTO
 liked_song (user_id, song_id) VALUES (104, 21);
 INSERT INTO liked_song (user_id, song_id) VALUES (123, 20); INSERT INTO
 liked_song (user_id, song_id) VALUES (122, 11);
 INSERT INTO liked_song (user_id, song_id) VALUES (119, 14); INSERT INTO
 liked_song (user_id, song_id) VALUES (104, 31);
 INSERT INTO liked_song (user_id, song_id) VALUES (116, 10); INSERT INTO
 liked_song (user_id, song_id) VALUES (117, 31);
 DESC liked_song;
 SELECT * FROM liked_song;

--- LIKED PLAYLIST
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (1, 102);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (2, 122);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (3, 114);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (4, 127);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (5, 102);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (6, 119);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (7, 111);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (8, 130);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (9, 105);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (10, 116);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (1, 125);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (2, 109);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (3, 118);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (4, 131);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (5, 113);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (6, 128);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (7, 120);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (8, 132);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (9, 115);
INSERT INTO liked_playlist (playlist_id, user_id) VALUES (10, 126);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (5, 114);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (9, 130);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (7, 117);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (3, 126);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (8, 119);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (10, 132);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (6, 115);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (4, 128);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (2, 120);
 INSERT INTO liked_playlist (playlist_id, user_id) VALUES (1, 132);
 DESC liked_playlist;
 SELECT * FROM liked_playlist;

----PAYMENT HISTORY
 INSERT INTO payment_history VALUES (1, 150.75, 101 ,TO_DATE('2024-03-29
 12:30:13','YYYY-MM-DD HH24:MI:SS'), 'Credit Card');
 INSERT INTO payment_history VALUES (2, 200, 131 ,TO_DATE('2022-04-20
 18:30:13','YYYY-MM-DD HH24:MI:SS'), 'Cash');
 INSERT INTO payment_history VALUES (3, 350.75, 123 ,TO_DATE('2023-02-18
 16:20:13','YYYY-MM-DD HH24:MI:SS'), 'PayPal');
 INSERT INTO payment_history VALUES (4, 400.75, 105 ,TO_DATE('2024-03-12
 2:20:33','YYYY-MM-DD HH24:MI:SS'), 'Credit Card');
 INSERT INTO payment_history VALUES (5, 150, 108 ,TO_DATE('2022-05-10
 8:32:43','YYYY-MM-DD HH24:MI:SS'), 'Bank Transfer');
 INSERT INTO payment_history VALUES (6, 300, 105 ,TO_DATE('2023-05-29
 22:15:38','YYYY-MM-DD HH24:MI:SS'), 'Mobile Wallet');
 INSERT INTO payment_history VALUES (7, 75, 108 ,TO_DATE('2024-03-29
 19:24:13','YYYY-MM-DD HH24:MI:SS'), 'PayPal');
 INSERT INTO payment_history VALUES (8, 725, 105 ,TO_DATE('2024-03-20
 12:30:13','YYYY-MM-DD HH24:MI:SS'), 'Cash');
SELECT * FROM PAYMENT_HISTORY;
 DESC PAYMENT_HISTORY;

---- CUSTOMER SERVICES
 INSERT INTO customer_services VALUES (1, 101 ,TO_DATE('2024-03-29
 12:30:13','YYYY-MM-DD HH24:MI:SS'), 'Network connectivity issue');
 INSERT INTO customer_services VALUES (2, 121 ,TO_DATE('2024-03-12
 2:20:33','YYYY-MM-DD HH24:MI:SS'), 'Data recovery request');
 INSERT INTO customer_services VALUES (3, 115 ,TO_DATE('2022-05-10
 8:32:43','YYYY-MM-DD HH24:MI:SS'), 'Software installation problem');
 INSERT INTO customer_services VALUES (4, 121 ,TO_DATE('2024-03-20
 12:30:13','YYYY-MM-DD HH24:MI:SS'), 'Data recovery request');
 INSERT INTO customer_services VALUES (5, 111 ,TO_DATE('2022-05-10
 8:32:43','YYYY-MM-DD HH24:MI:SS'), 'Password reset assistance');
 INSERT INTO customer_services VALUES (6, 105 ,TO_DATE('2024-03-29
 12:30:13','YYYY-MM-DD HH24:MI:SS'), 'Software installation problem');
 SELECT * FROM customer_services;
 desc customer_services;

--- CONTACT DETAILS
 INSERT INTO contact_details VALUES (101, 9876543210);
 INSERT INTO contact_details VALUES (101, 8872985628);
 INSERT INTO contact_details VALUES (102, 9462863284);
 INSERT INTO contact_details VALUES (103, 9767562894);
 INSERT INTO contact_details VALUES (104, 9834758757);
 INSERT INTO contact_details VALUES (104, 7876543210);
 INSERT INTO contact_details VALUES (104, 9782364870);
 INSERT INTO contact_details VALUES (105, 8543534230);
INSERT INTO contact_details VALUES (106, 8525252450);
 INSERT INTO contact_details VALUES (106, 7352525250);
 INSERT INTO contact_details VALUES (107, 9325423520);
 SELECT * FROM contact_details;
 DESC contact_details;

--- DURATION
 INSERT INTO DURATION (subscription_plan_id, start_date, end_date)
 (SELECT
 user_subscription_plan.subscription_plan_id,user_subscription_plan.start_date,a
 dd_months(user_subscription_plan.start_date, subscription_plan.plan_duration)
 AS end_date FROM (user_subscription_plan LEFT JOIN subscription_plan ON
 user_subscription_plan.subscription_plan_id=subscription_plan.subscription_pla
 n_id));
 SELECT * FROM DURATION;
 DESC DURATION;
