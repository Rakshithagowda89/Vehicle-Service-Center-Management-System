Vehicle Service Center Management System

## Project Description

The **Vehicle Service Center Management System** is a database management project designed to manage the day-to-day activities of a vehicle service center.

The system stores and manages information about customers, their vehicles, mechanics, vehicle servicing, and billing. It helps organize service-related information in a structured database and makes it easier to store, retrieve, and manage records.

## Objectives

The main objectives of this project are:

- To maintain customer information.
- To store vehicle details.
- To maintain mechanic information.
- To record vehicle service details.
- To manage service status and service records.
- To maintain billing information.
- To establish relationships between customers, vehicles, mechanics, services, and bills.

## Database Name

```text
vehicle_service_center_management_system
```

## Database Tables

The database contains the following five tables:

### 1. Customers

The `customers` table stores information about customers.

It contains details such as:

- Customer ID
- Customer Name
- Phone Number
- Email
- Address

### 2. Vehicles

The `vehicles` table stores information about vehicles belonging to customers.

It contains details such as:

- Vehicle ID
- Customer ID
- Vehicle Number
- Vehicle Model
- Vehicle Type

The `customer_id` connects a vehicle with its customer.

### 3. Mechanics

The `mechanics` table stores information about mechanics working at the service center.

It contains details such as:

- Mechanic ID
- Mechanic Name
- Specialization
- Phone Number

### 4. Service Records

The `service_records` table stores information about vehicle services.

It contains details such as:

- Service ID
- Vehicle ID
- Mechanic ID
- Service Date
- Service Type
- Service Status
- Service Cost

This table connects vehicles with the mechanics who perform the services.

### 5. Bills

The `bills` table stores billing information related to vehicle services.

It contains details such as:

- Bill ID
- Service ID
- Bill Date
- Total Amount
- Payment Status

## Database Relationships

The main relationships between the tables are:

```text
Customers
    │
    │ 1 : Many
    ↓
Vehicles
    │
    │ 1 : Many
    ↓
Service Records
    ↑
    │
    │ Many : 1
    │
Mechanics

Service Records
    │
    │ 1 : 1
    ↓
Bills
```

### Relationship Explanation

- One customer can have multiple vehicles.
- One vehicle can have multiple service records.
- One mechanic can handle multiple service records.
- A service record is associated with a bill.

## Technologies Used

- **MySQL**
- **MySQL Workbench**
- **SQL**

## SQL Concepts Used

This database project uses several SQL concepts, including:

- CREATE DATABASE
- CREATE TABLE
- INSERT
- PRIMARY KEY
- FOREIGN KEY
- AUTO_INCREMENT
- NOT NULL
- DEFAULT
- SELECT
- UPDATE
- DELETE
- Table relationships

## Project Structure

```text
Vehicle-Service-Center-Management-System
│
├── README.md
│
└── Database
    └── vehicle_service_center_management_system.sql
```

## Database File

The complete database backup is available here:

```text
Database/vehicle_service_center_management_system.sql
```

The SQL file contains the table structures and sample data for the project.

## How to Use the Database

### Step 1: Open MySQL Workbench

Open MySQL Workbench and connect to your MySQL server.

### Step 2: Import the SQL File

Download the following file from this repository:

```text
vehicle_service_center_management_system.sql
```

Then import the SQL file into MySQL Workbench.

### Step 3: View the Tables

After importing, refresh the **Schemas** section.

You should see:

```text
vehicle_service_center_management_system
│
└── Tables
    ├── bills
    ├── customers
    ├── mechanics
    ├── service_records
    └── vehicles
```

### Step 4: View the Data

The data can be viewed using SQL queries such as:

```sql
USE vehicle_service_center_management_system;

SELECT * FROM customers;

SELECT * FROM vehicles;

SELECT * FROM mechanics;

SELECT * FROM service_records;

SELECT * FROM bills;
```

## Conclusion

The Vehicle Service Center Management System provides a structured way to manage important service center information using a relational database. It demonstrates the use of MySQL and SQL for storing data, creating relationships between tables, and managing vehicle service and billing records.
