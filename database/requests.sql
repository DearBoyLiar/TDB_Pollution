--Récupération du tf cumulé de chaque mot en enlevant l'article nul
Select word, sum(tf)
from belong b inner join words w on w.id_word = b.id_word
where id_article <> 542
group by word
order by 2 desc

--Récupération du tf de chaque mot dans chaque article
Select word, sum(tf), id_article
from belong b inner join words w on w.id_word = b.id_word
where id_article <> 542 and len(word) > 5
group by word, id_article
order by 2 desc