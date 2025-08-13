# Caterpillar Emissions Tracker – Data Model

This document describes the **logical** and **physical** data model for the Caterpillar Emissions Tracker database.  
It includes entity descriptions, relationships, and a high-level overview of the system’s design objectives.

---

## 🎯 Purpose of the Data Model

The Caterpillar Emissions Tracker database was designed to:
- Record emissions data for heavy machinery across worksites and territories
- Support compliance reporting for regulators
- Enable business analysis of machine usage, emissions patterns, and pricing
- Provide role-based access for different types of users

---

## 📊 Entities and Relationships

The data model is based on **nine primary tables**:

| Table Name       | Description |
|------------------|-------------|
| **CETUSER**      | Stores system users and roles (admin, regulator, customer rep) |
| **CUSTOMER**     | Holds information about clients who own or operate machinery |
| **MACHINE**      | Catalog of heavy machinery tracked for emissions |
| **PRODUCT**      | Details of machinery models and product specifications |
| **PRICE**        | Pricing details for different products or services |
| **EMISSIONS**    | Records emission measurements tied to machines, dates, and worksites |
| **WORKSITE**     | Locations where machinery operates |
| **TERRITORY**    | Geographic regions for regulatory and sales purposes |
| **TIME**         | Date and time dimension table for reporting and analysis |
| **REGULATOR**    | Entities overseeing compliance with environmental laws |

---

## 🔗 Relationships Overview

- **CUSTOMER** ↔ **MACHINE**:  
  One customer can own multiple machines.
- **MACHINE** ↔ **PRODUCT**:  
  Each machine is of a specific product model.
- **MACHINE** ↔ **EMISSIONS**:  
  Each emissions record belongs to a specific machine.
- **WORKSITE** ↔ **EMISSIONS**:  
  Each emissions record is linked to the worksite where it was recorded.
- **TERRITORY** ↔ **WORKSITE**:  
  Each worksite belongs to a specific territory.
- **TIME** ↔ **EMISSIONS**:  
  Time dimension supports temporal analysis (daily, monthly, yearly trends).
- **REGULATOR** ↔ **TERRITORY**:  
  Each territory is regulated by one or more regulatory bodies.

---

## 🗄 Primary Keys & Foreign Keys

Below is a simplified key mapping:

| Table      | Primary Key | Foreign Keys |
|------------|-------------|--------------|
| CETUSER    | user_id     | territory_id (optional) |
| CUSTOMER   | customer_id | territory_id |
| MACHINE    | machine_id  | customer_id, product_id |
| PRODUCT    | product_id  | — |
| PRICE      | price_id    | product_id |
| EMISSIONS  | emissions_id| machine_id, worksite_id, time_id |
| WORKSITE   | worksite_id | territory_id |
| TERRITORY  | territory_id| regulator_id |
| TIME       | time_id     | — |
| REGULATOR  | regulator_id| — |

---

## 🖼 Entity Relationship Diagram (ERD)

The ERD can be found here:  
📄 `/docs/Database_ERD.pdf`  

This diagram visually represents:
- All entities
- Primary and foreign key relationships
- Cardinality (one-to-many, many-to-one)

---

## 📂 Data Flow

1. **Data Entry**  
   - Operators or automated sensors submit emissions data.
2. **Storage**  
   - Data is stored in `EMISSIONS`, linked to `MACHINE`, `WORKSITE`, and `TIME`.
3. **Analysis**  
   - SQL queries aggregate and filter data for compliance and performance.
4. **Reporting**  
   - Reports are generated for regulators, customers, and internal stakeholders.

---

## 🛡 Data Integrity & Constraints

- **Foreign Key Constraints** ensure that references are valid.
- **NOT NULL Constraints** enforce mandatory fields such as primary keys and required attributes.
- **Check Constraints** (e.g., emissions values must be non-negative).
- **Unique Constraints** on certain identifiers (e.g., machine serial numbers).

---

## 📈 Scalability & Extensions

The model supports:
- Adding new emission types (e.g., CO₂, NOx, particulate matter)
- Linking to IoT sensor streams
- Expanding to multiple regulatory jurisdictions
- Time-series analysis for predictive modeling

---

**Author:** Francisco Figueroa  
**License:** MIT  
