drop database QLNhaKhoa

create database QLNhaKhoa
go

use QLNhaKhoa
go

if exists (select * from sys.objects where name ='ThiTruong')
	drop table ThiTruong
go
create table ThiTruong
(
	IDSanPham char(4) not null,
	TenSanPham nvarchar(255) not null,
	Loai nvarchar(50) not null,
	DonViTinh nvarchar(255) not null,
	DonGia money not null,
	primary key (IDSanPham)
)
insert into ThiTruong
values('SP01',N'Bông gòn','VTYT',N'túi',50000.00),
	  ('SP02',N'Thuốc tê local ',N'Thuốc',N'thùng',50000.00),
	  ('SP03',N'Ống hút bọt','VTYT',N'cái',50000.00),
	  ('SP04',N'Gương nha khoa','VTYT',N'cái',50000.00),
	  ('SP05',N'Nước súc miệng',N'Thuốc',N'cái',50000.00),
	  ('SP06',N'Thuốc chống đau và chống viêm ',N'Thuốc',N'thùng',50000.00),
	  ('SP07',N'Kềm nhổ răng','VTYT',N'cái',50000.00),
	  ('SP08',N'Bút trám răng','VTYT',N'cái',50000.00),
	  ('SP09',N'Răng kim loại','VTYT',N'cái',50000.00),
	  ('SP10',N'Răng Titan','VTYT',N'cái',50000.00),
	  ('SP11',N'Răng sứ','VTYT',N'cái',50000.00),
	  ('SP12',N'Mắc cài kim loại','VTYT',N'cái',50000.00),
	  ('SP13',N'Mắc cài sứ','VTYT',N'cái',50000.00),
	  ('SP14',N'Thuốc trị sâu răng',N'Thuốc',N'thùng',50000.00),
	  ('SP15',N'Thuốc trị sưng nướu',N'Thuốc',N'thùng',50000.00),
	  ('SP16',N'Kháng sinh',N'Thuốc',N'cái',50000.00),
	  ('SP17',N'thuốc giảm căng thẳng',N'Thuốc',N'thùng',50000.00),
	  ('SP18',N'Thuốc tạo men răng',N'Thuốc',N'thùng',50000.00),
	  ('SP19',N'Thuốc kháng dị ứng',N'Thuốc',N'thùng',50000.00),
	  ('SP20',N'Thuốc kháng vi khuẩn miệng',N'Thuốc',N'thùng',50000.00);
	
if exists (select * from sys.objects where name ='Kho')
	drop table Kho
go
create table Kho
(
	IDSanPham char(4) not null,
	IDDungCu char(4) not null,
	TenDungCu nvarchar(255) not null,
	Loai nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int,
	primary key (IDDungCu),
	constraint chk_IDSanPham_Kho foreign key (IDSanPham) references ThiTruong(IDSanPham)	
)
INSERT INTO Kho
VALUES('SP01','DC01',N'Bông gòn','VTYT',N'túi',1000),
	  ('SP02','DC02',N'Thuốc tê local ',N'Thuốc',N'thùng',100),
	  ('SP03','DC03',N'Ống hút bọt','VTYT',N'cái',1000),
	  ('SP04','DC04',N'Gương nha khoa','VTYT',N'cái',50),
	  ('SP05','DC05',N'Nước súc miệng',N'Thuốc',N'cái',100),
	  ('SP06','DC06',N'Thuốc chống đau và chống viêm ',N'Thuốc',N'thùng',100),
	  ('SP07','DC07',N'Kềm nhổ răng','VTYT',N'cái',100),
	  ('SP08','DC08',N'Bút trám răng','VTYT',N'cái',100),
	  ('SP09','DC09',N'Răng kim loại','VTYT',N'cái',100),
	  ('SP10','DC10',N'Răng Titan','VTYT',N'cái',100),
	  ('SP11','DC11',N'Răng sứ','VTYT',N'cái',100),
	  ('SP12','DC12',N'Mắc cài kim loại','VTYT',N'cái',100),
	  ('SP13','DC13',N'Mắc cài sứ','VTYT',N'cái',100),
	  ('SP14','DC14',N'Thuốc trị sâu răng',N'Thuốc',N'thùng',100),
	  ('SP15','DC15',N'Thuốc trị sưng nướu',N'Thuốc',N'thùng',100),
	  ('SP16','DC16',N'Kháng sinh',N'Thuốc',N'cái',100),
	  ('SP17','DC17',N'thuốc giảm căng thẳng',N'Thuốc',N'thùng',100),
	  ('SP18','DC18',N'Thuốc tạo men răng',N'Thuốc',N'thùng',100),
	  ('SP19','DC19',N'Thuốc kháng dị ứng',N'Thuốc',N'thùng',100),
	  ('SP20','DC20',N'Thuốc kháng vi khuẩn miệng',N'Thuốc',N'thùng',100);

