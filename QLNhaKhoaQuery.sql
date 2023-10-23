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
	NgayNhap datetime not null,
	primary key (IDDungCu)
)
INSERT INTO DungCuNhaKhoa
VALUES('Nhap','SP1','Bong gon','VTYT','tui',1000,10000.00,10000000.00,'10/17/2023'),
	  ('Nhap','SP2','Thuoc te local ','Thuoc','thung',100,200000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP3','Ong hut bot','VTYT','cai',1000,20000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP4','Guong nha khoa','VTYT','cai',50,20000.00,1000000.00,'10/17/2023'),
	  ('Nhap','SP5','Nuoc suc mieng','Thuoc','cai',100,200000.00,20000000.00,'10/17/2023'),
	  ('Nhap','SP6','Thuoc chong dau và chong viem ','Thuoc','thung',100,250000.00,25000000.00,'10/17/2023');

if exists (select * from sys.objects where name ='TaiKhoan')
	drop table TaiKhoan
go
create table TaiKhoan
(
	TenDangNhap varchar(22) not null,
	MatKhau varchar(50) not null,
	primary key (TenDangNhap)
)
	
if exists (select * from sys.objects where name ='BacSi')
	drop table BacSi
go
create table BacSi
(
	MaNV char(3) not null,
	TenDangNhap varchar(22) not null,
	Ten nvarchar(50) not null,
	ChucVu nvarchar(50) not null,
	KinhNghiem nvarchar(50) not null,
	SDT CHAR (10) not null,
	MoTa nvarchar(100) not null,
	primary key (MaNV),
	constraint chk_TenDangNhap_BacSi foreign key (TenDangNhap) references TaiKhoan(TenDangNhap)
)

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
	IDBenhNhan char(3) not null,
	IDDungCu char(3) not null,
	SoLuong int not null,
	ThanhTien money not null,
	constraint chk_IDDichVu_DieuTri foreign key (IDDichVu) references DichVu(IDDichVu),
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
