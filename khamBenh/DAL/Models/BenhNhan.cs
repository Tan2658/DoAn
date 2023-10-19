namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BenhNhan")]
    public partial class BenhNhan
    {
        [Key]
        [StringLength(3)]
        public string IDBenhNhan { get; set; }

        [Required]
        [StringLength(3)]
        public string MaNV { get; set; }

        [Required]
        [StringLength(3)]
        public string IDHoaDon { get; set; }

        [Required]
        [StringLength(3)]
        public string IDDonThuoc { get; set; }

        [Required]
        [StringLength(3)]
        public string IDChanDoan { get; set; }

        [Required]
        [StringLength(3)]
        public string IDCanLamSang { get; set; }

        [Required]
        [StringLength(255)]
        public string HoTen { get; set; }

        public bool? Gioi { get; set; }

        [Required]
        [StringLength(4)]
        public string NamSinh { get; set; }

        [Required]
        [StringLength(11)]
        public string SDT { get; set; }

        [Required]
        [StringLength(255)]
        public string DiaChi { get; set; }

        public DateTime NgayKhamDau { get; set; }

        [Required]
        [StringLength(255)]
        public string LyDo { get; set; }

        public virtual BacSi BacSi { get; set; }

        public virtual CanLamSang CanLamSang { get; set; }

        public virtual ChanDoan ChanDoan { get; set; }

        public virtual DonThuoc DonThuoc { get; set; }

        public virtual HoaDon HoaDon { get; set; }
    }
}
