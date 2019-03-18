--Récupération du tf cumulé de chaque mot en enlevant l'article nul
Select label_word, sum(tf)
from belong b, word w 
where w.id_word = b.id_word
and id_article <> 542
group by label_word
order by 2 desc

--Récupération du tf de chaque mot dans chaque article
Select label_word, sum(tf), id_article
from belong b, word w 
where w.id_word = b.id_word
and id_article <> 542
and tf between 5 and 30
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


-- pays par mois
select distinct label_word, left(publication_date, 7)
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
order by 2 desc

--nb de pays par mois
select TOP 10 count(distinct label_word), left(publication_date, 7)
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
group by left(publication_date, 7)
order by 1 desc

--Mots qui apparaissent le plus dans les descriptions d'article
Select TOP 8 count(b.id_word), label_word
from belong b, word w
where w.id_word = b.id_word
and label_word not in ('ete', 'ans')
and b.is_description = 1
group by label_word
order by 1 desc

--Mots qui apparaissent le plus dans les titres d'articles
Select TOP 8 count(b.id_word), label_word
from belong b, word w
where w.id_word = b.id_word
and label_word not in ('ete', 'ans')
and b.is_title = 1
group by label_word
order by 1 desc

--Mots qui apparaissent le plus dans les titres et description d'articles
Select TOP 8 count(b.id_word), label_word
from belong b, word w
where w.id_word = b.id_word
and label_word not in ('ete', 'ans')
and b.is_title = 1
and b.is_description = 1
group by label_word
order by 1 desc