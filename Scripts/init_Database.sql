/* Script purpose:
This script creates new database named 'DataWarehouse' 
WARNING:
Using this script will drop all existing data from 'DataWarehouse' if this named Database exists in server. So make sure you check this warning before you proceed to utilise this script.
*/

-- *** CREATING A BRAND NEW DATA WAREHOUSE ***

-- *** CHECKING IF CREATING DATA WAREHOUSE EXISTS ***
IF EXISTS (SELECT 1 FROM sys.databases WHERE name ='DataWarehouse')
-- *** IF EXISTS THEN WE ARE ALTERING DATABASE AND DROPPING IT ***
	BEGIN
		ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
		DROP DATABASE DataWarehouse;
	END;
GO
-- *** AFTER DROPPING OR IF WE WON'T FIND ANY DATA WAREHOUSE THEN WE CREATING NEW ONE ***
CREATE DATABASE DataWarehouse;
GO
-- *** USE CREATED DATA WAREHOUSE ***
USE DataWarehouse

-- *** CREATING SCHEMAS ***

-- *** CREATING BRONZE SCHEMA ***
CREATE SCHEMA bronze;
GO

-- *** CREATING SILVER SCHEMA ***
CREATE SCHEMA silver;
GO

-- *** CREATING GOLD SCHEMA ***
CREATE SCHEMA gold;
GO
