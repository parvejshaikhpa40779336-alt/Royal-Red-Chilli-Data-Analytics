CREATE DATABASE  royal_red_chilli_db;

USE royal_red_chilli_db;

SELECT DATABASE();

CREATE TABLE customers (
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    location VARCHAR(100),
    customer_type VARCHAR(30),
    first_order_date DATE 
    
);

DESC customers;

CREATE TABLE products (
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    product_type VARCHAR(50),
    quality_grade VARCHAR(50),
    purchase_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);

desc products;

CREATE TABLE suppliers (
	supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100) NOT NULL,
    phone VARCHAR(50),
    location VARCHAR(50),
    supplier_type VARCHAR(50)
);

DESC suppliers;

CREATE TABLE purchases (
	purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    purchase_date DATE NOT NULL,
    quantity_kg DECIMAL(10,2) NOT NULL,
    purchase_rate DECIMAL(10,2) NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
    FOREIGN KEY  (product_id) REFERENCES products(product_id)
);


desc purchases;

CREATE TABLE sales (
	sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT  NULL,
    sale_date DATE NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    payment_status VARCHAR(30) NOT NULL,

	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

desc sales;

CREATE TABLE sale_items (
	sale_item_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_kg DECIMAL(10,2) NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    total_price DECIMAL(12,2) NOT NULL,
    
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

desc sale_items;

CREATE TABLE payments (
	payment_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount_paid DECIMAL(12,2) NOT NULL,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id)
);

desc payments;

SHOW TABLES;

INSERT INTO  products 
(product_name, product_type, quality_grade, purchase_price, selling_price)
VALUES 
('Dry Red Chilli', 'Whole', 'Premium', 100, 150),
('Dry Red Chilli', 'Whole', 'Standard', 90, 140),
('Chilli Powder', 'Powder', 'Premium', 100, 180),
('Chilli Powder', 'Powder', 'Standard', 90, 150),
('Chilli Powder', 'Powder', 'Local', 80, 130);

SELECT * FROM products;

INSERT INTO customers
(customer_name, phone, location,customer_type, first_order_date)
VALUES
('Shree Ganesh Kirana', '9876543210', 'Shiradhon', 'Retailer', '2026-01-10'),
('Sai General Store', '9876543211', 'Dharashiv', 'Retailer', '2026-01-15'),
('Om Sai Kirana', '9876543212', 'Tuljapur', 'Retailer', '2026-02-05'),
('Mahalaxmi Stores', '9876543213', 'Solapur', 'Retailer', '2026-02-18'),
('Raj Traders', '9876543214', 'Dharashiv', 'Wholesaler', '2026-01-20'),
('Shivam Wholesale', '9876543215', 'Solapur', 'Wholesaler', '2026-02-10'),
('Royal Food Hotel', '9876543216', 'Hyderabad', 'Hotel', '2026-03-01'),
('Sai Family Restaurant', '9876543217', 'Hyderabad', 'Hotel', '2026-03-12'),
('Ganesh Hotel', '9876543218', 'Dharashiv', 'Hotel', '2026-03-20'),
('Laxmi Kirana', '9876543219', 'Shiradhon', 'Retailer', '2026-04-05');

select * from customers;

INSERT INTO suppliers
(supplier_name, phone, location, supplier_type)
VALUES
('Shree Chilli Traders', '9822000011', 'Dharashiv', 'Wholesaler'),
('Maharashtra Spice Market', '9822000012', 'Solapur', 'Wholesaler'),
('Hyderabad Chilli Supplier', '9822000013', 'Hyderabad', 'Wholesaler'),
('Laxmi Dry Chilli Traders', '9822000014', 'Nizamabad', 'Wholesaler');

SELECT * FROM suppliers;

INSERT INTO purchases
(supplier_id, product_id, purchase_date, quantity_kg,purchase_rate,total_cost)
VALUES
(1, 1, '2026-01-05', 300, 100, 30000),
(1, 2, '2026-01-25', 400, 90, 36000),
(2, 1, '2026-02-08', 250, 100, 25000),
(2, 4, '2026-02-20', 300, 90, 27000),
(3, 3, '2026-03-05', 200, 100, 20000),
(3, 4, '2026-03-18', 350, 90, 31500),
(4, 2, '2026-04-10', 500, 90, 45000),
(4, 5, '2026-04-25', 250, 80, 20000);

select * from purchases;

INSERT INTO sales
(customer_id,sale_date,total_amount,payment_status)
VALUES
(1, '2026-01-12', 750, 'Paid'),
(2, '2026-01-18', 1500, 'Paid'),
(5, '2026-01-28', 2800, 'Partial'),
(3, '2026-02-10', 1800, 'Paid'),
(6, '2026-02-22', 4500, 'Partial'),
(7, '2026-03-08', 9000, 'Paid'),
(8, '2026-03-20', 4500, 'Partial'),
(9, '2026-03-25', 7500, 'Pending'),
(4, '2026-04-12', 2100, 'Paid'),
(10, '2026-04-20', 1500, 'Partial');


select * from sales;

select * from sale_items;
INSERT INTO sale_items
(sale_id,product_id,quantity_kg,selling_price,total_price)
VALUES
(1, 5, 5.00, 150.00, 750.00),

(2, 4, 10.00, 150.00, 1500.00),

(3, 2, 20.00, 140.00, 2800.00),

(4, 3, 10.00, 180.00, 1800.00),

(5, 4, 30.00, 150.00, 4500.00),

(6, 3, 50.00, 180.00, 9000.00),

(7, 4, 30.00, 150.00, 4500.00),

(8, 3, 41.67, 180.00, 7500.60),

(9, 2, 15.00, 140.00, 2100.00),

(10, 5, 10.00, 150.00, 1500.00);

select * from sale_items;

UPDATE sale_items
SET quantity_kg = 50.00,
    selling_price = 150.00,
    total_price = 7500.00
WHERE sale_id = 8;

INSERT INTO payments
(sale_id,payment_date,amount_paid,payment_method,payment_status)
VALUES
(1, '2026-01-12', 750.00, 'Cash', 'Paid'),
(2, '2026-01-18', 1500.00, 'UPI', 'Paid'),
(3, '2026-01-28', 1500.00, 'Cash', 'Partial'),
(4, '2026-02-10', 1800.00, 'UPI', 'Paid'),
(5, '2026-02-22', 2500.00, 'Bank Transfer', 'Partial'),
(6, '2026-03-08', 9000.00, 'Bank Transfer', 'Paid'),
(7, '2026-03-20', 2000.00, 'UPI', 'Partial'),
(8, '2026-03-25', 0.00, NULL, 'Pending'),
(9, '2026-04-12', 2100.00, 'Cash', 'Paid'),
(10, '2026-04-20', 800.00, 'UPI', 'Partial');

select * from payments;

select
	sum(total_amount) as total_sales
from sales;

select
	sum(total_cost) as total_purchase_cost
from purchases;

select
	(select sum(total_amount)from sales) as total_sales,
    (select sum(total_cost)from purchases) as total_purchase_cost,
    (select sum(total_amount) from sales),
    
    (select sum(total_cost) from purchases) as difference;
    
select
	(select sum(total_amount) from sales) as total_sales,
    (select sum(total_cost) from purchases) as total_cost,
    (select sum(total_amount) from sales)
    -(select sum(total_cost)from purchases) as difference;
    
select *
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.product_id;
    
SELECT
	SUM(si.total_price) as total_sales,
    SUM(si.quantity_kg * p.purchase_price) as total_product_cost,
    SUM(si.total_price) - SUM(si.quantity_kg * p.purchase_price) as gross_profit
FROM sale_items si
INNER JOIN products p
	on si.product_id = p.product_id;
    
    
SELECT 
	SUM(quantity_kg) as total_sold_kg
FROM sale_items;

SELECT 
	p.product_name,
    SUM(si.quantity_kg) as total_sold_kg,
    SUM(si.total_price) as total_revenue
FROM sale_items si
INNER JOIN products p
	ON si.product_id = p.product_id
group by p.product_id, p.product_name;


SELECT 
	p.product_name,
    SUM(si.quantity_kg) as total_sold_kg,
    SUM(si.total_price) as total_revenue
FROM sale_items si
INNER JOIN products p
	ON si.product_id = p.product_id
group by p.product_id, p.product_name;

SELECT
	p.product_name,
    SUM(si.quantity_kg) as total_SOLD_kg
FROM sale_items si
INNER JOIN products p
	ON si.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_sold_kg DESC
LIMIT 1;

SELECT
    p.product_name,
    SUM(si.total_price) AS total_revenue
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_revenue DESC
LIMIT 1;

SELECT 
	c.customer_name,
    c.customer_type,
    SUM(s.total_amount) as total_sales
FROM sales s
inner join customers c
	on s.customer_id = c.customer_id
    group by c.customer_id,c.customer_name,c.customer_type
    order by total_sales desc
limit 1;

SELECT 
	c.customer_type,
    COUNT(DISTINCT c.customer_id) as total_customer,
    sum(s.total_amount) as total_sales
from sales s
inner join customers c
	on s.customer_id = c.customer_id
    group by c.customer_type
order by total_sales desc;


select 
	date_format(sale_date, '%Y-%m') as sales_month,
    sum(total_amount) as total_sales
from sales
group by date_format(sale_date, '%Y-%m')
order by sales_month asc;

select
	sum(s.total_amount) as total_sales,
    sum(p.amount_paid) as total_paid,
    sum(s.total_amount) - sum(p.amount_paid) as outstanding_amount
from sales s 
inner join payments p 
	on s.sale_id = p.sale_id;
    
   
select 
	payment_status,
    count(*) as total_sales,
    sum(total_amount) as total_sales_amount
from sales
group by payment_status
order by total_sales_amount desc;

SELECT
    p.product_name,
    COALESCE(SUM(pur.quantity_kg), 0) AS total_purchased_kg,
    COALESCE((
        SELECT SUM(si.quantity_kg)
        FROM sale_items si
        WHERE si.product_id = p.product_id
    ), 0) AS total_sold_kg,
    COALESCE(SUM(pur.quantity_kg), 0)
    -
    COALESCE((
        SELECT SUM(si.quantity_kg)
        FROM sale_items si
        WHERE si.product_id = p.product_id
    ), 0) AS remaining_stock_kg
FROM products p
LEFT JOIN purchases pur
    ON p.product_id = pur.product_id
GROUP BY p.product_id, p.product_name
ORDER BY remaining_stock_kg DESC;


select
	s.supplier_name,
    sum(p.quantity_kg) as total_purchased_kg,
    sum(p.total_cost) as total_purchase_cost
from purchases p 
inner join suppliers s
	on p.supplier_id = s.supplier_id
group by s.supplier_id, s.supplier_name
order by total_purchase_cost desc;


SELECT
    c.customer_type,
    SUM(si.total_price) AS total_sales,
    SUM(si.quantity_kg * p.purchase_price) AS product_cost,
    SUM(si.total_price)
        - SUM(si.quantity_kg * p.purchase_price) AS gross_profit
FROM sale_items si
INNER JOIN sales s
    ON si.sale_id = s.sale_id
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN products p
    ON si.product_id = p.product_id
GROUP BY c.customer_type
ORDER BY gross_profit DESC;

select
	date_format(s.sale_date, '%Y-%m') as sales_month,
    sum(si.total_price) as total_sales,
    sum(si.quantity_kg * p.purchase_price) as product_cost,
    sum(si.total_price)
		- sum(si.quantity_kg * p.purchase_price) as gross_profit
from sale_items si
inner join sales s
	on si.sale_id = s.sale_id
inner join products p
	on si.product_id = p.product_id
group by date_format(s.sale_date, '%Y-%m')
order by sales_month  asc;


SELECT
    p.product_name,
    p.quality_grade,
    SUM(si.quantity_kg) AS sold_kg,
    SUM(si.total_price) AS total_revenue,
    SUM(si.quantity_kg * p.purchase_price) AS product_cost,
    SUM(si.total_price)
        - SUM(si.quantity_kg * p.purchase_price) AS gross_profit
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.quality_grade
ORDER BY gross_profit DESC;

SELECT
    c.customer_name,
    c.customer_type,
    SUM(s.total_amount) AS total_sales,
    SUM(p.amount_paid) AS total_paid,
    SUM(s.total_amount) - SUM(p.amount_paid) AS outstanding_amount
FROM sales s
INNER JOIN customers c
    ON s.customer_id = c.customer_id
INNER JOIN payments p
    ON s.sale_id = p.sale_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.customer_type
HAVING SUM(s.total_amount) > SUM(p.amount_paid)
ORDER BY outstanding_amount DESC;

SELECT
    monthly_sales.sales_month,
    monthly_sales.total_sales,
    monthly_purchases.total_purchase_cost
FROM
(
    SELECT
        DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
        SUM(total_amount) AS total_sales
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
) AS monthly_sales
LEFT JOIN
(
    SELECT
        DATE_FORMAT(purchase_date, '%Y-%m') AS purchase_month,
        SUM(total_cost) AS total_purchase_cost
    FROM purchases
    GROUP BY DATE_FORMAT(purchase_date, '%Y-%m')
) AS monthly_purchases
    ON monthly_sales.sales_month = monthly_purchases.purchase_month
ORDER BY monthly_sales.sales_month ASC;


SELECT
    c.customer_name,
    c.customer_type,
    SUM(s.total_amount) AS total_sales,
    SUM(si.quantity_kg) AS total_quantity_kg
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
INNER JOIN sale_items si
    ON s.sale_id = si.sale_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.customer_type
ORDER BY total_sales DESC
LIMIT 3;


SELECT
    c.customer_name,
    c.customer_type,
    SUM(s.total_amount) AS total_sales,
    SUM(p.amount_paid) AS total_paid,
    SUM(s.total_amount) - SUM(p.amount_paid) AS outstanding_amount
FROM customers c
INNER JOIN sales s
    ON c.customer_id = s.customer_id
INNER JOIN payments p
    ON s.sale_id = p.sale_id
GROUP BY
    c.customer_id,
    c.customer_name,
    c.customer_type
HAVING SUM(s.total_amount) - SUM(p.amount_paid) > 0
ORDER BY outstanding_amount DESC;


with monthly_sales as (
	select 
		date_format(sale_date, '%Y-%m') as sales_month,
        sum(total_amount) as total_sales
	from sales 
    group by date_format(sale_Date, '%Y-%m')
    
),

sales_growth as (
	select 
		sales_month,
        total_sales,
        lag(total_sales) over (
			order by sales_month
		) as previous_month_sales
	from monthly_sales

)
select 
	sales_month,
    total_sales,
    previous_month_sales,
    ROUND(
		(total_sales - previous_month_sales)
        / NULLIF(previous_month_Sales, 0) * 100,
        2
	) as growth_percentage
from sales_growth
order by sales_month;


SELECT
    p.product_name,
    p.quality_grade,
    SUM(si.quantity_kg) AS total_sold_kg,
    SUM(si.total_price) AS total_revenue,
    SUM(si.quantity_kg * p.purchase_price) AS product_cost,
    SUM(si.total_price)
        - SUM(si.quantity_kg * p.purchase_price) AS gross_profit
FROM sale_items si
INNER JOIN products p
    ON si.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name,
    p.quality_grade
ORDER BY gross_profit DESC
LIMIT 3;


select 
	s.supplier_name,
    sum(p.quantity_kg) as total_quanntity_kg,
    sum(p.total_cost) as total_purchase_cost,
    ROUND(
    sum(p.total_cost) / sum(p.quantity_kg),
    2
    ) as average_purchase_rate
from suppliers s
	inner join purchases p 
    on s.supplier_id = p.supplier_id
group by 
	s.supplier_id,
    s.supplier_name
order by total_purchase_cost desc;

select
	p.product_name,
    p.quality_grade,
    coalesce(pur.total_purchased_kg,0) as total_purchased_kg,
    coalesce(si.total_sold_kg, 0) as total_sold_kg,
    coalesce(pur.total_purchased_kg, 0) 
			- coalesce(si.total_sold_kg, 0) as remaining_stock_kg,
		
	(
		coalesce(pur.total_purchased_kg, 0)
			- coalesce(si.total_sold_kg, 0)
	) * p.purchase_price as remaining_stock_value
from products p 
left join (
	select 
		product_id,
        sum(quantity_kg) as total_purchased_kg
	from purchases
    group by product_id
) pur
	on p.product_id = pur.product_id 
left join (
	select 	
		product_id,
        sum(quantity_kg) as total_sold_kg
	from sale_items
    group by product_id
) si
	on p.product_id = si.product_id
order by remaining_stock_value desc;


select 
	c.customer_name,
    c.customer_type,
    COUNT(s.sale_id) as total_orders,
    sum(s.total_amount) as total_sales,
    ROUND(AVG(s.total_amount), 2) as average_order_value
from customers c
inner join sales s
	on c.customer_id = s.customer_id
group by 
	c.customer_id,
    c.customer_name,
    c.customer_type
having count(s.sale_id) > 1
order by total_orders desc;

WITH monthly_purchases AS (
    SELECT
        DATE_FORMAT(purchase_date, '%Y-%m') AS month_name,
        SUM(quantity_kg) AS purchased_kg,
        SUM(total_cost) AS purchase_cost
    FROM purchases
    GROUP BY DATE_FORMAT(purchase_date, '%Y-%m')
),
monthly_sales AS (
    SELECT
        DATE_FORMAT(s.sale_date, '%Y-%m') AS month_name,
        SUM(si.quantity_kg) AS sold_kg,
        SUM(si.total_price) AS sales_revenue
    FROM sales s
    INNER JOIN sale_items si
        ON s.sale_id = si.sale_id
    GROUP BY DATE_FORMAT(s.sale_date, '%Y-%m')
)
SELECT
    COALESCE(mp.month_name, ms.month_name) AS month_name,
    COALESCE(mp.purchased_kg, 0) AS purchased_kg,
    COALESCE(ms.sold_kg, 0) AS sold_kg,
    COALESCE(mp.purchase_cost, 0) AS purchase_cost,
    COALESCE(ms.sales_revenue, 0) AS sales_revenue
FROM monthly_purchases mp
LEFT JOIN monthly_sales ms
    ON mp.month_name = ms.month_name

UNION

SELECT
    ms.month_name,
    0 AS purchased_kg,
    ms.sold_kg,
    0 AS purchase_cost,
    ms.sales_revenue
FROM monthly_sales ms
LEFT JOIN monthly_purchases mp
    ON ms.month_name = mp.month_name
WHERE mp.month_name IS NULL

ORDER BY month_name;


SELECT
    (SELECT SUM(total_amount)
     FROM sales) AS total_sales_revenue,

    (SELECT SUM(quantity_kg)
     FROM sale_items) AS total_sold_kg,

    (SELECT SUM(si.quantity_kg * p.purchase_price)
     FROM sale_items si
     INNER JOIN products p
         ON si.product_id = p.product_id) AS total_product_cost,

    (SELECT SUM(si.total_price)
     FROM sale_items si)
    -
    (SELECT SUM(si.quantity_kg * p.purchase_price)
     FROM sale_items si
     INNER JOIN products p
         ON si.product_id = p.product_id) AS gross_profit,

    ROUND(
        (
            (SELECT SUM(si.total_price)
             FROM sale_items si)
            -
            (SELECT SUM(si.quantity_kg * p.purchase_price)
             FROM sale_items si
             INNER JOIN products p
                 ON si.product_id = p.product_id)
        )
        / NULLIF((SELECT SUM(si.total_price)
                  FROM sale_items si), 0) * 100,
        2
    ) AS gross_profit_margin_pct,

    (SELECT SUM(total_cost)
     FROM purchases) AS total_purchase_cost,

    (SELECT SUM(amount_paid)
     FROM payments) AS total_payments_received,

    (SELECT SUM(total_amount)
     FROM sales)
    -
    (SELECT SUM(amount_paid)
     FROM payments) AS outstanding_amount;
     
     
select 
	(select sum(total_amount)
    from sales) as sales_table_total,
    
    (select sum(total_price)
    from sale_items) as sale_items_total,
    
    (select sum(total_amount)
		from sales)
        -
        
	(select sum(total_price)
    from sale_items) as difference;
    
    
select 
	p.product_name,
    p.quality_grade,
    coalesce(pur.purchased_kg, 0) as purchased_kg,
    coalesce(si.sold_kg, 0) as sold_kg,
    coalesce(pur.purchased_kg, 0)
		- coalesce(si.sold_kg, 0) remaining_stock_kg
	from products p 
    left join (
		select 
			product_id,
            sum(quantity_kg) as purchased_kg
	from purchases 
    group by product_id
    
)pur 
	on p.product_id = pur.product_id
left join (
	select 
		product_id,
        sum(quantity_kg) as sold_kg
	from sale_items
    group by product_id

) si
	on p.product_id = si.product_id
order by remaining_stock_kg desc;
		
        
SELECT
    (SELECT COUNT(*) FROM customers)
        AS total_customers,

    (SELECT COUNT(*) FROM products)
        AS total_products,

    (SELECT SUM(total_amount) FROM sales)
        AS total_sales_revenue,

    (SELECT SUM(quantity_kg) FROM sale_items)
        AS total_sold_kg,

    (SELECT SUM(si.total_price)
     FROM sale_items si)
        AS item_revenue,

    (SELECT SUM(si.total_price)
     FROM sale_items si)
    -
    (SELECT SUM(si.quantity_kg * p.purchase_price)
     FROM sale_items si
     INNER JOIN products p
        ON si.product_id = p.product_id)
        AS gross_profit,

    (SELECT SUM(amount_paid) FROM payments)
        AS total_payments_received,

    (SELECT SUM(total_amount) FROM sales)
    -
    (SELECT SUM(amount_paid) FROM payments)
        AS outstanding_amount;
        
        
SELECT SUM(total_amount) AS Total_Sales
FROM sales;

SELECT SUM(amount_paid) AS Payments_Received
FROM payments;



SELECT
    (SELECT SUM(total_amount) FROM sales)
    -
    (SELECT SUM(amount_paid) FROM payments)
    AS Outstanding_Amount;
    
    
    
SELECT
    SUM(si.total_price) -
    SUM(si.quantity_kg * p.purchase_price) AS Gross_Profit
FROM sale_items si
JOIN products p
    ON si.product_id = p.product_id;
    
    
SELECT
    (SELECT SUM(quantity_kg) FROM purchases)
    -
    (SELECT SUM(quantity_kg) FROM sale_items)
    AS Current_Stock_KG;
    
    
SELECT
    SUM(p.quantity_kg * p.purchase_rate) AS Total_Purchase_Value
FROM purchases p;

SELECT
    p.product_name,
    p.purchase_price,
    COALESCE(pur.total_purchased, 0) -
    COALESCE(sold.total_sold, 0) AS current_stock_kg,
    (
        COALESCE(pur.total_purchased, 0) -
        COALESCE(sold.total_sold, 0)
    ) * p.purchase_price AS current_stock_value
FROM products p
LEFT JOIN (
    SELECT product_id, SUM(quantity_kg) AS total_purchased
    FROM purchases
    GROUP BY product_id
) pur ON p.product_id = pur.product_id
LEFT JOIN (
    SELECT product_id, SUM(quantity_kg) AS total_sold
    FROM sale_items
    GROUP BY product_id
) sold ON p.product_id = sold.product_id;