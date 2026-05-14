-- creating tables

create table categories (
    category_id int auto_increment primary key,
    category_name varchar(255) not null
);

create table suppliers (
    supplier_id int auto_increment primary key,
    supplier_name varchar(255) not null,
    supplier_email varchar(255) unique
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
    inventory_quantity int not null check (inventory_quantity >= 0),
    foreign key (product_id) references products(product_id)
);

create table customers (
    customer_id int auto_increment primary key,
    customer_name varchar(255) not null unique,
    customer_email varchar(255) not null unique
);

create table transactions (
    transaction_id int auto_increment primary key,
    transaction_product_id int,
    transaction_customer_id int,
    transaction_quantity int not null check (transaction_quantity > 0),
    foreign key (transaction_product_id) references products(product_id),
    foreign key (transaction_customer_id) references customers(customer_id)
);

