IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[belong]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE belong;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[word]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE word;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[article]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE article;
IF EXISTS (select * from dbo.sysobjects where id = object_id(N'[newspaper]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE newspaper;


CREATE TABLE NEWSPAPER
(
id_newspaper int identity(1,1) primary key,
name_newspaper varchar(50)
);

CREATE TABLE ARTICLE
(
id_article int identity(1,1) primary key ,
link_article varchar(255),
publication_date date,
author varchar(255),
id_newspaper int references NEWSPAPER (id_newspaper)
);

CREATE TABLE WORD
(
id_word int identity(1,1) primary key ,
label_word varchar(100),
pos_tag varchar(30)
);

CREATE TABLE BELONG
(
id_article int references ARTICLE (id_article),
id_word int references WORD (id_word),
tf int,
is_description tinyint,
is_title tinyint,
is_country tinyint
);

CREATE INDEX index_belong ON BELONG (id_article, id_word);
