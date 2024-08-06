-- 1. SQL statement returns the cities (only distinct values) from both the "Clients" and the "salesman" 
-- table.
select City from clients
union
select City from salesman;

-- 2. SQL statement returns the cities (duplicate values also) both the "Clients" and the "salesman" table.
select City from clients
union all
select City from salesman;

-- 3. SQL statement returns the Ho Chi Minh cities (only distinct values) from the "Clients" and the 
-- "salesman" table.
select City from clients
where City = 'Ho Chi Minh'
union
select City from salesman
where City = 'Ho Chi Minh';


-- 4. SQL statement returns the Ho Chi Minh cities (duplicate values also) from the "Clients" and the 
-- "salesman" table.
select City from clients
where City = 'Ho Chi Minh'
union all
select City from salesman
where City = 'Ho Chi Minh';

-- 5. SQL statement lists all Clients and salesman.
select Client_Name ten
from clients
union
select Salesman_Name ten
from salesman;

-- 6. Write a SQL query to find all salesman and clients located in the city of Ha Noi on a table with 
-- information: ID, Name, City and Type.

select Client_Number id, Client_Name 'Name', City, 'clients' `type`
from clients where City = 'Hanoi'
union all
select Salesman_Number id, Salesman_Name 'Name', City, 'salesman' `type`
from salesman where City = 'Hanoi';

-- 7. Write a SQL query to find those salesman and clients who have placed more than one order. Return 
-- ID, name and order by ID.
select c.Client_Number, c.Client_Name, count(Order_Number) ornum
from clients c
left join salesorder so
on c.Client_Number = so.Client_Number
group by Client_Number
having ornum > 1
union
select s.Salesman_Number, s.Salesman_Name, count(Order_Number) ornum
from salesman s
left join salesorder so
on s.Salesman_Number = so.Salesman_Number
group by Salesman_Number
having ornum > 1;

-- 8. Retrieve Name, Order Number (order by order number) and Type of client or salesman with the client 
-- names who placed orders and the salesman names who processed those orders.
select c.client_number as Number, c.client_name as Name, c.City, so.Order_Number, 'client' as Type
from clients c
inner join salesorder so
on  c.Client_Number= so.Client_Number
union all
select s.salesman_number, s.salesman_name, s.City, so.Order_Number, 'salesman'
from salesman s
inner join salesorder so
on s.Salesman_Number = so.Salesman_Number
order by Order_Number;

-- 9. Write a SQL query to create a union of two queries that shows the salesman, cities, and 
-- target_Achieved of all salesmen. Those with a target of 60 or greater will have the words 'High 
-- Achieved', while the others will have the words 'Low Achieved'.
select s.salesman_number, s.salesman_name, s.City, s.Target_Achieved, 'High Achieved' as 'Target'
from salesman s
where s.Target_Achieved >= 60 
union 
select s.salesman_number, s.salesman_name, s.City, s.Target_Achieved, 'Low Achieved' as 'Target'
from salesman s
where s.Target_Achieved < 60;

-- 10. Write query to creates lists all products (Product_Number AS ID, Product_Name AS Name, 
-- Quantity_On_Hand AS Quantity) and their stock status. Products with a positive quantity in stock are 
-- labeled as 'More 5 pieces in Stock'. Products with zero quantity are labeled as ‘Less 5 pieces in Stock'
select product_number as ID, product_name as Name, Quantity_On_Hand as Quantity, 'More 5 pieces in stock' as 'Labeled'
from product
where Quantity_On_Hand > 0
union 
select product_number as ID, product_name as Name, Quantity_On_Hand as Quantity, 'Less 5 pieces in stock' as 'Labeled'
from product
where Quantity_On_Hand <= 0;

-- 11. Create a procedure stores get_clients_by_city () saves the all Clients in table. Then Call procedure 
-- stores.
DELIMITER $$
create procedure get_clients_by_city()
begin
	select * from clients;
end $$
DELIMITER ;

call get_client_by_city();
-- 12. Drop get_clients _by_city () procedure stores.
drop procedure get_client_by_city;

-- 13. Create a stored procedure to update the delivery status for a given order number. Change value 
-- delivery status of order number “O20006” and “O20008” to “On Way”.
-- Step 1: Create the stored procedure
DELIMITER $$
create procedure Updatedeliverystatus(
    in orderNumber varchar(10),
    in newStatus varchar(20)
)
begin
    update Salesorder
    set Delivery_Status = newStatus
    where Order_Number = orderNumber;
