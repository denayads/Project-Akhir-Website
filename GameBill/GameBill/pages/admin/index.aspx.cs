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

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from games where id=@id";
            string querry2 = "select * from genre where id=@id";
            string querry3 = "select * from games_platforms where id_games=@id";

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
                            if (reader.Read())
                            {
                                TextBoxNamaGame.Text = reader["game_name"].ToString();
                            }
                        }
                        TextBoxIsi.Text = "";
                        using (SqlCommand cmd2 = new SqlCommand(querry2, con))
                        {
                            cmd2.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                            using (SqlDataReader reader = cmd2.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    TextBoxIsi.Text += reader["genre_name"].ToString() + ";\n";
                                }
                            }
                        }
                        ButtonUpdate.CommandArgument = id.ToString();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);
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

        //protected void LinkButtonDelete_Click(object sender, EventArgs e)
        //{
        //    LinkButton lbtn = (LinkButton)sender;
        //    long id = Convert.ToInt64(lbtn.CommandArgument);
        //    string con_str = ConfigurationManager.ConnectionStrings["blogspaceCS"].ConnectionString;
        //    string querry = "delete from todo where id=@id";

        //    using (SqlConnection con = new SqlConnection(con_str))
        //    {
        //        try
        //        {
        //            con.Open();
        //            using (SqlCommand cmd = new SqlCommand(querry, con))
        //            {
        //                cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
        //                if (cmd.ExecuteNonQuery() > 0)
        //                {
        //                    Response.Redirect("~/pages/member/todo/index.aspx");
        //                }
        //                else
        //                {
        //                    notif.Visible = true;
        //                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        //                    message.Text = "Delete To Do Gagal";
        //                }
        //            }
        //        }
        //        catch (Exception ex)
        //        {
        //            notif.Visible = true;
        //            notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        //            message.Text = ex.Message;
        //        }
        //    }
        //}

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