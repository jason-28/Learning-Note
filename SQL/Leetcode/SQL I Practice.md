# [SQL I](https://leetcode.com/study-plan/sql/?progress=x4dk0rod)

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
    
# [1965. Employees With Missing Information](https://leetcode.com/problems/employees-with-missing-information/description/?envType=study-plan&id=sql-i)   
 
Write an SQL query to report the IDs of all the employees with missing information.
 
## MySQL ans
 
    SELECT employee_id FROM Employees WHERE employee_id NOT IN (SELECT employee_id FROM Salaries) #Employee裡的ID沒有在Salaries的ID
    UNION 
    SELECT employee_id FROM Salaries WHERE employee_id NOT IN (SELECT employee_id FROM Employees) #同上
    ORDER BY employee_id ASC;

# [1795. Rearrange Products Table](https://leetcode.com/problems/rearrange-products-table/?envType=study-plan&id=sql-i)

Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

## MySQL ans

    SELECT product_id, 'store1' AS store, store1 as price FROM products WHERE store1 IS NOT NULL #字串store1為store，數值store1為price，以下同理
    UNION 
    SELECT product_id, 'store2' AS store, store2 as price FROM products WHERE store2 IS NOT NULL
    UNION 
    SELECT product_id, 'store3' AS store, store3 as price From products WHERE store3 IS NOT NULL
    ORDER BY product_id ASC;
    
# [608. Tree Node](https://leetcode.com/problems/tree-node/description/?envType=study-plan&id=sql-i)    

Write an SQL query to report the type of each node in the tree.

## MySQL ans

    SELECT id,
    CASE WHEN p_id IS NULL THEN 'Root'
    WHEN p_id in (SELECT id FROM tree) AND id in (SELECT p_id FROM tree) THEN  'Inner' #p_id跟id都有出現才是inner
    ELSE 'Leaf' END AS type
    FROM tree;
    
# [176. Second Highest Salary](https://leetcode.com/problems/second-highest-salary/?envType=study-plan&id=sql-i)    

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

## MySQL ans

    SELECT  MAX(salary) AS SecondHighestSalary 
    FROM Employee  
    WHERE SALARY != (SELECT MAX(SALARY) FROM EMPLOYEE); #在不等於正常篩選下最大值的條件下選最大的
    
# [175. Combine Two Tables](https://leetcode.com/problems/combine-two-tables/?envType=study-plan&id=sql-i)

Write an SQL query to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.

## MySQL ans

    SELECT Person.firstName, Person.lastName, Address.city, Address.state
    FROM Person LEFT JOIN Address on Person.personId=Address.personId;
    
# [1581. Customer Who Visited but Did Not Make Any Transactions](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan&id=sql-i)    
    
Write a SQL query to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.

## MySQL ans

    SELECT Visits.customer_id,
    COUNT( Visits.visit_id)
    AS count_no_trans
    FROM Visits LEFT JOIN Transactions ON Visits.visit_id=Transactions.visit_id
    WHERE Transactions.visit_id is NULL #在Transactions的visit_id 為空值的情況數Visits的visit_id出現幾次
    GROUP BY customer_id 
    ORDER BY count_no_trans DESC;

# [1148. Article Views I](https://leetcode.com/problems/article-views-i/?envType=study-plan&id=sql-i)

Write an SQL query to find all the authors that viewed at least one of their own articles.

## MySQL ans

    SELECT DISTINCT (viewer_id) AS id
    FROM Views
    WHERE viewer_id=author_id
    ORDER BY id;
    
# [197. Rising Temperature](https://leetcode.com/problems/rising-temperature/?envType=study-plan&id=sql-i)

Write an SQL query to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

## MySQL ans

    SELECT A.id 
    FROM Weather A,Weather B
    WHERE datediff(A.recordDate, B.recordDate)= 1 #A為今天、B為昨天
    AND A.temperature > B.temperature;
    
# [607. Sales Person](https://leetcode.com/problems/sales-person/description/?envType=study-plan&id=sql-i)    
    
Write an SQL query to report the names of all the salespersons who did not have any orders related to the company with the name "RED".

## MySQL ans

    SELECT DISTINCT SalesPerson.name 
    FROM SalesPerson LEFT JOIN Orders ON SalesPerson.sales_id=Orders.sales_id
    WHERE SalesPerson.sales_id NOT IN
    (SELECT DISTINCT Orders.sales_id
    FROM Orders
    INNER JOIN Company on Orders.com_id = Company.com_id
    WHERE Company.name = 'Red'); 
    
# [1141. User Activity for the Past 30 Days I](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/?envType=study-plan&id=sql-i)    
    
Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day.   
   
## MySQL ans    

    SELECT
    activity_date AS day, 
    COUNT(DISTINCT user_id) AS active_users
    FROM Activity
    WHERE activity_date > "2019-06-27" AND activity_date <= "2019-07-27"
    GROUP BY activity_date;

# [1693. Daily Leads and Partners](https://leetcode.com/problems/daily-leads-and-partners/?envType=study-plan&id=sql-i)

Write an SQL query that will, for each date_id and make_name, return the number of distinct lead_id's and distinct partner_id's.

