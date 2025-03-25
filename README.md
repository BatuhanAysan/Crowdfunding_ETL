# Crowdfunding Database Project

## 📌 Overview

This project focuses on designing and building a relational database system to manage crowdfunding campaign data. Starting from raw Excel files, the data was cleaned, transformed, and loaded into a PostgreSQL database. An Entity-Relationship Diagram (ERD) was created to define the database schema, and SQL scripts were used to generate tables and import cleaned data.

The final result is a normalized and query-ready database, structured to support analysis of crowdfunding campaigns, their categories, outcomes, and associated contacts.

---

## 📁 Resources

The project uses the following initial resources:

- `crowdfunding.xlsx`  
- `contacts.xlsx`

These files were provided as raw data and used as the foundation for building the database.

---

## 🧹 Data Cleaning and Transformation

The data cleaning and preparation steps were performed using Python (pandas) in a Jupyter Notebook. Below is a summary of the techniques and steps used to prepare the data for PostgreSQL import.

### 📂 1. Category & Subcategory DataFrames

- The combined `"category & sub-category"` column in the main dataset was split into two separate columns: `"category"` and `"subcategory"` using `.str.split()`.
- Unique values from each were extracted using `.unique()`.
- Custom category and subcategory IDs were generated using list comprehensions:
  - Category IDs: `cat1` to `cat9`
  - Subcategory IDs: `subcat1` to `subcat24`
- Two separate DataFrames (`category_df` and `subcategory_df`) were created and exported as CSV files.

### 📂 2. Campaign DataFrame

- A new DataFrame was built with selected and renamed columns:
  - `"blurb"` was renamed to `"description"`.
  - `"launched_at"` and `"deadline"` were renamed and converted to datetime format.
  - `"goal"` and `"pledged"` columns were converted to float.
- The proper `category_id` and `subcategory_id` values were mapped from the created category/subcategory CSVs.
- A unique `contact_id` was also added based on data in `contacts.xlsx`.
- The cleaned campaign DataFrame was saved as `campaign.csv`.

### 📂 3. Contacts DataFrame

- The `contacts.xlsx` file was read with an offset header using `header=3`.
- The `"contact_info"` column, which contained JSON strings, was parsed using `json.loads()` in a loop.
- The parsed data was used to create a new DataFrame with `"contact_id"`, `"name"`, and `"email"`.
- The `"name"` column was split into `"first_name"` and `"last_name"` using `.str.split()`.
- After dropping the original `"name"` column, the final DataFrame was reordered and exported as `contacts.csv`.

---

## 🧱 Database Schema Design

An Entity-Relationship Diagram (ERD) was created using QuickDBD. The schema follows normalization principles, with separate tables for categories, subcategories, campaigns, and contacts.

### Schema Summary

#### `campaign`
- `cf_id` (PK)  
- `contact_id` (FK)  
- `company_name`  
- `description`  
- `goal`  
- `pledged`  
- `outcome`  
- `backers_count`  
- `country`  
- `currency`  
- `launched_date`  
- `end_date`  
- `category_id` (FK)  
- `subcategory_id` (FK)  

#### `contacts`
- `contact_id` (PK)  
- `first_name`  
- `last_name`  
- `email`  

#### `category`
- `category_id` (PK)  
- `category`  

#### `subcategory`
- `subcategory_id` (PK)  
- `subcategory`  

---

## 🛠️ Database Implementation

Using PostgreSQL, a new database was created and populated as follows:

1. **SQL Table Creation:**  
   Tables were created using the `crowdfunding_db_schema.sql` file generated from QuickDBD.

2. **CSV Import:**  
   Cleaned CSV files were imported using PostgreSQL's `COPY` command or pgAdmin’s import tool.

3. **Foreign Key Constraints:**  
   Relationships were enforced via foreign key constraints to ensure data consistency across tables.

---

## 📊 Key Skills Demonstrated

- Data Cleaning and Wrangling with Python (pandas)  
- JSON Parsing and Nested Data Handling  
- Database Design and Normalization  
- SQL Script Writing and ERD Planning  
- PostgreSQL Database Management  
- ETL (Extract, Transform, Load) Process  

---

## 🔚 Conclusion

This project demonstrates the full pipeline of transforming raw business data into a structured relational database. It provides a strong foundation for further analytical tasks and showcases technical proficiency in data processing and database management.
