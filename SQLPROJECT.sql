create database SQLPROJECT
go
use SQLPROJECT
go
create table Department
(
dept_id int primary key identity,
dept_name varchar(50) not null,
)

create table student 
(
st_id int primary key identity ,
st_Fname varchar(50) not null,
st_Lname varchar(50) not null,
st_age int not null ,
st_address varchar(50) not null,
dept_id int foreign key references department(dept_id)
)
create table Instructor
(
ins_id int primary key,
ins_name varchar(50),
dept_id int foreign key references department(dept_id)
)
create table Course
(
crs_id int primary key ,
crs_name varchar(50)
)
create table instructor_course
(
crs_id int foreign key references course(crs_id),
ins_id int foreign key references Instructor(ins_id),
primary key(crs_id,ins_id)
)
create table student_course
(
crs_id int foreign key references course(crs_id),
st_id int foreign key references student(st_id),
primary key(crs_id,st_id)
)
create table Topics 
(
topic_id int primary key,
topic_name varchar(50),
crs_id int foreign key references course(crs_id),
)
create table Exam 
(
exam_id int primary key identity ,
exam_date datetime default getdate(),
st_id int foreign key references student(st_id),
)
create table Questoins 
(
Q_id int primary key,
question varchar(100) not null,
right_answer varchar(50) not null,
Ques_Type varchar(2) not null,
crs_id int foreign key references course(crs_id),
)
create table Q_multichoice
(
Q_id int foreign key references questoins(Q_id),
choice1 varchar(50) not null,
choice2 varchar(50) not null, 
choice3 varchar(50) not null, 
multichoice_id int primary key identity 
)
create table Q_Tru_Fls 
(
q_id int foreign key references questoins(q_id),
True varchar(5) not null,
False varchar(5) not null, 
Tru_Fls_id int primary key identity 
)
create table Questions_Exam
(
Q_id int foreign key references questoins(Q_id),
exam_id int foreign key references exam(exam_id),
primary key (Q_id,exam_id),
st_Answer varchar(50)
)