## MySQL ans  

    SELECT date_id,make_name,
    COUNT(DISTINCT lead_id) AS unique_leads,
    COUNT(DISTINCT partner_id) AS unique_partners 
    FROM DailySales
    GROUP BY date_id, make_name;

# [1729. Find Followers Count](https://leetcode.com/problems/find-followers-count/?envType=study-plan&id=sql-i)

Write an SQL query that will, for each user, return the number of followers.

Return the result table ordered by user_id in ascending order.

## MySQL ans  

    SELECT DISTINCT user_id,
    COUNT(follower_id) AS followers_count
    FROM Followers
    GROUP BY user_id
    ORDER BY user_id;
    
# [586. Customer Placing the Largest Number of Orders](https://leetcode.com/problems/customer-placing-the-largest-number-of-orders/?envType=study-plan&id=sql-i)    
    
 Write an SQL query to find the customer_number for the customer who has placed the largest number of orders.

The test cases are generated so that exactly one customer will have placed more orders than any other customer.
 
 ## MySQL ans 
 
    SELECT customer_number FROM Orders
    GROUP BY customer_number
    ORDER BY COUNT(order_number) DESC
    LIMIT 1;
    
# [511. Game Play Analysis I](https://leetcode.com/problems/game-play-analysis-i/?envType=study-plan&id=sql-i)    
    
Write an SQL query to report the first login date for each player.

## MySQL ans

    SELECT DISTINCT player_id,
    MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
    ORDER BY player_id;
    
# [1890. The Latest Login in 2020](https://leetcode.com/problems/the-latest-login-in-2020/?envType=study-plan&id=sql-i)    
    
Write an SQL query to report the latest login for all users in the year 2020. Do not include the users who did not login in 2020.

## MySQL ans

    SELECT DISTINCT user_id,
    MAX(time_stamp ) AS last_stamp  
    FROM Logins
    WHERE YEAR(time_stamp) = 2020 
    GROUP BY user_id; 
    
# [1741. Find Total Time Spent by Each Employee](https://leetcode.com/problems/find-total-time-spent-by-each-employee/?envType=study-plan&id=sql-i)    

Write an SQL query to calculate the total time in minutes spent by each employee on each day at the office.

## MySQL ans    
    
    SELECT event_day AS day,emp_id,
    SUM(out_time-in_time)  AS total_time
    FROM Employees
    GROUP BY DAY,emp_id;    

# [1393. Capital Gain/Loss](https://leetcode.com/problems/capital-gainloss/?envType=study-plan&id=sql-i)    
    
Write an SQL query to report the Capital gain/loss for each stock.

The Capital gain/loss of a stock is the total gain or loss after buying and selling the stock one or many times. 

## MySQL ans 

    SELECT stock_name,
    SUM(CASE WHEN operation='Buy' THEN price*-1 ELSE price end ) AS capital_gain_loss
    FROM tocks 
    GROUP BY stock_name ;

# [1407. Top Travellers](https://leetcode.com/problems/top-travellers/description/?envType=study-plan&id=sql-i)

Write an SQL query to report the distance traveled by each user.

Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

## MySQL ans 
 
    SELECT U.name, 
    COALESCE(SUM(R.distance), 0) AS travelled_distance #把空值直接改0，不然統計不到
    FROM Users U
    LEFT JOIN Rides R ON U.id = R.user_id
    GROUP BY user_id  #group by "user_id" (primary key)比name好，可避免重複
    ORDER BY travelled_distance DESC, name ASC;
    
# [1158. Market Analysis I](https://leetcode.com/problems/market-analysis-i/?envType=study-plan&id=sql-i)    
    
Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.    

## MySQL ans 

    SELECT U.user_id AS buyer_id, join_date, 
    COALESCE(COUNT(order_date), 0) AS orders_in_2019 
    FROM Users U
    LEFT JOIN Orders O ON U.user_id = O.buyer_id
    AND YEAR(order_date) = '2019' #用where再定年份會無法顯示為0的值
    GROUP BY U.user_id;
    
# [182. Duplicate Emails](https://leetcode.com/problems/duplicate-emails/?envType=study-plan&id=sql-i)    
 
Write an SQL query to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL. 

## MySQL ans 

    SELECT email AS Email 
    FROM Person
    GROUP BY email
    HAVING COUNT(email) > 1;

# [1050. Actors and Directors Who Cooperated At Least Three Times](https://leetcode.com/problems/actors-and-directors-who-cooperated-at-least-three-times/?envType=study-plan&id=sql-i)

Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.

## MySQL ans 

    SELECT actor_id ,director_id
    FROM ActorDirector
    GROUP BY actor_id,director_id
    HAVING COUNT(timestamp)>=3; 
    
# [1587. Bank Account Summary II1587. Bank Account Summary II](https://leetcode.com/problems/bank-account-summary-ii/?envType=study-plan&id=sql-i)    
    
Write an SQL query to report the name and balance of users with a balance higher than 10000. The balance of an account is equal to the sum of the amounts of all transactions involving that account.    

## MySQL ans

    SELECT U.name,
    SUM(T.amount) AS balance
    FROM Users U LEFT JOIN Transactions T ON U.account =T.account 
    GROUP BY name
    HAVING balance>10000;
    
# [1084. Sales Analysis III]    
    
    
    
    
    
    