if exists (select * from sys.objects where name ='LichSuNhapXuat')
	drop table LichSuNhapXuat
go
create table LichSuNhapXuat
(
	NoiDung bit not null,
	IDDungCu char(4) not null,
	TenDungCu nvarchar(255) not null,
	Loai nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuongNhapXuat int,
	Don money not null,
	ThanhTien money not null,
	NgayNhap datetime not null,
	constraint chk_IDDungCu_NK foreign key (IDDungCu) references Kho(IDDungCu)
)
INSERT INTO LichSuNhapXuat
VALUES(1,'DC01',N'Bông gòn','VTYT',N'túi',1000,50000.00,50000000.00,'10/17/2023'),
	  (1,'DC02',N'Thuốc tê local ',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC03',N'Ống hút bọt','VTYT',N'cái',1000,50000.00,50000000.00,'10/17/2023'),
	  (1,'DC04',N'Gương nha khoa','VTYT',N'cái',50,50000.00,2500000.00,'10/17/2023'),
	  (1,'DC05',N'Nước súc miệng',N'Thuốc',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC06',N'Thuốc chống đau và chống viêm ',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC07',N'Kềm nhổ răng','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC08',N'Bút trám răng','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC09',N'Răng kim loại','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC10',N'Răng Titan','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC11',N'Răng sứ','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC12',N'Mắc cài kim loại','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC13',N'Mắc cài sứ','VTYT',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC14',N'Thuốc trị sâu răng',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC15',N'Thuốc trị sưng nướu',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC16',N'Kháng sinh',N'Thuốc',N'cái',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC17',N'thuốc giảm căng thẳng',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC18',N'Thuốc tạo men răng',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC19',N'Thuốc kháng dị ứng',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023'),
	  (1,'DC20',N'Thuốc kháng vi khuẩn miệng',N'Thuốc',N'thùng',100,50000.00,5000000.00,'10/17/2023');

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
	Ten nvarchar(50) not null,
	ChucVu nvarchar(50),
	KinhNghiem nvarchar(50),
	SDT CHAR (10),
	MoTa nvarchar(100),
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
	HoTen nvarchar(255) not null,
	Gioi bit,
	NamSinh char(4),
	SDT varchar(10),
	DiaChi nvarchar(255),
	NgayKhamDau datetime,
	primary key (IDBenhNhan)
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

if exists (select * from sys.objects where name ='DanhSachKham')
	drop table DanhSachKham
go
create table DanhSachKham
(
	IDKham char(3) not null,
	IDBenhNhan char(3) not null,
	MaNV char(3),
	NgayKham datetime not null,
	primary key (IDKham),
	constraint chk_IDBenhNhan_DanhSachKham foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan),
	constraint chk_MaNV_DanhSachKham foreign key (MaNV) references BacSi(MaNV)
)

if exists (select * from sys.objects where name ='CanLamSang')
	drop table CanLamSang
go
create table CanLamSang
(
	IDKham char(3) not null,
	HuyetAp int,
	Mach int,
	DuongHuyet nvarchar(255),
	MauKhoDong bit not null,
	BenhTim bit not null,
	ThieuNang bit not null,
	BaoHanh nvarchar(255),
	Khac nvarchar(255),
	constraint chk_IDKham_CanLamSang foreign key (IDKham) references DanhSachKham(IDKham)
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
insert into ChanDoan
values
('CAO', N'Cạo vôi răng'),
('TAY', N'Tẩy trắng răng'),
('NHO', N'Nhổ răng'),
('TRM', N'Trám răng'),
('NOI', N'Nội nha (chữa tủy)'),
('RSU', N'Răng sứ'),
('RTL', N'Răng tháo lắp'),
('NIE', N'Niềng răng'),
('IMP', N'Implant')

if exists (select * from sys.objects where name ='DichVu')
	drop table DichVu
go
create table DichVu
(
	IDDichVu char(4) not null,
	IDChanDoan char(3) not null,
	TenDichVu nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	DonGia money not null,
	primary key (IDDichVu),
	constraint chk_IDChanDoan_DichVu foreign key (IDChanDoan) references ChanDoan(IDChanDoan)
)
insert into DichVu
values
('CA01', 'CAO', N'Toàn hàm', N'Lần', 300000.00),
('TA01', 'TAY', N'Tại nhà', N'Lần', 300000.00),
('TA02', 'TAY', N'Tại phòng', N'Lần', 400000.00),
('NH01', 'NHO', N'Trước (1 chân)', N'Cái', 50000.00),
('NH02', 'NHO', N'Hàm (nhiều chân)', N'Lần', 200000.00),
('NH03', 'NHO', N'Khó', N'Cái', 50000.00),
('NH04', 'NHO', N'Chân răng', N'Cái', 50000.00),
('NH05', 'NHO', N'Lung lay', N'Cái', 50000.00),
('NH06', 'NHO', N'Sữa', N'Cái', 50000.00),
('NH07', 'NHO', N'Khôn hàm trên', N'Cái', 50000.00),
('NH08', 'NHO', N'Khôn hàm dưới', N'Cái', 50000.00),
('TR01', 'TRM', N'Sâu S1, S2', N'Cái', 50000.00),
('TR02', 'TRM', N'Sâu S3', N'Cái', 50000.00),
('TR03', 'TRM', N'Mòn cổ', N'Cái', 50000.00),
('TR04', 'TRM', N'Kẽ răng thưa', N'Cái', 50000.00),
('TR05', 'TRM', N'Đắp mặt', N'Cái', 50000.00),
('TR06', 'TRM', N'Gắn đá kim cương', N'Cái', 50000.00),
('NO01', 'NOI', N'Răng sữa (trẻ em)', N'Cái', 50000.00),
('NO02', 'NOI', N'Răng cửa', N'Cái', 50000.00),
('NO03', 'NOI', N'Răng tiền cối', N'Cái', 50000.00),
('NO04', 'NOI', N'Răng cối', N'Cái', 50000.00),
('NO05', 'NOI', N'Nội nha lại răng cửa', N'Cái', 50000.00),
('NO06', 'NOI', N'Nội nha lại răng tiền cối', N'Cái', 50000.00),
('NO07', 'NOI', N'Nội nha lại răng cối', N'Cái', 50000.00),
('RS01', 'RSU', N'Kim loại', N'Cái', 50000.00),
('RS02', 'RSU', N'Titan', N'Cái', 50000.00),
('RS03', 'RSU', N'Toàn sứ', N'Cái', 50000.00),
('RT01', 'RTL', N'Nền nhựa cứng bán hàm', N'Cái', 50000.00),
('RT02', 'RTL', N'Nền nhựa cứng toàn hàm', N'Cái', 50000.00),
('RT03', 'RTL', N'Nền nhựa mềm bán hàm', N'Cái', 50000.00),
('RT04', 'RTL', N'Nền nhựa mềm toàn hàm', N'Cái', 50000.00),
('RT05', 'RTL', N'Răng nhựa Việt Nam', N'Cái', 50000.00),
('RT06', 'RTL', N'Răng nhựa ngoại', N'Cái', 50000.00),
('RT07', 'RTL', N'Răng composite', N'Cái', 50000.00),
('RT08', 'RTL', N'Răng sứ', N'Cái', 50000.00),
('RT09', 'RTL', N'Hàm khung kim loại', N'Cái', 50000.00),
('RT10', 'RTL', N'Hàm khung liên kết', N'Cái', 50000.00),
('RT11', 'RTL', N'Hàm khung nhựa cứng', N'Cái', 50000.00),
('RT12', 'RTL', N'Hàm khung nhựa mềm', N'Cái', 50000.00),
('NI01', 'NIE', N'Mắc cài kim loại', N'Lần', 40000.00),
('NI02', 'NIE', N'Mắc cài sứ', N'Lần', 30000.00),
('IM01', 'IMP', N'Hàn quốc', N'Cái', 50000.00),
('IM02', 'IMP', N'Ý', N'Cái', 50000.00),
('IM03', 'IMP', N'Mỹ', N'Cái', 50000.00),
('IM04', 'IMP', N'Khác', N'Cái', 50000.00)

if exists (select * from sys.objects where name ='DieuTri')
	drop table DieuTri
go
create table DieuTri
(
	IDDichVu char(4) not null,
	IDKham char(3) not null,
	IDDungCu char(4) not null,
	SoLuong int not null,
	ThanhTien money not null,
	constraint chk_IDDichVu_DieuTri foreign key (IDDichVu) references DichVu(IDDichVu),
	constraint chk_IDKham_DieuTri foreign key (IDKham) references DanhSachKham(IDKham),
	constraint chk_IDDungCu_DieuTri foreign key (IDDungCu) references Kho(IDDungCu)
)

if exists (select * from sys.objects where name ='DonThuoc')
	drop table DonThuoc
go
create table DonThuoc
(
	IDDonThuoc char(3) not null,
	IDKham char(3) not null,
	TongTien money not null,
	NgayLapDT datetime,
	primary key (IDDonThuoc),
	constraint chk_IDKham_DonThuoc foreign key (IDKham) references DanhSachKham(IDKham)
)

if exists (select * from sys.objects where name ='CTDonThuoc')
	drop table CTDonThuoc
go
create table CTDonThuoc
(
	IDDonThuoc char(3) not null,
	TenThuoc nvarchar(255) not null,
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
	IDKham char(3) not null,
	PhuongThucThanhToan nvarchar(255),
	TienThuoc money not null,
	TienDieuTri money not null,
	TongTien money not null,
	NgayLap money not null,
	primary key (IDHoaDon),
	constraint chk_IDKham_HoaDon foreign key (IDKham) references DanhSachKham(IDKham)
)
