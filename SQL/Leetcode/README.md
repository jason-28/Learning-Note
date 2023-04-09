# [595. Big Countries](https://leetcode.com/problems/big-countries/?envType=study-plan&id=sql-i)

A country is big if:

it has an area of at least three million (i.e., 3000000 km2), or it has a population of at least twenty-five million (i.e., 25000000).

Write an SQL query to report the name, population, and area of the big countries.

## MySQL ans

    SELECT name,population,area
    FROM World
    WHERE area>=3000000 OR population>=25000000;

# [1757. Recyclable and Low Fat Products](https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan&id=sql-i)

Write an SQL query to find the ids of products that are both low fat and recyclable.  
  
## MySQL ans

    SELECT product_id
    FROM Products
    WHERE low_fats = 'Y' AND recyclable = 'Y';  

# [584. Find Customer Referee](https://leetcode.com/problems/find-customer-referee/description/?envType=study-plan&id=sql-i)

Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

## MySQL ans

    SELECT name
    FROM Customer
    WHERE referee_id != 2 OR  referee_id is null; #NULL也可以
    
# [183. Customers Who Never Order](https://leetcode.com/problems/customers-who-never-order/?envType=study-plan&id=sql-i)

Write an SQL query to report all customers who never order anything.

## MySQL ans

    SELECT name AS Customers
    FROM Customers
    WHERE id not in (select customerId from orders);

# [1873. Calculate Special Bonus](https://leetcode.com/problems/calculate-special-bonus/description/?envType=study-plan&id=sql-i)

Write an SQL query to calculate the bonus of each employee. The bonus of an employee is 100% of their salary if the ID of the employee is an odd number and the employee name does not start with the character 'M'. The bonus of an employee is 0 otherwise.

## MySQL ans

    SELECT employee_id , 
    CASE WHEN employee_id%2 != 0 AND name not like 'M%' THEN salary  #除2餘數不等於(奇數)且名字不是M開頭才能有BONUS
    ELSE 0 end AS bonus
    FROM employees
    ORDER BY employee_id;

# [627. Swap Salary](https://leetcode.com/problems/swap-salary/?envType=study-plan&id=sql-i)

Write an SQL query to swap all 'f' and 'm' values (i.e., change all 'f' values to 'm' and vice versa) with a single update statement and no intermediate temporary tables.

## MySQL ans

    UPDATE Salary
    SET sex = CASE sex 
    WHEN 'm' THEN 'f'
    WHEN 'f' THEN 'm'
    END;

# [196. Delete Duplicate Emails](https://leetcode.com/problems/delete-duplicate-emails/?envType=study-plan&id=sql-i)

Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

## MySQL ans

    DELETE A FROM Person A, Person B 
    WHERE A.id > B.id AND A.email=B.email;

# [1667. Fix Names in a Table](https://leetcode.com/problems/fix-names-in-a-table/?envType=study-plan&id=sql-i)

Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.Return the result table ordered by user_id.

## MySQL ans

    SELECT user_id , 
    CONCAT(UPPER(SUBSTR(name,1,1)),LOWER(SUBSTR(name,2))) AS name  #合併對第一個字轉大寫及剩下的字轉小寫
    FROM Users
    ORDER BY user_id;
    
# [1484. Group Sold Products By The Date](https://leetcode.com/problems/group-sold-products-by-the-date/description/?envType=study-plan&id=sql-i) 
 
 Write an SQL query to find for each date the number of different products sold and their names.

The sold products names for each date should be sorted lexicographically.

Return the result table ordered by sell_date.
 
 ## MySQL ans
 
    SELECT sell_date , 
    COUNT(DISTINCT(product)) AS num_sold, #只需要有賣的種類
    GROUP_CONCAT(DISTINCT product ORDER BY product SEPARATOR ',') AS products #兼具GROUPBY&CONCAT，MYSQL才有
    FROM Activities
    GROUP BY sell_date #依日期分組
    ORDER BY sell_date;   

# [1527. Patients With a Condition](https://leetcode.com/problems/patients-with-a-condition/?envType=study-plan&id=sql-i)

Write an SQL query to report the patient_id, patient_name and conditions of the patients who have Type I Diabetes. Type I Diabetes always starts with DIAB1 prefix.

 ## MySQL ans

    SELECT *
    FROM Patients
    WHERE conditions LIKE 'DIAB1%' OR conditions LIKE '% DIAB1%';
    
    
    

