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
            string user_name = TextBoxUserName.Text.Trim();
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();
            string confirmPassword = TextBoxConfirmPassword.Text.Trim();

            if (password.Equals(confirmPassword))
            {
                string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
                Encryptor encryptor = new Encryptor();
                using (SqlConnection con = new SqlConnection(con_str))
                {
                    using (SqlCommand cmd = new SqlCommand("insert into users (user_name, email, password) values (@user_name, @email, @password)", con))
                    {
                        cmd.Parameters.Add("@user_name", SqlDbType.NVarChar).Value = user_name;
                        cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                        cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = encryptor.Hash(password);
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-primary alert-dismissible fade show");
                                message.Text = "Register success, please login!";
                            }
                            else
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Register failed!";
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
                message.Text = "Password and Confirm Password not same!";
            }
        }
    }
}