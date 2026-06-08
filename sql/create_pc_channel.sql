 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_sale_channel];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_sale_channel]    
(
    channel_ID int identity(1,1) primary key,
    channel varchar(250)
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_sale_channel]
(
    p.[channel]
)

SELECT DISTINCT
    p.[channel]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_sale_channel] AS p
    WHERE p.[channel] = p.[channel]
);

Select * from [PC_SALES_STAGING].[dbo].[stg_dim_sale_channel]