CREATE SCHEMA smog;

USE smog;

CREATE USER 'jsp_admin'@'%' IDENTIFIED BY 'jsp_admin';

GRANT ALL PRIVILEGES ON smog.* TO 'jsp_admin'@'%';

SHOW GRANTS FOR jsp_admin;

--------------------------------------------------------
--  파일이 생성됨 - 월요일-10월-21-2019
--------------------------------------------------------
--------------------------------------------------------
--  파일이 수정됨 - 수요일-10월-23-2019   (for MySQL)
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ATTACHS
--------------------------------------------------------

  CREATE TABLE ATTACHS
   (	UUID VARCHAR(100) NOT NULL,
	UPLOADPATH VARCHAR(200),
	FILENAME VARCHAR(100) NOT NULL,
	FILETYPE CHAR(1) DEFAULT 'I',
	BNO INT
   );
--------------------------------------------------------
--  DDL for Table BOARDS
--------------------------------------------------------

  CREATE TABLE BOARDS
   (	NUM INT NOT NULL,
	USERNAME VARCHAR(20),
	SUBJECT VARCHAR(60),
	CONTENT TEXT,
	READCOUNT INT,
	IP VARCHAR(20),
	REG_DATE DATE,
	RE_REF INT, -- 글 그룹
	RE_LEV INT, -- 글 들여쓰기 레벨
	RE_SEQ INT, -- 같은 글그룹안에서 몇번째 글인지
	BOARDNUM INT NOT NULL
   );

