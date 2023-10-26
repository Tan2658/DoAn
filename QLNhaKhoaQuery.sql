drop database QLNhaKhoa

create database QLNhaKhoa
go

use QLNhaKhoa
go

if exists (select * from sys.objects where name ='DungCuNhaKhoa')
	drop table DungCuNhaKhoa
go
create table DungCuNhaKhoa
(
	NoiDung nvarchar(50) not null,
	IDDungCu char(3) not null,
	TenDungCu nvarchar(255) not null,
	Loai nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	Don money not null,
	ThanhTien money not null,
	NgayNhap datetime not null
)
INSERT INTO DungCuNhaKhoa
VALUES('Nhap','SP1','Bong gon','VTYT','tui',1000,10000.00,10000000.00,'10/17/2023'),
	  ('Nhap','SP2','Thuoc te local ','Thuoc','thung',100,200000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP3','Ong hut bot','VTYT','cai',1000,20000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP4','Guong nha khoa','VTYT','cai',50,20000.00,1000000.00,'10/17/2023'),
	  ('Nhap','SP5','Nuoc suc mieng','Thuoc','cai',100,200000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP6','Thuoc chong dau và chong viem ','Thuoc','thung',100,250000.00,25000000.00,'10/17/2023');

	  if exists (select * from sys.objects where name ='Kho')
	drop table Kho
go
create table Kho
(
	IDDungCu char(3) not null,
	TenDungCu nvarchar(255) not null,
	Loai nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	Don money not null,
	primary key (IDDungCu)
)
if exists (select * from sys.objects where name ='TaiKhoan')
	drop table TaiKhoan
go
create table TaiKhoan
(
	TenDangNhap varchar(22) not null,
	MatKhau varchar(50) not null,
	primary key (TenDangNhap)
)
insert into TaiKhoan
values ('admin', 'admin'),
	('admin1', 'admin'),
	('admin2', 'admin'),
	('admin3', 'admin'),
	('admin4', 'admin'),
	('admin5', 'admin'),
	('admin6', 'admin'),
	('admin7', 'admin'),
	('admin8', 'admin'),
	('nhanvien', 'nhanvien'),
	('nhanvien1', 'nhanvien'),
	('nhanvien2', 'nhanvien'),
	('nhanvien3', 'nhanvien'),
	('nhanvien4', 'nhanvien'),
	('nhanvien5', 'nhanvien'),
	('nhanvien6', 'nhanvien'),
	('nhanvien7', 'nhanvien')
	
if exists (select * from sys.objects where name ='BacSi')
	drop table BacSi
go
create table BacSi
(
	MaNV char(3) not null,
	TenDangNhap varchar(22) not null,
	TrangThai nvarchar(52) not null,
	IDChanDoan char(3) not null,
	Ten nvarchar(50) not null,
	ChucVu nvarchar(50) not null,
	KinhNghiem nvarchar(50) not null,
	SDT CHAR (10) not null,
	MoTa nvarchar(100) not null,
	primary key (MaNV),
	constraint chk_TenDangNhap_BacSi foreign key (TenDangNhap) references TaiKhoan(TenDangNhap)
)
insert into BacSi
values ('BS1', 'admin', N'Bác s? A', N'Bác s?', N'10 n?m', '0348859428', N'Tôi là Bác s? A, t?ng h?c ??i H?c Y D??c TPHCM'),
       ('BS2', 'admin1', N'Bác s? B', N'Bác s?', N'35 n?m', '0345559428', N'Tôi là Bác s? B, t?ng h?c ??i H?c Y D??c C?n Th?'),
	('BS3', 'admin2', N'Bác s? C', N'Bác s?', N'2 n?m', '0341159428', N'Tôi là Bác s? C, t?ng h?c ??i H?c Y D??c Hà N?i'),
	('BS4', 'admin3', N'Bác s? D', N'Bác s?', N'6 n?m', '0342259428', N'Tôi là Bác s? D, t?ng h?c ??i H?c Y D??c Hu?'),
	('BS5', 'admin4', N'Bác s? E', N'Bác s?', N'15 n?m', '0343359428', N'Tôi là Bác s? E, t?ng h?c ??i H?c Y D??c ?à N?ng'),
	('BS6', 'admin5', N'Bác s? F', N'Bác s?', N'11 n?m', '0344459428', N'Tôi là Bác s? F, t?ng h?c ??i H?c Y D??c V?ng Tàu'),
	('BS7', 'admin6', N'Bác s? G', N'Bác s?', N'7 n?m', '0341259428', N'Tôi là Bác s? G, t?ng h?c ??i H?c Y D??c Bà R?a'),
	('BS8', 'admin7', N'Bác s? H', N'Bác s?', N'20 n?m', '0341359428', N'Tôi là Bác s? H, t?ng h?c ??i H?c Y D??c Sóc Tr?ng'),
	('BS9', 'admin8', N'Bác s? Q', N'Bác s?', N'20 n?m', '0341359428', N'Tôi là Bác s? Q, t?ng h?c ??i H?c Y D??c Sóc Tr?ng'),
	('NV1', 'nhanvien', N'Nhân Viên A', N'Nhân Viên', N'8 n?m', '0341459428', N'Tôi là Nhân viên A, t?ng h?c ??i H?c Y D??c Th? D?u M?t'),
	('NV2', 'nhanvien1', N'Nhân Viên B', N'Nhân Viên', N'4 n?m', '0341559428', N'Tôi là Nhân viên B, t?ng h?c ??i H?c Y D??c Quy Nh?n'),
	('NV3', 'nhanvien2', N'Nhân Viên C', N'Nhân Viên', N'3 n?m', '0341659428', N'Tôi là Nhân viên C, t?ng h?c ??i H?c Y D??c ?à L?t'),
	('NV4', 'nhanvien3', N'Nhân Viên D', N'Nhân Viên', N'10 n?m', '0342159428', N'Tôi là Nhân viên D, t?ng h?c ??i H?c Y D??c Nha Trang'),
	('NV5', 'nhanvien4', N'Nhân Viên E', N'Nhân Viên', N'6 n?m', '0342259428', N'Tôi là Nhân viên E, t?ng h?c ??i H?c Y D??c Tây Ninh'),
	('NV6', 'nhanvien5', N'Nhân Viên F', N'Nhân Viên', N'12 n?m', '0342359428', N'Tôi là Nhân viên F, t?ng h?c ??i H?c Y D??c L?ng S?n'),
	('NV7', 'nhanvien6', N'Nhân Viên G', N'Nhân Viên', N'33 n?m', '0342459428', N'Tôi là Nhân viên G, t?ng h?c ??i H?c Y D??c Thanh Hóa'),
	('NV8', 'nhanvien7', N'Nhân Viên H', N'Nhân Viên', N'1 n?m', '0342559428', N'Tôi là Nhân viên H, t?ng h?c ??i H?c Y D??c Ngh? An')
		  

if exists (select * from sys.objects where name ='BenhNhan')
	drop table BenhNhan
go
create table BenhNhan
(
	IDBenhNhan char(3) not null,
	MaNV char(3) not null,
	HoTen nvarchar(255) not null,
	Gioi bit,
	NamSinh char(4) not null,
	SDT varchar(11) not null,
	DiaChi nvarchar(255) not null,
	NgayKhamDau datetime not null,
	LyDo nvarchar(255) not null,
	primary key (IDBenhNhan),
	constraint chk_MaNV foreign key (MaNV) references BacSi(MaNV)
)
insert into BenhNhan
values ('BN1', N'Nguy?n Thành Long',1,N'2003','0348859428',N'Th? ??c','12/30/2013'),
       ('BN2', N'Tr?n Duy Tu?n',1, N'2001','0345559428',N'Bình D??ng','10/26/2018'),
	('BN3', N'Hu?nh S?n Nh?t Tân',1,N'2002','0341159428',N'Bình Th?nh','1/25/2015'),
	('BN4', N'Nguy?n Thanh Tùng',1,N'1996','0342259428',N'Tân Phú','10/10/2011'),
	('BN5', N'Nguy?n Th? Qu?nh H??ng',0,N'1986','0343359428',N'Hu?','7/7/2017'),
	('BN6', N'Lê Th? Di?m My',0, N'1972','0344459428',N'Qu?ng Bình','8/8/2021'),
	('BN7', N'Nguy?n Th? Ph??ng Thùy',0,N'1995','0341259428',N'Qu?ng Tr?','9/9/2016'),
	('BN8', N'Tr?n Thanh Tâm',0, N'2003','0341359428', N'Qu?ng Ngãi','8/10/2014'),
	('BN9', N'Lê M? L?',0, N'2002','0341459428', N'Qu?ng An','11/11/2019'),
	('B10', N'Tr?n Th? Côi',0, N'2002','0341559428', N'?à L?t','12/12/2020'),
	('B11', N'Tr?n Th? Y?n Nhi',0, N'2001','0341659428', N'Thanh Hóa','12/13/2010'),
	('B12', N'Mai Bá Quang',1,N'1996','0342159428', N'Phú Bài', '8/13/2018'),
	('B13', N'Tr?n Qu?c To?n',1,N'1988','0342259428', N'L?ng S?n','9/14/2016'),
	('B14', N'Tr??ng Quang Lu?n',1,N'1976','0342359428', N'Kon Tum','10/15/2019'),
	('B15', N'Nguy?n Th? M? Duyên',0,N'1983','0342459428', N'Sóc Tr?ng','11/16/2000'),
	('B16', N'Mai Chí Tài',1,N'2003','0342559428', N'Tân Phú','12/17/2001'),
	('B17', N'Hu?nh Hoàng Long',1,N'2000','0342659428', N'Tây Ninh','12/30/2003')

if exists (select * from sys.objects where name ='CanLamSang')
	drop table CanLamSang
go
create table CanLamSang
(
	IDBenhNhan char(3) not null,
	Loai nvarchar(50) not null,
	ThongSo nvarchar(25) not null,
	constraint chk_IDBenhNhan_CanLamSang foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)

if exists (select * from sys.objects where name ='ChanDoan')
	drop table ChanDoan
go
create table ChanDoan
(
	IDChanDoan char(3) not null,
	TenChanDoan nvarchar(255) not null,
	primary key (IDChanDoan)
)

if exists (select * from sys.objects where name ='DieuTri')
	drop table DieuTri
go
create table DieuTri
(
	IDChanDoan char(3) not null,
	IDBenhNhan char(3) not null,
	IDDungCu char(3) not null,
	TenDieuTri nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	DonGia money not null,
	ThanhTien money not null,
	constraint chk_IDChanDoan_DieuTri foreign key (IDChanDoan) references ChanDoan(IDChanDoan),
	constraint chk_IDBenhNhan_DieuTri foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan),
	constraint chk_IDDungCu_DieuTri foreign key (IDDungCu) references DungCuNhaKhoa(IDDungCu),
)

