--1

select film_title,release_year,worldwide_gross
from specs
INNER join revenue
ON revenue.movie_id = specs.movie_id
order by worldwide_gross
limit 1;

--2

select release_year,avg(imdb_rating) as highest_avg_rating
from specs
INNER join rating
ON rating.movie_id = specs.movie_id
group by (release_year)
order by avg(imdb_rating) desc
limit 1;


--3

SELECT revenue.worldwide_gross,specs.mpaa_rating,distributors.company_name,specs.film_title
from specs
inner join revenue on revenue.movie_id = specs.movie_id
inner join distributors on distributors.distributor_id = specs.domestic_distributor_id
where mpaa_rating = 'G'
order by revenue.worldwide_gross desc
LIMIT 1

--4

SELECT distributors.company_name, count(specs.movie_id)
from specs
left join distributors on distributors.distributor_id = specs.domestic_distributor_id
group by company_name

select count(movie_id)
from specs

--5
select distributors.company_name as distributor, avg(revenue.film_budget) as highest_avg_buget
from specs
inner join distributors on distributors.distributor_id = specs.domestic_distributor_id
inner join revenue on revenue.movie_id = specs.movie_id
group by company_name
order by avg(revenue.film_budget) desc
limit 5

--6 

select count(specs.movie_id), rating.imdb_rating
from specs

left join distributors on distributors.distributor_id = specs.domestic_distributor_id
inner join rating on rating.movie_id = specs.movie_id
where headquarters not like 'CA%'
group by distributors.company_name

WITH NonCA AS (
    SELECT s.movie_id, r.imdb_rating
    FROM specs s
    LEFT JOIN distributors d ON d.distributor_id = s.domestic_distributor_id
    INNER JOIN rating r ON r.movie_id = s.movie_id
    WHERE d.headquarters NOT LIKE 'CA%'
)
SELECT COUNT(*) AS MovieCount, MAX(imdb_rating) AS HighestRating
FROM NonCA;

--7

select 
case 
	when length_in_min >= 120 then '>2 hours'
	ELSE '<2 HOURS'
END AS length_of_movie, ROUND(avg(imdb_rating),2) as avg_rating
from specs
inner join rating
using (movie_id)
group by length_of_movie
order by avg_rating desc;



