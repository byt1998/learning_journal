
CREATE TABLE teachers (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(25) NOT NULL,
  last_name VARCHAR(50),
  school VARCHAR(50) NOT NULL,
  hire_date DATE,
  salary NUMERIC
) 

-- Menambah column agedemo
ALTER TABLE teachers ADD age INT;

-- Menghapus column age
ALTER TABLE teachers drop COLUMN age;

-- Mengganti tipe data column salary
alter table teachers modify column salary int;

-- Mengubah nama table teachers menjadi guru
alter table teachers rename to guru;

-- Mengubah nama table guru menjadi teachers
alter table guru rename to teachers;

-- Mengisi data ke table teachers
INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
-- Melihat isi dari table teachers
select * from teachers;

-- Menghapus semua isi dari table teachers
truncate table teachers;

-- Menghapus table teachers
drop table teachers;

-- Mengubah salary dari id=3
update teachers
set salary=50000
where id=3;

-- Melihat column firs_name, last_name, dan school
select first_name, last_name, school
from teachers

-- Mengurutkan last_name dari huruf Z-A
select *
from teachers
order by last_name desc;

-- Mengurutkan last_name dari huruf Z-A dan school dari huruf A-Z
select *
from teachers
order by last_name desc, school asc;

-- Menghapus data dengan id=6
delete from teachers
where id=6;

-- Menambah data baru
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
select * from teachers;

-- Mencari dosen yang mengajar di Harvard University dengan gaji lebih dari 50000
select *
from teachers
where school='Harvard University' and salary>50000

-- Mencari dosen yang nama belakangnya abbers atau smith
-- Cara 1 dengan menggunakan OR
select *
from teachers
where last_name='Abbers' or last_name='Smith';

-- Cara 2 dengan menggunakan IN
select * 
from teachers
where last_name in ('Abbers', 'Smith');

-- Melihat total gaji dari MIT dan memeberi nama alias memakai AS
select sum(salary) as total_gaji
from teachers
where school='MIT';

-- Melihat unque value di column shool
select distinct(school)
from teachers;

-- Melihat unque value dengan angka di column shool
select count(distinct(school))
from teachers;

