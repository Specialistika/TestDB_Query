	SELECT	x.ProductsName as '��� ��������', 
			k.KategoryName as '��� ���������'
	FROM	(select [ProductsName], c.Id_Products, c.Id_Kategory
	FROM	Products p
			inner join 
			CrossTable c
	on		p.Id = c.Id_Products) x
			left join 
			Kategory k
	on		x.Id_Kategory = k.Id




	

	