

-- 1
insert into cities(name) values('Hải phòng');
insert into districts(name,city_id) values('Lê Chân',1);
insert into districts(name,city_id) values('Ngô Quyền',1);

insert into stores(name,district_id) values('Lotteria Lê Chân',1);
insert into stores(name,district_id) values('Lotteria Ngô Quyền',2);

insert into shipping_units(name) values('Aha move');
insert into shipping_units(name) values('Viettel Post');

insert into categories(name) values ('spaghetti');
-- 2
insert into users(code,name) values(12345,'manage');

-- 3
select * from products;


insert into products(name,description,category_id,image,price)
values('Mỳ ý thịt bò','Đặc sản tháp nghiêng',1,'Myythitbo.jpg',50000);

insert into products(name,description,category_id,image,price)
values('Mỳ ý sốt kem','Thêm ít sốt kem dai dai ngon ngon',1,'Myysotkem.jpg',60000);

insert into products(name,description,category_id,image,price)
values('Mỳ ý cua','Cua đắt nhưng ngon',1,'Myycua.jpg',75000);

-- 4 Thêm 3 mặt hàng ở mục 3 cho cửa hàng "Lotteria ngô Quyền"
select * from products;
insert into store_products(store_id,product_id,status) 
values(2,1,1);

insert into store_products(store_id,product_id,status) 
values(2,2,1);

insert into store_products(store_id,product_id,status) 
values(2,3,1);

-- 5 Liệt kê các cửa hàng ở Hà Nội 
select store_id,s.name as store_name ,address,d.name as district_name
from stores s join districts d
on s.district_id = d.district_id
join cities c on d.city_id = c.city_id
where c.name = 'Hà Nôi';

-- 6 Liệt kê danh sách khách hàng tên là "Meritt Fernandez";

select o.order_id,o.price,o.payment_method,o.status,su.name as shipping_unit,o.created_at
from orders o join shipping_units su 
on o.shipping_unit_id = su.shipping_unit_id
join customers c on c.customer_id = o.customer_id 
where c.name = 'Meritt Fernandez';

-- 7. Liệt kê các mặt hàng và danh mục từng mặt hàng ở "Lotteria Cầu Giấy";


select p.product_id,p.name as product_name,c.name as categor_name,status 
from products p join categories c 
on p.category_id = c.category_id 
join store_products sp on p.product_id = sp.product_id
join stores s on sp.store_id = s.store_id
where s.name = 'Lotteria Cầu Giấy';

-- 8

select name,email,phone,address,birthday from customers where name = 'Josiah Cline';

-- 9
update customers set phone = '0338443113',
address = 'Phạm Hùng,Nam Từ Niêm,Hà Nội', birthday = '2000-03-01'
where customer_id = 7;

-- 10
insert into categories(name) values('Nước');
insert into categories(name) values('Cơm');
select * from store_products;
insert into products(name,category_id) values('Pepsi',4);
insert into products(name,category_id) values('Cơm gà viên',5);

insert into store_products(store_id,product_id,status)
values(6,9,1);
insert into store_products(store_id,product_id,status)
values(6,10,1);

insert into orders(customer_id,store_id,promotion_id,shipping_unit_id,payment_method)
values(2,6,2,3,1);

insert into order_details(order_id,store_product_id,quantity)
values(23,16,4);
insert into order_details(order_id,store_product_id,quantity)
values(23,17,2);
insert into order_details(order_id,store_product_id,quantity)
values(23,7,4);

-- 11
update store_products s set s.status = 4 
where s.status = 1;
set SQL_SAFE_UPDATES = 0;

-- 12
select o.order_id,o.price,o.status,o.created_at
from orders o join customers c on c.customer_id = o.customer_id 
 where c.name = 'Meritt Fernandez' and  month(o.created_at) = 3;

-- 13
insert into promotions(name,discount,day_id) 
values('Đầu tuần vui vẻ',20,2);
insert into promotions(name,discount,day_id) 
values('Thứ hai nửa giá',30,2);
insert into promotions(name,discount,day_id) 
values('Giảm 50% thứ năm',50,5);
insert into promotions(name,discount,day_id) 
values('Cuối tuần món ngon giá chât',30,1);
insert into promotions(name,discount,day_id) 
values('Cuối tuần món ngon giá chât',30,7);


select pr.promotion_id,pr.name,pr.discount
from promotions pr join days d
on pr.day_id = d.day_id
where d.day_id = 2;

-- 14

select name, quantity from
(select p.name,count(p.product_id) as quantity,p.product_id from orders o join stores s
on  o.store_id = s.store_id
join store_products sp on s.store_id = sp.store_id
join products p on sp.product_id = p.product_id
where o.store_id = 7
group by p.name
order by quantity desc
limit 2) as b limit 1;


-- 15
select c.name,count(o.order_id) from 
orders o join customers c on o.customer_id = c.customer_id
group by c.name
order by count(o.order_id) desc
limit 3;

-- 16
select order_id,price,payment_method,created_at
from orders 
where payment_method = 1;

-- 17
select pr.name,count(o.order_id)
from orders o right join  promotions pr 
on pr.promotion_id = o .promotion_id
group by pr.name;

-- 18
select s.name,sum(o.price)
from orders o join stores s on o.store_id = s.store_id
group by s.name
having sum(o.price) > 100000
order by sum(o.price) desc
limit 3;

-- 19
select o.created_at,o.payment_method,sum(o.price)
from orders o join stores s on o.store_id = s.store_id
where s.store_id = 6
group by o.payment_method;

-- 20
select su.name,sum(order_id)
from shipping_units su join orders o
on su.shipping_unit_id = o.shipping_unit_id
group by su.name
order by sum(order_id)
limit 1;















