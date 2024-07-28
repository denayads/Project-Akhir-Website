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
    public partial class index : System.Web.UI.Page
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
            string query = "select * from games";
            string queryGenre = "select * from genre";
            string queryPlatform = "select * from platforms";

            if (!searchText.Equals(""))
            {
                query = "select * from games where games.game_name like '%' + @search + '%'";
            }
            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (!searchText.Equals(""))
                        {
                            cmd.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchText.Trim();
                        }
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
                    using (SqlCommand cmd = new SqlCommand(queryGenre, con))
                    {
                        RadioButtonListGenre.Items.Clear();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ListItem item = new ListItem(reader["genre_name"].ToString(), reader["id"].ToString());
                                item.Selected = false;
                                RadioButtonListGenre.Items.Add(item);
                            }
                        }
                    }
                    using (SqlCommand cmd = new SqlCommand(queryPlatform, con))
                    {
                        RadioButtonListPlatform.Items.Clear();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                ListItem item = new ListItem(reader["platforms_name"].ToString(), reader["id"].ToString());
                                item.Selected = false;
                                RadioButtonListPlatform.Items.Add(item);
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

        protected void ListViewGames_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewGames.FindControl("DataPagerGames") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            BindData(TextBoxSearch.Text.Trim());
        }

        protected void ButtonFilter_Click(object sender, EventArgs e)
        {

        }
    }
}