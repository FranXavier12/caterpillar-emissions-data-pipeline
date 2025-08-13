# Caterpillar Emissions Tracker Database System

A relational database system for tracking and managing heavy machinery emissions for Caterpillar Inc., designed to improve environmental compliance and reporting. Includes database schema, sample data, and SQL queries for compliance reports, analytics, and trend analysis. Built as part of the CIS 4900 Capstone Project at Cal State LA.

[![Database](https://img.shields.io/badge/Database-SQL%20Server-blue)](https://www.microsoft.com/en-us/sql-server)
[![SQL](https://img.shields.io/badge/SQL-Queries-lightgrey)](https://en.wikipedia.org/wiki/SQL)
[![Relational Database](https://img.shields.io/badge/Relational-Database-green)](https://en.wikipedia.org/wiki/Relational_database)
[![Data Model](https://img.shields.io/badge/Data-Model-orange)](https://en.wikipedia.org/wiki/Data_model)
[![Environmental Compliance](https://img.shields.io/badge/Environmental-Compliance-brightgreen)](https://en.wikipedia.org/wiki/Environmental_compliance)
[![Emissions Tracking](https://img.shields.io/badge/Emissions-Tracking-yellow)](#)
[![Caterpillar](https://img.shields.io/badge/Caterpillar-Project-blueviolet)](#)
[![Reporting](https://img.shields.io/badge/Reporting-Analytics-lightblue)](#)
[![Sustainable Energy](https://img.shields.io/badge/Sustainable-Energy-darkgreen)](https://en.wikipedia.org/wiki/Sustainable_energy)
[![Compliance Reporting](https://img.shields.io/badge/Compliance-Reporting-red)](#)
[![Data Management](https://img.shields.io/badge/Data-Management-lightblue)](#)
[![ERD](https://img.shields.io/badge/ERD-Diagram-yellowgreen)](#)
[![Sample Data](https://img.shields.io/badge/Sample-Data-lightgrey)](#)

---

## Project Overview
The Caterpillar Emissions Tracker is designed to:
- Store structured data on machines, emissions, prices, customers, worksites, and territories.
- Support environmental compliance reporting.
- Provide sample queries for emissions analysis by product, customer, territory, and time.

The repository includes:
- **Database schema** (DDL)
- **Sample data inserts** (DML)
- **Prebuilt SQL reports**
- **Entity Relationship Diagram (ERD)**
- **Screenshots** of tables and query outputs
- **Documentation** from the final project report

---

## Repository Structure

```text
caterpillar-emissions-tracker/
├─ README.md
├─ .gitignore
├─ LICENSE
├─ docs/
│  ├─ Database_Design_Document.docx
│  ├─ Database_ERD.pdf
│  └─ screenshots/
│     ├─ CETUSER_table.png
│     ├─ CUSTOMER_table.png
│     ├─ EMISSIONS_table.jpg
│     ├─ MACHINE_table.png
│     ├─ PRICE_table.png
│     ├─ PRODUCT_table.png
│     ├─ REGULATOR_table.jpg
│     ├─ TERRITORY_table.png
│     ├─ TIME_table.png
│     ├─ WORKSITE_table.jpg
│     ├─ Report_3.jpg
│     ├─ Report_4.jpg
│     ├─ Report_5.jpg
│     ├─ Report_6.jpg
│     └─ Report_7.jpg
├─ sql/
│  ├─ SQL_README.md
│  ├─ schema/
│  │  ├─ CREATE_TABLE_queries.sql
│  │  └─ INSERT_STATEMENTS.sql
│  └─ reports/
│     ├─ REPORT_QUERY_1.sql
│     ├─ REPORT_QUERY_2.sql
│     ├─ REPORT_QUERY_3.sql
│     ├─ REPORT_QUERY_4.sql
│     ├─ REPORT_QUERY_5.sql
│     ├─ REPORT_QUERY_6.sql
│     └─ REPORT_QUERY_7.sql
└─ setup/
   ├─ INSTALLATION.pdf
   └─ DATA_MODEL.md
```

---

## Getting Started

### 1. Install SQL Server
Download and install **SQL Server** (Developer or Express edition) and **SQL Server Management Studio (SSMS)**.

### 2. Create a New Database
Open SSMS and run:
```sql
CREATE DATABASE CaterpillarEmissions;
```

### 3. Run Schema & Data Scripts
  - Run sql/schema/CREATE_TABLE_queries.sql to create all tables.
	- (Optional) Run sql/schema/INSERT_STATEMENTS.sql to load sample data.
	- (Optional) Run sql/schema/900_indexes_constraints.sql to add constraints & indexes for data integrity and performance.

### 4. Run Reports
Run any of the scripts in sql/reports/ to generate compliance and emissions reports.
Each script is self-contained and uses only the local database.

---

## Sample Reports
The /docs/screenshots/ folder contains example outputs for each report.

Examples include:
	- Compliance by Worksite
	- Compliance by Customer
	- Emissions totals by Product Category
	- Emissions totals by Territory

---

## Notes
- All scripts are designed for local execution; no passwords, IP addresses, or external connections are included.
- Data provided is sample data only.
