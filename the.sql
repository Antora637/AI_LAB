Basic Theory of DBMS and SQL

Database Management System (DBMS) is a software system that allows users to create, manage, and manipulate databases efficiently. A database is an organized collection of structured data stored electronically.

In modern systems, the most widely used type is the Relational Database Management System (RDBMS), where data is stored in the form of tables (relations). Each table consists of rows (tuples) and columns (attributes).

Structured Query Language (SQL) is the standard language used to interact with relational databases. It is used to perform various operations such as creating tables, inserting data, updating records, deleting data, and retrieving information.

🔹 Types of SQL Commands

SQL commands are mainly divided into the following categories:

Data Definition Language (DDL):
Used to define and modify the structure of database objects.
Examples: CREATE, ALTER, DROP
Data Manipulation Language (DML):
Used to manipulate data stored in tables.
Examples: INSERT, UPDATE, DELETE
Data Query Language (DQL):
Used to retrieve data from the database.
Example: SELECT
Data Control Language (DCL):
Used to control access to data.
Examples: GRANT, REVOKE
🔹 Keys in Database

Keys are used to uniquely identify records and maintain relationships between tables:

Primary Key: Uniquely identifies each record in a table and cannot be NULL.
Foreign Key: Creates a relationship between two tables by referring to a primary key in another table.
Candidate Key: A set of attributes that can uniquely identify a record.
Composite Key: A key formed using more than one column.
🔹 Constraints

Constraints are rules applied to table columns to ensure data integrity:

NOT NULL – Ensures that a column cannot have NULL values
UNIQUE – Ensures all values are different
CHECK – Ensures a condition is satisfied
DEFAULT – Assigns a default value
🔹 SQL Joins

Joins are used to combine data from multiple tables:

INNER JOIN: Returns matching records from both tables
LEFT JOIN: Returns all records from the left table and matched records from the right
RIGHT JOIN: Returns all records from the right table and matched records from the left
🔹 Normalization

Normalization is the process of organizing data to reduce redundancy and improve data integrity. Common normal forms include:

First Normal Form (1NF): Removes repeating groups
Second Normal Form (2NF): Removes partial dependency
Third Normal Form (3NF): Removes transitive dependency
🔹 Views and Triggers
View: A virtual table based on a SQL query, used for security and simplification
Trigger: A set of instructions that automatically executes in response to certain events (INSERT, UPDATE, DELETE)
✅ Conclusion

SQL is an essential tool for managing relational databases. It provides a simple and efficient way to store, retrieve, and manipulate data while maintaining integrity and consistency.