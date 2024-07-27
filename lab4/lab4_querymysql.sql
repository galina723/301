-- 1 Show the all-clients details who lives in “Binh Duong”
select * from clients
where Province = 'Binh Duong';

-- 2 Find the client’s number and client’s name who do not live in “Hanoi”
select Client_Number, Client_Name
from clients
where Province != 'Ha Noi';

-- 3 Identify the names of all products with less than 25 in stock.
select Product_Name
from product
where Quantity_On_Hand < 25;

-- 4 Find the product names where company making losses. 
select Product_Name
from product
where Quantity_Sell > 0;

--  5 Find the salesman’s details who are able achieved their target
select Salesman_Name
from salesman
where Sales_Target > 0;

-- 6 Select the names and city of salesman who are not received salary between 10000 and 17000.
select Salesman_Name, Address
from salesman
where Salary between 10000 and 17000;

--  7 Show order date and the clients_number of who bought the product between '2022-01-01' and '2022-02-15'
select Order_Date, Client_Number
from salesorder
where Order_Date between '2022-01-01' and '2022-02-15';

-- 8 Find the names of cities in clients table where city name starts with "N"
select City
from clients
where City like 'N%';

-- 9 Display clients’ information whose names have "u" in third position.
select *
from clients
where Client_Name like '__u%';

-- 10 Find the details of clients whose names have "u" in second last position.
select *
from clients
where Client_Name like '%u';

--  11 Find the names of cities in clients table where city name starts with "D" and ends with “n”
select City
from clients
where City like 'D%n';

--  12 Select all clients details who belongs from Ho Chi Minh, Hanoi and Da Lat.
select *
from clients
where City in ('Ho Chi Minh', 'Ha Noi', 'Da Lat');

--  13 Choose all clients data who do not reside in Ho Chi Minh, Hanoi and Da Lat.
select *
from clients
where City not in ('Ho Chi Minh', 'Ha Noi', 'Da Lat');

--  14 Find the average salesman’s salary
select avg(Salary) as avgsalary
from salesman;

--  15 Find the name of the highest paid salesman.
select Salesman_Name
from salesman
where Salary = (select max(Salary) as highestsalary);

-- 16. Find the name of the salesman who is paid the lowest salary
select Salesman_Name
from salesman
where Salary = (select min(Salary) as lowestsalary);

-- 17 Determine the total number of salespeople employed by the company.
select count(*) as total
from salesman;

-- 18. Compute the total salary paid to the company's salesman
select sum(Salary) as totalsalary
from salesman;

-- 19. Select the salesman’s details sorted by their salary.
select *
from salesman
order by Salary asc;

-- 20. Display salesman names and phone numbers based on their target achieved (in ascending order) 
-- and their city (in descending order).
select Salesman_Name, Phone
from salesman
order by Sales_Target asc, City desc;

-- 21. Display 3 first names of the salesman table and the salesman’s names in descending order.
select *
from salesman
order by Salesman_Name desc
limit 3;

-- 22. Find salary and the salesman’s names who is getting the highest salary.
select Salary, Salesman_Name
from salesman
order by Salary desc
limit 1;

-- 23. Find salary and the salesman’s names who is getting second lowest salary
select Salary, Salesman_Name
from salesman
order by Salary asc
limit 1;

-- 24. Display the first five sales orders in formation from the sales order table.
select *
from salesorder
limit 5;

-- 25. Display next ten sales order information from sales order table except first five sales order.
select *
from salesorder
limit 5, 10;

-- 26 If there are more than one client, find the name of the province and the number of clients in each 
-- province, ordered high to low.
select Province, count(*) totalClient
from clients
group by Province
having count(*) > 1
order by count(*) desc;

-- 27. Display information clients have number of sales order more than 1.
select
    c.Client_Number, 
    c.Client_Name, 
    c.Address, 
    c.City, 
    c.Pincode, 
    c.Province, 
    c.Amount_Paid, 
    c.Amount_Due, 
    COUNT(so.Order_Number) AS Sales_Order_Count
from 
    Clients c
join 
    Salesorder so ON c.Client_Number = so.Client_Number
group by 
    c.Client_Number, 
    c.Client_Name, 
    c.Address, 
    c.City, 
    c.Pincode, 
    c.Province, 
    c.Amount_Paid, 
    c.Amount_Due
having 
    COUNT(so.Order_Number) > 1;

-- 28. Display the name and due amount of those clients who lives in “Hanoi”.
select Client_Name, Amount_Due
from clients
where City in ('Hanoi');

-- 29. Find the clients details who has due more than 3000.
select *
from clients
where Amount_Due > 3000;

-- 30. Find the clients name and their province who has no due.
select Client_Name, Province
from clients
where Amount_Due < 1;

