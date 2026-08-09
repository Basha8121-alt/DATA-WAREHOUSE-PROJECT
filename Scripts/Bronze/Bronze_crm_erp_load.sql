/*
===================================================================================
Stored Procedure: bronze.SP_load_bronze
===================================================================================
PURPOSE:
    This procedure orchestrates the Full Load ETL process for the Data Warehouse 
    Bronze Layer. It ingests raw CSV datasets from local CRM and ERP source files, 
    truncates existing target tables, and bulk inserts fresh data. It also captures 
    and logs execution durations for individual tables and the overall batch process.

WARNINGS & DEPLOYMENT NOTES:
    1. DESTRUCTIVE DATA OVERWRITE:
       This procedure uses `TRUNCATE TABLE` on all target tables before loading. 
       Executing this will permanently delete all existing data in the Bronze schema.
    
    2. HARDCODED FILE PATHS:
       The `BULK INSERT` paths are currently set to absolute local Windows user 
       directories (e.g., 'C:\Users\VICE MB...'). You MUST update these file paths 
       to match your server's local directory or shared network UNC path before 
       running in a new environment.

    3. SQL SERVER PERMISSIONS:
       Executing `BULK INSERT` requires `ADMINISTER BULK OPERATIONS` or `INSERT` 
       permissions on the target tables, along with OS-level read access to the 
       specified CSV file directories for the SQL Server Service Account.
===================================================================================
*/
-- *** CREATING STORED PROCEDURE FOR BRONZE LOAD ***
CREATE OR ALTER PROCEDURE bronze.SP_load_bronze AS
BEGIN
 DECLARE @load_start_time DATETIME, @load_end_time DATETIME, @Batch_Start_time DATETIME, @Batch_end_time DATETIME;
	BEGIN TRY
		PRINT'|||||||||||||||||||||||||||||||||||||||||||||';
		PRINT'Bacth Duration Started';
		PRINT'|||||||||||||||||||||||||||||||||||||||||||||';
		SET @Batch_Start_time = GETDATE();
		-- *** INSERTING DATA INTO BRONZE CRM AND ERP TABLES ***
		PRINT'=============================================================';
		PRINT '-- *** Start inserting data to bronze crm tables ***';
		PRINT'=============================================================';
		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.crm_cust_info if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.crm_cust_info;
		PRINT'-- *** Bulk inserting data to table bronze.crm_cust_info ***';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT Count(*) FROM bronze.crm_cust_info;

		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.crm_prd_info if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.crm_prd_info;
		PRINT'-- *** Bulk inserting data to table bronze.crm_prd_info ***';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT Count(*) FROM bronze.crm_prd_info;

		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.crm_sales_details if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.crm_sales_details;
		PRINT'-- *** Bulk inserting data to table bronze.crm_sales_details ***';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT count(*) FROM bronze.crm_sales_details;

		PRINT'=============================================================';
		PRINT '-- *** Start inserting data to bronze erp tables ***';
		PRINT'=============================================================';
		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.erp_CUST_AZ12 if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.erp_CUST_AZ12;
		PRINT'-- *** Bulk inserting data to table bronze.erp_CUST_AZ12 ***';
		BULK INSERT bronze.erp_CUST_AZ12
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT COUNT(*) FROM bronze.erp_CUST_AZ12

		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.erp_LOC_A101 if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.erp_LOC_A101;
		PRINT'-- *** Bulk inserting data to table bronze.erp_LOC_A101 ***';
		BULK INSERT bronze.erp_LOC_A101
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT COUNT(*) FROM bronze.erp_LOC_A101

		SET @load_start_time = GETDATE();
		PRINT'------------------------------------------------------------------';
		PRINT'-- *** Truncating table bronze.erp_PX_CAT_G1V2 if old data exists ***';
		PRINT'------------------------------------------------------------------';
		TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;
		PRINT'-- *** Bulk inserting data to table bronze.erp_PX_CAT_G1V2 ***'
		BULK INSERT bronze.erp_PX_CAT_G1V2
		FROM 'C:\Users\VICE MB.VICE23MB\OneDrive\Desktop\SQL files\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH(
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
			);
		SET @load_end_time = GETDATE();
		PRINT'>>>>LOADING DURATION '+CAST(DATEDIFF(second,@load_start_time,@load_end_time) AS NVARCHAR)+' Seconds';
		PRINT'++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
		-- SELECT COUNT(*) FROM bronze.erp_PX_CAT_G1V2

		SET @Batch_end_time = GETDATE();
		PRINT'|||||||||||||||||||||||||||||||||||||||||||||';
		PRINT'Bacth Duration ended '+ CAST(DATEDIFF(second,@Batch_Start_time,@Batch_end_time) AS NVARCHAR)+' Seconds';
		PRINT'|||||||||||||||||||||||||||||||||||||||||||||';

	END TRY
	BEGIN CATCH
		PRINT'---------------------------------------------';
		PRINT'ERROR OCCURED DURING BRONZE LAYER EXECUTION';
		PRINT'Error message'+ ERROR_MESSAGE();
		PRINT'Error number'+ CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT'Error message'+ CAST(ERROR_STATE()AS NVARCHAR);
		PRINT'---------------------------------------------';
	END CATCH

END

-- *** FOR Exceution the Stored procedure use this "EXEC bronze.SP_load_bronze" ****