if exists (select * from sys.objects where name ='DonThuoc')
	drop table DonThuoc
go
create table DonThuoc
(
	IDDonThuoc char(3) not null,
	IDBenhNhan char(3) not null,
	primary key (IDDonThuoc),
	constraint chk_IDBenhNhan_DonThuoc foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)

if exists (select * from sys.objects where name ='CTDonThuoc')
	drop table CTDonThuoc
go
create table CTDonThuoc
(
	IDDonThuoc char(3) not null,
	TenThuoc nvarchar(255) not null,
	DonGia money not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	ThanhGia money not null,
	constraint chk_IDDonThuoc_CTDonThuoc foreign key (IDDonThuoc) references DonThuoc(IDDonThuoc)
)

if exists (select * from sys.objects where name ='HoaDon')
	drop table HoaDon
go
create table HoaDon
(
	IDHoaDon char(3) not null,
	IDBenhNhan char(3) not null,
	HoTen nvarchar(255) not null,
	Gioi bit,
	NamSinh char(4) not null,
	SDT varchar(11) not null,
	DiaChi nvarchar(255) not null,
	PhuongThucThanhToan nvarchar(255) not null,
	TongTien money not null,
	primary key (IDHoaDon),
	constraint chk_IDBenhNhan_HoaDon foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)
