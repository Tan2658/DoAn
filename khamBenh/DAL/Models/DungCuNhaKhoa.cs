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
        [Required]
        [StringLength(50)]
        public string NoiDung { get; set; }

        [Key]
        [StringLength(3)]
        public string IDDungCu { get; set; }

        [Required]
        [StringLength(255)]
        public string TenDungCu { get; set; }

        [Required]
        [StringLength(255)]
        public string Loai { get; set; }

        [Required]
        [StringLength(255)]
        public string DonViTinh { get; set; }

        public int SoLuong { get; set; }

        [Column(TypeName = "money")]
        public decimal Don { get; set; }

        [Column(TypeName = "money")]
        public decimal ThanhTien { get; set; }

        public DateTime NgayNhap { get; set; }
    }
}
