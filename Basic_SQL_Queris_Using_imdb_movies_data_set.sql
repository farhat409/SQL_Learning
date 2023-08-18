select * from information_schema.tables
where table_schema='public';

Select * from imdb_top_movies;

1) Fetch all the Data from table

SELECT
FROM
WHERE

Select * from imdb_top_movies;

2.) fetch only the movie name and relase year of the movie
 
 select series_title,released_year from imdb_top_movies;
 
 3) Fetch the name, release year and imdb rating of movies which are UA certified.
 
select series_title,released_year,imdb_rating 
from imdb_top_movies
where certificate = 'UA';
 
 
 4) Fetch the name and genre of movies which are UA certified and have a Imdb rating of over 8.
 
SELECT series_title, genre,imdb_rating
FROM imdb_top_movies
WHERE certificate  ='UA'
and imdb_rating>8;
 
 -- Operators in SQL
1) Arithmetic operator  -- + - * / %
2) Logical operator		-- AND OR LIKE IN NOT IN etc.
3) Comparison operator  -- = <> != > >= < <= etc.


5) Find out how many movies are of Drama genre
 select count(*) series_title
 FROM imdb_top_movies
 where genre like'%Drama%' -724
 
 select count(*) series_title
 FROM imdb_top_movies
 where upper (genre) like '%DRAMA%'-724
 
 select count(1) series_title
 FROM imdb_top_movies
 where upper (genre) like '%DRAMA%'
 
 select count(series_title) as total_movies
 from imdb_top_movies
 where upper (genre) like '%DRAMA%'
 
 select count(1)
 from imdb_top_movies
 where certificate is null;
 
 
 

6) How many movies are directed by 
					"Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" and "Rajkumar Hirani"	
					
Select count(1)
 from imdb_top_movies
 where director in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan', 'Rajkumar Hirani')
 
 Select * from imdb_top_movies
 
 7) What is the highest imdb rating given so far?
Select max(imdb_rating) as max_rating
from imdb_top_movies

 8) What is the highest and lowest imdb rating given so far?
 
 select max (imdb_rating) as max_rating, min(imdb_rating) as min_rating
 from imdb_top_movies;
 8a) Solve the above problem but display the results in different rows.
 
 select max (imdb_rating) as max_rating
 from imdb_top_movies
 union 
 select  min(imdb_rating) as min_rating
 from imdb_top_movies;
 
 -- union, union all, intersect, except, minus, 

8b) Solve the above problem but display the results in different rows. And have a column which indicates the value as lowest and highest.

select max (imdb_rating) as Movie_rating, 'Highest_Rating' as high_low
 from imdb_top_movies
 union 
 select  min(imdb_rating) , 'Lowest_Rating' as high_low
 from imdb_top_movies;

9) Find out the total business done by movies staring "Aamir Khan".
Select * from imdb_top_movies
 Select sum(gross)
 from imdb_top_movies
 where star1 = 'Aamir Khan'
 or star2 = 'Aamir Khan'
 or star3 = 'Aamir Khan'
 or star4 = 'Aamir Khan';
 
 Select sum(gross)
 from imdb_top_movies
 where 'Aamir Khan' in (star1,star2,star3,star4)
 
 10) Find out the average imdb rating of movies which are neither directed 
	by "Quentin Tarantino", "Steven Spielberg", "Christopher Nolan" 
	and are not acted by any of these stars "Christian Bale", "Liam Neeson"
		, "Heath Ledger", "Leonardo DiCaprio", "Anne Hathaway".
		
select avg(imdb_rating) as avg_rating
from imdb_top_movies
where director not in ('Quentin Tarantino', 'Steven Spielberg', 'Christopher Nolan')
and (star1 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway') 
	and star2 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway') 
	and star3 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway') 
	and star4 not in ('Christian Bale', 'Liam Neeson', 'Heath Ledger', 'Leonardo DiCaprio', 'Anne Hathaway') 
	);
		
		
		
		
12) Display the movie name and watch time (in both mins and hours) which have over 9 imdb rating.

select series_title
,runtime as runtim_mints
,cast(replace(runtime, 'min','')as decimal)/60 as runtime_hrs
,round(replace(runtime, 'min','') :: decimal/60,2) as runtime_hrs
from imdb_top_movies
where imdb_rating > 9;

16) What are the different certificates given to movies?

Select distinct certificate
from imdb_top_movies
order by 1;

Segregate all the Drama and Comedy movies released in the last 10 years as per their runtime. 
Movies shorter than 1 hour should be termed as short film. 
Movies longer than 2 hrs should be termed as longer movies. 
All others can be termed as Good watch time

select * from imdb_top_movies

select series_title as movie_name,
case when round(replace(runtime, 'min','') :: decimal/60,2) < 1 then 'shorter_movie'
	 when round(replace(runtime, 'min','') :: decimal/60,2) > 2 then 'longer_movie'
     else 'Good_to_watch'
	 end as category
from imdb_top_movies
where released_year <> 'PG'
and extract(year from current_date) - released_year :: int <= 10
and (upper (genre) like '%DRAMA%'
OR LOWER (genre) like '%comedy%')
order by category;

 