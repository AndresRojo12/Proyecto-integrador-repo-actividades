use [staging]
select a.nombre + ' ' + a.apellido1 as Vendedor, b.pais, b.region, c.nombre_cliente as Cliente, e.nombre as Producto, SUM(d.cantidad) as Cantidad_Compra,SUM(d.total) as Total_Compra from[dbo].[Empleado] as a
inner join (select DISTINCT * from[dbo].[Geografia]) as b on a.ID_geografia = b.ID_geografia
left join (select Distinct * from[dbo].[Cliente]) as c on a.ID_empleado = c.ID_empleado_rep_ventas
left join (select Distinct * from[dbo].[Hechos]) as d on c.ID_cliente = d.ID_cliente
left join (select Distinct * from[dbo].[Producto]) as e on d.ID_producto = e.ID_producto
group by 
    a.nombre, 
    a.apellido1, 
    b.pais, 
    b.region, 
    c.nombre_cliente, 
    e.nombre

