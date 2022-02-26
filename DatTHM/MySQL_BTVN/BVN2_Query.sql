/*
•	KHACH_HANG: lưu trữ thông tin của khách hàng
•	PHONG: lưu trữ thông tin phòng karaoke
•	DICH_VU_DI_KEM: lưu trữ thông tin các dịch vụ đi kèm được cung cấp tại quán Karaoke.
•	DAT_PHONG: lưu trữ thông tin đặt phòng karaoke của khách hàng
•	CHI_TIET_SU_DUNG_DV: lưu trữ thông tin chi tiết khi khách hàng sử dụng các dịch vụ đi kèm.
•	PK: là các trường tham gia vào khóa chính của bảng
=>	Viết câu lệnh SQL để thực hiện các yêu cầu sau (mỗi yêu cầu chỉ được viết tối đa 1 câu lệnh SQL):

I.
Câu 1:Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và nhỏ hơn 10. (1 điểm)
Câu 2: Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ 
		so với giá phòng hiện tại, chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10. (1 điểm)
Câu 3: Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạng thái đặt (TrangThaiDat) là “Da huy”. (1 điểm)

II.
Câu 4: Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” và có độ dài tối đa là 20 ký tự. (1 điểm)
Câu 5: Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, TenKH nào trùng nhau thì chỉ hiển thị một lần. 
	Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên, mỗi cách sẽ được 0,5 điểm. (1 điểm)
Câu 6: Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là “lon” và 
	có DonGia lớn hơn 10,000 VNĐ hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và có DonGia nhỏ hơn 5,000 VNĐ. (1 điểm)
Câu 7: Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong, DonGia 
	của những đơn đặt phòng có năm đặt phòng là “2016”, “2017” và đặt những phòng có giá phòng > 50,000 VNĐ/ 1 giờ. (1 điểm)
III.
Câu 8: Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat, TongTienHat, TongTienSuDungDichVu, TongTienThanhToan 
	tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG. Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì 
    cũng liệt kê thông tin của đơn đặt phòng đó ra. (1 điểm)
TongTienHat = GiaPhong * (GioKetThuc – GioBatDau)
TongTienSuDungDichVu = SoLuong * DonGia
TongTienThanhToan = TongTienHat + sum (TongTienSuDungDichVu)
Câu 9: Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”. (1 điểm)
Câu 10: Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần và 
	trạng thái đặt là “Da dat”. (1 điểm)
*/

# ---------------------------------------------
# 1. Liệt kê MaDatPhong, MaDV, SoLuong của tất cả các dịch vụ có số lượng lớn hơn 3 và nhỏ hơn 10. (1 điểm)
SELECT * FROM chi_tiet_su_dung_dv WHERE SOLUONG >= 3 AND SOLUONG <= 10;
# 2. Cập nhật dữ liệu trên trường GiaPhong thuộc bảng PHONG tăng lên 10,000 VNĐ 
#so với giá phòng hiện tại, chỉ cập nhật giá phòng của những phòng có số khách tối đa lớn hơn 10. (1 điểm)
SET SQL_SAFE_UPDATES =0;
UPDATE phong SET
	GIAPHONG = GIAPHONG + 10.000
WHERE SOKHACHTOIDA > 10;
# 3. Xóa tất cả những đơn đặt phòng (từ bảng DAT_PHONG) có trạng thái đặt (TrangThaiDat) là “Da huy”. (1 điểm)
DELETE FROM dat_phong WHERE TRANGTHAIDAT = 'DA HUY';
# 4. Hiển thị TenKH của những khách hàng có tên bắt đầu là một trong các ký tự “H”, “N”, “M” và có độ dài tối đa là 20 ký tự. (1 điểm)
SELECT TENKH FROM khach_hang WHERE TENKH like 'H%' OR TENKH like 'N%' OR TENKH like 'M%' AND (SELECT length(TENKH)) <= 20;
# 5. Hiển thị TenKH của tất cả các khách hàng có trong hệ thống, TenKH nào trùng nhau thì chỉ hiển thị một lần. 
#	Sinh viên sử dụng hai cách khác nhau để thực hiện yêu cầu trên, mỗi cách sẽ được 0,5 điểm. (1 điểm)
SELECT TENKH FROM khach_hang group by TENKH;

