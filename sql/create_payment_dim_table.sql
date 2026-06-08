 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_payment];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_payment]    
(
    payment_ID int identity(1,1) primary key,
    payment_method varchar(250),
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_payment]
(
    --p.[Payment_ID],
    p.[payment_method]
)

SELECT DISTINCT
    --p.[Payment_ID],
    p.[payment_method]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_payment] AS p
    WHERE --shop.[Payment_ID] = p.[Payment_ID]
      --AND 
      p.[payment_method] = p.[payment_method]
);

Select * from [PC_SALES_STAGING].[dbo].[stg_dim_payment]