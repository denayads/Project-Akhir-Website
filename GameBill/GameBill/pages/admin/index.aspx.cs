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
            string querry = "select * from games g join users u on g.id_users=u.id";

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

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            string namagame = TextBoxNamaGameCreate.Text.Trim(); ;
            string deskripsi = TextBoxDeskripsiCreate.Text.Trim();
            string tanggalrilis = TextBoxTanggalRilisCreate.Text.Trim();
            string developer = TextBoxDeveloperCreate.Text.Trim();
            string publisher = TextBoxPublisherCreate.Text.Trim();
            string modegame = TextBoxModeGameCreate.Text.Trim();
            string franchises = TextBoxFranchisesCreate.Text.Trim();
            string perspektifpemain = TextBoxPerspektifPemainCreate.Text.Trim();
            long id = Convert.ToInt64(Session["id"]);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("insert into games (game_name, description, release_dates, developers, publishers, game_modes, franchises, player_perspectives, id_users) values (@game_name, @description, @release_dates, @developers, @publishers, @game_modes, @franchises, @player_perspectives, @id_users); SELECT SCOPE_IDENTITY()", con))
                    {
                        cmd.Parameters.Add("@game_name", SqlDbType.NVarChar).Value = namagame;
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = deskripsi;
                        cmd.Parameters.Add("@release_dates", SqlDbType.Date).Value = tanggalrilis;
                        cmd.Parameters.Add("@developers", SqlDbType.NVarChar).Value = developer;
                        cmd.Parameters.Add("@publishers", SqlDbType.NVarChar).Value = publisher;
                        cmd.Parameters.Add("@game_modes", SqlDbType.NVarChar).Value = modegame;
                        cmd.Parameters.Add("@franchises", SqlDbType.NVarChar).Value = franchises;
                        cmd.Parameters.Add("@player_perspectives", SqlDbType.NVarChar).Value = perspektifpemain;
                        cmd.Parameters.Add("@id_users", SqlDbType.BigInt).Value = id;
                        id = Convert.ToInt64(cmd.ExecuteScalar());
                    }

                    //string[] task = TextBoxNamaGenreCreate.Text.Split(new char[] { ';' });
                    //foreach (var item in task)
                    //{
                    //    using (SqlCommand cmd2 = new SqlCommand("insert into games_genre (game_name, description, release_dates, developers, publishers, game_modes, franchises, player_perspectives) values (@isi, @id_todo)", con))
                    //    {
                    //        cmd2.Parameters.AddWithValue("@isi", item);
                    //        cmd2.Parameters.AddWithValue("@id_todo", id);
                    //        cmd2.ExecuteNonQuery();
                    //    }
                    //}
                }
                catch (Exception ex)
                {
                    notif.Visible = true;
                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                    message.Text = ex.Message;
                }
            }
        }

        protected void LinkButtonEdit_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from games where id=@id";
            string querry2 = "select c.genre_name from games_genre a join games b on a.id_games=b.id join genre c on a.id_genre=c.id where id_games=@id";

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
                                TextBoxNamaGameShow.Text = reader["game_name"].ToString();
                                TextBoxDeskripsiShow.Text = reader["description"].ToString();
                                TextBoxTanggalRilisShow.Text = Convert.ToDateTime(reader["release_dates"]).ToString("yyyy-MM-dd");
                                TextBoxDeveloperShow.Text = reader["developers"].ToString();
                                TextBoxPublisherShow.Text = reader["publishers"].ToString();
                                TextBoxModeGameShow.Text = reader["game_modes"].ToString();
                                TextBoxFranchisesShow.Text = reader["franchises"].ToString();
                                TextBoxPerspektifPemainShow.Text = reader["player_perspectives"].ToString();
                            }
                        }
                        TextBoxNamaGenreShow.Text = "";
                        using (SqlCommand cmd2 = new SqlCommand(querry2, con))
                        {
                            cmd2.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                            using (SqlDataReader reader = cmd2.ExecuteReader())
                            {
                                while (reader.Read())
                                {
                                    TextBoxNamaGenreShow.Text += reader["genre_name"].ToString() + ";\n";
                                }
                            }
                        }
                        //LinkButtonUpdate.CommandArgument = id.ToString();
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

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "delete from games where id=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            Response.Redirect("~/pages/admin/index.aspx");
                        }
                        else
                        {
                            notif.Visible = true;
                            notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                            message.Text = "Delete Games Failed!";
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