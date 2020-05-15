create table Exam 
(
exam_id int primary key ,
exam_date datetime default getdate(),
grade int,
st_id int foreign key references student(st_id),
)
go
create table Questions_Exam
(
Q_id int foreign key references questoins(Q_id),
exam_id int foreign key references Exam(exam_id),
primary key (Q_id,exam_id),
st_Answer varchar(50),
ques_grade bit,
)
