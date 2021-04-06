/*Find the average number of strikeouts per game by decade since 1920. 
Round the numbers you report to 2 decimal places. Do the same for home runs
per game. Do you see any trends?*/
SELECT 
	CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920-1929'
		 WHEN yearid BETWEEN 1930 AND 1939 THEN '1930-1939'
		 WHEN yearid BETWEEN 1940 AND 1949 THEN '1940-1949'
		 WHEN yearid BETWEEN 1950 AND 1959 THEN '1950-1959'
		 WHEN yearid BETWEEN 1960 AND 1969 THEN '1960-1969'
		 WHEN yearid BETWEEN 1970 AND 1979 THEN '1970-1979'
		 WHEN yearid BETWEEN 1980 AND 1989 THEN '1980-1989'
		 WHEN yearid BETWEEN 1990 AND 1999 THEN '1990-1999'
		 WHEN yearid BETWEEN 2000 AND 2009 THEN '2000-2009'
		 WHEN yearid BETWEEN 2010 AND 2019 THEN '2010-2019'
		 END AS decade, ROUND(SUM(so)::decimal/SUM(g)::decimal,2) AS average_strikeouts_per_game
FROM teams 
WHERE yearid >= 1920
GROUP BY decade 
ORDER BY decade;
-- The averge number of strikeouts/game has increased each decade over time.
-- Here's the code for home runs
SELECT 
	CASE WHEN yearid BETWEEN 1920 AND 1929 THEN '1920-1929'
		 WHEN yearid BETWEEN 1930 AND 1939 THEN '1930-1939'
		 WHEN yearid BETWEEN 1940 AND 1949 THEN '1940-1949'
		 WHEN yearid BETWEEN 1950 AND 1959 THEN '1950-1959'
		 WHEN yearid BETWEEN 1960 AND 1969 THEN '1960-1969'
		 WHEN yearid BETWEEN 1970 AND 1979 THEN '1970-1979'
		 WHEN yearid BETWEEN 1980 AND 1989 THEN '1980-1989'
		 WHEN yearid BETWEEN 1990 AND 1999 THEN '1990-1999'
		 WHEN yearid BETWEEN 2000 AND 2009 THEN '2000-2009'
		 WHEN yearid BETWEEN 2010 AND 2019 THEN '2010-2019'
		 END AS decade, ROUND(SUM(hr)::decimal/SUM(g)::decimal,2) AS average_strikeouts_per_game
FROM teams 
WHERE yearid >= 1920
GROUP BY decade 
ORDER BY decade;
/*Home runs/game increased up to the 1970's, then decreased in the 70'& 80's,
then increased up to 2010, then decreased slightly since.*/