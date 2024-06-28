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
using System.Security.Policy;

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
            DataTable rst = MyRst("select * from games g join users u on g.id_users=u.id");

            rst.Columns.Add("genre_name", typeof(string));

            foreach (DataRow OneRow in rst.Rows)
            {
                DataTable ChildRows = MyRst("select * from games_genre g join genre r on g.id_genre=r.id where id_games = " + OneRow["id"]);

                foreach (DataRow ChildRow in ChildRows.Rows)
                {
                    if (OneRow["genre_name"].ToString() != "")
                    {
                        OneRow["genre_name"] += "<br/>";
                    }

                    OneRow["genre_name"] += ChildRow["genre_name"].ToString();
                }
            }
            ListViewGames.DataSource = rst;
            ListViewGames.DataBind();
        }

        public DataTable MyRst(string query)
        {
            DataTable rstData = new DataTable();
            using (SqlCommand cmdSQL = new SqlCommand(query,
                new SqlConnection(ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString)))
            {
                cmdSQL.Connection.Open();
                rstData.Load(cmdSQL.ExecuteReader());
            }
            return rstData;
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
                    if (CheckBoxActionCreate.Checked)
                    {
                        using (SqlCommand cmd2 = new SqlCommand("insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)", con))
                        {
                            cmd2.Parameters.AddWithValue("@id_genre", 1);
                            cmd2.Parameters.AddWithValue("@id_games", id);
                            cmd2.ExecuteNonQuery();
                        }
                    }
                    if (CheckBoxAdventureCreate.Checked)
                    {
                        using (SqlCommand cmd2 = new SqlCommand("insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)", con))
                        {
                            cmd2.Parameters.AddWithValue("@id_genre", 2);
                            cmd2.Parameters.AddWithValue("@id_games", id);
                            cmd2.ExecuteNonQuery();
                        }
                    }
                    if (CheckBoxOpenWorldCreate.Checked)
                    {
                        using (SqlCommand cmd2 = new SqlCommand("insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)", con))
                        {
                            cmd2.Parameters.AddWithValue("@id_genre", 3);
                            cmd2.Parameters.AddWithValue("@id_games", id);
                            cmd2.ExecuteNonQuery();
                        }
                    }
                    Response.Redirect("~/pages/admin/index.aspx");
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
            string querry2 = "select * from genre";
            string querry3 = "select genre.* from games_genre join genre on games_genre.id_genre=genre.id where games_genre.id_games=@id";

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
                    }
                    CheckBoxListGenreShow.Items.Clear();
                    using (SqlCommand cmd = new SqlCommand(querry2, con))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ListItem item = new ListItem(reader["genre_name"].ToString(), reader["id"].ToString());
                                item.Selected = false;
                                CheckBoxListGenreShow.Items.Add(item);
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand(querry3, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                foreach (ListItem item in CheckBoxListGenreShow.Items)
                                {
                                    if (reader["genre_name"].ToString().Equals(item.Text))
                                    {
                                        item.Selected = true;
                                    }
                                }
                            }
                        }
                    }
                    ButtonUpdateShow.CommandArgument = id.ToString();
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

        protected void ButtonUpdateShow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            long id = Convert.ToInt64(btn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;

            string querry = "update games set game_name=@game_name, description=@description, release_dates=@release_dates, developers=@developers, publishers=@publishers, game_modes=@game_modes, franchises=@franchises, player_perspectives=@player_perspectives where id=@id";
            string querryDelete = "delete from games_genre where id_games=@id";
            string querryInsert = "insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@game_name", SqlDbType.NVarChar).Value = TextBoxNamaGameShow.Text;
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = TextBoxDeskripsiShow.Text;
                        cmd.Parameters.Add("@release_dates", SqlDbType.Date).Value = TextBoxTanggalRilisShow.Text;
                        cmd.Parameters.Add("@developers", SqlDbType.NVarChar).Value = TextBoxDeveloperShow.Text;
                        cmd.Parameters.Add("@publishers", SqlDbType.NVarChar).Value = TextBoxPublisherShow.Text;
                        cmd.Parameters.Add("@game_modes", SqlDbType.NVarChar).Value = TextBoxModeGameShow.Text;
                        cmd.Parameters.Add("@franchises", SqlDbType.NVarChar).Value = TextBoxFranchisesShow.Text;
                        cmd.Parameters.Add("@player_perspectives", SqlDbType.NVarChar).Value = TextBoxPerspektifPemainShow.Text;
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd2 = new SqlCommand(querryDelete, con))
                    {
                        cmd2.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        cmd2.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd3 = new SqlCommand(querryInsert, con))
                    {
                        foreach (ListItem item in CheckBoxListGenreShow.Items)
                        {
                            if (item.Selected)
                            {
                                cmd3.Parameters.Clear();
                                cmd3.Parameters.AddWithValue("@id_genre", item.Value);
                                cmd3.Parameters.Add("@id_games", SqlDbType.BigInt).Value = id;
                                cmd3.ExecuteNonQuery();
                            }
                        }
                    }
                    Response.Redirect("~/pages/admin/index.aspx");
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
            string querry2 = "delete from games_genre where id_games=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlCommand cmd2 = new SqlCommand(querry2, con))
                        {
                            cmd2.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                            if (cmd.ExecuteNonQuery() > 0 && cmd2.ExecuteNonQuery() > 0)
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

        private void ClearCheckBoxShow()
        {
            CheckBoxActionShow.Checked = false;
            CheckBoxAdventureShow.Checked = false;
            CheckBoxOpenWorldShow.Checked = false;
        }
    }
}