CREATE DATABASE practice_hub;
USE practice_hub;

CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2) DEFAULT 0.00
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2) NOT NULL CHECK (salary > 0),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50),
    country VARCHAR(50) DEFAULT 'India',
    joined_date DATE NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL DEFAULT 0,
    supplier VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total_amount DECIMAL(12,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE salaries (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    effective_date DATE NOT NULL,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);



INSERT INTO departments (dept_name, location, budget) VALUES
('Engineering', 'Bangalore', 950000.00),
('Marketing', 'Mumbai', 500000.00),
('Sales', 'Delhi', 750000.00),
('Human Resources', 'Hyderabad', 300000.00),
('Finance', 'Pune', 600000.00),
('Operations', 'Chennai', 450000.00),
('Product', 'Bangalore', 800000.00),
('Customer Support', 'Kolkata', 250000.00);



INSERT INTO employees (first_name, last_name, email, phone, hire_date, salary, dept_id, manager_id) VALUES
('Rajesh', 'Kumar', 'rajesh.kumar@company.com', '9810001111', '2018-03-15', 95000.00, 1, NULL),
('Priya', 'Sharma', 'priya.sharma@company.com', '9820002222', '2019-06-01', 87000.00, 2, NULL),
('Amit', 'Verma', 'amit.verma@company.com', '9830003333', '2017-11-20', 105000.00, 3, NULL),
('Sneha', 'Patel', 'sneha.patel@company.com', '9840004444', '2020-01-10', 72000.00, 4, NULL),
('Vikram', 'Singh', 'vikram.singh@company.com', '9850005555', '2016-08-05', 120000.00, 5, NULL),
('Neha', 'Gupta', 'neha.gupta@company.com', '9860006666', '2021-03-22', 68000.00, 6, NULL),
('Arjun', 'Mehta', 'arjun.mehta@company.com', '9870007777', '2019-09-15', 98000.00, 7, NULL),
('Kavya', 'Reddy', 'kavya.reddy@company.com', '9880008888', '2022-05-01', 60000.00, 8, NULL),
('Rohit', 'Joshi', 'rohit.joshi@company.com', '9890009999', '2018-07-18', 88000.00, 1, 1),
('Ananya', 'Das', 'ananya.das@company.com', '9800010000', '2020-11-30', 75000.00, 2, 2),
('Suresh', 'Nair', 'suresh.nair@company.com', '9811011111', '2017-04-25', 91000.00, 3, 3),
('Deepa', 'Pillai', 'deepa.pillai@company.com', '9822022222', '2021-08-14', 65000.00, 4, 4),
('Karan', 'Malhotra', 'karan.malhotra@company.com', '9833033333', '2019-02-28', 83000.00, 5, 5),
('Pooja', 'Iyer', 'pooja.iyer@company.com', '9844044444', '2022-01-17', 62000.00, 6, 6),
('Manish', 'Tiwari', 'manish.tiwari@company.com', '9855055555', '2018-10-05', 97000.00, 7, 7),
('Ritu', 'Agarwal', 'ritu.agarwal@company.com', '9866066666', '2020-06-20', 70000.00, 8, 8),
('Sanjay', 'Bhatt', 'sanjay.bhatt@company.com', '9877077777', '2016-12-01', 110000.00, 1, 1),
('Meera', 'Chopra', 'meera.chopra@company.com', '9888088888', '2021-04-10', 66000.00, 2, 2),
('Tarun', 'Saxena', 'tarun.saxena@company.com', '9899099999', '2019-07-22', 79000.00, 3, 3),
('Divya', 'Kulkarni', 'divya.kulkarni@company.com', '9810110000', '2023-02-14', 58000.00, 4, 4),
('Harish', 'Rao', 'harish.rao@company.com', '9821221111', '2017-09-09', 102000.00, 5, 5),
('Lakshmi', 'Venkat', 'lakshmi.venkat@company.com', '9832332222', '2022-08-30', 63000.00, 6, 6),
('Nitin', 'Desai', 'nitin.desai@company.com', '9843443333', '2018-05-16', 89000.00, 7, 7),
('Swati', 'Jain', 'swati.jain@company.com', '9854554444', '2020-09-03', 73000.00, 8, 8),
('Gaurav', 'Pandey', 'gaurav.pandey@company.com', '9865665555', '2019-11-27', 85000.00, 1, 1),
('Asha', 'Menon', 'asha.menon@company.com', '9876776666', '2021-06-08', 67000.00, 2, 2),
('Rahul', 'Srivastava', 'rahul.srivastava@company.com', '9887887777', '2016-03-30', 115000.00, 3, 3),
('Priyanka', 'Bose', 'priyanka.bose@company.com', '9898998888', '2023-05-21', 56000.00, 4, 4),
('Varun', 'Kapoor', 'varun.kapoor@company.com', '9809109999', '2018-01-14', 93000.00, 5, 5),
('Smita', 'Patil', 'smita.patil@company.com', '9810210000', '2020-03-08', 77000.00, 6, 6);



INSERT INTO customers (full_name, email, phone, city, country, joined_date) VALUES
('Aakash Trivedi', 'aakash.t@gmail.com', '9901001001', 'Mumbai', 'India', '2021-01-15'),
('Bhavna Shah', 'bhavna.shah@gmail.com', '9902002002', 'Ahmedabad', 'India', '2021-03-22'),
('Chirag Lotia', 'chirag.l@gmail.com', '9903003003', 'Surat', 'India', '2021-05-10'),
('Disha Mody', 'disha.mody@gmail.com', '9904004004', 'Pune', 'India', '2021-07-18'),
('Eshan Parikh', 'eshan.p@gmail.com', '9905005005', 'Vadodara', 'India', '2021-09-05'),
('Foram Desai', 'foram.d@gmail.com', '9906006006', 'Rajkot', 'India', '2021-11-12'),
('Gaurangi Mehta', 'gaurangi.m@gmail.com', '9907007007', 'Mumbai', 'India', '2022-01-20'),
('Harsh Patel', 'harsh.p@gmail.com', '9908008008', 'Delhi', 'India', '2022-02-14'),
('Isha Kapoor', 'isha.k@gmail.com', '9909009009', 'Bangalore', 'India', '2022-03-30'),
('Jayesh Rathod', 'jayesh.r@gmail.com', '9910010010', 'Chennai', 'India', '2022-05-08'),
('Krupa Nair', 'krupa.n@gmail.com', '9911011011', 'Hyderabad', 'India', '2022-06-25'),
('Laksh Sharma', 'laksh.s@gmail.com', '9912012012', 'Kolkata', 'India', '2022-08-03'),
('Manav Joshi', 'manav.j@gmail.com', '9913013013', 'Pune', 'India', '2022-09-17'),
('Nidhi Gupta', 'nidhi.g@gmail.com', '9914014014', 'Delhi', 'India', '2022-10-29'),
('Om Prakash', 'om.p@gmail.com', '9915015015', 'Jaipur', 'India', '2022-12-05'),
('Palak Verma', 'palak.v@gmail.com', '9916016016', 'Lucknow', 'India', '2023-01-18'),
('Qasim Ali', 'qasim.a@gmail.com', '9917017017', 'Hyderabad', 'India', '2023-02-27'),
('Riddhi Soni', 'riddhi.s@gmail.com', '9918018018', 'Ahmedabad', 'India', '2023-04-04'),
('Sahil Bhatia', 'sahil.b@gmail.com', '9919019019', 'Mumbai', 'India', '2023-05-13'),
('Tanvi Rao', 'tanvi.r@gmail.com', '9920020020', 'Bangalore', 'India', '2023-06-22'),
('Uday Kiran', 'uday.k@gmail.com', '9921021021', 'Chennai', 'India', '2023-07-31'),
('Vidya Pillai', 'vidya.p@gmail.com', '9922022022', 'Kochi', 'India', '2023-08-15'),
('Wahida Banu', 'wahida.b@gmail.com', '9923023023', 'Mysore', 'India', '2023-09-02'),
('Xerxes Irani', 'xerxes.i@gmail.com', '9924024024', 'Mumbai', 'India', '2023-09-20'),
('Yashvi Doshi', 'yashvi.d@gmail.com', '9925025025', 'Rajkot', 'India', '2023-10-08'),
('Zara Khan', 'zara.k@gmail.com', '9926026026', 'Delhi', 'India', '2023-10-25'),
('Aryan Malviya', 'aryan.m@gmail.com', '9927027027', 'Indore', 'India', '2023-11-10'),
('Bhumi Trivedi', 'bhumi.t@gmail.com', '9928028028', 'Surat', 'India', '2023-11-28'),
('Chetan Solanki', 'chetan.s@gmail.com', '9929029029', 'Vadodara', 'India', '2023-12-14'),
('Drashti Shah', 'drashti.sh@gmail.com', '9930030030', 'Mumbai', 'India', '2024-01-05');


INSERT INTO products (product_name, category, price, stock_quantity, supplier) VALUES
('Laptop Pro 15', 'Electronics', 75000.00, 50, 'TechWorld Supplies'),
('Wireless Mouse', 'Electronics', 1200.00, 200, 'TechWorld Supplies'),
('Mechanical Keyboard', 'Electronics', 3500.00, 150, 'TechWorld Supplies'),
('27-inch Monitor', 'Electronics', 22000.00, 60, 'DisplayMart'),
('USB-C Hub', 'Electronics', 2500.00, 180, 'TechWorld Supplies'),
('Noise Cancelling Headphones', 'Electronics', 8500.00, 90, 'SoundZone'),
('Webcam HD', 'Electronics', 4200.00, 110, 'SoundZone'),
('Office Chair', 'Furniture', 12000.00, 40, 'ComfortZone'),
('Standing Desk', 'Furniture', 28000.00, 25, 'ComfortZone'),
('Desk Lamp', 'Furniture', 1800.00, 120, 'BrightHome'),
('Notebook Pack (5)', 'Stationery', 250.00, 500, 'PaperWorld'),
('Ballpen Set (10)', 'Stationery', 150.00, 600, 'PaperWorld'),
('Sticky Notes Pack', 'Stationery', 120.00, 700, 'PaperWorld'),
('Whiteboard Marker Set', 'Stationery', 350.00, 300, 'PaperWorld'),
('Printer Paper A4 (500 sheets)', 'Stationery', 450.00, 400, 'PaperWorld'),
('Python Programming Book', 'Books', 699.00, 80, 'KnowledgeHub'),
('MySQL Complete Guide', 'Books', 599.00, 70, 'KnowledgeHub'),
('Data Science Handbook', 'Books', 799.00, 65, 'KnowledgeHub'),
('Clean Code', 'Books', 649.00, 75, 'KnowledgeHub'),
('System Design Primer', 'Books', 749.00, 60, 'KnowledgeHub'),
('Yoga Mat', 'Fitness', 1500.00, 100, 'FitLife'),
('Resistance Bands Set', 'Fitness', 800.00, 150, 'FitLife'),
('Dumbbell Set 10kg', 'Fitness', 3200.00, 45, 'FitLife'),
('Water Bottle 1L', 'Fitness', 600.00, 250, 'FitLife'),
('Protein Powder 1kg', 'Fitness', 2200.00, 80, 'NutriStore');


INSERT INTO orders (customer_id, order_date, status, total_amount) VALUES
(1, '2023-01-05 10:30:00', 'Delivered', 76200.00),
(2, '2023-01-18 14:15:00', 'Delivered', 4700.00),
(3, '2023-02-02 09:45:00', 'Delivered', 22000.00),
(4, '2023-02-20 16:00:00', 'Delivered', 9300.00),
(5, '2023-03-08 11:20:00', 'Delivered', 1350.00),
(6, '2023-03-25 13:50:00', 'Delivered', 28000.00),
(7, '2023-04-10 10:00:00', 'Delivered', 8500.00),
(8, '2023-04-28 15:30:00', 'Delivered', 2500.00),
(9, '2023-05-14 09:15:00', 'Delivered', 12000.00),
(10, '2023-05-30 12:45:00', 'Delivered', 3650.00),
(11, '2023-06-12 14:00:00', 'Delivered', 75000.00),
(12, '2023-06-28 10:30:00', 'Delivered', 5900.00),
(13, '2023-07-15 16:20:00', 'Delivered', 22950.00),
(14, '2023-07-31 11:00:00', 'Delivered', 1448.00),
(15, '2023-08-16 09:30:00', 'Delivered', 8500.00),
(16, '2023-08-30 14:45:00', 'Delivered', 4200.00),
(17, '2023-09-14 10:15:00', 'Delivered', 28750.00),
(18, '2023-09-28 13:00:00', 'Delivered', 1800.00),
(19, '2023-10-12 15:30:00', 'Shipped', 3200.00),
(20, '2023-10-26 09:45:00', 'Shipped', 9100.00),
(21, '2023-11-08 11:20:00', 'Shipped', 2200.00),
(22, '2023-11-22 14:00:00', 'Pending', 76800.00),
(23, '2023-12-05 10:45:00', 'Pending', 1299.00),
(24, '2023-12-19 16:15:00', 'Pending', 4500.00),
(25, '2024-01-03 09:00:00', 'Pending', 600.00),
(1, '2024-01-17 13:30:00', 'Cancelled', 22000.00),
(3, '2024-01-28 11:00:00', 'Shipped', 8500.00),
(5, '2024-02-10 14:20:00', 'Delivered', 1948.00),
(7, '2024-02-24 10:30:00', 'Pending', 3500.00),
(9, '2024-03-08 15:00:00', 'Shipped', 12600.00);


INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 75000.00),
(1, 2, 1, 1200.00),
(2, 3, 1, 3500.00),
(2, 5, 1, 1200.00),
(3, 4, 1, 22000.00),
(4, 6, 1, 8500.00),
(4, 24, 1, 600.00),
(4, 22, 1, 800.00),
(5, 12, 3, 150.00),
(5, 13, 5, 120.00),
(5, 14, 1, 350.00),
(6, 9, 1, 28000.00),
(7, 6, 1, 8500.00),
(8, 5, 1, 2500.00),
(9, 8, 1, 12000.00),
(10, 11, 5, 250.00),
(10, 15, 2, 450.00),
(10, 13, 5, 120.00),
(11, 1, 1, 75000.00),
(12, 16, 2, 699.00),
(12, 17, 1, 599.00),
(12, 19, 1, 649.00),
(12, 20, 1, 749.00),
(12, 18, 1, 799.00),
(13, 4, 1, 22000.00),
(13, 2, 1, 1200.00),
(13, 6, 1, 8500.00),
(13, 10, 1, 1800.00),
(14, 11, 2, 250.00),
(14, 12, 3, 150.00),
(14, 13, 2, 120.00),
(14, 14, 1, 350.00),
(14, 15, 1, 450.00),
(15, 6, 1, 8500.00),
(16, 7, 1, 4200.00),
(17, 9, 1, 28000.00),
(17, 2, 1, 1200.00),
(17, 10, 1, 1800.00),
(18, 10, 1, 1800.00),
(19, 23, 1, 3200.00),
(20, 8, 1, 12000.00),
(21, 25, 1, 2200.00),
(22, 1, 1, 75000.00),
(22, 2, 1, 1200.00),
(22, 3, 1, 3500.00),
(23, 16, 1, 699.00),
(23, 17, 1, 600.00),
(24, 21, 1, 1500.00),
(24, 22, 1, 800.00),
(24, 24, 1, 600.00),
(24, 25, 1, 2200.00),
(25, 24, 1, 600.00),
(26, 4, 1, 22000.00),
(27, 6, 1, 8500.00),
(28, 11, 3, 250.00),
(28, 17, 1, 599.00),
(28, 16, 1, 699.00),
(29, 3, 1, 3500.00),
(30, 8, 1, 12000.00),
(30, 25, 1, 2200.00),
(30, 24, 2, 600.00);


