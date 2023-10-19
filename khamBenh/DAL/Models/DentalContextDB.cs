using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DAL.Models
{
    public partial class DentalContextDB : DbContext
    {
        public DentalContextDB()
            : base("name=DentalContextDB")
        {
        }

        public virtual DbSet<BenhNhan> BenhNhan { get; set; }
        public virtual DbSet<ChanDoan> ChanDoan { get; set; }
        public virtual DbSet<DonThuoc> DonThuoc { get; set; }
        public virtual DbSet<DungCuNhaKhoa> DungCuNhaKhoa { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoan { get; set; }
        public virtual DbSet<CanLamSang> CanLamSang { get; set; }
        public virtual DbSet<CTDonThuoc> CTDonThuoc { get; set; }
        public virtual DbSet<DieuTri> DieuTri { get; set; }
        public virtual DbSet<HoaDon> HoaDon { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BenhNhan>()
                .Property(e => e.IDBenhNhan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BenhNhan>()
                .Property(e => e.NamSinh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<BenhNhan>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<BenhNhan>()
                .HasMany(e => e.CanLamSang)
                .WithRequired(e => e.BenhNhan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BenhNhan>()
                .HasMany(e => e.ChanDoan)
                .WithRequired(e => e.BenhNhan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BenhNhan>()
                .HasMany(e => e.DonThuoc)
                .WithRequired(e => e.BenhNhan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BenhNhan>()
                .HasMany(e => e.HoaDon)
                .WithRequired(e => e.BenhNhan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChanDoan>()
                .Property(e => e.IDChanDoan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChanDoan>()
                .Property(e => e.IDBenhNhan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<ChanDoan>()
                .HasMany(e => e.DieuTri)
                .WithRequired(e => e.ChanDoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DonThuoc>()
                .Property(e => e.IDDonThuoc)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DonThuoc>()
                .Property(e => e.IDBenhNhan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DonThuoc>()
                .Property(e => e.NamSinh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DonThuoc>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<DonThuoc>()
                .HasMany(e => e.CTDonThuoc)
                .WithRequired(e => e.DonThuoc)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.IDDungCu)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.Don)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.ThanhTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .HasMany(e => e.DungCuNhaKhoa)
                .WithRequired(e => e.TaiKhoan)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CanLamSang>()
                .Property(e => e.IDBenhNhan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CTDonThuoc>()
                .Property(e => e.IDDonThuoc)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<CTDonThuoc>()
                .Property(e => e.DonGia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<CTDonThuoc>()
                .Property(e => e.ThanhGia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DieuTri>()
                .Property(e => e.IDDieuTri)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DieuTri>()
                .Property(e => e.DonGia)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DieuTri>()
                .Property(e => e.ThanhTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DieuTri>()
                .Property(e => e.IDChanDoan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.IDBenhNhan)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.NamSinh)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(19, 4);
        }
    }
}
