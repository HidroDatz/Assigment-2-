SELECT s.First_Name + ' ' + s.Last_Name  AS [Name], c.CouID AS Course FROM 
Students s INNER JOIN Grade G ON s.StudentID = g.StudentID
INNER JOIN ASSESSMENT_SYSTEM sa ON sa.AssID = G.AssID
INNER JOIN Courses c ON c.CouID = sa.CouID
WHERE (G.score = 0) OR G.score < 4 
GROUP BY s.First_Name + s.Last_Name,c.CouID
HAVING (SUM(G.score * sa.Weigh) < 5) OR MIN(G.score) = 0
