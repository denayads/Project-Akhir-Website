using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.admin.crud
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
            DataTable rst = MyRst("select * from games join users on games.id_users=users.id");
            rst.Columns.Add("genre_name", typeof(string));
            rst.Columns.Add("platforms_name", typeof(string));
            foreach (DataRow OneRow in rst.Rows)
            {
                DataTable ChildRows = MyRst("select * from games_genre join genre on games_genre.id_genre=genre.id where games_genre.id_games= " + OneRow["id"]);
                foreach (DataRow ChildRow in ChildRows.Rows)
                {
                    if (OneRow["genre_name"].ToString() != "")
                    {
                        OneRow["genre_name"] += "<br/>";
                    }
                    OneRow["genre_name"] += ChildRow["genre_name"].ToString();
                }
            }
            foreach (DataRow OneRow in rst.Rows)
            {
                DataTable ChildRows = MyRst("select * from games_platforms join platforms on games_platforms.id_platforms=platforms.id where games_platforms.id_games= " + OneRow["id"]);
                foreach (DataRow ChildRow in ChildRows.Rows)
                {
                    if (OneRow["platforms_name"].ToString() != "")
                    {
                        OneRow["platforms_name"] += "<br/>";
                    }
                    OneRow["platforms_name"] += ChildRow["platforms_name"].ToString();
                }
            }
            ListViewGames.DataSource = rst;
            ListViewGames.DataBind();

            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string queryGenre = "select * from genre";
            string queryPlatform = "select * from platforms";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(queryGenre, con))
                    {
                        CheckBoxListGenre.Items.Clear();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ListItem item = new ListItem(reader["genre_name"].ToString(), reader["id"].ToString());
                                item.Selected = false;
                                CheckBoxListGenre.Items.Add(item);
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand(queryPlatform, con))
                    {
                        CheckBoxListPlatform.Items.Clear();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ListItem item = new ListItem(reader["platforms_name"].ToString(), reader["id"].ToString());
                                item.Selected = false;
                                CheckBoxListPlatform.Items.Add(item);
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

        public DataTable MyRst(string query)
        {
            DataTable rstData = new DataTable();
            using (SqlCommand cmdSQL = new SqlCommand(query, new SqlConnection(ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString)))
            {
                cmdSQL.Connection.Open();
                rstData.Load(cmdSQL.ExecuteReader());
            }
            return rstData;
        }

        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            long id = Convert.ToInt64(Session["id"]);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "insert into games (game_name, description, release_dates, developers, publishers, game_modes, franchises, player_perspectives, prices, id_users) values (@game_name, @description, @release_dates, @developers, @publishers, @game_modes, @franchises, @player_perspectives, @prices, @id_users); SELECT SCOPE_IDENTITY()";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@game_name", SqlDbType.NVarChar).Value = TextBoxNamaGameCreate.Text.Trim();
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = TextBoxDeskripsiCreate.Text.Trim();
                        cmd.Parameters.Add("@release_dates", SqlDbType.Date).Value = TextBoxTanggalRilisCreate.Text.Trim();
                        cmd.Parameters.Add("@developers", SqlDbType.NVarChar).Value = TextBoxDeveloperCreate.Text.Trim();
                        cmd.Parameters.Add("@publishers", SqlDbType.NVarChar).Value = TextBoxPublisherCreate.Text.Trim();
                        cmd.Parameters.Add("@game_modes", SqlDbType.NVarChar).Value = TextBoxModeGameCreate.Text.Trim();
                        cmd.Parameters.Add("@franchises", SqlDbType.NVarChar).Value = TextBoxFranchisesCreate.Text.Trim();
                        cmd.Parameters.Add("@player_perspectives", SqlDbType.NVarChar).Value = TextBoxPerspektifPemainCreate.Text.Trim();
                        cmd.Parameters.Add("@prices", SqlDbType.Money).Value = Convert.ToInt64(TextBoxHargaCreate.Text.Trim());
                        cmd.Parameters.Add("@id_users", SqlDbType.BigInt).Value = id;
                        id = Convert.ToInt64(cmd.ExecuteScalar());
                    }
                    Response.Redirect("~/pages/admin/crud/index.aspx");
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
                                TextBoxHargaShow.Text = Convert.ToInt64(reader["prices"]).ToString();
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
            string querry = "update games set game_name=@game_name, description=@description, release_dates=@release_dates, developers=@developers, publishers=@publishers, game_modes=@game_modes, franchises=@franchises, player_perspectives=@player_perspectives, prices=@prices where id=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@game_name", SqlDbType.NVarChar).Value = TextBoxNamaGameShow.Text.Trim();
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar).Value = TextBoxDeskripsiShow.Text.Trim();
                        cmd.Parameters.Add("@release_dates", SqlDbType.Date).Value = TextBoxTanggalRilisShow.Text.Trim();
                        cmd.Parameters.Add("@developers", SqlDbType.NVarChar).Value = TextBoxDeveloperShow.Text.Trim();
                        cmd.Parameters.Add("@publishers", SqlDbType.NVarChar).Value = TextBoxPublisherShow.Text.Trim();
                        cmd.Parameters.Add("@game_modes", SqlDbType.NVarChar).Value = TextBoxModeGameShow.Text.Trim();
                        cmd.Parameters.Add("@franchises", SqlDbType.NVarChar).Value = TextBoxFranchisesShow.Text.Trim();
                        cmd.Parameters.Add("@player_perspectives", SqlDbType.NVarChar).Value = TextBoxPerspektifPemainShow.Text.Trim();
                        cmd.Parameters.Add("@prices", SqlDbType.Money).Value = Convert.ToInt64(TextBoxHargaShow.Text.Trim());
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                    Response.Redirect("~/pages/admin/crud/index.aspx");
                }
                catch (Exception ex)
                {
                    notif.Visible = true;
                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                    message.Text = ex.Message;
                }
            }
        }

        protected void LinkButtonGenre_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select genre.* from games_genre join genre on games_genre.id_genre=genre.id where games_genre.id_games=@id";
            string querryInsert = "insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    bool hasGenres = false;
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                hasGenres = true;
                                while (reader.Read())
                                {
                                    foreach (ListItem item in CheckBoxListGenre.Items)
                                    {
                                        if (reader["genre_name"].ToString().Equals(item.Text))
                                        {
                                            item.Selected = true;
                                        }
                                    }
                                }
                                ButtonGenreCreate.CommandArgument = id.ToString();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalGenre();", true);
                            }
                        }
                    }
                    if (!hasGenres)
                    {
                        using (SqlCommand cmd = new SqlCommand(querryInsert, con))
                        {
                            foreach (ListItem item in CheckBoxListGenre.Items)
                            {
                                if (item.Selected)
                                {
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@id_genre", item.Value);
                                    cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = id;
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }
                        Response.Redirect("~/pages/admin/crud/index.aspx");
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

        protected void ButtonGenreCreate_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            long id = Convert.ToInt64(btn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querryDelete = "delete from games_genre where id_games=@id";
            string querryInsert = "insert into games_genre (id_genre, id_games) values (@id_genre, @id_games)";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querryDelete, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd = new SqlCommand(querryInsert, con))
                    {
                        foreach (ListItem item in CheckBoxListGenre.Items)
                        {
                            if (item.Selected)
                            {
                                cmd.Parameters.Clear();
                                cmd.Parameters.AddWithValue("@id_genre", item.Value);
                                cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = id;
                                cmd.ExecuteNonQuery();
                            }
                        }
                    }
                    Response.Redirect("~/pages/admin/crud/index.aspx");
                }
                catch (Exception ex)
                {
                    notif.Visible = true;
                    notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                    message.Text = ex.Message;
                }
            }
        }

        protected void LinkButtonPlatform_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select platforms.* from games_platforms join platforms on games_platforms.id_platforms=platforms.id where games_platforms.id_games=@id";
            string querryInsert = "insert into games_platforms (id_platforms, id_games) values (@id_platforms, @id_games)";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    bool hasPlatform = false;
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                hasPlatform = true;
                                while (reader.Read())
                                {
                                    foreach (ListItem item in CheckBoxListPlatform.Items)
                                    {
                                        if (reader["platforms_name"].ToString().Equals(item.Text))
                                        {
                                            item.Selected = true;
                                        }
                                    }
                                }
                                ButtonPlatformCreate.CommandArgument = id.ToString();
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalPlatform();", true);
                            }
                        }
                    }
                    if (!hasPlatform)
                    {
                        using (SqlCommand cmd = new SqlCommand(querryInsert, con))
                        {
                            foreach (ListItem item in CheckBoxListPlatform.Items)
                            {
                                if (item.Selected)
                                {
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@id_platforms", item.Value);
                                    cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = id;
                                    cmd.ExecuteNonQuery();
                                }
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

        protected void ButtonPlatformCreate_Click(object sender, EventArgs e)
        {
            {
                Button btn = (Button)sender;
                long id = Convert.ToInt64(btn.CommandArgument);
                string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
                string querryDelete = "delete from games_platforms where id_games=@id";
                string querryInsert = "insert into games_platforms (id_platforms, id_games) values (@id_platforms, @id_games)";

                using (SqlConnection con = new SqlConnection(con_str))
                {
                    try
                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand(querryDelete, con))
                        {
                            cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                            cmd.ExecuteNonQuery();
                        }
                        using (SqlCommand cmd = new SqlCommand(querryInsert, con))
                        {
                            foreach (ListItem item in CheckBoxListPlatform.Items)
                            {
                                if (item.Selected)
                                {
                                    cmd.Parameters.Clear();
                                    cmd.Parameters.AddWithValue("@id_platforms", item.Value);
                                    cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = id;
                                    cmd.ExecuteNonQuery();
                                }
                            }
                        }
                        Response.Redirect("~/pages/admin/crud/index.aspx");
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

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "delete from games where id=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                    try
                    {
                        con.Open();
                        if (cmd.ExecuteNonQuery() > 0)
                        {
                            BindData();
                            notif.Visible = true;
                            notif.Attributes.Add("class", "alert alert-primary alert-dismissible fade show");
                            message.Text = "Delete Games Success!";
                        }
                        else
                        {
                            notif.Visible = true;
                            notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                            message.Text = "Delete Games Failed!";
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