-- 31. Show details of all clients paying between 10,000 and 13,000
select *
from clients
where Amount_Paid between 10000 and 13000;

-- 32. Find the details of clients whose name is “Dat”.
select *
from clients
where Client_Name = 'Dat';

-- 33. Display all product name and their corresponding selling price.
select Product_Name, Sell_Price
from product;

-- 34. How many TVs are in stock?
select Quantity_On_Hand
from product
where Product_Name in ('TV');

-- 35. Find the salesman’s details who are not able achieved their target.
select *
from salesman
where Target_Achieved < 1;

-- 36. Show all the product details of product number ‘P1005’
select *
from product
where Product_Number = 'P1005';

-- 37. Find the buying price and sell price of a Mouse
select Cost_Price, Sell_Price
from product
where Product_Name = 'Mouse';

-- 38. Find the salesman names and phone numbers who lives in Thu Dau Mot.
select Salesman_Name, Phone
from salesman
where City = 'Thu Dau Mot';

-- 39. Find all the salesman’s name and salary
select Salesman_Name, Salary
from salesman;

-- 40. Select the names and salary of salesman who are received between 10000 and 17000.
select Salesman_Name, Salary
from salesman
where Salary between 10000 and 17000;

-- 41. Display all salesman details who are received salary between 10000 and 20000 and achieved 
-- their target
select *
from salesman
where Salary between 10000 and 20000 and Target_Achieved >1;

-- 42. Display all salesman details who are received salary between 20000 and 30000 and not achieved 
-- their target
select * 
from salesman
where Salary between 20000 and 30000 and Target_Achieved < 1;

-- 43. Find information about all clients whose names do not end with "h"
select *
from clients
where Client_Name not like '%h';

-- 44. Find client names whose second letter is 'r' or second last letter 'a'
select Client_Name
from clients
where Client_Name like '_r%' or '%a_';

-- 45. Select all clients where the city name starts with "D" and at least 3 characters in length.
select *
from clients
where City like 'D__%';

-- 46. Select the salesman name, salaries and target achieved sorted by their target_achieved in 
-- descending order
select Salesman_Name, Salary, Target_Achieved
from salesman
order by Target_Achieved desc;

-- 47. Select the salesman’s details sorted by their sales_target and target_achieved in ascending order
select *
from salesman
order by Sales_Target and Target_Achieved asc;

-- 48. Select the salesman’s details sorted ascending by their salary and descending by achieved target.
select *
from salesman
order by Salary asc, Target_Achieved desc;

-- 49. Display salesman names and phone numbers in descending order based on their sales target
select Salesman_Name, Phone
from salesman
order by Sales_Target desc;

-- 50. Display the product name, cost price, and sell price sorted by quantity in hand.
select Product_Name, Cost_Price, Sell_Price
from product
order by Quantity_On_Hand;

-- 51. Retrieve the clients’ names in ascending order
select Client_Name
from clients
order by Client_Name asc;

-- 52. Display client information based on order by their city
select *
from clients
order by City;

-- 53. Display client information based on order by their address and city.
select *
from clients
order by Address and City;

-- 54. Display client information based on their city, sorted high to low based on amount due
select *
from clients
order by Amount_Due desc;

-- 55. Display the data of sales orders depending on their delivery status from the current date to the 
-- old date
select *
from salesorder
where Delivery_Date between current_date() and '2012-01-01'
order by Delivery_Status;

-- 56. Display last five sales order in formation from sales order table
select *
from salesorder
order by Order_Date desc
limit 5;

-- 57. Count the pincode in client table.
select count(Pincode) as pincode
from clients;

-- 58. How many clients are living in Binh Duong
select count(Client_Name)
from clients
where Province = 'Binh Duong';

-- 59. Count the clients for each province.
select Province, count(Client_Name)
from clients
group by Province;

-- 60. If there are more than three clients, find the name of the province and the number of clients in each 
-- province
select Province, count(*) totalClient
from clients
group by Province
having count(*) > 3;

-- 61. Display product number and product name and count number orders of each product more than 1 
-- (in ascending order)
select
    p.Product_Number, 
    p.Product_Name, 
    COUNT(so.Order_Number) AS Order_Count
from Product p
join 
    Salesorderdetails so ON p.Product_Number = so.Product_Number
group by 
    p.Product_Number, 
    p.Product_Name
having 
    COUNT(so.Order_Number) > 1
order by 
    p.Product_Number ASC;


-- 62. Find products which have more quantity on hand than 20 and less than the sum of average.
select 
    Product_Number, 
    Product_Name, 
    Quantity_On_Hand
from 
    Product
where 
    Quantity_On_Hand > 20 
    and Quantity_On_Hand < (select SUM(avg_qty) 
                            from (select avg(Quantity_On_Hand) as avg_qty 
							from Product) subquery);





