use Student_mark
--simple query
SELECT * FROM Students WHERE [Last_Name] = N'Nguy?n V?n' AND [First_Name] =		'A'
-- procedue dem sinh vien
CREATE PROCEDURE Count_Student
	@GR VARCHAR(50),
	@COUNT INT OUT
AS
BEGIN
	SELECT @COUNT = COUNT(StudentID) FROM JOIN_Groups_Students WHERE GrID = @GR
END

DECLARE @NumOfStu INT = 0;
EXEC Count_Student @GR = 'IA1604', @COUNT = @NumOfStu OUT
PRINT @NumOfStu;
-- procedure add sinh vien
create proc Insert_Student
@Student_ID nvarchar(8),
@FirstName nvarchar(150),
@LastName nvarchar(150),
@Gender bit,
@Email varchar(100),
@DoB date
as
if @Student_ID in (select StudentID  from Students  )
begin
PRINT  'Duplicated'
end
else
insert into Students values(@Student_ID, @FirstName, @LastName, @Gender, @email, @DoB)
exec Insert_Student 'HE0001', 'Nguyen Van', 'C',1,'CNVHe001@fpt.edu.vn', '1/5/2001' 
-- trigger
create trigger InsertStudent on Students
after insert
as
declare @Student_ID nvarchar(8),
@DoB date;
Select @Student_ID = StudentID, @DoB = DoB from inserted
Select * From Students where @Student_ID = StudentID 
if Year(@Dob) -  2004 > 0
begin
PRINT  'To young'
rollback tran
end
Insert into Students values ('HE0006', 'Nguyen Van', 'C',1,'CNVHe001@fpt.edu.vn', '1/5/2006' )
--
Delete From Students
Where len(StudentID) =6 ;
--Querry student who have component score >=0 && <=4
SELECT s.Last_Name + ' ' +s.First_Name   AS [Name], c.CName AS Course, G.score as avr_grade FROM 
Students s INNER JOIN Grade G ON s.StudentID = G.StudentID
INNER JOIN ASSESSMENT_SYSTEM ass ON ass.AssID = G.AssID
INNER JOIN Courses c ON c.CouID = ass.CouID
WHERE (G.score = 0) OR G.score < 4 
Group by s.Last_Name ,s.First_Name, c.CName, G.score
HAVING (SUM(G.score * ass.weigh) < 5) OR MIN(g.score) = 0
ORDER BY s.Last_Name ,s.First_Name