///No1

SELECT * FROM regions
INNER JOIN countries
ON regions.region_id = countries.region_id
WHERE region_name = 'Europe'



///No2

SELECT countries.region_id,region_name,count(countries.region_id)Total_countries 
FROM regions,countries
GROUP BY countries.region_id,region_name
ORDER BY countries.region_id

///No3

SELECT * FROM countries
RIGHT JOIN locations
ON countries.country_id = locations.country_id
WHERE region_id = 1
ORDER BY country_name


///No4
SELECT * FROM departments
WHERE location_id <= 1800 


///No5

SELECT region_name,COUNT(department_id)total_department
	FROM regions 
	    JOIN countries USING (region_id)
		JOIN locations USING (country_id) 
		JOIN departments USING (location_id) 
GROUP BY region_name;


///No6
SELECT country_name,COUNT(department_id)total_department
	FROM countries 
		JOIN locations USING (country_id) 
		JOIN departments USING (location_id) 
GROUP BY country_name;


///No7
SELECT country_name,COUNT(department_id)total_department
	FROM countries 
		JOIN locations USING (country_id) 
		JOIN departments USING (location_id) 
GROUP BY country_name
HAVING COUNT(department_id)>=7;


///No8

SELECT departments.department_id,department_name,COUNT(employee_id)emp
    FROM departments
         JOIN employees using (department_id)
GROUP BY departments.department_id,department_name
ORDER BY COUNT(employee_id)


///No9

SELECT departments.department_id,department_name,COUNT(employee_id)emp
FROM departments
JOIN employees using (department_id)
JOIN locations using (location_id)
WHERE country_id = 'US'
GROUP BY departments.department_id,department_name
ORDER BY COUNT(employee_id)


///No10


