using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.admin.transaction
{
    public partial class payment : System.Web.UI.Page
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
            string querry = "select * from checkout join games on checkout.id_games=games.id join users on checkout.id_users=users.id order by checkout.dates desc";

            if (!searchText.Equals(""))
            {
                querry = "select * from checkout join games on checkout.id_games=games.id join users on checkout.id_users=users.id where checkout.id_order like '%' + @search + '%' order by checkout.dates desc";
            }
            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
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
                                ListViewTransaction.DataSource = dt;
                                ListViewTransaction.DataBind();
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

        protected void LinkButtonStatus_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            string id = (lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from checkout where id_order=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                DropDownListStatus.SelectedValue = reader["status"].ToString();
                            }
                        }
                    }
                    ButtonUpdateStatus.CommandArgument = id.ToString();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
                }
                catch (Exception ex)
                {
                    notif.Visible = true;
                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                    message.Text = ex.Message;
                }
            }
        }

        protected void ButtonUpdateStatus_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = (btn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "update checkout set status=@status where id_order=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = DropDownListStatus.SelectedValue;
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                    Response.Redirect("~/pages/admin/transaction/payment.aspx");
                }
                catch (Exception ex)
                {
                    notif.Visible = true;
                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                    message.Text = ex.Message;
                }
            }
        }

        protected void ListViewTransaction_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewTransaction.FindControl("DataPagerTransaction") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            BindData(TextBoxSearch.Text.Trim());
        }
    }
}