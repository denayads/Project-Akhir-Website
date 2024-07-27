using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.browse
{
    public partial class show : System.Web.UI.Page
    {
        public string title = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        protected void ShowData()
        {
            DataTable rst = MyRst("select * from games where games.id=" + Convert.ToInt64(Request.QueryString["id"]) + "");
            rst.Columns.Add("genre_name", typeof(string));
            rst.Columns.Add("platforms_name", typeof(string));
            foreach (DataRow OneRow in rst.Rows)
            {
                DataTable ChildRows = MyRst("select * from games_genre join genre on games_genre.id_genre=genre.id where games_genre.id_games= " + OneRow["id"]);
                foreach (DataRow ChildRow in ChildRows.Rows)
                {
                    if (OneRow["genre_name"].ToString() != "")
                    {
                        OneRow["genre_name"] += ", ";
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
                        OneRow["platforms_name"] += ", ";
                    }
                    OneRow["platforms_name"] += ChildRow["platforms_name"].ToString();
                }
            }
            ListViewDetail.DataSource = rst;
            ListViewDetail.DataBind();

            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand("select * from games join games_genre on games.id=games_genre.id_games join genre on games_genre.id_genre=genre.id join games_platforms on games.id=games_platforms.id_games join platforms on games_platforms.id_platforms=platforms.id where games.id=@id", con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Request.QueryString["id"]);
                    try
                    {
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                title = reader["game_name"].ToString();
                                LabelNamaGame.Text = reader["game_name"].ToString();
                                ImageGame.ImageUrl = "~/" + reader["img_location"].ToString();
                                LabelDeskripsi.Text = reader["description"].ToString();
                                LabelHarga.Text = String.Format(CultureInfo.GetCultureInfo("id-ID"), "{0:C2}", reader["prices"]);
                                LabelDevelopers.Text = reader["developers"].ToString();
                                LabelPublishers.Text = reader["publishers"].ToString();
                                LabelGameMode.Text = reader["game_modes"].ToString();
                                LabelPlayerPerspectives.Text = reader["player_perspectives"].ToString();
                                LabelReleaseDate.Text = String.Format("{0:dd/MM/yyyy}", reader["release_dates"]);
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

        protected void LinkButtonBuy_Click(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                long id = Convert.ToInt64(Session["id"]);
                string querry = "insert into cart (id_games, id_users) values (@id_games, @id_users)";
                string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;

                using (SqlConnection con = new SqlConnection(con_str))
                {
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = Convert.ToInt64(Request.QueryString["id"]);
                        cmd.Parameters.Add("@id_users", SqlDbType.BigInt).Value = id;
                        try
                        {
                            con.Open();
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                Response.Redirect("~/pages/member/cart/index.aspx");
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
                Response.Redirect("~/pages/auth/login.aspx");
            }
        }
    }
}