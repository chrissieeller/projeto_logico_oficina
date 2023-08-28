create database ecommerce;
use ecommerce;

create table clients(
	idClient int auto_increment primary key,
    fName varchar(15),
    mName char(1),
    lName varchar(20),
    CPF char(11) not null,
    birthDate date,
    address varchar(45), 
    constraint unique_cpf_client unique (CPF)
);

desc clients;

create table product(
	idProduct int auto_increment primary key,
    productName varchar(15) not null,
    productCategory enum('Electronic','Toys','Clothing','Decor','Books'),
    productDescription varchar(45), 
    productPrice float,
    rating float default 0
);

desc product;

create table payment(
	idPayment int auto_increment primary key,
    clients_idClient int, 
    orders_idOrder int,
    paymentType enum('Credit Card','Debit Card','Bank Deposit', 'Bank Slip'),
    constraint fk_payment_client foreign key (clients_idClient) references clients (idClient),
    constraint fk_payment_order foreign key (orders_idOrder) references orders(idOrder)
);

desc payment;

create table orders(
	idOrder int auto_increment primary key,
    clients_idClient int,
    orderStatus enum('Processing','Sent','Delivered') default 'Processing',
    orderDescription varchar(180),
    shipping float default 10,
    constraint fk_orders_client foreign key (clients_idClient) references clients (idClient)
);

desc orders;

create table storages(
	idStorage int auto_increment primary key,
    storageLocation varchar(180),
    quantity int default 0
);

desc storages;

create table supplier(
	idSupplier int auto_increment primary key,
    supplierName varchar(45) not null,
    CNPJ char(15) not null,
    supplierContact char(11) not null,
    constraint unique_supplier_cnpj unique (CNPJ)
);

desc supplier;

create table seller(
	idSeller int auto_increment primary key,
    sellerName varchar(45) not null,
    CPF char(11) not null,
    sellerContact char(11) not null,
    constraint unique_seller_cpf unique (CPF)
);

desc seller;

create table productOrders(
	idProdOrder int auto_increment primary key,
    product_idProduct int,
    orders_idOrder int, 
    productQuantity int,
    productStatus enum('Avaliable','Out of Storage'),
    constraint fk_idProduct_Orders foreign key (product_idProduct) references product (idProduct),
    constraint fk_idOrder_Product foreign key (orders_idOrder) references orders (idOrder)
);

desc productOrders;

create table productStorage(
	idProdStorage int auto_increment primary key,
    product_idProduct int,
    storages_idStorage int,
    position char(3),
    constraint fk_idProduct_Storage foreign key (product_idProduct) references product (idProduct),
    constraint fk_idStorage_Product foreign key (storages_idStorage) references storages (idStorage)
);

desc productStorage;

create table productSupplier(
	idProdSupplier int auto_increment primary key,
    product_idProduct int,
    supplier_idSupplier int,
    productQuantity int not null,
    constraint fk_idProduct_Supplier foreign key (product_idProduct) references product (idProduct),
    constraint fk_idSupplier_Product foreign key (supplier_idSupplier) references supplier (idSupplier)
);

desc productSupplier;

create table productOrderSeller(
	idProdOrderSeller int auto_increment primary key,
	seller_idSeller int,
    product_idProduct int,
    orders_idOrder int,
    productQuantity int default 1,
    constraint fk_idSeller_seller foreign key (seller_idSeller) references seller (idSeller),
    constraint fk_idProduct_seller foreign key (product_idProduct) references product (idProduct),
    constraint fk_idOrder_seller foreign key (orders_idOrder) references orders (idOrder)
);

desc productOrderSeller;

show tables; 

show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints;
