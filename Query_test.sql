	SELECT	x.ProductsName as 'Имя продукта', 
			k.KategoryName as 'Имя категории'
	FROM	(select [ProductsName], c.Id_Products, c.Id_Kategory
	FROM	Products p
			inner join 
			CrossTable c
	on		p.Id = c.Id_Products) x
			left join 
			Kategory k
	on		x.Id_Kategory = k.Id




	

	