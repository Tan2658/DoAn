namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DungCuNhaKhoa")]
    public partial class DungCuNhaKhoa
    {
        [Key]
        [StringLength(3)]
        public string IDDungCu { get; set; }

        [Required]
        [StringLength(22)]
        public string TenDangNhap { get; set; }

        [Required]
        [StringLength(255)]
        public string TenDungCu { get; set; }

        [Required]
        [StringLength(255)]
        public string DonViTinh { get; set; }

        public int SoLuong { get; set; }

        [Column(TypeName = "money")]
        public decimal Don { get; set; }

        [Column(TypeName = "money")]
        public decimal ThanhTien { get; set; }

        public virtual TaiKhoan TaiKhoan { get; set; }
    }
}
