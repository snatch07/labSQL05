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


select O.orderID เลขใบสั่งซื้อ,c.companyName ลูกค้า,e.firstName พนักงาน,o.shipAddress ส่งไปที่
from orders o ,customers c,employees e
where o.customerID = c.customerID and o.EmployeeID = e.EmployeeID

select O.orderID เลขใบสั่งซื้อ,c.companyName ลูกค้า,e.firstName พนักงาน,o.shipAddress ส่งไปที่
from orders o join customers c on o.customerID = c.customerID
			  join employees e on o.employeeID = e.employeeID

--
select e.employeeID,firstName,count(*) as[นวน order],sum(freight) as [Sum of Freight]
from employees e join orders o 
on e.EmployeeID = o.employeeID
where year(orderdate) = 1998
group by e.employeeID,firstName	

-- ต้องการรหัสสินค้า ชื่อสินค้า ที่ nancy ขายได้ ทั้งหมด เรียงตามลำดับรหัสสินต้า
select distinct p.productID,p.productName
from employees e join orders o on e.employeeID = o.employeeID
				  join [Order Details] od on o.orderID = od.orderID
				  join products p on od.productID = p.productID
where e.firstName = 'Nancy'
order by productID

-- ต้องการชื่อบริษัทลูกค้า Around the Horn ซื้อสินค้าที่มาจากประเทศอะไรบ้าง
select distinct s.country
from customers c join orders o on c.customerID = o.customerID
				 join [Order Details] od on o.orderID = od.orderID
				 join products p on od.productID = p.productID
				 join suppliers s on s.supplierID = p.supplierID
where c.companyName = 'Around the Horn'

-- บริษัทลูกค้าชื่อ Around the Horn ซิ้อสินค้าอะไรบ้าง จำนวนเท่าใด
select p.productID,p.productName,sum(Quantity) as [sum of Quantity]
from customers c join orders o on c.customerID = o.customerID
				 join [Order Details] od on o.orderID = od.orderID
				 join products p on p.productID = od.productID
where c.companyName = 'Around the Horn'
group by p.productID,p.productName
order by 1

-- ต้องการหมายเลขใบสั่งซื้อ ชื่อพนักงาน และยอดขาบในใบสั่งซื้อนั้น
select o.orderID,e.FirstName,sum((od.Quantity * od.UnitPrice * (1 - od.Discount))) as TotalCash
from orders o join Employees e on o.EmployeeID = e.employeeID
			  join [Order Details] od on o.orderID = od.orderID
group by o.orderID,e.firstName
order by orderID
