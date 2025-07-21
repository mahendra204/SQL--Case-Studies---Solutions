
--Q) How Do you handle null values or missing values or inconsistent 
---values in a table that stays in a DB. 

--isnull
---coalesce
--- conditional statements

select * from empss 

select count(employee_name) from empss 

select isnull(null, 9)


select employee_id, isnull(employee_name, 'unknown'), isnull(age, 19), 
isnull(department, 'IT'), isnull(salary, 10000) from empss

select employee_id, coalesce(employee_name, department, 'unknown'), 
coalesce(age, employee_id *10, 20), coalesce(department, 'IT'), coalesce(salary, 
employee_id *1000, age * 100, 30000) from empss 

select coalesce(null, null, null, 10, 30)

select employee_id, 
	case when employee_name is null or department is null 
		then 'unknown' else employee_name end as employee_name, 
	case when age is null then 28 else age end as age, 
	case when department is null and employee_name is null then 'IT' 
		when department is null then 'Sales' 
		else department end as department, 
	case when salary is null then 78000 else salary end as salary from empss 



-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Insert Sample Data into Orders
INSERT INTO orders (order_id, customer_id, order_date, total_amount) VALUES
(101, 1, '2025-03-01', 150.0),
(102, 1, '2025-03-05', 200.0),
(103, 2, '2025-03-02', 250.0),
(104, 2, '2025-03-06', 300.0),
(105, 3, '2025-03-03', 100.0),
(106,1, '2025-03-08', 240.0);

