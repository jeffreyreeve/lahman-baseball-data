-- lahman project 4)
/*Using the fielding table, group players into three groups based on their 
position: label players with position OF as "Outfield", those with position
"SS", "1B", "2B", and "3B" as "Infield", and those with position "P" or "C"
as "Battery". Determine the number of putouts made by each of these three 
groups in 2016.*/
SELECT playerid, pos, 
	CASE WHEN pos = 'OF' THEN 'Outfield'
		 WHEN pos = '1B' THEN 'Infield'
		 WHEN pos = '2B' THEN 'Infield'
		 WHEN pos = '3B' THEN 'Infield'
		 WHEN pos = 'SS' THEN 'Infield'
		 ELSE 'Battery' END AS position_description
FROM fielding
WHERE yearid = '2016';

-- Now aggregate 3 categories by po for year 2016
WITH position_categorization AS (SELECT playerid, pos, po,
	CASE WHEN pos = 'OF' THEN 'Outfield'
		 WHEN pos = '1B' THEN 'Infield'
		 WHEN pos = '2B' THEN 'Infield'
		 WHEN pos = '3B' THEN 'Infield'
		 WHEN pos = 'SS' THEN 'Infield'
		 ELSE 'Battery' END AS position_description
		 FROM fielding
		 WHERE yearid = '2016')
SELECT position_description, SUM (po) AS total_put_outs_2016
FROM position_categorization
GROUP BY position_description;