using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL.Models;
using BUS;

namespace GUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        DichVuServices dichVuServices = new DichVuServices();

        private void BindGridDieuTri()
        {
            List<DichVu> dichVu = dichVuServices.GetAll();
            dgvDieuTri.Rows.Clear();

            foreach(var item in dichVu)
            {
                int index = dgvDieuTri.Rows.Add();

                dgvDieuTri.Rows[index].Cells[0].Value = item.IDDichVu;
                dgvDieuTri.Rows[index].Cells[1].Value = item.TenDichVu;
                dgvDieuTri.Rows[index].Cells[2].Value = item.DonViTinh;
                dgvDieuTri.Rows[index].Cells[3].Value = item.DonGia.ToString();
                dgvDieuTri.Rows[index].Cells[4].Value = "0";
                dgvDieuTri.Rows[index].Cells[5].Value = "0";
            }
        }

        private void FillBacsiCombo()
        {
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            BindGridDieuTri();
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (tabControl1.SelectedTab.Text == "Danh sách khám bệnh")
                ;
        }

        private void dgvDieuTri_CellValueChanged(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                float sum = 0;
                
                for (int i = 0; i < dgvDieuTri.Rows.Count - 1; i++)
                {
                    if (dgvDieuTri.Rows[i].Cells[5].Value != null)
                    {
                        dgvDieuTri.Rows[i].Cells[5].Value =
                            (float.Parse(dgvDieuTri.Rows[i].Cells[3].Value.ToString())
                            * float.Parse(dgvDieuTri.Rows[i].Cells[4].Value.ToString())).ToString();
                        
                        sum += float.Parse(dgvDieuTri.Rows[i].Cells[5].Value.ToString());
                    }
                }

                txtTongDieuTri.Text = sum.ToString();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
