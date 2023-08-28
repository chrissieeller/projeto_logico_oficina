use ecommerce; 

show tables; 

insert into clients (fName, mName, lName, CPF, birthDate, address) values
	('Maria','M','Silva',123456789,'1988-02-14','Rua Silva de Prata, 29, Carangola'),
    ('Matheus','O','Pimentel',987654321,'1990-04-16','Rua Alameda, 289, Centro'),
    ('Ricardo','F','Silva',456789123,'1994-08-23','Avenida Alameda Vinha, 100, Centro'),
    ('Julia','S','França',789123456,'1984-12-04','Rua Lareiras, 861, Centro');
    
insert into product (productName, productCategory, productDescription, productPrice, rating) values
	('Microfone','Electronic','Gravação de áudio plug and play',299.90,4.8),
    ('Vavazinha','Toys','Inspirada na Wandinha',66.90,5.0),
    ('Vestido','Clothing','Curto com bojo',129.00,4.7),
    ('1984','Books','George Orwell',40.00,4.8);

select * from clients;
select * from product;

delete from orders where clients_idClient in  (1,2,3,4);
insert into orders (clients_idClient, orderStatus, orderDescription, shipping) values 
	(1, default,'compra via aplicativo',null),
    (2,default,'compra via aplicativo',50),
	(3,'Sent',null,null),
	(4,default,'compra via web site',150);
                             
select * from orders;

insert into storages (storageLocation,quantity) values 
	('Rio de Janeiro',1000),
	('Rio de Janeiro',500),
	('São Paulo',10),
	('São Paulo',100),
	('São Paulo',10),
	('Brasília',60);
    
select * from storages;

insert into supplier (supplierName, CNPJ, supplierContact) values
	('Almeida e filhos', 123456789123456,'21985474'),
	('Eletrônicos Silva',854519649143457,'21985484'),
	('Eletrônicos Valma', 934567893934695,'21975474');

select * from supplier;

insert into seller (sellerName, CPF, sellerContact) values
	('Jorge Silva',74185296382,321654987),
    ('Mariana Ferreira',25487956328,635254145),
    ('Julio Cesar',78451236559,326547859);

select * from seller;

insert into productOrderSeller (productQuantity) values
	(80),
    (10);

select * from productOrderSeller;
