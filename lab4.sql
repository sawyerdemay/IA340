--Q4.1
/* no, because we still have VA records in other tables */

--Q4.2
/* no, because no state has | fips of 80 */

--Q4.3
/* it works, but can be improved */

--Q4.5
/* yes, great job */

--Q4.6
-- Step 1: Find the most recent year available in the income table
WITH recent_year AS (
    SELECT MAX(year) AS max_year
    FROM income
),

-- Step 2: Find the state(s) with the highest income for that year
highest_income AS (
    SELECT i.fips, i.income, n.name
    FROM income i
    JOIN name n ON i.fips = n.fips
    WHERE i.year = (SELECT max_year FROM recent_year)
    ORDER BY i.income DESC
    LIMIT 1
)

-- Step 3: Select the result
SELECT * FROM highest_income;
/* yes, it wokrs */

--Q4.7
WITH va_population AS (
    SELECT 
        year, 
        pop,
        LAG(pop, 1) OVER (ORDER BY year) AS previous_pop
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 6 -- Get data for the most recent 6 years to calculate the last 5 years growth rate
)

SELECT 
    year,
    pop AS current_population,
    previous_pop AS previous_population,
    (pop - previous_pop) AS absolute_growth,
    ((pop - previous_pop) / NULLIF(previous_pop, 0)::numeric) * 100 AS growth_rate_percentage
FROM va_population
WHERE previous_pop IS NOT NULL
ORDER BY year DESC;
/* calculate the VA population growth in the past five years, did not modify */

--Q4.8
/* No, accurate results are not always produced */
