# Student CRUD Web Application

A simple full-stack Java web application for managing student records (Add, View, Update, Delete) using **Servlets, JSP, JDBC**, and **MySQL**. Deployed with **Docker** on **Render** and database hosted on **Clever Cloud**.

## 🌐 Live Demo

👉 [CRUD Portal on Render](https://crud-portal.onrender.com/index.jsp)

---

## 🔧 Features

- Add new student records
- View all students in a table
- Update student information
- Delete student records
- MySQL database integration
- Deployed using Docker + Render

---

## 💻 Tech Stack

| Layer          | Technology                          |
|----------------|-------------------------------------|
| Frontend       | HTML, CSS, Javascript, JSP          |
| Backend        | Java Servlets, JDBC                 |
| Database       | MySQL (Clever Cloud)                |
| Server         | Apache Tomcat 9                     |
| Deployment     | Docker, Render                      |

---
## 🗂️ Project Structure

StudentCRUDApp-/
├── src/
│ └── com/example/ # Servlet Java classes
├── WEB-INF/
│ ├── web.xml # Deployment descriptor
│ └── lib/
│ └── mysql-connector-j-9.3.0.jar
├── index.jsp # Main frontend file
├── Dockerfile # Docker instructions
├── LICENSE
└── README.md
## 🐋 Run with Docker

# Build Docker image
docker build -t student-crud-app .

# Run the container
docker run -p 8080:8080 student-crud-app
## ✅ Features
 - Add Student
 - Update Student
 - Delete Student
 - List All Students

## 🪪 License
- This project is licensed under the MIT License.

# # Made with ❤️ by SELVA

