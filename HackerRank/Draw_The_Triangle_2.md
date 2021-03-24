P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
```

* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
```

Solution in MS SQL:
```
DECLARE @row INT = 1
WHILE (@row < 21)
BEGIN
    PRINT REPLICATE('* ', @row)
    SET @row = @row + 1
END
```
Link: https://www.hackerrank.com/challenges/draw-the-triangle-2/problem
