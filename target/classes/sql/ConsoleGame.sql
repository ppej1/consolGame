DROP TABLE lendConsol;
DROP TABLE consoluser;
DROP TABLE CONSOLGAME;

CREATE TABLE consoluser
(
    usernum VARCHAR2(100) primary key,
    userid VARCHAR2(50) not null unique,
    userpwd VARCHAR2(50) not null,
    birthdate date,
    username VARCHAR2(50) not null,
    email VARCHAR2(200) not null unique,
    tel1 VARCHAR2(5) not null,
    tel2 VARCHAR2(5) not null,
    tel3 VARCHAR2(5) not null,
    imageurl VARCHAR2(200) ,
    point number default 0,
    userlevel number default 1
    REGISTERDATE date default sysdate
);

CREATE TABLE CONSOLGAME
(
gamenum NUMBER PRIMARY KEY,
gametitle varchar(300) not null,
production varchar(200) ,
content varchar2(2000) ,
imageurl VARCHAR2(200) ,
genre varchar2(100) ,
typename varchar2(50) 
);

CREATE TABLE lendConsol
(
lend NUMBER primary key,
usernum VARCHAR2(100) references consoluser on delete cascade,
startdate date,
enddate date,
returndate date,
status VARCHAR2(100)  default 'returned',
gamenum NUMBER references CONSOLGAME on delete cascade
);



create sequence lend_seq;
create sequence consolgame_seq;