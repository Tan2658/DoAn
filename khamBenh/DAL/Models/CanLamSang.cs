namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CanLamSang")]
    public partial class CanLamSang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CanLamSang()
        {
            BenhNhan = new HashSet<BenhNhan>();
        }

        [Key]
        [StringLength(3)]
        public string IDCanLamSang { get; set; }

        [Required]
        [StringLength(50)]
        public string Loai { get; set; }

        [Required]
        [StringLength(25)]
        public string ThongSo { get; set; }

        [Required]
        [StringLength(3)]
        public string IDBenhNhan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhNhan> BenhNhan { get; set; }
    }
}
