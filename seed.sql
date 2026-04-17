INSERT INTO roles (label) VALUES ('Admin'), ('Prof'), ('Student');

INSERT INTO classes (name, classroom_number) VALUES 
('Développeur Web 2026', 101),
('Design UI/UX 2026', 102);


INSERT INTO users (first_name, last_name, email, password, role_id) VALUES 
('System', 'Admin', 'admin@ecole.ma', 'hash_password_123', 1),
('Najib', 'Sami', 'najib.prof@ecole.ma', 'hash_password_prof', 2),
('Youssef', 'Ait Abo', 'youssef.dev@ecole.ma', 'hash_password_youssef', 3),
('Amine', 'Alaoui', 'amine.student@ecole.ma', 'hash_password_amine', 3);


INSERT INTO students (date_of_birth, student_number, user_id, class_id) VALUES 
('2000-05-15', 'STD-2026-001', 3, 1),
('2001-09-20', 'STD-2026-002', 4, 1);

INSERT INTO courses (title, description, total_hours, professor_id) VALUES 
('React & JavaScript ES6', 'Maîtriser le front-end moderne', 40, 2),
('SQL & Architecture BD', 'Conception et optimisation de bases de données', 30, 2);

INSERT INTO enrollments (student_id, course_id, enrolled_at, status) VALUES 
(1, 1, '2026-04-16', 'Actif'),
(1, 2, '2026-04-16', 'Actif'),
(2, 1, '2026-04-16', 'Actif');