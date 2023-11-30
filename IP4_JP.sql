use `premier_products`;

-- Print all rows and columns of the dataset
describe customer;
describe order_line;
describe orders;
describe part;
describe sales_rep;

-- All rows, last name , first name, sales rep number, city from sales rep table 
select last_name, first_name, sales_rep_num, city
from sales_rep; 
-- Select order and customer number from orders
select order_num, customer_num
from orders;

-- Select only two rows from order line
select *
from order_line
limit 2;

-- Select all of the entries from customer where sales rep num=20
select *
from customer
where sales_rep_num = 20;

-- Select only customer name, balance, credit limit from customer where sales rep num=20
select customer_name, balance, credit_limit
from customer
where sales_rep_num = 20;

-- Select part num, num ordered, quoted price and total price where total price is (num_ordered * quoted_price) where only 1 num ordered and the order number is 21617
select part_num, num_ordered, quoted_price, order_num, (num_ordered * quoted_price) as "Total Price"
from order_line
where order_num = 21617;

-- Show all the orders from order date between '2010-10-20’ and '2010-10-22'
select *
from orders
where order_date between "2010-10-20" and "2010-10-22";

--  List all of parts where the part description starts with ‘D’ and end with  ‘er’
select * 
from part
where part_description like "D%" and part_description like "%er";

-- Show total balance from customer
select sum(balance) as "Total Balance"
from customer;
-- Show minimum balance from customer
select min(balance) as "Minimum Balance"
from customer;

-- Count number of customers in customer table
select count(balance) as "Count of Customer"
from customer;
-- Select order number where the quote price is more than 500 but less than 1000
select order_num
from order_line
where quoted_price>500 and quoted_price<1000;

-- Create a new table of customer name, last name, and first name from customer and sales rep table by matching up their primary key
select c.customer_name, sp.last_name, sp.first_name, sp.sales_rep_num
from customer c
join sales_rep sp on c.sales_rep_num = sp.sales_rep_num;