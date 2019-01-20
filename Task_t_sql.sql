	Use master;
	GO
	IF DB_ID (N'TestProg') IS NOT NULL
	DROP DATABASE TestProg;
	GO
	Create Database TestProg;
	GO
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO

	USE TestProg
	GO
	IF NOT EXISTS(SELECT * FROM sys.objects WHERE Object_ID = Object_ID(N'dbo.Products')) 

	Create Table [dbo].[Products]
	(
		Id int NOT NULL Primary Key Identity(1, 1),
		ProductsName NVARCHAR(50) UNIQUE NOT NULL
	)

	IF NOT EXISTS(SELECT * FROM sys.objects WHERE Object_ID = Object_ID(N'dbo.Kategory')) 

	Create Table [dbo].[Kategory]
	(
		Id int NOT NULL Primary Key Identity(1, 1),
		KategoryName NVARCHAR(50) UNIQUE NOT NULL
	)

	IF NOT EXISTS(SELECT * FROM sys.objects WHERE Object_ID = Object_ID(N'dbo.CrossTable')) 
	
	Create Table [dbo].[CrossTable]
	(
		Id_Kategory int  NULL,
		Id_Products int  NULL
	)

	ALTER TABLE CrossTable 
	ADD CONSTRAINT fk_Products_CrossTable
	FOREIGN KEY (Id_Products) REFERENCES Products (Id)
	ON UPDATE CASCADE ON DELETE CASCADE;

	ALTER TABLE CrossTable 
	ADD CONSTRAINT fk_Kategory_CrossTable 
	FOREIGN KEY (Id_Kategory) REFERENCES Kategory (Id)
	ON UPDATE CASCADE ON DELETE CASCADE;

	Insert Into [Products] 
	(ProductsName)
	VALUES ('������'),('�����'),('�������'),('����'),('�����'),('�������'),('��������'),('����'),('���������'), ('�������')

	Insert Into [Kategory] 
	(KategoryName)
	VALUES ('�����'),('������'),('�������'),('���������'),('���������')


	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select k.id, p.id
	from [Kategory] k,
	[Products] p
	where k.KategoryName = '���������'
	and p.ProductsName in ('�������','�����')

	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select k.id as kategory, p.id as products
	from [Kategory] k,
	[Products] p
	where k.KategoryName = '���������'
	and p.ProductsName in ('�����','�������')

	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select k.id as kategory, p.id as products
	from [Kategory] k,
	[Products] p
	where k.KategoryName = '�������'
	and p.ProductsName in ('����','��������')

	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select k.id as kategory, p.id as products
	from [Kategory] k,
	[Products] p
	where k.KategoryName = '������'
	and p.ProductsName in ('�����','���������')

	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select k.id as kategory, p.id as products
	from [Kategory] k,
	[Products] p
	where k.KategoryName = '�����'
	and p.ProductsName in ('������','�������')

	Insert Into CrossTable 
	(Id_Kategory, Id_Products)
	select distinct NULL as kategory, p.id as products
	from [Kategory] k, [Products] p
	where p.ProductsName in ('����')

	