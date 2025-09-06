create table netflix(
    show_id	VARCHAR(5),
	type   VARCHAR(10),
	title	VARCHAR(250),
	director VARCHAR(550),
	casts	VARCHAR(1050),
	country	VARCHAR(550),
	date_added	VARCHAR(55),
	release_year	INT,
	rating	VARCHAR(15),
	duration	VARCHAR(15),
	listed_in	VARCHAR(250),
	description VARCHAR(550)
);
select * from netflix;


--Number of movies v/s tv shows
select
 type,
 count(*) as content
from netflix
group by type;

--All movies released in 2020
select * from netflix
where release_year=2020 and type='Movie';

--Top 5 countries with most content on netflix
select 
trim(unnest(string_to_array(country,',')))as new_country,
count(show_id) as total_count
from netflix
group by 1
order by 2 desc
limit 5

--Movie with maximum duration
select * from netflix
where type='Movie' and duration=(select max(duration) from netflix)


-- All shows/movies directed by rajiv chilaka

select * from netflix
where director ilike '%Rajiv Chilaka%'

--TV shows with more than 5 seasons

select * from netflix
where type='TV Show' and split_part(duration,' ',1)::numeric>5;


--Number of content item in each genre

select 
trim(unnest(string_to_array(listed_in,','))),
count(show_id) from netflix
group by 1


--Find each year and avg number of content released by India

select 
extract ( year from TO_DATE(date_added,'month DD,YYYY')) as year,
count(*),
count(*)::numeric/(select count(*)from netflix where country='India')::numeric * 100 as Average
from netflix 
where country = 'India'
group by 1


--All movies that are documentaries

select * from netflix 
where listed_in ilike '%documentaries%'


-- All content without a director
select * from netflix
where director is null

--Top 10 actors who appeard in highest number of movies produced by India

select
trim(unnest(string_to_array(casts,',')))as actors,
count(*)
from netflix
where country = 'India'
group by 1
order by 2 desc
limit 10

--Years with highest number of releases
SELECT 
    release_year,
    COUNT(*) AS total_releases,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank
FROM netflix
GROUP BY release_year
ORDER BY total_releases DESC
LIMIT 10;



---Categorize content as 'bad' if description contains violence or kill otherwise good


SELECT 
    category,
	TYPE,
    COUNT(*) AS content_count
FROM (
    SELECT 
		*,
        CASE 
            WHEN description ILIKE '%kill%' OR description ILIKE '%violence%' THEN 'Bad'
            ELSE 'Good'
        END AS category
    FROM netflix
) AS categorized_content
GROUP BY 1,2
ORDER BY 2