--------------------------------------------------------
--  DDL for Table MEMBERS
--------------------------------------------------------

  CREATE TABLE MEMBERS
   (	ID VARCHAR(20) NOT NULL,
	PASSWD VARCHAR(20) NOT NULL,
	NAME VARCHAR(20) NOT NULL,
	REG_DATE DATE,
	AGE INT,
	GENDER VARCHAR(6),
	EMAIL VARCHAR(30),
	ADDRESS VARCHAR(60),
	TEL VARCHAR(20),
	MTEL VARCHAR(20),
	BIRTH_ DATE,
	INTERESTED VARCHAR(60),
	F_UUID VARCHAR(100),
	F_PATH VARCHAR(200),
	F_NAME VARCHAR(100)
   );

Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('11a6a40e-f958-412f-b6b2-9dd41e0652ea',null,'_KVwKIMDpjDhqqtl2n7404.jpg','I',51);
Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('46a4fca7-436f-4464-86b6-3f6ad8e45228',null,'Retro-motorcycle_1920x10801.jpg','I',51);
Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('f05c396f-f216-43df-9863-af20a81c0462',null,'_KVwKIMDpjDhqqtl2n740.jpg','I',41);
Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('dc835912-bf79-43ae-9fa3-2a347e6d7b9b',null,'_KVwKIMDpjDhqqtl2n7401.jpg','I',47);
Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('ea45767b-d3ae-4bde-8a7f-1aeeb1d2d7b0',null,'front.css','O',39);
Insert into ATTACHS (UUID,UPLOADPATH,FILENAME,FILETYPE,BNO) values ('7cce2381-e53e-4c7a-a456-28cea21cbfca',null,'coffee.gif','I',40);


Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (17,'war','1234','tt',25,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/02','%Y-%m-%d %H:%i:%S'),17,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (19,'ames1118',null,'hi',41,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/03','%Y-%m-%d %H:%i:%S'),19,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (48,'123123','12312312','123123214',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),48,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (34,'답글맨','1234','답글',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),31,1,1,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (30,'답글테스터','1234','답글테스트2',1,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),28,2,3,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (49,'123124','124124','214124',5,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),49,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (50,'tester','1234','test',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),50,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (51,'tester','1234','안녕!',8,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),51,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (1,'tester','1234','test',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),1,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (2,'admin',null,'관리자입니다,,,,,,',4,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),2,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (3,'admin',null,'안녕하세요 관리자입니다,,,',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),3,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (29,'답글애호가','1234','답글테스트',1,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),28,1,2,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (6,'admin',null,'test2',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),6,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (7,'admin',null,'test3',5,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),7,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (31,'답글수호자','1234','답글333',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),31,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (9,'admin',null,'dd',4,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),9,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (10,'admin',null,'rㄱㄱㄱㄱ',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),10,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (11,'admin',null,'ㅇ',1,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),11,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (12,'admin',null,'test',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),12,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (13,'admin',null,'머먹지',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),13,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (14,'admin',null,'ㅎㅎㅎ',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),14,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (15,'admin',null,'ascii',4,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),15,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (16,'admin',null,'설명무새',13,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/08/28','%Y-%m-%d %H:%i:%S'),16,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (18,'tester','1234','tt',27,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/02','%Y-%m-%d %H:%i:%S'),18,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (32,'답글애호가','1234','답글44',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),28,1,1,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (33,'tester','1234','답글테스트',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/09','%Y-%m-%d %H:%i:%S'),28,3,4,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (35,'1234','1234','1234',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/10','%Y-%m-%d %H:%i:%S'),35,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (36,'12314','213124','12412',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/10','%Y-%m-%d %H:%i:%S'),35,1,1,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (42,'1231242',null,'123124',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),42,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (26,'admin',null,'admin',7,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/03','%Y-%m-%d %H:%i:%S'),26,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (43,'21412','124124','214124',1,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),43,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (28,'admin',null,'afwaeㅇㄹㅈㄷ',15,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/03','%Y-%m-%d %H:%i:%S'),28,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (44,'213214','124124','21412424',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),44,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (45,'12314','124124','124124',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),45,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (46,'2131231','12312312','1241241241',0,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),46,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (47,'2131231','123124','1241241241',2,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/11','%Y-%m-%d %H:%i:%S'),47,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (37,'tester','1234','1234',3,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/10','%Y-%m-%d %H:%i:%S'),37,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (39,'1234',null,'1234',22,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/10','%Y-%m-%d %H:%i:%S'),39,0,0,1);
Insert into BOARDS (NUM,USERNAME,PASSWD,SUBJECT,READCOUNT,IP,REG_DATE,RE_REF,RE_LEV,RE_SEQ,BOARDNUM) values (40,'1234','1234','1234',15,'0:0:0:0:0:0:0:1',DATE_FORMAT('19/09/10','%Y-%m-%d %H:%i:%S'),40,0,0,1);


Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('imagetester','1234','명선생',DATE_FORMAT('19/09/24','%Y-%m-%d %H:%i:%S'),25,'other','ames1118@naver.com','부산시해운대구해운대로123','051527929114','0109214929151',DATE_FORMAT('93/12/11','%Y-%m-%d %H:%i:%S'),'vape/motocycle/fishing_gear','a0fbc972-a01e-443e-ae30-e22c135a2ab8',null,'profileImage1.PNG');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('testmaster','1234','name',DATE_FORMAT('19/10/16','%Y-%m-%d %H:%i:%S'),25,'male',null,'busan','01092149291','01092149291',DATE_FORMAT('93/12/11','%Y-%m-%d %H:%i:%S'),'vape/fishing_gear/','ac927909-e2ae-4b7d-9e51-b0eb92a8adb7',null,'profileImage.PNG');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('testmaster2','1234','12134',DATE_FORMAT('19/10/16','%Y-%m-%d %H:%i:%S'),0,'male',null,'123','123','123',null,'vape/motocycle','99c378a3-eda2-41e8-afa1-a9b8096039b5',null,'2.jpg');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('testmaster3','1234','1234',DATE_FORMAT('19/10/16','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape/camera/fishing_gear/','6811d77b-2c07-44c8-9e52-6070b59ad2ba',null,'2018. 12. 3.jpg');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('testmaster4','1234','12343',DATE_FORMAT('19/10/16','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape/fishing_gear','46ce5e02-ddd6-481e-b342-e026d21eb75f',null,'2018. 12. 31.jpg');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('123415','1234','12324',DATE_FORMAT('19/10/16','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape',null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('1234abcd','1234','1234abcd',DATE_FORMAT('19/09/19','%Y-%m-%d %H:%i:%S'),25,'male','ames1118@naver.com','부산시해운대구해운대로','01000000000','05100000000',DATE_FORMAT('93/12/11','%Y-%m-%d %H:%i:%S'),null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('abdh3243','1234','안녕?',DATE_FORMAT('19/09/20','%Y-%m-%d %H:%i:%S'),135,'male','abdh@naver.com','마다가스카르','01092439142','010251515513',DATE_FORMAT('83/12/23','%Y-%m-%d %H:%i:%S'),null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('abd','1234','김명한',DATE_FORMAT('19/08/13','%Y-%m-%d %H:%i:%S'),27,'남',null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('ames','1234','명선생',DATE_FORMAT('19/10/20','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape',null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('1234','1234','ames1114',DATE_FORMAT('19/10/20','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('admin4','admin','admin',DATE_FORMAT('19/08/20','%Y-%m-%d %H:%i:%S'),1234,'남자','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('1234124','1234','김명한',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),1234,'남자','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('ames11118','1234','김명한',DATE_FORMAT('19/08/13','%Y-%m-%d %H:%i:%S'),27,'남','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('abcdcccc','1234','김명한',DATE_FORMAT('19/08/13','%Y-%m-%d %H:%i:%S'),27,'남','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('ames1118','1234','김명한',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),0,null,'1234@ffwe.wfw',null,null,null,null,null,'2d86679c-a3ba-47b5-be61-64e8658971b4',null,'profileImage.PNG');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('non5','1234','1234',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),1,null,null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('ames11181234','1234','ddd',DATE_FORMAT('19/08/26','%Y-%m-%d %H:%i:%S'),1234,'남','1234@ffwe.wfw',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('admin2','1234','관리자',DATE_FORMAT('19/08/20','%Y-%m-%d %H:%i:%S'),1233,'남자','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('non','1234','1234',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),1234,'남자',null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('non2','1234','1234',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),1,null,null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('non123','1234','1234',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),1,null,null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('nope','nope','nope',DATE_FORMAT('19/08/21','%Y-%m-%d %H:%i:%S'),10,null,null,null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('admin3','1234','1234',DATE_FORMAT('19/08/20','%Y-%m-%d %H:%i:%S'),1234,'남자','ames1118@naver.com',null,null,null,null,null,null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('tester','1234','살아있네',DATE_FORMAT('19/09/25','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape/',null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('admin','admin','관리자',DATE_FORMAT('19/10/19','%Y-%m-%d %H:%i:%S'),0,'male',null,null,null,null,null,'vape',null,null,null);
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('imageman','1234','이미지맨',DATE_FORMAT('19/10/20','%Y-%m-%d %H:%i:%S'),25,'female','ames1118@naver.com','해운대구','1993','1005',DATE_FORMAT('93/12/11','%Y-%m-%d %H:%i:%S'),'vape/motocycle','552f9c96-cc47-43c1-b0bb-6114638e5b3c',null,'2.jpg');
Insert into MEMBERS (ID,PASSWD,NAME,REG_DATE,AGE,GENDER,EMAIL,ADDRESS,TEL,MTEL,BIRTH_,INTERESTED,F_UUID,F_PATH,F_NAME) values ('gendertester','1234','젠더테스터',DATE_FORMAT('19/10/19','%Y-%m-%d %H:%i:%S'),26,'other',null,null,null,null,DATE_FORMAT('92/12/11','%Y-%m-%d %H:%i:%S'),'vape/camera',null,null,null);
--------------------------------------------------------
--  DDL for Index ATTACHS_UUID_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX ATTACHS_UUID_PK ON ATTACHS (UUID);

--------------------------------------------------------
--  DDL for Index BOARDS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX BOARDS_PK ON BOARDS (NUM);

--------------------------------------------------------
--  DDL for Index MEMBERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX MEMBERS_PK ON MEMBERS (ID);

--------------------------------------------------------
--  Constraints for Table ATTACHS
--------------------------------------------------------

  ALTER TABLE ATTACHS ADD CONSTRAINT ATTACHS_UUID_PK PRIMARY KEY (UUID);

--------------------------------------------------------
--  Constraints for Table BOARDS
--------------------------------------------------------

  ALTER TABLE BOARDS ADD CONSTRAINT BOARDS_PK PRIMARY KEY (NUM);

--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_PK PRIMARY KEY (ID);
