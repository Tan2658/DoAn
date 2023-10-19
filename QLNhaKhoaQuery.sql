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
	constraint chk_TenDangNhap foreign key (TenDangNhap) references TaiKhoan(TenDangNhap)
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
	Loai nvarchar(50) not null,
	ThongSo nvarchar(25) not null,
	IDBenhNhan char(3) not null,
	constraint chk_IDBenhNhan foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)

if exists (select * from sys.objects where name ='ChanDoan')
	drop table ChanDoan
go
create table ChanDoan
(
	IDChanDoan char(3) not null,
	TenChanDoan nvarchar(255) not null,
	IDBenhNhan char(3) not null,
	primary key (IDChanDoan),
	constraint chk_IDBenhNhan1 foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)

if exists (select * from sys.objects where name ='DieuTri')
	drop table DieuTri
go
create table DieuTri
(
	IDDieuTri char(2) not null,
	TenDieuTri nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	DonGia money not null,
	ThanhTien money not null,
	IDChanDoan char(3) not null,
	constraint chk_IDChanDoan foreign key (IDChanDoan) references ChanDoan(IDChanDoan)
)

if exists (select * from sys.objects where name ='DonThuoc')
	drop table DonThuoc
go
create table DonThuoc
(
	IDDonThuoc char(3) not null,
	IDBenhNhan char(3) not null,
	HoTen nvarchar(255) not null,
	Gioi bit,
	NamSinh char(4) not null,
	SDT varchar(11) not null,
	DiaChi nvarchar(255) not null,
	primary key (IDDonThuoc),
	constraint chk_IDBenhNhan2 foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)

if exists (select * from sys.objects where name ='CTDonThuoc')
	drop table CTDonThuoc
go
create table CTDonThuoc
(
	IDDonThuoc char(3) not null,
	TenThuoc nvarchar(255) not null,
	DonViTinh nvarchar(255) not null,
	SoLuong int not null,
	DonGia money not null,
	ThanhGia money not null,
	constraint chk_IDDonThuoc foreign key (IDDonThuoc) references DonThuoc(IDDonThuoc)
)

if exists (select * from sys.objects where name ='HoaDon')
	drop table HoaDon
go
create table HoaDon
(
	IDBenhNhan char(3) not null,
	HoTen nvarchar(255) not null,
	Gioi bit,
	NamSinh char(4) not null,
	SDT varchar(11) not null,
	DiaChi nvarchar(255) not null,
	PhuongThucThanhToan nvarchar(255) not null,
	TongTien money not null,
	constraint chk_IDBenhNhan3 foreign key (IDBenhNhan) references BenhNhan(IDBenhNhan)
)
