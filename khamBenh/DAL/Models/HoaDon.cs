namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(3)]
        public string IDBenhNhan { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(255)]
        public string HoTen { get; set; }

        public bool? Gioi { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(4)]
        public string NamSinh { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(11)]
        public string SDT { get; set; }

        [Key]
        [Column(Order = 4)]
        [StringLength(255)]
        public string DiaChi { get; set; }

        [Key]
        [Column(Order = 5)]
        [StringLength(255)]
        public string PhuongThucThanhToan { get; set; }

        [Key]
        [Column(Order = 6, TypeName = "money")]
        public decimal TongTien { get; set; }

        public virtual BenhNhan BenhNhan { get; set; }
    }
}
