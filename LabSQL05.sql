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
from orders as o,shippers as s
where .ShipperID =o.shipvia
and orderID = 10275

select companyName,orderID
from orders o join shippers s
on s.ShipperID = o.ShipVia
where orderID = 10275

-- ต้องการรหัสพนักงาน ชื่อพนักงาน รหัสใบสั่งซื้อที่เกี่ยวข้อง เรียงตามลำดับพนักงาน
select e.EmployeeID,firstName,orderID
from Employees as e join orders as o
on e.EmployeeID = o.EmployeeID
order by EmployeeID

-- ต้องการรหัสสินค้า เมือง และประเทศของผู้จำหน่าย
select productID,ProductName,city,country
from products p join suppliers s 
on p.supplierID = s.SupplierID

-- ต้องการชื่อบรริษัทขนส่ง และจำนวนใบสั่งซื้อที่เกี่ยวข้อง
select companyName, count(*)
from orders as o join shippers as s
on o.shipvia = s.ShipperID
group by companyName

-- ต้องการรหัสสินค้า ชื่อสินค้า และจำนวนทั้งหมดที่ขายได้
select p.productID,p.productName,sum(Quantity)
from products p join [order details] od
on p.productID = od.productID
group by p.productID,p.productName
order by 1

-- 
