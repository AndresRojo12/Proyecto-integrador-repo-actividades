use[staging]

select a.CodigoProducto, a.nombre, a.proveedor, SUM(isnull(a.cantidad_en_stock,0)) as Cantidad_Inventario, isnull(a.precio_proveedor,0) as Precio_Proveedor,
SUM(isnull(a.cantidad_en_stock,0)) * isnull(a.precio_proveedor,0) as Valor_Total_Inventario,
SUM(isnull(b.cantidad,0)) as Cantidad_Vendido, isnull(b.precio_unidad,0) as Valor_Unitario_Venta,
SUM(isnull(b.cantidad,0)) * isnull(b.precio_unidad,0) as Total_Venta,
isnull(b.precio_unidad,0) - isnull(a.precio_proveedor,0) as Utilidad_Venta_Unidad,
SUM(isnull(b.cantidad,0)) * (isnull(b.precio_unidad,0) - isnull(a.precio_proveedor,0)) as Utilidad_Total_Venta,
SUM(isnull(a.cantidad_en_stock,0)) * (isnull(b.precio_unidad,0) - isnull(a.precio_proveedor,0)) as Utilidad_Pendiente_Venta
from  (select Distinct top 10 * from[Producto])as a
left join (select distinct top 10* from [dbo].[Hechos]) as b on a.ID_producto = b.ID_producto
left join (select distinct top 10* from [dbo].[Tiempo]) as c on b.ID_tiempo = c.ID_tiempo

group by 
a.CodigoProducto, a.nombre, a.proveedor,a.precio_proveedor, b.precio_unidad



/*
codigo_producto,
nombre_producto,
proveedor
cantidad_en_stock
precio_proveedor
cantidad
precio_venta
fecha_pedido
*/