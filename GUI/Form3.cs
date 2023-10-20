using DAL.DungCu;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class frmStore : Form
    {
        frmMedicalSupplies frm;
        private DentalContextDB context = new DentalContextDB();
        public frmStore()
        {
            InitializeComponent();
        }
        public frmStore(frmMedicalSupplies frm)
        {
            InitializeComponent();
            this.frm = frm;
        }
        private void BindGrid(List<DungCuNhaKhoa> Medics)
        {
            dgvStore.Rows.Clear();
            foreach (var Medic in Medics)
            {
                int index = dgvStore.Rows.Add();
                dgvStore.Rows[index].Cells[0].Value = Medic.IDDungCu;
                dgvStore.Rows[index].Cells[1].Value = Medic.TenDungCu.ToString();
                dgvStore.Rows[index].Cells[2].Value = Medic.Loai.ToString();
                dgvStore.Rows[index].Cells[3].Value = Medic.DonViTinh.ToString();
                dgvStore.Rows[index].Cells[4].Value = Medic.SoLuong.ToString();
                dgvStore.Rows[index].Cells[5].Value = Medic.Don.ToString();

            }
        }
        private void frmStore_Load(object sender, EventArgs e)
        {
            List<DungCuNhaKhoa> listMedic = context.DungCuNhaKhoas.ToList();
            BindGrid(listMedic);
        }
    }
}
