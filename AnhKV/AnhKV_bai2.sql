
-- Câu hỏi

-- 1:Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và nhỏ hơn 10. 
select madatphong,madv,soluong from chi_tiet_su_dung_dv 
where soluong between 3 and 10;

-- 2:Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ so với giá phòng hiện tại, chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10. (1
update phong set giaphong = giaphong +10.000 where sokhachtoida > 10;
select * from phong;

-- 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạngthái đặt (TrangThaiDat) là “Da huy”. 
delete from DAT_PHONG where TrangThaiDat = 'Da huy';

-- 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” và có độ dài tối đa là 20 ký tự. 
select tenkh from khach_hang
where  (tenkh like '%h%' or tenkh like '%n%' or tenkh like '%m%') and CHAR_LENGTH(tenkh) < 20;

-- 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, TenKH nào trùng nhau thì chỉ hiển thị một lần. Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên, mỗi cách sẽ được
-- cách 1

select distinct Tenkh from khach_hang;



-- Cách 2
select  Tenkh from khach_hang
union
select  Tenkh from khach_hang;

-- 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là “lon” và có DonGia lớn hơn 10,000 VNĐ hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và có DonGia nhỏ hơn 5,000 VNĐ. (1
select MaDV, TenDV, DonViTinh, DonGia from dich_vu_di_kem 
where (DonViTinh = 'lon' and DonGia >= 10.000) or (DonViTinh = 'Cai' and DonGia < 5.000);

-- 7: Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong,
-- MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong,
-- DonGia của những đơn đặt phòng có năm đặt phòng là “2016”, “2017” và đặt
-- những phòng có giá phòng > 50,000 VNĐ/ 1 giờ. 
select dp.MaDatPhong, p.MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong,
dp.MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, ctsd.madv, ctsd.SoLuong,DonGia
from dat_phong dp join Phong p 
on dp.maphong = p.maphong
join khach_hang kh on dp.makh = kh.makh
join chi_tiet_su_dung_dv ctsd on ctsd.madatphong = dp.madatphong
join dich_vu_di_kem dv on dv.madv = ctsd.madv
where giaphong > 50.000 and (year(NgayDat) = 2016 or year(NgayDat) = 2017);

-- 8: Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat,
-- TongTienHat, TongTienSuDungDichVu, TongTienThanhToan tương ứng với từng
-- mã đặt phòng có trong bảng DAT_PHONG. Những đơn đặt phòng nào không
-- sử dụng dịch vụ đi kèm thì cũng liệt kê thông tin của đơn đặt phòng đó
-- ra. 
select dp.MaDatPhong, dp.MaPhong, LoaiPhong, GiaPhong,TenKH, NgayDat, p.giaphong * (hour(gioketthuc - giobatdau)) as TongTienHat,
soluong*dongia as TongTienSuDungDichVu,p.giaphong * (hour(gioketthuc - giobatdau)) + sum(soluong*dongia) as TongTienThanhToan
from dat_phong dp join phong p on dp.maphong = p.maphong
join khach_hang kh on dp.makh = kh.makh
join chi_tiet_su_dung_dv ctsd on dp.madatphong = ctsd.madatphong
join dich_vu_di_kem dv on dv.madv = ctsd.madv
group by dp.MaDatPhong, dp.MaPhong, LoaiPhong, GiaPhong,TenKH, NgayDat,TongTienHat,TongTienSuDungDichVu;



-- 9: Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã
-- từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”. 

select  dp.maKH, TenKH, DiaChi, SoDT 
from Khach_hang kh join dat_phong dp
on kh.makh = dp.makh
where DiaChi = 'Hoa xuan';

-- 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat của
-- những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần và trạng thái đặt
-- là “Da dat”. 
select dp.MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, count(dp.maphong) as SoLanDat
from dat_phong dp join phong p on dp.maphong = p.maphong
where trangthaidat = 'Da dat'
having SoLanDat > 2