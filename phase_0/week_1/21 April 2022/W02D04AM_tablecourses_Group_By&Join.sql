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
 
 -- Melihat semua data
 select *
 from teachers;
 
 -- Mlihat dosen yang salarynya lebih besar dari 50000
 select *
 from teachers
 where salary>50000;
 
 -- Menghitung dosen yang salarynya lebih besar dari 50000
 select count(*)
 from teachers
 where salary>50000;
 
 -- Melihat dosen yang first_name adalah "samuel"
 select *
 from teachers
 where binary first_name='samuel';
 
 -- Melihat dosen yang first_name berawalan "Sam-"
 select *
 from teachers
 where first_name like 'Sam%';
 
  -- Melihat dosen yang first_name berakhiran "-sam"
 select *
 from teachers
 where first_name like '%sam';
 
   -- Melihat dosen yang first_name mengandung "-sam-"
 select *
 from teachers
 where first_name like '%sam%';
 
 -- Melihat dosen yang memiliki gaji tertinggi
 select first_name, last_name, max(salary)
 from teachers;
 
select first_name, last_name
from teachers
where salary=(
  select max(salary)
  from teachers
);
 
-- Melihat rata-rata gaji dosen Cambridgde Univesity
select avg(salary), FLOOR(AVG(salary)), CEIL(avg(salary))
from teachers
where school='Cambridge Unversity';

-- Melihat gaji tertinggi di setiap universitas
select school, max(salary)
from teachers
group by school;

select last_name, max(salary)
from teachers
group by last_name;

-- Melihat dosen yang memiliki gaji tertinggi di setiap universitas
select first_name, last_name, school, salary
from teachers
where (school, salary) in(
  select school, max(salary)
  from teachers
  group by school
);

-- Menggabungkan table teachers dengan table courses
select *
from teachers
join courses on teachers.id=courses.teachers_id;

-- Melihat semua dosen yang mengajar Calculus 
select *
from teachers
join courses on teachers.id=courses.teachers_id
where courses.name='Calculus';

-- Melihat jumlah mata kuliah setiap unversitas 
select teachers.school, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
group by teachers.school;

-- Melihat universitas apa saja yang total mata kuliahnya lebih dari 5 
select teachers.school, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
group by teachers.school;
having total_matkul>5;

-- Melihat nama dosen (first_name) beserta jumlah mata kuliah yang diajarkan
select teachers.first_name, count(courses.id) as total_matkul
from teachers
join courses on teachers.id=courses.teachers_id
