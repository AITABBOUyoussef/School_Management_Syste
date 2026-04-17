CREATE DATABASE school ;
USE school ;

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    label VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL, 
    password VARCHAR(255) NOT NULL, 
    role_id INT NOT NULL,
   FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE RESTRICT
);


CREATE TABLE classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    classroom_number INT NOT NULL
);


CREATE TABLE courses (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    total_hours INT NOT NULL,
    professor_id INT NOT NULL,
    FOREIGN KEY (professor_id) REFERENCES users(id) ON DELETE RESTRICT
);


CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_of_birth DATE NOT NULL,
    student_number VARCHAR(50) UNIQUE NOT NULL,
    user_id INT UNIQUE NOT NULL, 
    class_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (class_id) REFERENCES classes(id) ON DELETE RESTRICT
);


