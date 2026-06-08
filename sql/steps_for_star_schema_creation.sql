-- High overview of process of building Warehouse:

-- 1. Landing zone is raw pc_data.csv ( here we load data)
-- 2. stg_dim_table e.g stg_dim_location
-- 3. clean_dim_table clean_dim_location
-- 4. loading the warehouse dwh_dim_location

Select * from [PC_SALES_STAGING].[dbo].[raw_pc_data]