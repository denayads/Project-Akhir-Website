using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.admin
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData()
        {
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from games";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
                    try
                    {
                        con.Open();

                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            sda.SelectCommand = cmd;

                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ListViewGames.DataSource = dt;
                                ListViewGames.DataBind();
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
            }
        }

        protected void ListViewGames_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                long id = Convert.ToInt64(e.CommandArgument);
                string path_name = "";
                string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(con_str))
                {
                    try
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("select * from games where id=@id", con))
                        {
                            cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Request.QueryString["id"]);
                            using (SqlDataReader reader = cmd.ExecuteReader())
                            {
                                if (reader.Read())
                                    path_name = reader["fitur_img"].ToString();
                            }
                        }

                        using (SqlCommand cmd2 = new SqlCommand("delete from games where id=@id", con))
                        {
                            cmd2.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                            if (cmd2.ExecuteNonQuery() > 0)
                            {
                                FileInfo fileInfo = new FileInfo(Server.MapPath("~/" + path_name));
                                fileInfo.Delete();
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-primary alert-dismissible fade show");
                                message.Text = "Artikel berhasil didelete";
                                BindData();
                            }
                            else
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Artikel gagal didelete";
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

        protected void ListViewGames_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewGames.FindControl("DataPagerGames") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void ListViewGames_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}