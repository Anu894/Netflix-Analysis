SELECT * FROM netflix.netflix1;
#data aggrgation and analysis
#1. Total Shows by Type
SELECT type, COUNT(*) AS total_shows
FROM netflix.netflix1
GROUP BY type;

#2. Average Release Year by Rating
SELECT rating, AVG(release_year) AS avg_release_year
FROM netflix.netflix1
GROUP BY rating
ORDER BY avg_release_year DESC;

#3. Top 5 Most Common Countries
SELECT country, COUNT(*) AS count
FROM netflix.netflix1
GROUP BY country
ORDER BY count DESC
LIMIT 5;

#4. Total Duration of Movies by Type
SELECT type, 
       SUM(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS total_duration
FROM netflix.netflix1
WHERE type = 'Movie'
GROUP BY type;

#5. Count of Shows Added by Year
SELECT YEAR(date_added) AS year_added, COUNT(*) AS total_shows_added
FROM netflix.netflix1
GROUP BY YEAR(date_added)
ORDER BY year_added DESC;

#6. Shows with Duration Greater Than 120 Minutes
SELECT title, duration
FROM netflix.netflix1
WHERE type = 'Movie'
AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 120;

#7. Shows Released in the Last 5 Years
SELECT title, release_year
FROM netflix.netflix1
WHERE release_year >= 2020;

#8. Count of Shows by Director
SELECT director, COUNT(*) AS show_count
FROM netflix.netflix1
WHERE director IS NOT NULL
GROUP BY director
ORDER BY show_count DESC
LIMIT 10;

#9. List Shows with Missing Data
SELECT show_id, title, director, country, date_added
FROM netflix.netflix1
WHERE director IS NULL OR country IS NULL OR rating IS NULL;

#10.  Shows by Genre
SELECT listed_in, COUNT(*) AS show_count
FROM netflix.netflix1
GROUP BY listed_in
ORDER BY show_count DESC
LIMIT 5;





