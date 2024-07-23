## Food Delivery Data Modeling Project with dbt

### What is dbt?
dbt is a command-line tool that enables data analysts and engineers to transform data in their warehouse more effectively. 

###  Project Overview
This project aims to design and implement a data model for analyzing courier performance in a food delivery business. 

This data model will support various performance metrics and handle high data volumes efficiently using dbt and Snowflake as the data warehouse.

###  Project Structure
The project is structured into multiple stages to ensure reusability, modularity, maintainability, and performance. 

These stages include:

* **Staging** -  cleans, standardizes, and prepares raw data for further processing
* **Intermediate** -  business logic and aggregates data to create useful metrics
* **Core** - dim and fact tables that represent the main analytical data structures 
* **Marts** - provides tailored, highly aggregated data models optimized for specific business needs

## Proposed Data Model
![ER (10)](https://github.com/user-attachments/assets/d1cf9087-7773-4118-b63d-9cab9ceaa7bc)

## ...
