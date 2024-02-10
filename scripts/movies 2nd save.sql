--1

select film_title,release_year,worldwide_gross
from specs
left join revenue
ON revenue.movie_id = specs.movie_id
order by worldwide_gross
limit 1;

--2

select release_year,avg(imdb_rating)
from specs
left join rating
ON rating.movie_id = specs.movie_id
group by (release_year)
order by avg(imdb_rating) desc
limit 1;


--3


