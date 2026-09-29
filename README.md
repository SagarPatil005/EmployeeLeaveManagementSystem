
# Employee Leave Management System (ELMS)

## About the Project

The Employee Leave Management System (ELMS) is a web-based application that helps manage employee leave requests.

Employees can apply for leave and check their leave status, while administrators can manage employee records and approve or reject leave requests.

## Features

- Employee login and admin login
- Employee management
- Department management
- Leave type management
- Apply for leave
- Approve or reject leave requests
- View leave history
- Role-based access

## Technologies Used

- Java 21
- Jakarta Servlet
- JSP
- Hibernate ORM
- MySQL
- HTML, CSS, JavaScript
- Bootstrap
- Apache Tomcat 11
- Maven
- Eclipse IDE

## Project Structure

```text
EmployeeLeaveManagementSystem/
├── src/
│   └── main/
│       ├── java/
│       └── webapp/
├── database/
│   └── elmsdb.sql
├── pom.xml
├── .gitignore
└── README.md
```

## Database Setup

1. Install MySQL.
2. Create the database by importing `database/elmsdb.sql`.
3. Configure your MySQL username and password in `hibernate.cfg.xml`.
4. Make sure the database name matches the configuration.

## How to Run

1. Clone this repository.
2. Import the project into Eclipse as an Existing Maven Project.
3. Update Maven dependencies.
4. Set up the MySQL database.
5. Configure the database credentials.
6. Configure Apache Tomcat 11.
7. Run the project on the server.

## Author

Sagar Patil
