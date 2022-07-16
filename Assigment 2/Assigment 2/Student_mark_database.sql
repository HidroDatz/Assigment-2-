create database Student_mark;
use Student_mark
create table Student(
S_ID nvarchar(8) primary key,
S_Name nvarchar(150),
Gender bit,
DoB date,
Phone varchar(12),
Address nvarchar(150),
email varchar(100)
);
create table Instructor(
I_ID int primary key identity(1,1),
I_Name nvarchar(20) not null,
);
create table Lecture(
L_ID int primary key identity(1,1),
L_Name nvarchar(150),
I_ID int not null,
foreign key (I_ID) references Instructor(I_ID),
);
create table Course(
C_ID int primary key identity(1,1),
C_Name nvarchar(150)
);
create table [Group](
G_ID int primary key identity(1,1),
C_ID int not null,
L_ID int not null,
G_Name nvarchar(150) not null,
I_ID int not null,
foreign key (C_ID) references Course(C_ID),
foreign key (L_ID) references Lecture(L_ID),
foreign key (I_ID) references Instructor(I_ID),
);
create table Assessment(
A_ID int primary key identity(1,1),
A_Name nvarchar(150),
A_Weight int,
C_ID int foreign key references  Course(C_ID),
);
create table Student_Assessment(
A_ID int foreign key references Assessment(A_ID),
S_ID nvarchar(8) foreign key references Student(S_ID),
[date] date primary key,
score float not null,
);
create table GroupStudent(
S_ID nvarchar(8) not null,
G_ID int not null,
foreign key (G_ID) references [Group](G_ID),
foreign key (S_ID) references Student(S_ID)
);
insert into Student values 
('HE163063','NGUYEN DUC THANG',1,		'1/5/2022',		'0987803161','Phu Tho','ducthang01052002@gmail.com'),
('HE163064','TRAN TRONG NGHIA',1,		'4/11/2022',	'0987803161','Phu Tho','asdasd@gmail.com'),
('HE163065','NGUYEN CHI HUNG',1,		'2/5/2022',		'0987803161','Phu Tho','qweqwf@gmail.com'),
('HE163066','DOAN MANH HUNG',1,			'3/5/2022',		'0987803161','Phu Tho','ewq@gmail.com'),
('HE163067','NGUYEN NGOC HUY HOANG',1,	'5/5/2022',		'0987803161','Phu Tho','fqweqw@gmail.com'),
('HE163068','NGUYEN NGOC HUYEN',0,		'12/5/2022',	'0987803161','Phu Tho','eqweqwf@gmail.com'),
('HE163069','NGUYEN HOANG GIANG',1,		'11/5/2022',	'0987803161','Phu Tho','rwef@gmail.com'),
('HE163070','KIEU ANH SON',1,			'12/1/2022',	'0987803161','Phu Tho','ducthang01052002@gmail.com'),
('HE163031','HUY HOANG',1,				'1/7/2022',		'0987803161','Phu Tho','uykjy@gmail.com'),
('HE163032','LE QUANG HUY',1,			'1/4/2022',		'0987803161','Phu Tho','dghjrkli@gmail.com');
insert into Instructor values
('Ngo Tung Son'),
('Tran Quy Ban'),
('Le Phuong Chi'),
('Bui Ngoc Anh'),
('Dao Thi Thanh');
insert into Lecture values
('JAVAWEB',1),
('JAVAWEB',2),
('JAVAWEB',3),
('JAVAWEB',4),
('JAVAWEB',5);
insert into Course values
('DBI'),
('CSD'),
('JPD'),
('WED'),
('JAVA LAB');
insert into Assessment values
('QUIZ1',8,1),
('QUIZ2',7,1),
('ACTIVITY',10,1),
('G_ASS',15,1),
('G_PROJECT',30,1),
('FE',30,1),
('QUIZ1',8,2),
('QUIZ2',7,2),
('ACTIVITY',10,2),
('G_ASS',15,2),
('G_PROJECT',30,2),
('FE',30,2);
insert into [Group] values 
(1,1,'SE1647',1),
(2,2,'SE1111',2),
(3,3,'SE1112',3),
(4,4,'SE1221',4);
insert into GroupStudent values
('HE163063',1),
('HE163064',2),
('HE163064',1),
('HE163065',1),
('HE163066',1),
('HE163065',3),
('HE163066',4);
insert into Student_Assessment values 
(1,'HE163063','2020/10/7',10),
(2,'HE163063','2020/10/8',10),
(3,'HE163063','2020/10/9',9),
(4,'HE163063','2020/10/10',8),
(5,'HE163063','2020/10/11',7),
(6,'HE163063','2020/10/12',8),
(7,'HE163063','2020/10/13',9),
(8,'HE163063','2020/10/14',10),
(9,'HE163063','2020/10/15',8),
(10,'HE163063','2020/10/16',8),
(11,'HE163063','2020/10/17',4),
(12,'HE163063','2020/10/18',9);