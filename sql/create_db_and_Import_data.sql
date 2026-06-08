USE PC_SALES_STAGING



--PC_SALES_WAREHOUSE

-- 1. Landing zone is raw pc_data.csv 
-- 2. stg_dim_table e.g stg_dim_location


 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_location];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_location]    
(
    Location_ID int identity(1,1) primary key,
    Continent varchar(250),
    Country_or_State varchar(250),
    Province_or_City varchar(250)
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_location]
(
    Continent,
    Country_or_State,
    Province_or_City
)
SELECT DISTINCT
    p.[Continent],
    p.[Country_or_State],
    p.[Province_or_City]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_location] loc
    WHERE loc.Continent = p.Continent
      AND loc.Country_or_State = p.Country_or_State
      AND loc.Province_or_City = p.Province_or_City
);

USE PC_SALES_STAGING

Select * from stg_dim_location

 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_location];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_location]    
(
    Location_ID int identity(1,1) primary key,
    Continent varchar(250),
    Country_or_State varchar(250),
    Province_or_City varchar(250)
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_location]
(
    Continent,
    Country_or_State,
    Province_or_City
)
SELECT DISTINCT
    p.[Continent],
    p.[Country_or_State],
    p.[Province_or_City]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_location] loc
    WHERE loc.Continent = p.Continent
      AND loc.Country_or_State = p.Country_or_State
      AND loc.Province_or_City = p.Province_or_City
);