# 6. Hiển thị MaDV, TenDV, DonViTinh, DonGia của những dịch vụ đi kèm có DonViTinh là “lon” và 
#	có DonGia lớn hơn 10,000 VNĐ hoặc những dịch vụ đi kèm có DonViTinh là “Cai” và có DonGia nhỏ hơn 5,000 VNĐ. (1 điểm)
SELECT * FROM dich_vu_di_kem WHERE (DONVITINH = 'LON' AND DONGIA >= 10.000) OR (DONVITINH = 'CAI' AND DONGIA <= 5.000);
# 7. Hiển thị MaDatPhong, MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, MaKH, TenKH, SoDT, NgayDat, GioBatDau, GioKetThuc, MaDichVu, SoLuong, DonGia 
#	của những đơn đặt phòng có năm đặt phòng là “2016”, “2017” và đặt những phòng có giá phòng > 50,000 VNĐ/ 1 giờ. (1 điểm)
SELECT bang1.MADATPHONG, bang1.MAPHONG, bang1.LOAIPHONG, bang1.SOKHACHTOIDA, bang1.GIAPHONG, bang2.MAKH,
bang1.TENKH, bang1.SODT, bang2.NGAYDAT, bang2.GIOBATDAU, bang2.GIOKETTHUC, 
bang2.MADV, bang2.SOLUONG,  bang2.DONGIA
FROM (SELECT dat_phong.MADATPHONG, dat_phong.MAPHONG, phong.LOAIPHONG, phong.SOKHACHTOIDA, phong.GIAPHONG, khach_hang.TENKH, khach_hang.SODT
FROM dat_phong inner join phong on dat_phong.MAPHONG = phong.MAPHONG
inner join khach_hang on dat_phong.MAKH = khach_hang.MAKH WHERE GIAPHONG > 50.000) as bang1 
inner join (SELECT dat_phong.MADATPHONG, dat_phong.MAKH, dat_phong.NGAYDAT, dat_phong.GIOBATDAU, dat_phong.GIOKETTHUC,
chi_tiet_su_dung_dv.MADV, chi_tiet_su_dung_dv.SOLUONG,  dich_vu_di_kem.DONGIA 
FROM chi_tiet_su_dung_dv inner join dat_phong on chi_tiet_su_dung_dv.MADATPHONG = dat_phong.MADATPHONG
inner join dich_vu_di_kem on chi_tiet_su_dung_dv.MADV = dich_vu_di_kem.MADV WHERE year(NGAYDAT) in ('2016', '2017')) as bang2
on bang1.MADATPHONG = bang2.MADATPHONG;

# bang1
SELECT dat_phong.MADATPHONG, dat_phong.MAPHONG, phong.LOAIPHONG, phong.SOKHACHTOIDA, phong.GIAPHONG, khach_hang.TENKH, khach_hang.SODT
FROM dat_phong inner join phong on dat_phong.MAPHONG = phong.MAPHONG
inner join khach_hang on dat_phong.MAKH = khach_hang.MAKH
WHERE GIAPHONG > 50.000;

# bang2
SELECT dat_phong.MADATPHONG, dat_phong.MAKH, dat_phong.NGAYDAT, dat_phong.GIOBATDAU, dat_phong.GIOKETTHUC,
chi_tiet_su_dung_dv.MADV, chi_tiet_su_dung_dv.SOLUONG,  dich_vu_di_kem.DONGIA 
FROM chi_tiet_su_dung_dv inner join dat_phong on chi_tiet_su_dung_dv.MADATPHONG = dat_phong.MADATPHONG
inner join dich_vu_di_kem on chi_tiet_su_dung_dv.MADV = dich_vu_di_kem.MADV
WHERE year(NGAYDAT) in ('2016', '2017');

# 8. Hiển thị MaDatPhong, MaPhong, LoaiPhong, GiaPhong, TenKH, NgayDat, TongTienHat, TongTienSuDungDichVu, TongTienThanhToan 
#	tương ứng với từng mã đặt phòng có trong bảng DAT_PHONG. Những đơn đặt phòng nào không sử dụng dịch vụ đi kèm thì 
#    cũng liệt kê thông tin của đơn đặt phòng đó ra. (1 điểm)


# 9. Hiển thị MaKH, TenKH, DiaChi, SoDT của những khách hàng đã từng đặt phòng karaoke có địa chỉ ở “Hoa xuan”. (1 điểm)


# 10. Hiển thị MaPhong, LoaiPhong, SoKhachToiDa, GiaPhong, SoLanDat của những phòng được khách hàng đặt có số lần đặt lớn hơn 2 lần và 
#	trạng thái đặt là “Da dat”. (1 điểm)





