end $$
DELIMITER ;

call UpdateDeliveryStatus('O20006', 'On Way');
call UpdateDeliveryStatus('O20008', 'On Way');

-- 14. Create a stored procedure to retrieve the total quantity for each product.
DELIMITER $$
create procedure gettotalquantityforeachproduct()
begin
	select
		p.Product_Name,
        p.Quantity_On_Hand
	from
        product p
    left join
        salesorderdetails sod on p.Product_Number = sod.Product_Number
    GROUP BY 
        p.Product_Number, p.Product_Name;
end $$

call GetTotalQuantityForEachProduct();

-- 15. Create a stored procedure to update the remarks for a specific salesman.
Delimiter $$
create procedure updateRemark(in salesNumber varchar(15), in remarkchange varchar(20))
begin
update salesman
set remark = remarkchange
where salesman_number = salesNumber;
end;
$$

-- 16. Create a procedure stores find_clients() saves all of clients and can call each client by client_number.
Delimiter $$
create procedure find_clients(in n_client_number varchar(10))
begin
select * from clients where Client_Number = n_client_number;
end;
$$

-- 17. Create a procedure stores salary_salesman() saves all of clients (salesman_number, salesman_name, 
-- salary) having salary >15000. Then execute the first 2 rows and the first 4 rows from the salesman 
-- table.
Delimiter $$
create procedure salary_salesman(in a int)
begin
select salesman_number, salesman_name, salary
from salesman where salary > 15000 limit a;
end;
$$
call salary_salesman(2);
call salary_salesman(4);

-- 18. Procedure MySQL MAX() function retrieves maximum salary from MAX_SALARY of salary table.
DELIMITER $$
create procedure MAXX(in salarymax varchar(30))
begin
	select max(salary) from salesman;
end $$
DELIMITER ;

-- 19. Create a procedure stores execute finding amount of order_status by values order status of salesorder 
-- table.
DELIMITER //
create procedure os()
begin
	
end //
DELIMITER ;

-- 20. Create a stored procedure to calculate and update the discount rate for orders.


-- 21. Count the number of salesman with following conditions : SALARY < 20000; SALARY > 20000; 
-- SALARY = 20000.
DELIMITER //
create procedure m()
begin
	select sum(case when salary < 20000 then 1 else 0 end) as less_20000,
		sum(case when salary > 20000 then 1 else 0 end) as more_20000,
		sum(case when salary = 20000 then 1 else 0 end)  equal_20000
from salesman;
end //
DELIMITER ;

-- 22. Create a stored procedure to retrieve the total sales for a specific salesman.
DELIMITER //
create procedure totalsalesforaspecificsalesman(in id varchar(15), out totalsales int)
begin
	select sum(Order_Quantity) into totalsales
    from salesorder as t2, salesorderdetails as t3
    where t2.Order_Number = t3.Order_Number
    and t2.Salesman_Number = id;
end //
DELIMITER ;

set totalsales = 0;
call totalsalesforspecificsaleman('S003', @totalsales);
select @totalsales;

-- 23. Create a stored procedure to add a new product:
-- Input variables: Product_Number, Product_Name, Quantity_On_Hand, Quantity_Sell, Sell_Price, 
-- Cost_Price.
DELIMITER //
create procedure addproduct(num varchar(15),name varchar(15), soluongonhand int, soluongsell int, sellprice int, costprice int)
begin
	insert into product (
		Product_Number,
        Product_Name,
        Quantity_On_Hand,
        Quantity_Sell,
        Sell_Price,
        Cost_Price
    )
    value (
		num, name, soluongonhand, soluongsell, sellprice, costprice
    );
end //
DELIMITER ;

call addproduct('P009', 'Marcy', 34, 14, 501, 1); 

-- 24. Create a stored procedure for calculating the total order value and classification:
-- - This stored procedure receives the order code (p_Order_Number) và return the total value 
-- (p_TotalValue) and order classification (p_OrderStatus).
-- - Using the cursor (CURSOR) to browse all the products in the order (SalesOrderDetails ).
-- - LOOP/While: Browse each product and calculate the total order value.
-- - CASE WHEN: Classify orders based on total value:
-- Greater than or equal to 10000: "Large"
-- Greater than or equal to 5000: "Midium"
-- Less than 5000: "Small"

