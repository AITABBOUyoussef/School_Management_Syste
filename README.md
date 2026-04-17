#   Base de Données - Système de Gestion Scolaire

##  Objectif du Projet
Ce projet consiste à concevoir et implémenter une base de données relationnelle normalisée et sécurisée pour la gestion d'un établissement scolaire. L'architecture répond à des exigences précises de gestion des identités, de structure académique et d'inscriptions aux cours.

---

##  Documentation : Explication des Choix de Relations

Dans le cadre de ce projet, plusieurs types de relations ont été mis en place pour garantir l'intégrité des données et éviter la redondance (respect des Formes Normales). Voici la justification technique de chaque relation :

### 1. Relation "Un-à-Un" (1:1)
**Entités :** `users` ↔ `students`
* **Explication :** Chaque profil étudiant doit être rattaché à un compte utilisateur unique pour l'authentification. Un utilisateur ne peut avoir qu'un seul profil étudiant, et un profil étudiant appartient à un seul utilisateur.
* **Implémentation :** Une clé étrangère `user_id` a été ajoutée dans la table `students`, accompagnée de la contrainte **`UNIQUE`**.
* **Comportement de suppression :** `ON DELETE CASCADE`. Si le compte utilisateur est supprimé de la plateforme, son profil étudiant est automatiquement supprimé pour éviter les données orphelines.

### 2. Relations "Un-à-Plusieurs" (1:N)
Ce type de relation est le plus utilisé dans notre architecture pour structurer la hiérarchie des données.

* **A. `roles` ↔ `users` :** * Un rôle (ex: Admin, Prof, Student) peut être attribué à plusieurs utilisateurs, mais un utilisateur n'a qu'un seul rôle strict (US2).
  * **Contrainte :** `ON DELETE RESTRICT` sur la clé `role_id` dans `users` pour empêcher la suppression d'un rôle s'il est encore utilisé par des comptes actifs.

* **B. `classes` ↔ `students` :** * Une classe (ex: "Développeur Web 2026") accueille plusieurs étudiants, mais un étudiant est assigné à une seule classe fixe pour son cursus.
  * **Contrainte :** Clé étrangère `class_id` dans la table `students`.

* **C. `users` (Professeurs) ↔ `courses` :** * Un professeur peut enseigner plusieurs matières, mais un cours spécifique est dispensé par un seul professeur (US4).
  * **Contrainte :** Clé étrangère `professor_id` dans la table `courses`.

### 3. Relation "Plusieurs-à-Plusieurs" (N:M)
**Entités :** `students` ↔ `courses`
* **Explication :** Le système académique exige qu'un étudiant puisse s'inscrire à plusieurs matières, et qu'une matière soit suivie par plusieurs étudiants simultanément (US6).
* **Implémentation :** Les bases de données relationnelles ne gérant pas le N:M nativement, une **table de jointure** nommée `enrollments` a été créée. Elle contient deux clés étrangères : `student_id` et `course_id`.
* **Sécurité & Intégrité :** Pour répondre à la contrainte stricte exigeant qu'un même étudiant ne puisse pas s'inscrire deux fois au même cours, une **Clé Unique Composée** (`UNIQUE(student_id, course_id)`) a été implémentée sur cette table de jointure.

---

##  Optimisation et Contraintes Supplémentaires
* **Types de données optimisés :** Utilisation de `VARCHAR` avec des limites adaptées, `DATE` pour les naissances, et `ENUM('Actif', 'Terminé')` pour le statut des inscriptions afin d'optimiser l'espace disque.
* **Unicité :** Les champs sensibles comme l'Email dans `users` et le Numéro d'étudiant dans `students` sont protégés par la contrainte `UNIQUE`.