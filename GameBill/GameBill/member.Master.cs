using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill
{
    public partial class member : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["admin"]) == 1)
                {
                    Response.Redirect("~/pages/auth/login.aspx");
                }
                else if (Session["id"] == null)
                {
                    Response.Redirect("~/pages/auth/login.aspx");
                }
            }
        }

        protected void BindData()
        {
            long id = Convert.ToInt64(Session["id"]);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select count(*) from cart where id_users=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {

                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void LinkButtonLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/pages/auth/login.aspx");
        }
    }
}