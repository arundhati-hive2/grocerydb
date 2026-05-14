-- creating tables

create table categories (
    category_id int auto_increment primary key,
    category_name varchar(255) not null
);

create table suppliers (
    supplier_id int auto_increment primary key,
    supplier_name varchar(255) not null,
    supplier_email varchar(255) not null unique,
    supplier_contact varchar(15) not null
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(255) not null,
    product_price decimal(10, 2) not null check (product_price > 0),
    category_id int,
    foreign key (category_id) references categories(category_id)
);

create table inventory (
    inventory_id int auto_increment primary key,
    inventory_product_id int,
    inventory_threshold int not null check (inventory_threshold >= 0),
    inventory_quantity int not null check (inventory_quantity >= 0) default 0,
    foreign key (inventory_product_id) references products(product_id)
);

create table customers (
    customer_id int auto_increment primary key,
    customer_name varchar(255) not null unique,
    customer_email varchar(255) not null unique,
    customer_phone varchar(10) unique,
    customer_loyalty_points int default 0
);

create table transactions (
    transaction_id int auto_increment primary key,
    transaction_product_id int,
    transaction_customer_id int,
    transaction_date date default current_date,
    transaction_quantity int not null check (transaction_quantity > 0),
    foreign key (transaction_product_id) references products(product_id),
    foreign key (transaction_customer_id) references customers(customer_id)
);

-- altering tables
alter table products add product_description varchar(255);
alter table customers drop column customer_email;
alter table products modify product_name varchar(100);

-- inserting data

-- categories

insert into categories (category_name)
values
('Grains'),
('Dairy'),
('Fruits'),
('Vegetables');

-- suppliers

insert into suppliers (supplier_name, supplier_contact, supplier_email)
values
('GreenHarvest Co', '1116543210', 'greenharvest@supplymail.com'),
('DairyPure Farms', '1113456780', 'dairypure@supplymail.com'),
('GoldenGrain Traders', '1118776655', 'goldengrain@supplymail.com'),
('SnackSphere Ltd', '1119776655', 'snacksphere@supplymail.com');

-- products

insert into products (product_name, product_price, category_id)
values
('Organic Spinach Bunch', 60.00, 1),
('Buffalo Milk 1L', 80.00, 2),
('Farm Eggs (12 pack)', 120.00, 2),
('Rice Bag', 1500.00, 4);

-- inventory

insert into inventory (
    inventory_product_id,
    inventory_threshold,
    inventory_quantity
)
values
(1, 10, 25),
(2, 15, 40),
(3, 20, 100),
(4, 5, 12),

-- customers

insert into customers (
    customer_name,
    customer_phone,
    customer_loyalty_points
)
values
('Nomlu Arahar', '9000055555', 95),
('Kiri Osdan', '9000066666', 410),
('Saubal Hut', '9000077777'),
('Getset Kopje', '9000088888', 150);

-- transactions

insert into transactions (
    transaction_product_id,
    transaction_customer_id,
    transaction_date,
    transaction_quantity
)
values
(1, 1, '2026-05-10', 1),
(3, 2, '2026-05-11', 2),
(4, 3, '2026-05-12', 1),
(2, 1, '2026-05-13', 1),
