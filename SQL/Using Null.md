# [Using Null](https://sqlzoo.net/wiki/Using_Null)

## List the teachers who have NULL for their department.

    SELECT name FROM teacher
    WHERE dept is null
    
## Note the INNER JOIN misses the teachers with no department and the departments with no teacher.

    SELECT teacher.name, dept.name
    FROM teacher INNER JOIN dept ON (teacher.dept=dept.id)

## Use a different JOIN so that all teachers are listed.

    SELECT teacher.name, dept.name
    FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
    
## Use a different JOIN so that all departments are listed.

    SELECT teacher.name, dept.name
    FROM teacher RIGHT JOIN dept ON (teacher.dept=dept.id)
    
## Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given.    

    SELECT name, COALESCE(mobile,'07986 444 2266')
    FROM teacher 
    
## Use the COALESCE function and a LEFT JOIN to print the teacher name and department name. Use the string 'None' where there is no department.

    SELECT teacher.name, COALESCE(dept.name,'None')
    FROM teacher LEFT JOIN dept ON (teacher.dept=dept.id)
    
## Use COUNT to show the number of teachers and the number of mobile phones.

    SELECT COUNT(name), COUNT(mobile)
    FROM teacher 
    
## Use COUNT and GROUP BY dept.name to show each department and the number of staff. Use a RIGHT JOIN to ensure that the Engineering department is listed.

