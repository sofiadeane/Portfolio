-- Ran this code to view the data in students
SELECT * 
    FROM students
;

--Selected the fields relevant to the analysis and created averages
SELECT 	stay, 
		COUNT(*) AS count_int, 
		ROUND(AVG(todep),2) AS average_phq, 
		ROUND(AVG(tosc),2) AS average_scs,
		ROUND(AVG(toas),2) AS average_as
	FROM students
;

-- Filtered out the domestic students
SELECT 	stay, 
		COUNT(*) AS count_int, 
		ROUND(AVG(todep),2) AS average_phq, 
		ROUND(AVG(tosc),2) AS average_scs,
		ROUND(AVG(toas),2) AS average_as
	FROM students

WHERE inter_dom = 'Inter'
;

-- grouped the data by stay and ordered it in a descending order
SELECT 	stay, 
		COUNT(*) AS count_int, 
		ROUND(AVG(todep),2) AS average_phq, 
		ROUND(AVG(tosc),2) AS average_scs,
		ROUND(AVG(toas),2) AS average_as
	FROM students

WHERE inter_dom = 'Inter'

GROUP BY stay
ORDER BY stay DESC
;

-- After analysing the output from the last query I realized i would need to compare the data from the domestic students to the international students to establish a baseline and see if there is a significant deviation between the two groups.
-- I then ran the following query to get the data for the domestic students
SELECT 	stay, 
		COUNT(*) AS count_int, 
		ROUND(AVG(todep),2) AS average_phq, 
		ROUND(AVG(tosc),2) AS average_scs,
		ROUND(AVG(toas),2) AS average_as
	FROM students

WHERE inter_dom = 'Dom'

GROUP BY stay
ORDER BY stay DESC
;


--See conclusions in the Query_Analysis.md file