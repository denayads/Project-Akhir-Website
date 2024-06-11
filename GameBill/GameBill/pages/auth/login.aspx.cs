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
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButtonLogin_Click(object sender, EventArgs e)
        {
            string email = TextBoxEmail.Text.Trim();
            string password = TextBoxPassword.Text.Trim();
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            Encryptor encryptor = new Encryptor();

            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand("select * from users where email=@email and pass=@pass", con))
                {
                    cmd.Parameters.Add("@email", SqlDbType.NVarChar).Value = email;
                    cmd.Parameters.Add("@pass", SqlDbType.NVarChar).Value = encryptor.Hash(password);

                    try
                    {
                        con.Open();
                        using (SqlDataReader rdr = cmd.ExecuteReader())
                        {
                            if (rdr.Read())
                            {
                                Session.Add("id", rdr["id"]);
                                Session.Add("nama", rdr["nama"]);
                                Session.Add("email", rdr["email"]);
                                Session.Add("admin", rdr["admin"]);
                                if (Convert.ToInt32(rdr["admin"]) == 1)
                                {
                                    Response.Redirect("~/pages/admin/index.aspx");
                                }
                                else
                                {
                                    Response.Redirect("~/pages/member/index.aspx");
                                }
                            }
                            else
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Login gagal!";
                            }
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
    }
}