--Select * from [PC_SALES_STAGING].[dbo].[raw_pc_data]

 -- 1. Drop the table if it already exists
DROP TABLE IF EXISTS [PC_SALES_STAGING].[dbo].[stg_dim_pc_spec];

-- 2. Create the table
CREATE TABLE [PC_SALES_STAGING].[dbo].[stg_dim_pc_spec]    
(
    pc_ID int identity(1,1) primary key,
    pc_make varchar(250),
    pc_model varchar(250),
    pc_ram varchar(250),
    pc_storage_type varchar(250),
    pc_storage_capacity varchar(250)
);

-- 3. Insert the distinct data (No NOT EXISTS needed because the table is empty)
-- Insert only new data into the existing table
INSERT INTO [PC_SALES_STAGING].[dbo].[stg_dim_pc_spec]
(
    --p.[pc_ID],
    p.[pc_make],
    p.[pc_model],
    p.[pc_ram],
    p.[pc_storage_type],
    p.[pc_storage_capacity]
)

SELECT DISTINCT
    --p.[pc_ID],
    p.[pc_make],
    p.[pc_model],
    p.[ram],
    p.[storage_type],
    p.[storage_capacity]
FROM [PC_SALES_STAGING].[dbo].[raw_pc_data] p
WHERE NOT EXISTS (
    SELECT 1
    FROM [PC_SALES_STAGING].[dbo].[stg_dim_pc_spec] AS p
    WHERE 
    --p.[pc_ID] = p.[pc_ID]
      --AND 
      p.[pc_make] = p.[pc_make]
      AND p.[pc_model] = p.[pc_model]
      AND p.[pc_ram] = p.[pc_ram]
      AND p.[pc_storage_type] = p.[pc_storage_type]
      AND p.[pc_storage_capacity] = p.[pc_storage_capacity]
);

Select * from [PC_SALES_STAGING].[dbo].[stg_dim_pc_spec]