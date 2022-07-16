Create database Student_mark
use Student_mark
Create table Students (
  StudentID  Varchar(50) Not Null Primary Key,
  First_Name    NVarchar(50 ) Not Null ,
  Last_Name   NVarchar(50) Not Null,
  Gender      Bit      Null,
  Email       Varchar(50) Not Null,
  DoB         Date
)
create table Groups(
  GrID  Varchar(50) Not Null Primary Key,
  Major    NVarchar(50 ) Not Null
)
create table Lectures(
  LecID  Varchar(50) Not Null Primary Key,
  Last_Name    NVarchar(50 ) Not Null ,
  First_Name   NVarchar(50) Not Null,
  Gender      Bit      Null,
  Email       Varchar(50) Not Null,
  DoB         Date,
  Report Varchar(50),
  constraint FK_Lectures foreign key (Report) references Lectures(LecID)
)
create table Assignment(
AsgID varchar(50) not null primary key,
Major varchar(50) not null,
LecID varchar(50) not null foreign key references  Lectures(LecID)
)
create table Classes(
ClassID varchar(50) not null,
Semester varchar(50) not null,
Start_Date Date ,
End_date Date,
AsgID varchar(50) not null,
constraint PK_Classes primary key (ClassID),
constraint FK_Classes foreign key (AsgID) references Assignment(AsgID)
)
Create table Guide(
GuideID varchar(50) not null primary key,
Details Varchar(350)
)
create table Courses
(
CouID varchar(50) not null primary key,
CName varchar(50) not null
)
create table Categories(
CatID varchar(50) not null primary key,
Name varchar(50) not null,
Type varchar(50) not null,
Completion_Criteria varchar(50)
)
Create Table ASSESSMENT_SYSTEM
(
 AssID Varchar(50) not null primary key,
 CatID varchar(50) not null foreign key references Categories(CatID),
 CouID varchar(50) not null foreign key references Courses(CouID),
 Num_Of_Ques int,
 Duration varchar(50),
 Weigh    Float,
 GuideID varchar(50) not null foreign key references Guide(GuideID)
)
create table Assess
(
AssID varchar(50) not null foreign key references ASSESSMENT_SYSTEM(AssID),
ClassID varchar(50) not null foreign key references Classes(ClassID),
Constraint PK_Enroll primary key(AssID,ClassID),
)
create table Grade
(
StudentID varchar(50) not null foreign key references Students(StudentID),
AssID varchar(50) not null foreign key references ASSESSMENT_SYSTEM(AssID),
Score Float(15),
Date Date,
Constraint PK_Grade primary key(AssID,StudentID,Date)
)
create table ENROLL
(
GrID varchar(50) not null foreign key references Groups(GrID),
ClassID varchar(50) not null foreign key references Classes(ClassID),
Constraint PK_Enroll_ primary key(GrID,ClassID)
)
Create table View_Students_Classes(
StudentID varchar(50) not null,
ClassID varchar(50) not null,
Average Float(15) not null,
Status Varchar(50) not null,
constraint PK_View_Students_Classes Primary Key(StudentID,ClassID),
constraint FK_View_Students foreign key (StudentID) references Students(StudentID),
constraint FK_View_Classes foreign key (ClassID) references Classes(ClassID)
)
create table JOIN_Groups_Students (
  GrID  Varchar(50) Not Null,
  StudentID    Varchar(50 ) Not Null,
  constraint PK_JOIN primary key (GrID,StudentID),
  constraint FK_JOIN_Students foreign key (StudentID) references Students(StudentID),
  constraint FK_JOIN_Groups foreign key (GrID) references Groups(GrID)
)