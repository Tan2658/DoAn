namespace DAL.Data
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("BacSi")]
    public partial class BacSi
    {
        [Required]
        [StringLength(10)]
        public string TrangThai { get; set; }

        [Key]
        [StringLength(22)]
        public string TenDangNhap { get; set; }

        [Required]
        [StringLength(50)]
        public string MatKhau { get; set; }

        [Required]
        [StringLength(50)]
        public string Ten { get; set; }

        [Required]
        [StringLength(50)]
        public string ChucVu { get; set; }

        [Required]
        [StringLength(50)]
        public string KinhNghiem { get; set; }

        [Required]
        [StringLength(10)]
        public string STD { get; set; }

        [Required]
        [StringLength(255)]
        public string Mota { get; set; }
    }
}
