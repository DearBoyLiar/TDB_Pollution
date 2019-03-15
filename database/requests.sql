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
and label_word in ('Aruba',
 'Afghanistan',
 'Angola',
 'Anguilla',
 'Ahvenanmaa',
 'Albanie',
 'Andorre',
 'Émirats arabes unis',
 'Argentine',
 'Arménie',
 'Samoa américaines',
 'Antarctique',
 'Terres australes et antarctiques françaises',
 'Antigua-et-Barbuda',
 'Australie',
 'Autriche',
 'Azerbaïdjan',
 'Burundi',
 'Belgique',
 'Bénin',
 'Burkina Faso',
 'Bangladesh',
 'Bulgarie',
 'Bahreïn',
 'Bahamas',
 'Bosnie-Herzégovine',
 'Saint-Barthélemy',
 'Sainte-Hélène, Ascension et Tristan da Cunha',
 'Biélorussie',
 'Belize',
 'Bermudes',
 'Bolivie',
 'Pays-Bas caribéens',
 'Brésil',
 'Barbade',
 'Brunei',
 'Bhoutan',
 'Île Bouvet',
 'Botswana',
 'République centrafricaine',
 'Canada',
 'Îles Cocos',
 'Suisse',
 'Chili',
 'Chine',
 'Cameroun',
 'Congo (Rép. dém.)',
 'Congo',
 'Îles Cook',
 'Colombie',
 'Comores',
 'Îles du Cap-Vert',
 'Costa Rica',
 'Cuba',
 'Curaçao',
 'Île Christmas',
 'Îles Caïmans',
 'Chypre',
 'Tchéquie',
 'Allemagne',
 'Djibouti',
 'Dominique',
 'Danemark',
 'République dominicaine',
 'Algérie',
 'Équateur',
 'Égypte',
 'Érythrée',
 'Sahara Occidental',
 'Espagne',
 'Estonie',
 'Éthiopie',
 'Finlande',
 'Fidji',
 'Îles Malouines',
 'France',
 'Îles Féroé',
 'Micronésie',
 'Gabon',
 'Royaume-Uni',
 'Géorgie',
 'Guernesey',
 'Ghana',
 'Gibraltar',
 'Guinée',
 'Guadeloupe',
 'Gambie',
 'Guinée-Bissau',
 'Guinée équatoriale',
 'Grèce',
 'Grenade',
 'Groenland',
 'Guatemala',
 'Guyane',
 'Guam',
 'Guyana',
 'Hong Kong',
 'Îles Heard-et-MacDonald',
 'Honduras',
 'Croatie',
 'Haïti',
 'Hongrie',
 'Indonésie',
 'Île de Man',
 'Inde',
 'Irlande',
 'Iran',
 'Irak',
 'Islande',
 'Israël',
 'Italie',
 'Jamaïque',
 'Jersey',
 'Jordanie',
 'Japon',
 'Kazakhstan',
 'Kenya',
 'Kirghizistan',
 'Cambodge',
 'Kiribati',
 'Saint-Christophe-et-Niévès',
 'Corée du Sud',
 'Kosovo',
 'Koweït',
 'Laos',
 'Liban',
 'Liberia',
 'Libye',
 'Sainte-Lucie',
 'Liechtenstein',
 'Sri Lanka',
 'Lesotho',
 'Lituanie',
 'Luxembourg',
 'Lettonie',
 'Macao',
 'Saint-Martin',
 'Maroc',
 'Monaco',
 'Moldavie',
 'Madagascar',
 'Maldives',
 'Mexique',
 'Îles Marshall',
 'Macédoine',
 'Mali',
 'Malte',
 'Birmanie',
 'Monténégro',
 'Mongolie',
 'Îles Mariannes du Nord',
 'Mozambique',
 'Mauritanie',
 'Montserrat',
 'Martinique',
 'Île Maurice',
 'Malawi',
 'Malaisie',
 'Mayotte',
 'Namibie',
 'Nouvelle-Calédonie',
 'Niger',
 'Île Norfolk',
 'Nigéria',
 'Nicaragua',
 'Niue',
 'Pays-Bas',
 'Norvège',
 'Népal',
 'Nauru',
 'Nouvelle-Zélande',
 'Oman',
 'Pakistan',
 'Panama',
 'Îles Pitcairn',
 'Pérou',
 'Philippines',
 'Palaos (Palau)',
 'Papouasie-Nouvelle-Guinée',
 'Pologne',
 'Porto Rico',
 'Corée du Nord',
 'Portugal',
 'Paraguay',
 'Palestine',
 'Polynésie française',
 'Qatar',
 'Réunion',
 'Roumanie',
 'Russie',
 'Rwanda',
 'Arabie Saoudite',
 'Soudan',
 'Sénégal',
 'Singapour',
 'Géorgie du Sud-et-les Îles Sandwich du Sud',
 'Svalbard et Jan Mayen',
 'Îles Salomon',
 'Sierra Leone',
 'Salvador',
 'Saint-Marin',
 'Somalie',
 'Saint-Pierre-et-Miquelon',
 'Serbie',
 'Soudan du Sud',
 'São Tomé et Príncipe',
 'Surinam',
 'Slovaquie',
 'Slovénie',
 'Suède',
 'Swaziland',
 'Saint-Martin',
 'Seychelles',
 'Syrie',
 'Îles Turques-et-Caïques',
 'Tchad',
 'Togo',
 'Thaïlande',
 'Tadjikistan',
 'Tokelau',
 'Turkménistan',
 'Timor oriental',
 'Tonga',
 'Trinité-et-Tobago',
 'Tunisie',
 'Turquie',
 'Tuvalu',
 'Taïwan',
 'Tanzanie',
 'Ouganda',
 'Ukraine',
 'Îles mineures éloignées des États-Unis',
 'Uruguay',
 'États-Unis',
 'Ouzbékistan',
 'Cité du Vatican',
 'Saint-Vincent-et-les-Grenadines',
 'Venezuela',
 'Îles Vierges britanniques',
 'Îles Vierges des États-Unis',
 'Viêt Nam',
 'Vanuatu',
 'Wallis-et-Futuna',
 'Samoa',
 'Yémen',
 'Afrique du Sud',
 'Zambie',
 'Zimbabwe')
