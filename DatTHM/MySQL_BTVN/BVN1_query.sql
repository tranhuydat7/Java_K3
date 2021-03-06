# 5. liệt kê danh sách cửa hàng ở 'Hà Nội'  
SELECT stores.id as 'store_id', stores.name as 'store_name', stores.address, districts.name as 'district_name' 
FROM stores JOIN districts JOIN cities 
WHERE cities.name = 'Hà Nội' AND cities.id = districts.city_id 
AND stores.district_id = districts.id; 
# 6. liệt kê các đơn hàng mà khách hàng có tên là 'Merritt Fernandez' đã đặt   
SELECT order_details.order_id, orders.price, orders.payment_method, orders.status, shipping_units.name as ' shipping_unit', orders.created_at
FROM order_details inner JOIN orders inner JOIN customers inner JOIN shipping_units
ON shipping_units.id = orders.shipping_unit_id AND customers.id = orders.customer_id
WHERE customers.name = 'Merritt Fernandez' group by shipping_units.name;
# 7. Liệt kê các mặt hàng và danh mục từng mặt hàng ở cửa hàng lotteria cầu giấy
SELECT pdid.id as 'product_id', pdid.name as 'product_name', pdid.ctn as 'category_name', spid.status 
FRom (SELECT store_id, product_id, status from store_products WHERE store_id = 5) as spid 
inner join (SELECT pd.name, ct.name as 'ctn', pd.id 
FROM products as pd inner join categories as ct on pd.category_id = ct.id) as pdid
on spid.product_id = pdid.id;
# 8. Liệt kê thông tin KH có tên "Josiah Cline" bao gồm: tên, email, điện thoại, địa chỉ, ngày sinh nhật
SELECT customers.name, customers.email, customers.phone, customers.address, customers.birthday FROM customers 
WHERE customers.name = 'Josiah Cline';
# 9. Cập nhật lại thông tin KH có id = 7 với nội dung sau:- Số điện thoại: 0338443113
#- Địa chỉ: Phạm Hùng, Nam Từ Liêm, Hà Nội
#- Ngày sinh: 2000-03-01
UPDATE customers SET phone = '0338443113', address = 'Phạm Hùng, Nam Từ Liêm, Hà Nội', birthday = '2000-03-01' WHERE id = 7;
# 10. Tạo order với các thông tin sau:- Khách hàng: Josiah Cline
#- Cửa hàng: Lotteria Cầu Giấy
#- Ưu đãi: Thứ hai nửa giá
#- Đơn vị vận chuyển: Giao hàng nhanh
#- Hình thức thanh toán: 1 
#- Mặt hàng - số lượng: Gà rán - 4, Pepsi - 4, Cơm gà viên - 2
INSERT INTo orders(customer_id, store_id, promotion_id, shipping_unit_id, payment_method) values (3, 5, 1, 3, 1);
insert into store_products(store_id, product_id) values (5, 7),(5,12),(5,11);
insert into order_details(order_id, store_product_id, quantity) values (7, 7, 4),(7,8,4),(7,9,2);
# 11. Hủy đơn hàng vừa tạo ở mục 7 bằng cách cập nhật lại status (1: chờ vận chuyển, 2: đang vận chuyển, 3: đã nhận hàng, 4: hủy đơn hàng)



# 12. tra cứu thông tin tất cả đơn đặt hàng của khách hàng có tên 'Merritt Fernandez' trong tháng 3
SELECT order_details.id, orders.price, orders.status, orders.created_at FROM orders JOIN customers JOIN order_details
WHERE customers.name = 'Merritt Fernandez' AND customers.id = orders.customer_id 
AND monthname(orders.created_at) = 'March' AND order_details.order_id = orders.id;
# 13. liệt kê ưu đãi được phép sử dụng vào ngày hôm thứ 2 theo thứ tự giảm dần 
SELECT promotions.id, promotions.name, promotions.discount FROM promotions 
WHERE DAYNAME(promotions.start_date) = 'Monday' order by promotions.discount DESC;
# 14. tìm mặt hàng được đặt nhiều thứ 2 ở cửa hàng lotteria trần duy hưng
select products.name, sum(quantity) as "quantity" 
from order_details inner join store_products on order_details.store_product_id = store_products.id 
inner join products on products.id = store_products.product_id 
inner join stores on stores.id = store_products.store_id 
where stores.id= 6  
group by  order_details.store_product_id order by quantity desc limit 1,1;
# 15. liệt kê 3 khách hàng đặt hàng nhiều ở cửa hàng lotte cầu giấy theo số lượng đơn đặt hàng giảm dần 
select orders.customer_id, customers.name, sum(order_details.quantity) as quantity from order_details
inner join orders on orders.id = order_details.order_id
inner join customers on customers.id = orders.customer_id
where orders.store_id = 5
group by orders.customer_id order by sum(order_details.quantity) desc limit 3;
# 16. liệt kê những đơn hàng cửa hàng lotteria cầu giấy đang ở trạng thái chưa thanh toán
SELECT orders.id, orders.price, orders.payment_method, orders.created_at 
FROM orders JOIN stores
WHERE stores.name = 'Lotteria Cầu Giấy' 
AND stores.id = orders.store_id AND orders.status = 1;
# 17. liệt kê tất cả những mã giảm giá có trong hệ thống kèm theo số lượng mã đã áp dụng   
select orders.promotion_id, promotions.name, count(orders.promotion_id) as total_order from orders
inner join promotions on orders.promotion_id = promotions.id
group by orders.promotion_id;
# 18. liệt kê 3 cửa hàng có doanh thu trong tháng 1 lớn hơn 100000
SELECT stores.name, SUM(orders.price) AS 'total_price' 
FROM stores inner join orders ON stores.id = orders.store_id
WHERE monthname(orders.created_at) = 'January' group by stores.name
having SUM(orders.price) > 100000;
# 19. doanh số bán hàng của cửa hàng lotteria cầu giấy theo từng ngày và từng phương thức thanh toán
SELECT date(orders.created_at) as 'order_date', orders.payment_method, sum(orders.price) as 'total_price'
FROM orders inner join stores on orders.store_id = stores.id
WHERE stores.name = 'Lotteria Cầu Giấy' group by orders.created_at, orders.payment_method;
# 20. tìm đơn vị vận chuyển đã vận chuyển được ít đơn hàng nhất và số lượng đơn hàng đó đã vận chuyển 
select orders.shipping_unit_id, shipping_units.name, sum(order_details.quantity) as quantity 
from orders inner join order_details on order_details.order_id = orders.id
inner join shipping_units on orders.shipping_unit_id = shipping_units.id
group by orders.shipping_unit_id order by sum(order_details.quantity) asc limit 1;





























