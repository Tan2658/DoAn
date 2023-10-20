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
    public partial class frmStatistics : Form
    {
        DentalContextDB context = new DentalContextDB();
        frmMedicalSupplies frm1 = new frmMedicalSupplies();
        public frmStatistics()
        {
            InitializeComponent();
        }
        public frmStatistics(frmMedicalSupplies frm1)
        {
            InitializeComponent();
            this.frm1 = frm1;
        }

        private void BindGrid(List<DungCuNhaKhoa> Medics)
        {

            dgvMedical.Rows.Clear();
            foreach (var Medic in Medics)
            {
                int index = dgvMedical.Rows.Add();
                dgvMedical.Rows[index].Cells[0].Value = Medic.NoiDung;
                dgvMedical.Rows[index].Cells[1].Value = Medic.IDDungCu;
                dgvMedical.Rows[index].Cells[2].Value = Medic.TenDungCu.ToString();
                dgvMedical.Rows[index].Cells[3].Value = Medic.Loai.ToString();
                dgvMedical.Rows[index].Cells[4].Value = Medic.DonViTinh.ToString();
                dgvMedical.Rows[index].Cells[5].Value = Medic.SoLuong.ToString();
                dgvMedical.Rows[index].Cells[6].Value = Medic.Don.ToString();
                dgvMedical.Rows[index].Cells[7].Value = Medic.ThanhTien.ToString();
                dgvMedical.Rows[index].Cells[8].Value = Medic.NgayNhap.ToString();

            }
        }

        private void Form2_Load_1(object sender, EventArgs e)
        {
            List<DungCuNhaKhoa> listMedic = context.DungCuNhaKhoas.ToList();
            BindGrid(listMedic);
        }
       
        private void tinh_Click(object sender, EventArgs e)
        {
            decimal s = 0;
            for (int i = 0; i < dgvMedical.Rows.Count; i++)
            {
                if (radioButton1.Checked)
                {
                    if (dtpMonth.Value.Month.ToString() == DateTime.Parse(dgvMedical.Rows[i].Cells[8].Value.ToString()).Month.ToString()
                        && dtpYear.Value.Year.ToString() == DateTime.Parse(dgvMedical.Rows[i].Cells[8].Value.ToString()).Year.ToString())
                    {
                        if (dgvMedical.Rows[i].Cells[0].Value.ToString() == "Nhap")
                        {
                            s -= decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                        }
                        else
                        {
                            s += decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                        }
                        txtDoanh.Text = s.ToString();
                    }
                }
                else if (radioButton3.Checked)
                {
                    if (dtpYear.Value.Year.ToString() == DateTime.Parse(dgvMedical.Rows[i].Cells[8].Value.ToString()).Year.ToString())
                    {
                        if (dgvMedical.Rows[i].Cells[0].Value.ToString() == "Nhap" )
                        {
                            s -= decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                        }
                        else
                        {
                            s += decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                        }
                        txtDoanh.Text = s.ToString();
                    }
                }
                else if (radioButton2.Checked)
                {
                    if (dtpQuy.Value.Year.ToString() == DateTime.Parse(dgvMedical.Rows[i].Cells[8].Value.ToString()).Year.ToString())
                    {
                        int quy = cboQui.SelectedIndex;
                        int transactionQuarter =
                              (int.Parse(DateTime.Parse(dgvMedical.Rows[i].Cells[8].Value.ToString()).Month.ToString()) - 1) / 3 ;
                        if (transactionQuarter == quy)
                        {
                            if (dgvMedical.Rows[i].Cells[0].Value.ToString() == "Nhap" )
                            {
                                s -= decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                            }
                            else
                            {
                                s += decimal.Parse(dgvMedical.Rows[i].Cells[7].Value.ToString());
                            }
                        }
                        txtDoanh.Text = s.ToString();
                    }
                }
                else
                {
                    MessageBox.Show("Ban can phai chon nut thong kẻ");
                    break;
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn thoát không ?", "Thong bao", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                dgvMedical.Rows.RemoveAt(dgvMedical.CurrentRow.Index);
                this.Close();
            }
        }
    }
}
