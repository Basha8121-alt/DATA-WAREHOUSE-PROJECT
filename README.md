# DATA-WAREHOUSE-PROJECT
BUILDING A MODERN DATAWAREHOUSE USING SQL SERVER.

# End-to-End Data Warehouse Project with SQL

**Author:** Basha Mohammad  
**Tech Stack:** SQL Server (T-SQL), ETL Pipelines, Data Modeling

---

## 📌 Project Overview
Hello! My name is **Basha Mohammad**, and this repository showcases an end-to-end Data Warehouse implementation built using SQL. 

The primary goal of this project is to consolidate fragmented source data from disparate operational systems—specifically CRM and ERP platforms—into a centralized, high-performance Data Warehouse. By leveraging a structured multi-layer architecture (Bronze, Silver, and Gold), this solution cleanses raw data, establishes dimensional data modeling, and enables reliable analytical reporting.

## 🛠 Architecture & Highlights
* **Medallion Architecture:** Standardized data ingestion across **Bronze** (raw ingestion), **Silver** (data cleansing & standardization), and **Gold** (star-schema analytical models) layers.
* **Automated Ingestion:** Custom stored procedures utilizing T-SQL `BULK INSERT` for efficient batch processing.
* **Data Quality & Integrity:** Robust error handling (`TRY...CATCH`), schema validation, and table-level truncation routines.
