--Récupération du tf cumulé de chaque mot
Select TOP 30 label_word, sum(tf)
from belong b, word w 
where w.id_word = b.id_word
and id_article <> 542
and label_word not in ('000')
group by label_word
order by 2 desc

--Avec une liste de pays
select TOP 30 sum(tf), label_word, id_article
from belong b, word w
where b.id_word = w.id_word 
and id_article <> 542
and b.is_country = 1
group by label_word, id_article
order by 1 desc

-- par journaux
select TOP 30 sum(tf), label_word, name_newspaper
from belong b, word w, article a, newspaper n 
where b.id_word = w.id_word 
and a.id_article = b.id_article
and a.id_newspaper = n .id_newspaper
and b.id_article <> 542
and label_word not in ('000')
group by label_word, name_newspaper
order by 1 desc

--par date / pays
select TOP 30 sum(tf), label_word, left(publication_date,4) 
from belong b, word w, article a 
where b.id_word = w.id_word 
and a.id_article = b.id_article 
and b.id_article <> 542 
and b.is_country = 1 
and left(publication_date,4)  between '1950' and '2019'
group by label_word, left(publication_date,4) 
order by 1 desc

--Nombre de mots par date
select count(label_word), left(publication_date, 4)
from belong b, word w, article a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and a.id_article <> 542
group by left(publication_date, 4)
order by 2 desc

--mot pertinent
select label_word, a.id_article, tf, left(publication_date, 4)
from belong b, word w, article a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and a.id_article <> 542
and label_word in ('ocean', 'plastiques', 'plastique', 'mer', 'dechets', 'dechet', 'eau', 'pollution',
'microplastiques', 'microplastiques')
order by 4 desc

-- pays par mois avec label associé à chaque tranche de date
select distinct label_word, left(publication_date, 7),
case when  left(publication_date, 7) between '2010-01' and '2019-03' THEN 1
when  left(publication_date, 7) between '2000-01' and '2010-01' THEN 2
when  left(publication_date, 7) between '1990-01' and '2000-01' THEN 3
when  left(publication_date, 7) between '1980-01' and '1990-01' THEN 4
when  left(publication_date, 7) between '1970-01' and '1980-01' THEN 5
when  left(publication_date, 7) between '1960-01' and '1970-01' THEN 6
when  left(publication_date, 7) between '1950-01' and '1960-01' THEN 7 
ELSE 8 END
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
order by 2 desc


-- pays par année avec label associé à chaque tranche de date
select distinct label_word, left(publication_date, 4),
case when  left(publication_date, 4) between '2010' and '2019' THEN 1
when  left(publication_date, 4) between '2000' and '2010' THEN 2
when  left(publication_date, 4) between '1990' and '2000' THEN 3
when  left(publication_date, 4) between '1980' and '1990' THEN 4
when  left(publication_date, 4) between '1970' and '1980' THEN 5
when  left(publication_date, 4) between '1960' and '1970' THEN 6 
when  left(publication_date, 4) between '1950' and '1960' THEN 7 
ELSE 8 END
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
order by 2 desc

--nb de pays par mois
select a.word, a.date_pub,
case when  left(a.date_pub, 7) between '2010-01' and '2019-01' THEN 1
when  left(a.date_pub, 7) between '2000-01' and '2010-01' THEN 2
when  left(a.date_pub, 7) between '1990-01' and '2000-01' THEN 3
when  left(a.date_pub, 7) between '1980-01' and '1990-01' THEN 4
when  left(a.date_pub, 7) between '1970-01' and '1980-01' THEN 5
when  left(a.date_pub, 7) between '1960-01' and '1970-01' THEN 6 
when  left(a.date_pub, 7) between '1950-01' and '1960-01' THEN 7 
ELSE 8 END
from
(
select TOP 30 count(distinct label_word) as word, left(publication_date, 7) as date_pub
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
group by left(publication_date, 7)
order by 2 desc
) a

-- nb de pays par année
select a.word, a.date_pub,
case when  left(a.date_pub, 4) between '2010' and '2019' THEN 1
when  left(a.date_pub, 4) between '2000' and '2010' THEN 2
when  left(a.date_pub, 4) between '1990' and '2000' THEN 3
when  left(a.date_pub, 4) between '1980' and '1990' THEN 4
when  left(a.date_pub, 4) between '1970' and '1980' THEN 5
when  left(a.date_pub, 4) between '1960' and '1970' THEN 6 
when  left(a.date_pub, 4) between '1950' and '1960' THEN 7 
ELSE 8 END
from
(
select TOP 30 count(distinct label_word) as word, left(publication_date, 4) as date_pub
from belong b, word w, article a
where b.id_word = w.id_word
and b.id_article = a.id_article
and b.id_article <> 542
and is_country = 1
group by left(publication_date, 4)
order by 2 desc
) a


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