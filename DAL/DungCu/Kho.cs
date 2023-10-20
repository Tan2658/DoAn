namespace DAL.DungCu
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Kho")]
    public partial class Kho
    {
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

        public virtual DungCuNhaKhoa DungCuNhaKhoa { get; set; }
    }
}
