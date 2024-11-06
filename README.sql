--Название и продолжительность самого длительного трека.
select length_of_the_song, name from tracks
where length_of_the_song = (select max(length_of_the_song) from tracks);

--Название треков, продолжительность которых не менее 3,5 минут.
select length_of_the_song, name
from tracks
where length_of_the_song >=350;

--Названия сборников, вышедших в период с 2018 по 2020 год включительно.
select name
from collections
where year_of_release between 2018 and 2020';

--Исполнители, чьё имя состоит из одного слова.
select name
from performers
where name not like '% %';

--Название треков, которые содержат слово «мой» или «my».
select name from tracks t
where lower(name) like '%my%' or lower(name) like '%мой%';

--Количество исполнителей в каждом жанре.
select name, COUNT(performers_id) performers_ from genres g
join performersgenres p on g.id = p.genres_id
group by g.name 
order by performers_ desc;

--Количество треков, вошедших в альбомы 2019–2020 годов.
select year_of_release, count(t.id) traks_ from tracks t 
join albums a on a.id = t.album_id 
where year_of_release between 2019 and 2020
group by a.year_of_release 
order by traks_ desc

--Средняя продолжительность треков по каждому альбому.
select a.name, avg(t.length_of_the_song) traks_ from tracks t 
join albums a on a.id = t.album_id 
group by a.name
order by traks_ desc

--Все исполнители, которые не выпустили альбомы в 2020 году.
select p.name from performers p
where p.id not in(
select p.id from performers
join performersalbums p2 on p.id = p2.performers_id
join albums a on a.id = p2.albums_id
where year_of_release = 2020);

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами).
select distinct c.name from collections c
join collectiontracks c2 ON c.id = c2.collection_id
join tracks t on c2.tracks_id = t.id 
join albums a on a.id = t.album_id
join performersalbums p2 on a.id = p2.albums_id 
join performers p on p.id = p2.performers_id
where p.name = 'Park Jimin'

