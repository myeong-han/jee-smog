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
	PASSWD VARCHAR(20),
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

--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE COMMENTS
   (	SEQ INT NOT NULL,
  ID VARCHAR(20) NOT NULL,
 	CONTENT TEXT NOT NULL,
 	BNO INT NOT NULL
    );

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
  ALTER TABLE ATTACHS ADD CONSTRAINT attachs_bno_fk FOREIGN KEY (bno)
  REFERENCES boards (num);

--------------------------------------------------------
--  Constraints for Table BOARDS
--------------------------------------------------------

  ALTER TABLE BOARDS ADD CONSTRAINT BOARDS_PK PRIMARY KEY (NUM);
  ALTER TABLE BOARDS ADD CONSTRAINT boards_username_fk FOREIGN KEY (username)
  REFERENCES members (id);

--------------------------------------------------------
--  Constraints for Table MEMBERS
--------------------------------------------------------

  ALTER TABLE MEMBERS ADD CONSTRAINT MEMBERS_PK PRIMARY KEY (ID);

--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE COMMENTS ADD CONSTRAINT COMMENTS_PK PRIMARY KEY (ID);
  ALTER TABLE COMMENTS ADD CONSTRAINT COMMENTS_ID_FK FOREIGN KEY (ID)
  REFERENCES MEMBERS (ID);
  ALTER TABLE COMMENTS ADD CONSTRAINT COMMENTS_BNO_FK FOREIGN KEY (BNO)
  REFERENCES BOARDS (NUM);
