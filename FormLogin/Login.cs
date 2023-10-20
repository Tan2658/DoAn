using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;
using DAL.Data;

namespace FormLogin
{
    public partial class formLogin : Form
    {

        DentalContextDB context = new DentalContextDB();
        public formLogin()
        {
            InitializeComponent();
        }

        private void txtAccount_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtAccount_Click(object sender, EventArgs e)
        {
            txtAccount.BackColor = Color.White;
            panelAccount.BackColor = Color.White;
            txtPassword.BackColor = SystemColors.Control;
            panelPas.BackColor = SystemColors.Control;
        }

        private void txtPassword_Click(object sender, EventArgs e)
        {
            txtPassword.BackColor = Color.White;
            panelPas.BackColor = Color.White;
            txtAccount.BackColor = SystemColors.Control;
            panelAccount.BackColor = SystemColors.Control;
        }

        private void picAccount_Click(object sender, EventArgs e)
        {
            txtAccount.Focus();
            panelAccount.BackColor = Color.White;
            panelPas.BackColor = SystemColors.Control;
            txtAccount.BackColor = Color.White;
            txtPassword.BackColor = SystemColors.Control;
        }

        private void picLock_Click(object sender, EventArgs e)
        {
            txtPassword.Focus();
            panelPas.BackColor = Color.White;
            panelAccount.BackColor = SystemColors.Control;
            txtPassword.BackColor = Color.White;
            txtAccount.BackColor = SystemColors.Control;
        }

        private void pictureBox4_MouseDown(object sender, MouseEventArgs e)
        {

            string newImagePath = "C:\\Users\\Admin\\source\\repos\\DA Nha Khoa\\FormLogin\\Resources\\picture-show.png";
            Image newImage = Image.FromFile(newImagePath);

            pictureBox4.Image = newImage;

            txtPassword.UseSystemPasswordChar = false;
        }

        private void pictureBox4_MouseUp(object sender, MouseEventArgs e)
        {
            string newImagePath = "C:\\Users\\Admin\\source\\repos\\DA Nha Khoa\\FormLogin\\Resources\\noShowPas.png";

            Image newImage = Image.FromFile(newImagePath);

            pictureBox4.Image = newImage;
            txtPassword.UseSystemPasswordChar = true;
        }

        private void btnClose_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void txtPassword_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
               List<TaiKhoan> ts  = context.TaiKhoans.ToList();
               foreach(var item in ts)
                {
                    if(txtAccount.Text == "" || txtPassword.Text == "")
                    {
                        MessageBox.Show("Yêu cầu nhập các fields đầy đủ !");
                    }else if(txtPassword.Text != item.MatKhau && txtAccount.Text == item.TenDangNhap)
                    {
                        MessageBox.Show("Nếu bạn quên mật khẩu thì click vào Forget Password ?");
                    }else if(txtPassword.Text != item.MatKhau && txtAccount.Text != item.TenDangNhap)
                    {
                        MessageBox.Show("Tài khoản và Mật khẩu bạn chưa tổn tại !!!");
                    }
                    else
                    {

                        MessageBox.Show("Đăng nhập thành công !");
                    }
                }
            }
            catch (Exception ex)
            {

                MessageBox.Show(ex.Message);
            }
        }

        private void btnForget_Click(object sender, EventArgs e)
        {
            ForgetPassword form = new ForgetPassword();
            form.Show();
            //this.Close();
        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
