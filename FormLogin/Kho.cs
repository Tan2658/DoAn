using DAL.Data;
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

namespace FormLogin
{
    public partial class frmKho : Form
    {
        FormTrangChu frm;
        public frmKho()
        {
            InitializeComponent();
        }
        public frmKho(FormTrangChu frm)
        {
            InitializeComponent();
            this.frm = frm;
        }
        private void BindGrid(List<Kho> Medics)
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

        private void frmKho_Load(object sender, EventArgs e)
        {
            DentalContextDB context = new DentalContextDB();
            List<Kho> listMedic = context.Khoes.ToList();
            BindGrid(listMedic);
        }

        private void btnDongKho_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
