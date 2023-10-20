using BLL;
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
using System.Xml.Linq;

namespace GUI
{
    public partial class frmMedicalSupplies : Form
    {
        private readonly MedicalService ms= new MedicalService();
        private DentalContextDB context=new DentalContextDB();
        public frmMedicalSupplies()
        {
            InitializeComponent();
        }
        private int GetSelectedRow(string id)
        {
            for (int i = 0; i < dgvMedical.Rows.Count; i++)
            {
                if (dgvMedical.Rows[i].Cells[1].Value.ToString() == id)
                {
                    return i;
                }
            }
            return -1;
        }


        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                int selectRow = GetSelectedRow(txtMa.Text);
                if (checkDataFields()== true)
                {
                    int sl = Convert.ToInt32(txtSL.Text);
                    int donGia = Convert.ToInt32(txtPrice.Text);
                    if (selectRow == -1)
                   {
                        DungCuNhaKhoa d = new DungCuNhaKhoa()
                        {
                            NoiDung = cboND.Text,
                            IDDungCu = txtMa.Text,
                            TenDungCu = txtTen.Text,
                            Loai=cboLoai.Text,
                            DonViTinh = cboDVT.Text,
                            SoLuong = int.Parse(txtSL.Text),
                            Don = decimal.Parse(txtPrice.Text),
                            ThanhTien = decimal.Parse((sl*donGia).ToString()),
                            NgayNhap = dateTimePicker1.Value                        };
                        ms.InsertUpdate(d);
                        MessageBox.Show("Thêm dữ liệu thành công", "Thông báo", MessageBoxButtons.OK);
                        List<DungCuNhaKhoa> listMedic = context.DungCuNhaKhoas.ToList();
                        BindGrid(listMedic);
                        clearContent();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

            }
        }

        private void btnUp_Click(object sender, EventArgs e)
        {
            int selectRow = GetSelectedRow(txtMa.Text);
            if( selectRow != -1)
            {
                decimal sl = Convert.ToDecimal(txtSL.Text);
                decimal donGia = Convert.ToDecimal(txtPrice.Text);
                decimal thanhTien = sl * donGia;
                var id = dgvMedical.SelectedCells[0].OwningRow.Cells[1].Value.ToString();
                DungCuNhaKhoa dbUpdate = ms.FindID(txtMa.Text);
                if (dbUpdate != null)
                {
                    DungCuNhaKhoa sv = context.DungCuNhaKhoas.Find(id);
                    sv.NoiDung = cboND.Text;
                    sv.TenDungCu=txtTen.Text;
                    sv.Loai = cboLoai.Text;
                    sv.DonViTinh = cboLoai.Text;
                    sv.SoLuong = int.Parse(txtSL.Text);
                    sv.Don = decimal.Parse(txtPrice.Text);
                    sv.ThanhTien = Convert.ToDecimal(thanhTien);
                    sv.NgayNhap = dateTimePicker1.Value;
                    context.SaveChanges();
                    MessageBox.Show("Cap nhat dữ liệu thành công", "Thông báo", MessageBoxButtons.OK);
                    List<DungCuNhaKhoa> listMedic = context.DungCuNhaKhoas.ToList();
                    BindGrid(listMedic);
                    clearContent();
                }
            }
            

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
        private bool checkDataFields()
        {
            if (txtMa.Text == "" || txtTen.Text == "" || txtPrice.Text == "" || txtSL.Text == "")
            {
                MessageBox.Show("Vui long nhap day du thong tin");
                return false;
            }
            
            return true;
        }


        private void frmMedicalSupplies_Load(object sender, EventArgs e)
        {
            List<DungCuNhaKhoa> listMedic = context.DungCuNhaKhoas.ToList();
            BindGrid(listMedic);
        }

        private void btnEx_Click(object sender, EventArgs e)
        {
            DialogResult dr = MessageBox.Show("Bạn có muốn thoát không ?", "Thong bao", MessageBoxButtons.YesNo);
            if (dr == DialogResult.Yes)
            {
                this.Close();
            }
        }

        private void btnDel_Click(object sender, EventArgs e)
        {
            try
            {
                string ID = txtMa.Text;

                DungCuNhaKhoa dbDelete = context.DungCuNhaKhoas.FirstOrDefault(p => p.IDDungCu == ID);
                if (dbDelete == null)
                {
                    throw new Exception("Không tìm thấy mã cần xóa");
                }
                else
                {
                    if (dbDelete != null)
                    {
                        DialogResult dr = MessageBox.Show("Bạn có muốn xóa ?", "Yes / No", MessageBoxButtons.YesNo);
                        if (dr == DialogResult.Yes)
                        {
                            dgvMedical.Rows.RemoveAt(dgvMedical.CurrentRow.Index);
                            context.DungCuNhaKhoas.Remove(dbDelete);
                            context.SaveChanges();
                            MessageBox.Show("Xóa thành công", "Thông báo", MessageBoxButtons.OK);
                            clearContent();
                        }

                    }


                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
        public void clearContent()
        {
            cboND.SelectedIndex = -1;
            txtMa.Text = string.Empty;
            txtTen.Text = string.Empty;
            txtSL.Text = string.Empty;
            cboDVT.SelectedIndex = -1;
            txtPrice.Text= string.Empty;
        }

        private void dgvMedical_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dgvMedical.SelectedRows.Count > 0)
            {
                cboND.Text = dgvMedical.Rows[e.RowIndex].Cells[0].Value.ToString();
                txtMa.Text = dgvMedical.Rows[e.RowIndex].Cells[1].Value.ToString();
                txtTen.Text = dgvMedical.Rows[e.RowIndex].Cells[2].Value.ToString();
                cboLoai.Text = dgvMedical.Rows[e.RowIndex].Cells[3].Value.ToString();
                cboDVT.Text = dgvMedical.Rows[e.RowIndex].Cells[4].Value.ToString();
                txtSL.Text = dgvMedical.Rows[e.RowIndex].Cells[5].Value.ToString();
                txtPrice.Text = dgvMedical.Rows[e.RowIndex].Cells[6].Value.ToString();
                dateTimePicker1.Value =DateTime.Parse(dgvMedical.Rows[e.RowIndex].Cells[8].Value.ToString());
            }
            else
            {
                MessageBox.Show("Can chon vao dong ban muon sua");
            }
        }

        private void thongKeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmStatistics frm2 = new frmStatistics(this);
            this.Hide();
            frm2.ShowDialog();
            this.Show();
        }

        private void btnStore_Click(object sender, EventArgs e)
        {
            frmStore frm = new frmStore(this);
            this.Hide();
            frm.ShowDialog();
            this.Show();
        }
    }
}
