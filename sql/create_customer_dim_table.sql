 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_customer];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_customer]    
(
    customer_ID int identity(1,1) primary key,
    customer_name varchar(250),
    customer_surname varchar(250),
    customer_number varchar(250),
    customer_email_address varchar(250),
    customer_score int
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_customer]
(
    p.[customer_name],
    p.[customer_surname],
    p.[customer_number],
    p.[customer_email_address],
    p.[customer_score]
)

SELECT DISTINCT
    p.[customer_name],
    p.[customer_surname],
    p.[Customer_Contact_Number],
    p.[customer_email_address],
    p.[credit_score]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_customer] AS cus
    WHERE cus.customer_name = p.customer_name
      AND cus.customer_surname = p.customer_surname
      AND cus.customer_number = p.[Customer_Contact_Number]
      AND cus.[customer_email_address] = p.[customer_email_address]
      AND cus.customer_score = p.credit_score
);

Select * from [PC_SALES_STAGING].[dbo].[stg_dim_customer]