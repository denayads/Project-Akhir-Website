using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.member.history
{
    public partial class invoice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        protected void BindData(string searchText = "")
        {
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from checkout join games on checkout.id_games=games.id where checkout.id_users=@id";

            if (!searchText.Equals(""))
            {
                querry = "select * from checkout join games on checkout.id_games=games.id where checkout.id_users=@id like '%' + @search + '%'";
            }
            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Session["id"]);
                    if (!searchText.Equals(""))
                    {
                        cmd.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchText.Trim();
                    }
                    try
                    {
                        con.Open();
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ListViewInvoice.DataSource = dt;
                                ListViewInvoice.DataBind();
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

        protected void ListViewInvoice_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewInvoice.FindControl("DataPagerGames") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            //BindData(TextBoxSearch.Text.Trim());
        }
    }
}