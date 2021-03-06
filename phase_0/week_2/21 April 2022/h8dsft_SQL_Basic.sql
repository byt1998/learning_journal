CREATE TABLE courses (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name varchar(20),
    teachers_id INT,
    total_students INT
    );

INSERT INTO courses (name, teachers_id, total_students)
    VALUES  ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);
            
select count(*) from teachers;
select count(*) from courses;

-- Carilah dosen yang memiliki gaji tertinggi per masing-masing mata kuliah. 
-- Tampilkan semua atribut dosen dan semua atribut mata kuliahnya. 
-- Urutkan hasilnya berdasarkan nama mata kuliahnya secara ascending (A-Z)
select *
from teachers
join courses on teachers.id=courses.teachers_id
WHERE (courses.name, teachers.salary) IN (

  -- Get Courses's Name and Maximum Salary of the Lecturer Who Teaches that Course

  SELECT courses.name, MAX(teachers.salary)
  FROM teachers
  JOIN courses ON teachers.id=courses.teachers_id
  GROUP BY courses.name
)
ORDER BY courses.name ASC