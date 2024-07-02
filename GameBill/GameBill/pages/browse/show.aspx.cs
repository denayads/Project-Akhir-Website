using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.browse
{
    public partial class show : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        protected void ShowData()
        {
            DataTable rst = MyRst("select * from games where games.id="+ Convert.ToInt64(Request.QueryString["id"]) + "");

            rst.Columns.Add("genre_name", typeof(string));

            foreach (DataRow OneRow in rst.Rows)
            {
                DataTable ChildRows = MyRst("select * from games_genre join genre on games_genre.id_genre=genre.id where id_games = " + OneRow["id"]);

                foreach (DataRow ChildRow in ChildRows.Rows)
                {
                    if (OneRow["genre_name"].ToString() != "")
                    {
                        OneRow["genre_name"] += ", ";
                    }

                    OneRow["genre_name"] += ChildRow["genre_name"].ToString();
                }
            }
            ListViewGenre.DataSource = rst;
            ListViewGenre.DataBind();

            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select * from games join games_genre on games.id=games_genre.id_games join genre on games_genre.id_genre=genre.id where games.id=@id", con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Request.QueryString["id"]);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            reader.Read();
                            LabelNamaGame.Text = reader["game_name"].ToString();
                            LabelDeskripsi.Text = reader["description"].ToString();
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
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
    }
}