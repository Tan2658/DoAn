namespace DAL.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChanDoan")]
    public partial class ChanDoan
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ChanDoan()
        {
            BenhNhan = new HashSet<BenhNhan>();
            DieuTri = new HashSet<DieuTri>();
        }

        [Key]
        [StringLength(3)]
        public string IDChanDoan { get; set; }

        [Required]
        [StringLength(255)]
        public string TenChanDoan { get; set; }

        [Required]
        [StringLength(3)]
        public string IDBenhNhan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BenhNhan> BenhNhan { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DieuTri> DieuTri { get; set; }
    }
}
