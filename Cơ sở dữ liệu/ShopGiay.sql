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

----------------------- Create Table ------------------------
create table Category
(
	idCategory int not null identity(1,1),
	nameOfCategory nvarchar(100),
	defaultUrlImage ntext,

	primary key(idCategory),
)

create table Vendor
(
	idVendor int not null identity(1,1),
	nameOfVendor nvarchar(100),
	address nvarchar(100),
	phoneNumber nvarchar(13),

	primary key(idVendor)
)

create table Attribute
(
	idAttribute int not null identity(1,1),
	attributeName nvarchar(100),

	primary key (idAttribute)
)

create table Shoes
(
	idShoes int not null identity(1,1),
	descriptions ntext,
	active bit,
	defaultUrlImage ntext,
	idCategory int,
	idVendor int,
	price float,
	name nvarchar(100),

	primary key(idShoes),
	foreign key(idCategory) references Category(idCategory),
	foreign key(idVendor) references Vendor(idVendor),
)

create table Account
(
	idAccount int not null identity(1,1),
	username nvarchar(24),
	password nvarchar(24),
	role nvarchar(10) default(N'customer') check(role in (N'customer', N'admin')),

	primary key(idAccount),
)

create table Customer
(
	idCustomer int not null identity(1,1),
	idAccount int,
	gender nvarchar(5) check(gender in ('male', 'female')),
	address nvarchar(100),
	phoneNumber nvarchar(50),

	primary key(idCustomer),
	foreign key(idAccount) references Account(idAccount),
)
create table ShoesDetail
(
	idShoesDetail int not null identity(1,1),
	idAttribute int,
	idShoes int,
	active bit,
	quantity int,
	urlImage ntext,
	attibuteValue nvarchar(50),

	primary key(idShoesDetail),
	foreign key(idAttribute) references Attribute(idAttribute),
	foreign key(idShoes) references Shoes(idShoes)
)

create table Cart
(
	idCart int not null identity(1,1),
	idCustomer int,
	idShoeDetail int,
	quantity int,

	primary key(idCart),
	foreign key(idCustomer) references Customer(idCustomer),
	foreign key(idShoeDetail) references ShoesDetail(idShoesDetail),

)

-------------- Thêm dữ liệu -------------------
USE ShopGiayCongNgheWeb
insert into Vendor(nameOfVendor, address, phoneNumber)
values
(N'Adidas', N'China', 123456789),
(N'Nike', N'China', 123456789),
(N'Jordan', N'China', 123456789),
(N'Converse', N'Campuchia', 123456789),
(N'Reebok', N'VietNam', 123456789),
(N'Vans', N'China', 123456789)
go

insert into Category (nameOfCategory, defaultUrlImage)
values
(N'Male', '/Content/images/men.jpg'),
(N'Female', '/Content/images/women.jpg'),
(N'Children', '/Content/images/children.jpg')
go

insert into Attribute (attributeName)
values (N'Size'),(N'Color')

insert into Account(username, password, role)
values
(N'Hieu', '123', 'customer'),
(N'Hau', '123', 'customer'),
(N'Hiep', '123', 'customer'),
(N'Linh', '123', 'customer'),
(N'hieu', '123', 'customer'),
(N'hieu', '123', 'customer'),
(N'hieu', '123', 'customer')
go

insert into Customer
(idAccount, gender, address, phoneNumber)
values
(2, 'female', 'China', '123456789'),
(3, 'male', 'Vietnam', '123456789'),
(4, 'female', 'Japan', '123456789'),
(5, 'male', 'Korea', '123456789'),
(6, 'female', 'Chicago', '123456789'),
(7, 'male', N'Vancuver', '123456789')
go


insert into Shoes (name ,active, descriptions, defaultUrlImage, idCategory, idVendor, price)
values
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport ',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30),
('Running Shoes Athletic Shoes Slip-On Sport Shoes Lightweight Comfortable Sneakers',1, N'Sole: High quality synthetic rubber sole, Flexible, stability, Anti-slip, wearable Upper material: Fly-Knit mesh fabric material, breathable, light, cool quick-drying Kids Sneakers Feature Stylish Sock-Like Slip-On Construction For Easy On /Off,Provide More Comfortable Wearing Experience Suitable for various occasions, especially for running, athletic, walking, playing, hiking and more Antimicrobial top cloth minimizes the risk of odor causing bacteria. Annti-odor technology applied to footbed to prevent the growth of odor-causing microbes.', '/Content/images/shoe_1.jpg', 1, 1, 30)

insert into ShoesDetail(active,idAttribute,idShoes,quantity,urlImage)
values
(1, 1, 1, 15, '/Content/images/shoe_1.jpg'),
(1, 2, 1, 16, '/Content/images/shoe_1.jpg'),
(1, 1, 2, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 3, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 4, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 5, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 6, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 7, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 8, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 9, 15, '/Content/images/shoe_1.jpg'),
(1, 1, 10, 15, '/Content/images/shoe_1.jpg')
