# SQL Scripts – Caterpillar Emissions Tracker

This folder contains all SQL scripts used to create, populate, and generate reports from the Caterpillar Emissions Tracker database.

---

## 📂 Folder Structure

```text
sql/
├─ README.md # This documentation file
├─ schema/ # DDL and initial data
│ ├─ CREATE_TABLE_queries.sql
│ └─ INSERT_STATEMENTS.sql
└─ reports/ # SQL queries for analytical reports
├─ REPORT_QUERY_1.sql
├─ REPORT_QUERY_2.sql
├─ REPORT_QUERY_3.sql
├─ REPORT_QUERY_4.sql
├─ REPORT_QUERY_5.sql
├─ REPORT_QUERY_6.sql
└─ REPORT_QUERY_7.sql
```

---

## 🏗 Schema Scripts (`schema/`)

- **`CREATE_TABLE_queries.sql`**  
  Contains the Data Definition Language (DDL) commands for creating all database tables with:
  - Primary keys
  - Foreign keys
  - Data types
  - Constraints

- **`INSERT_STATEMENTS.sql`**  
  Contains the Data Manipulation Language (DML) commands to populate tables with sample data for:
  - Users
  - Customers
  - Products
  - Machines
  - Worksites
  - Territories
  - Regulators
  - Pricing
  - Emissions
  - Time dimension

---

## 📊 Report Scripts (`reports/`)

Each `REPORT_QUERY_X.sql` file contains a specific analytical or compliance report query.

| File Name           | Purpose |
|---------------------|---------|
| REPORT_QUERY_1.sql  | Machine emissions summary by customer |
| REPORT_QUERY_2.sql  | Total emissions by worksite and date |
| REPORT_QUERY_3.sql  | Monthly emissions trends per territory |
| REPORT_QUERY_4.sql  | Regulatory compliance report |
| REPORT_QUERY_5.sql  | High emissions alert report |
| REPORT_QUERY_6.sql  | Product-level emissions comparison |
| REPORT_QUERY_7.sql  | Territory-based machine utilization & emissions |

---

## 🚀 How to Use

1. **Create Database**  
   Run `CREATE_TABLE_queries.sql` to set up the database schema.

2. **Insert Data**  
   Run `INSERT_STATEMENTS.sql` to load sample data.

3. **Generate Reports**  
   Run any of the `REPORT_QUERY_X.sql` scripts to view analytical or compliance outputs.

---

## 🛡 Notes

- All queries are compatible with **Oracle SQL** syntax.
- Ensure proper user permissions before running schema or data scripts.
- Modify sample data in `INSERT_STATEMENTS.sql` as needed for different testing scenarios.

---

**Author:** Francisco Figueroa  
**License:** MIT  
