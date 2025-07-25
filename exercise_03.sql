-- =============================================
-- OBJECTIVE: Retrieve all US cities with >100K population
-- CONDITIONS:
--    - CountryCode = 'USA'
--    - Population > 100000
-- OUTPUT: All columns from CITY table
-- TABLE SCHEMA:
--    CITY (ID, NAME, COUNTRYCODE, DISTRICT, POPULATION)
-- =============================================

-- CITY:
-- +-------------+---------------+
-- | Field       | Type         |
-- +-------------+---------------+
-- | ID          | NUMBER        |
-- | NAME        | VARCHAR2(17)  |
-- | COUNTRYCODE | VARCHAR2(3)   |
-- | DISTRICT    | VARCHAR2(20)  |
-- | POPULATION  | NUMBER        |
-- +-------------+---------------+

SELECT *
FROM CITY
WHERE ( COUNTRYCODE = 'USA'AND POPULATION > 100000)