drop procedure InsertArticle;
drop procedure InsertNewspaper;
drop procedure InsertBelong;
drop procedure InsertWord;


CREATE PROCEDURE InsertArticle
@link_article varchar(255),
@publication_date date,
@author  varchar(255),
@id_newspaper int
AS
BEGIN
	if (select count(*) from article where link_article = @link_article) = 0
		begin
			INSERT INTO ARTICLE (link_article, publication_date, author, id_newspaper)
			VALUES (@link_article, @publication_date, @author, @id_newspaper);
		end
END
GO


CREATE PROCEDURE InsertNewspaper
@name_newspaper varchar(50)
AS
BEGIN
	if (select count(*) from newspaper where name_newspaper = @name_newspaper) = 0
		begin
			INSERT INTO NEWSPAPER (name_newspaper)
			VALUES (@name_newspaper);
		end
END
GO


CREATE PROCEDURE InsertBelong
@id_article int,
@id_word int,
@tf int,
@is_description tinyint,
@is_title tinyint,
@is_country tinyint
AS
BEGIN
	INSERT INTO BELONG (id_article, id_word, tf, is_description, is_title, is_country)
	VALUES (@id_article, @id_word, @tf, @is_description, @is_title, @is_country);
END
GO


CREATE PROCEDURE InsertWord
@label_word varchar(100),
@pos_tag varchar(30)
AS
BEGIN
	if (select count(*) from word where label_word = @label_word) = 0
		BEGIN
			INSERT INTO WORD (label_word, pos_tag)
			VALUES (@label_word, @pos_tag);
		END
END
GO


