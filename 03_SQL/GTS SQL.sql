/* =========================================================
   Global Tech Startup Financial & Investment Intelligence
   ========================================================= */
   
   --Total number of startups--
SELECT 
COUNT(DISTINCT Company_ID) AS Total_Startups
FROM GTS;


--=========================================================--

--	Total_Funding --
SELECT 
SUM (Total_Funding_USD_Millions) AS Total_Funding_USD_Millions
FROM GTS;


--=========================================================--

--  Total_Valuation  --
SELECT 
SUM (Valuation_USD_Millions) AS Total_Valuation_USD_Millions
FROM GTS;


--=========================================================--

--  Total_ARR  --
SELECT 
SUM (Revenue_ARR_Millions) AS Total_ARR
FROM GTS;


--=========================================================--

--  Average_Runway   --
SELECT 
AVG (Runway_Months_2024) AS Average_Runway 
FROM GTS;


--=========================================================--

--  Average_Burn_Rate   --
SELECT 
AVG (Monthly_Burn_Rate_Millions) AS Average_Burn_Rate
FROM GTS;


--=========================================================--

--  Burn-to-Revenue_%   --
SELECT 
((SUM(Monthly_Burn_Rate_Millions) * 12) / SUM(Revenue_ARR_Millions))*100
AS Burn_to_Revenue_Percent
FROM GTS;


--=========================================================--

--  Capital_Efficiency   --
SELECT 
    SUM(Revenue_ARR_Millions) / SUM(Total_Funding_USD_Millions)
    AS Capital_Efficiency
FROM GTS;


--=========================================================--

--  Valuation / Revenue Multiple  --
SELECT 
    SUM(Valuation_USD_Millions) / SUM(Revenue_ARR_Millions)
    AS Valuation_Revenue_Multiple 
FROM GTS;


--=========================================================--

--  Total Layoffs   --
SELECT 
    SUM(Layoffs_2024_2025) 
    AS Total_Layoffs
FROM GTS;


--=========================================================--

--  Layoff Rate %  --
SELECT 
    CAST(SUM(Layoffs_2024_2025) * 100.0 
         / SUM(Peak_Headcount_2023) AS DECIMAL(10,2))
    AS Layoff_Percentage
FROM GTS;


--=========================================================--

--  Headcount Retention %  --
SELECT 
    (CAST(SUM(Current_Headcount_2026) AS DECIMAL(10,2)) 
     / NULLIF(SUM(Peak_Headcount_2023), 0)) * 100
    AS Headcount_Retention_Percentage
FROM GTS;


--=========================================================--

--  Independent %  --
SELECT 
    CAST(
        SUM(CASE 
                WHEN Acquisition_Status = 'Independent' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Independent_Percentage
FROM GTS;


--=========================================================--

--  Acquired %  --
SELECT 
    CAST(
        SUM(CASE 
                WHEN Acquisition_Status = 'Acquired' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Acquired_Percentage
FROM GTS;


--=========================================================--

--  Fire Sale %  --
SELECT 
    CAST(
        SUM(CASE 
                WHEN Acquisition_Status = 'Acquired (Fire Sale)' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Fire_Sale_Percentage
FROM GTS;


--=========================================================--

--  Closed %  --
SELECT 
    CAST(
        SUM(CASE 
                WHEN Acquisition_Status = 'Closed' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS Closed_Percentage
FROM GTS;


--=========================================================--

--  IPO %  --
SELECT 
    CAST(
        SUM(CASE 
                WHEN Acquisition_Status = 'IPO' THEN 1 
                ELSE 0 
            END) * 100.0 / COUNT(*)
        AS DECIMAL(5,2)
    ) AS IPO_Percentage
FROM GTS;


--=========================================================--