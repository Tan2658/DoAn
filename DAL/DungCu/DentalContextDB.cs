using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace DAL.DungCu
{
    public partial class DentalContextDB : DbContext
    {
        public DentalContextDB()
            : base("name=DentalContextDB")
        {
        }

        public virtual DbSet<DonThuoc> DonThuocs { get; set; }
        public virtual DbSet<DungCuNhaKhoa> DungCuNhaKhoas { get; set; }
        public virtual DbSet<Kho> Khoes { get; set; }
        public virtual DbSet<TaiKhoan> TaiKhoans { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
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

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.IDDungCu)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.Don)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .Property(e => e.ThanhTien)
                .HasPrecision(19, 4);

            modelBuilder.Entity<DungCuNhaKhoa>()
                .HasOptional(e => e.Kho)
                .WithRequired(e => e.DungCuNhaKhoa);

            modelBuilder.Entity<Kho>()
                .Property(e => e.IDDungCu)
                .IsFixedLength()
                .IsUnicode(false);

            modelBuilder.Entity<Kho>()
                .Property(e => e.Don)
                .HasPrecision(19, 4);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.TenDangNhap)
                .IsUnicode(false);

            modelBuilder.Entity<TaiKhoan>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);
        }
    }
}
