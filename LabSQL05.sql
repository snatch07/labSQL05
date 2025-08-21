-- แสดงชื่อประเภทสินค้า ชื่อสินค้า และ ราคาสินค้า

Select CategoryName,ProductName,UnitPrice
From Products,Categories
Where Products.CategoryID = Categories.CategoryID

Select CategoryName,ProductName,UnitPrice
From Products join Categories
on Products.CategoryID = Categories.CategoryID

Select CategoryName,ProductName,UnitPrice
From Products as p ,Categories as c
Where p.CategoryID = c.CategoryID


select companyName,orderID
from orders,shippers
where shippers.shipperID = orders.shipvia

select companyName,orderID
from orders join shippers
on shippers.shipperID = orders.shipvia

select companyName,orderID
from orders as o,shippers as s
where s.shipperID = o.shipvia

-- ต้องการรหัสสินค้า ชื่อสินค้า บริษัทผู้จำหน่าย ประเทศ
select productID,productName,CompanyName,Country
from products as p join Suppliers as s
on p.SupplierID = s.SupplierID


select companyName,OrderID
from orders,shippers
