--Название и продолжительность самого длительного трека.
select max(length_of_the_song), t.name
from tracks t
group by t.name
order by max desc
limit 1;

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



