namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DieuTri")]
    public partial class DieuTri
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(2)]
        public string IDDieuTri { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(255)]
        public string TenDieuTri { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(255)]
        public string DonViTinh { get; set; }

        [Key]
        [Column(Order = 3)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int SoLuong { get; set; }

        [Key]
        [Column(Order = 4, TypeName = "money")]
        public decimal DonGia { get; set; }

        [Key]
        [Column(Order = 5, TypeName = "money")]
        public decimal ThanhTien { get; set; }

        [Key]
        [Column(Order = 6)]
        [StringLength(3)]
        public string IDChanDoan { get; set; }

        public virtual ChanDoan ChanDoan { get; set; }
    }
}
