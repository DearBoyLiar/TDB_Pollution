IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[belong]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE belong;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[words]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE words;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[articles]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE articles;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[newspapers]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE newspapers;


CREATE TABLE NEWSPAPERS
(
id_newspaper int identity(1,1) primary key,
name_newspaper varchar(50)
);

CREATE TABLE ARTICLES
(
id_article int identity(1,1) primary key ,
link_article varchar(255),
publication_date date,
authors varchar(255),
id_newspaper int references NEWSPAPERS (id_newspaper)
);

CREATE TABLE WORDS
(
id_word int identity(1,1) primary key ,
word varchar(100),
pos_tag varchar(30)
);

CREATE TABLE BELONG
(
id_article int references ARTICLES (id_article),
id_word int references WORDS (id_word),
tf int,
is_description tinyint,
is_title tinyint
);

CREATE INDEX index_belong ON BELONG (id_article, id_word);
