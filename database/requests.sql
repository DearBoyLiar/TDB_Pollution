--Récupération du tf cumulé de chaque mot en enlevant l'article nul
Select label_word, sum(tf)
from belong b inner join word w on w.id_word = b.id_word
where id_article <> 542
group by label_word
order by 2 desc

--Récupération du tf de chaque mot dans chaque article
Select label_word, sum(tf), id_article
from belong b inner join word w on w.id_word = b.id_word
where id_article <> 542 and len(word) > 5
group by label_word, id_article
order by 2 desc

--Avec une liste de pays
select sum(tf), label_word, id_article
from belong b, word w
where b.id_word = w.id_word 
and id_article <> 542
and b.is_country = 1
group by label_word, id_article
order by 1 desc

-- par journaux
select sum(tf), label_word, id_newspaper
from belong b, word w, article a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
group by label_word, id_newspaper
order by 1 desc


--par date
select sum(tf), label_word, publication_date
from belong b, word w, article a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
group by label_word, publication_date
order by 1 desc

--par date / pays
select sum(tf), label_word, publication_date
from belong b, word w, article a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
and b.is_country = 1
group by label_word, publication_date
order by 1 desc

--Articles avec le plus de mots 
select TOP 50 count(label_word), id_article
from belong b, word w
where b.id_word = w.id_word 
and id_article <> 542
group by id_article
order by 1 desc

--mot pertinent
select label_word, id_article, tf
from belong b, word w
where b.id_word = w.id_word 
and id_article <> 542
and label_word in ('ocean', 'plastiques', 'plastique', 'mer', 'dechets', 'dechet', 'eau', 'pollution',
'microplastique')
order by 3 desc


select w.label_word, b.id_article, b.tf
from belong b, word w
where b.id_word = w.id_word
and b.id_article <> 542
and is_country = 1
