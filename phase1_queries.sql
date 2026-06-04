-- Phase 1: World Population Analysis
-- Dataset: world_population table (233 countries, 17 columns)

-- 1. Total population per continent sorted highest to lowest 
SELECT "Continent",
       SUM("2022 Population") AS total_population
FROM world_population
GROUP BY "Continent"
ORDER BY total_population DESC;

-- 2. Top 10 least densely populated countries
SELECT "Country/Territory",
       "Continent",
       "Density (per km²)" AS density
FROM world_population
ORDER BY "Density (per km²)" ASC
LIMIT 10;

-- 3. African countries with 2022 population over 50 million
SELECT "Country/Territory",
       "2022 Population"
FROM world_population
WHERE "Continent" = 'Africa'
AND "2022 Population" >= 50000000
ORDER BY "2022 Population" DESC;

-- 4. Count of countries and average density per continent
SELECT "Continent",
       COUNT("Country/Territory") AS country_count,
       ROUND(AVG("Density (per km²)")::numeric, 2) AS avg_density
FROM world_population
GROUP BY "Continent"
ORDER BY country_count DESC;

-- 5. Continents with 'a' in name and average population over 20 million
SELECT "Continent",
       COUNT("Country/Territory") AS country_count,
       ROUND(AVG("2022 Population")::numeric, 0) AS avg_population
FROM world_population
WHERE "Continent" LIKE '%a%'
GROUP BY "Continent"
HAVING AVG("2022 Population") > 20000000
ORDER BY avg_population DESC;