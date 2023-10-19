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
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            BenhNhan = new HashSet<BenhNhan>();
        }

        [Key]
        [StringLength(3)]
        public string IDHoaDon { get; set; }

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

        [Required]
        [StringLength(255)]
        public string PhuongThucThanhToan { get; set; }

        [Column(TypeName = "money")]
        public decimal TongTien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhNhan> BenhNhan { get; set; }
    }
}
