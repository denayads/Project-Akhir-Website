using GameBill.helper;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.auth
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonRegister_Click(object sender, EventArgs e)
        {
            string nama = TextBoxName.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();
            string confirmPass = TextBoxConfirmPassword.Text.Trim();

            if (password.Equals(confirmPass))
            {
                string con_str = ConfigurationManager.ConnectionStrings["blogspaceCS"].ConnectionString;
                Encryptor encryptor = new Encryptor();

                using (SqlConnection con = new SqlConnection(con_str))
                {
                    using (SqlCommand cmd = new SqlCommand("insert into pengguna (nama, email, pass) values (@nama, @email, @pass)", con))
                    {
                        cmd.Parameters.Add("@nama", SqlDbType.NVarChar).Value = nama;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                        cmd.Parameters.Add("@pass", SqlDbType.NVarChar).Value = encryptor.Hash(password);
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-primary alert-dismissible fade show");
                                message.Text = "Register berhasil, silahkan login!";
                            }
                            else
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Register gagal!";
                            }
                        }
                        catch (Exception ex)
                        {
                            notif.Visible = true;
                            notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                            message.Text = ex.Message;
                        }
                    }
                }
            }
            else
            {
                notif.Visible = true;
                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                message.Text = "Password dan Confirm Password tidak sama!";
            }
        }
    }
}