group by label_word, id_article
order by 1 desc

-- par journaux
select sum(tf), label_word, id_newspaper
from belong b, word w, articles a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
group by label_word, id_newspaper
order by 1 desc


--par date
select sum(tf), label_word, publication_date
from belong b, word w, articles a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
group by label_word, publication_date
order by 1 desc

--par date / pays
select sum(tf), label_word, publication_date
from belong b, word w, articles a
where b.id_word = w.id_word 
and a.id_article = b.id_article
and b.id_article <> 542
and label_word in ('Aruba',
 'Afghanistan',
 'Angola',
 'Anguilla',
 'Ahvenanmaa',
 'Albanie',
 'Andorre',
 'Émirats arabes unis',
 'Argentine',
 'Arménie',
 'Samoa américaines',
 'Antarctique',
 'Terres australes et antarctiques françaises',
 'Antigua-et-Barbuda',
 'Australie',
 'Autriche',
 'Azerbaïdjan',
 'Burundi',
 'Belgique',
 'Bénin',
 'Burkina Faso',
 'Bangladesh',
 'Bulgarie',
 'Bahreïn',
 'Bahamas',
 'Bosnie-Herzégovine',
 'Saint-Barthélemy',
 'Sainte-Hélène, Ascension et Tristan da Cunha',
 'Biélorussie',
 'Belize',
 'Bermudes',
 'Bolivie',
 'Pays-Bas caribéens',
 'Brésil',
 'Barbade',
 'Brunei',
 'Bhoutan',
 'Île Bouvet',
 'Botswana',
 'République centrafricaine',
 'Canada',
 'Îles Cocos',
 'Suisse',
 'Chili',
 'Chine',
 'Cameroun',
 'Congo (Rép. dém.)',
 'Congo',
 'Îles Cook',
 'Colombie',
 'Comores',
 'Îles du Cap-Vert',
 'Costa Rica',
 'Cuba',
 'Curaçao',
 'Île Christmas',
 'Îles Caïmans',
 'Chypre',
 'Tchéquie',
 'Allemagne',
 'Djibouti',
 'Dominique',
 'Danemark',
 'République dominicaine',
 'Algérie',
 'Équateur',
 'Égypte',
 'Érythrée',
 'Sahara Occidental',
 'Espagne',
 'Estonie',
 'Éthiopie',
 'Finlande',
 'Fidji',
 'Îles Malouines',
 'France',
 'Îles Féroé',
 'Micronésie',
 'Gabon',
 'Royaume-Uni',
 'Géorgie',
 'Guernesey',
 'Ghana',
 'Gibraltar',
 'Guinée',
 'Guadeloupe',
 'Gambie',
 'Guinée-Bissau',
 'Guinée équatoriale',
 'Grèce',
 'Grenade',
 'Groenland',
 'Guatemala',
 'Guyane',
 'Guam',
 'Guyana',
 'Hong Kong',
 'Îles Heard-et-MacDonald',
 'Honduras',
 'Croatie',
 'Haïti',
 'Hongrie',
 'Indonésie',
 'Île de Man',
 'Inde',
 'Irlande',
 'Iran',
 'Irak',
 'Islande',
 'Israël',
 'Italie',
 'Jamaïque',
 'Jersey',
 'Jordanie',
 'Japon',
 'Kazakhstan',
 'Kenya',
 'Kirghizistan',
 'Cambodge',
 'Kiribati',
 'Saint-Christophe-et-Niévès',
 'Corée du Sud',
 'Kosovo',
 'Koweït',
 'Laos',
 'Liban',
 'Liberia',
 'Libye',
 'Sainte-Lucie',
 'Liechtenstein',
 'Sri Lanka',
 'Lesotho',
 'Lituanie',
 'Luxembourg',
 'Lettonie',
 'Macao',
 'Saint-Martin',
 'Maroc',
 'Monaco',
 'Moldavie',
 'Madagascar',
 'Maldives',
 'Mexique',
 'Îles Marshall',
 'Macédoine',
 'Mali',
 'Malte',
 'Birmanie',
 'Monténégro',
 'Mongolie',
 'Îles Mariannes du Nord',
 'Mozambique',
 'Mauritanie',
 'Montserrat',
 'Martinique',
 'Île Maurice',
 'Malawi',
 'Malaisie',
 'Mayotte',
 'Namibie',
 'Nouvelle-Calédonie',
 'Niger',
 'Île Norfolk',
 'Nigéria',
 'Nicaragua',
 'Niue',
 'Pays-Bas',
 'Norvège',
 'Népal',
 'Nauru',
 'Nouvelle-Zélande',
 'Oman',
 'Pakistan',
 'Panama',
 'Îles Pitcairn',
 'Pérou',
 'Philippines',
 'Palaos (Palau)',
 'Papouasie-Nouvelle-Guinée',
 'Pologne',
 'Porto Rico',
 'Corée du Nord',
 'Portugal',
 'Paraguay',
 'Palestine',
 'Polynésie française',
 'Qatar',
 'Réunion',
 'Roumanie',
 'Russie',
 'Rwanda',
 'Arabie Saoudite',
 'Soudan',
 'Sénégal',
 'Singapour',
 'Géorgie du Sud-et-les Îles Sandwich du Sud',
 'Svalbard et Jan Mayen',
 'Îles Salomon',
 'Sierra Leone',
 'Salvador',
 'Saint-Marin',
 'Somalie',
 'Saint-Pierre-et-Miquelon',
 'Serbie',
 'Soudan du Sud',
 'São Tomé et Príncipe',
 'Surinam',
 'Slovaquie',
 'Slovénie',
 'Suède',
 'Swaziland',
 'Saint-Martin',
 'Seychelles',
 'Syrie',
 'Îles Turques-et-Caïques',
 'Tchad',
 'Togo',
 'Thaïlande',
 'Tadjikistan',
 'Tokelau',
 'Turkménistan',
 'Timor oriental',
 'Tonga',
 'Trinité-et-Tobago',
 'Tunisie',
 'Turquie',
 'Tuvalu',
 'Taïwan',
 'Tanzanie',
 'Ouganda',
 'Ukraine',
 'Îles mineures éloignées des États-Unis',
 'Uruguay',
 'États-Unis',
 'Ouzbékistan',
 'Cité du Vatican',
 'Saint-Vincent-et-les-Grenadines',
 'Venezuela',
 'Îles Vierges britanniques',
 'Îles Vierges des États-Unis',
 'Viêt Nam',
 'Vanuatu',
 'Wallis-et-Futuna',
 'Samoa',
 'Yémen',
 'Afrique du Sud',
 'Zambie',
 'Zimbabwe')
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


