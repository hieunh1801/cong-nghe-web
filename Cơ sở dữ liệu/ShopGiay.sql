IF NOT EXISTS (
	SELECT name
	FROM sys.databases
	WHERE name = N'ShopGiayCongNgheWeb'
)
CREATE DATABASE ShopGiayCongNgheWeb
GO

-- Use database ShopGiayCongNgheWeb
USE ShopGiayCongNgheWeb
GO

----------------------- Create table ------------------------
create table Category (
	idCategory int not null identity(1,1),
	nameOfCategory nvarchar(100),
	defaultUrlImage ntext,
	
	primary key(idCategory),
)

create table Vendor(
	idVendor int not null identity(1,1),
	nameOfVendor nvarchar(100),
	address nvarchar(100),
	phoneNumber nvarchar(13),
	
	primary key(idVendor)
)

create table Attribute (
	idAttribute int not null identity(1,1),
	attributeName nvarchar(100),
	
	primary key (idAttribute)
)

create table Shoes (
	idShoes int not null identity(1,1),
	descriptions ntext,
	active bit,
	defaultUrlImage ntext,
	idCategory int, 
	idVendor int,
	price float,
	
	primary key(idShoes),
	foreign key(idCategory) references Category(idCategory),
	foreign key(idVendor) references Vendor(idVendor),
)

create table Account (
	idAccount int not null identity(1,1),
	username nvarchar(24),
	password nvarchar(24),
	role nvarchar(10) default(N'customer') check(role in (N'customer', N'admin')),
	
	primary key(idAccount),
)

create table Customer (
	idCustomer int not null identity(1,1),
	idAccount int,
	gender nvarchar(5) check(gender in ('male', 'female')),
	address nvarchar(100),
	phoneNumber nvarchar(50),
	
	primary key(idCustomer),
	foreign key(idAccount) references Account(idAccount),
)
create table ShoesDetail (
	idShoesDetail int not null identity(1,1),
	idAttribute int,
	idShoes int,
	active bit,
	quantity int,
	urlImage ntext,
 
	primary key(idShoesDetail),
	foreign key(idAttribute) references Attribute(idAttribute),
	foreign key(idShoes) references Shoes(idShoes)
)

create table Cart (
	idCart int not null identity(1,1),
	idCustomer int,
	idShoeDetail int,
	quantity int,

	primary key(idCart),
	foreign key(idCustomer) references Customer(idCustomer),
	foreign key(idShoeDetail) references ShoesDetail(idShoesDetail),

)

-------------- Thêm dữ liệu -------------------
insert into Vendor(nameOfVendor, address, phoneNumber)
values(N'Adidas', N'Hoàng Quốc Việt', 123456789),
	  (N'Nike', N'Hoàng Quốc Việt', 123456789),
	  (N'Jordan', N'Hoàng Quốc Việt', 123456789),
	  (N'Converse', N'Hoàng Quốc Việt', 123456789),
	  (N'Reebok', N'Hoàng Quốc Việt', 123456789),
	  (N'Vans', N'Hoàng Quốc Việt', 123456789)

insert into Category(nameOfCategory, defaultUrlImage)
values(N'Thể thao', 'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg'),
(N'Nữ', 'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg'),
(N'Nam', 'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg'),		
(N'Trẻ nhỏ', 'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg'),
(N'Thể thao', 'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg')

insert into Attribute(attributeName)
values(N'Kích cỡ'),
(N'Màu sắc')

insert into Account(username, password, role) 
values(N'hieu', '123', 'customer');

insert into Customer(idAccount, gender, address, phoneNumber)
values(1, 'male',N'Cầu giấy - Hoàng Quốc Việt', '123456789')

insert into Shoes(active, descriptions, defaultUrlImage, idCategory, idVendor, price)
values(1, N'Giầy 1', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300),
(1, N'Giầy 2', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300),
(1, N'Giầy 3', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300),
(1, N'Giầy 4', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300),
(1, N'Giầy 5', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300),
(1, N'Giầy 6', N'https://images-na.ssl-images-amazon.com/images/I/61cbAQatNlL._UY395_.jpg', 1, 1, 12300)

select * from Shoes