INSERT INTO salaries (emp_id, amount, effective_date) VALUES
(1, 80000.00, '2018-03-15'),
(1, 88000.00, '2020-04-01'),
(1, 95000.00, '2022-04-01'),
(2, 70000.00, '2019-06-01'),
(2, 80000.00, '2021-06-01'),
(2, 87000.00, '2023-01-01'),
(3, 90000.00, '2017-11-20'),
(3, 98000.00, '2020-01-01'),
(3, 105000.00, '2022-07-01'),
(4, 60000.00, '2020-01-10'),
(4, 67000.00, '2022-01-01'),
(4, 72000.00, '2023-07-01'),
(5, 100000.00, '2016-08-05'),
(5, 110000.00, '2019-01-01'),
(5, 120000.00, '2021-08-01'),
(6, 58000.00, '2021-03-22'),
(6, 63000.00, '2022-10-01'),
(6, 68000.00, '2023-10-01'),
(7, 85000.00, '2019-09-15'),
(7, 92000.00, '2021-09-01'),
(7, 98000.00, '2023-04-01'),
(8, 52000.00, '2022-05-01'),
(8, 57000.00, '2023-05-01'),
(8, 60000.00, '2024-01-01'),
(9, 75000.00, '2018-07-18'),
(9, 82000.00, '2021-01-01'),
(9, 88000.00, '2023-01-01'),
(10, 63000.00, '2020-11-30'),
(10, 70000.00, '2022-11-01'),
(10, 75000.00, '2024-01-01');


