using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace GameBill.pages.member.cart
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["id"] == null)
                {
                    Response.Redirect("~/pages/auth/login.aspx");
                }
                BindData();
            }
        }

        protected void BindData()
        {
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select * from cart join games on cart.id_games=games.id join users on cart.id_users=users.id where cart.id_users=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Session["id"]);
                    try
                    {
                        con.Open();
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ListViewCart.DataSource = dt;
                                ListViewCart.DataBind();
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

        protected void LinkButtonDelete_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            long id = Convert.ToInt64(lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "delete from cart where id=@id";

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
                            Response.Redirect("~/pages/member/cart/index.aspx");
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

        //protected void LinkButtonCheckout_Click(object sender, EventArgs e)
        //{
        //    DataTable rst = MyRst("select * from cart join users on cart.id_users=users.id where cart.id_users=" + Convert.ToInt64(Session["id"]) + "");
        //    rst.Columns.Add("game_name", typeof(string));
        //    foreach (DataRow OneRow in rst.Rows)
        //    {
        //        DataTable ChildRows = MyRst("select * from cart join games on cart.id_games=games.id where cart.id= " + OneRow["id"]);
        //        foreach (DataRow ChildRow in ChildRows.Rows)
        //        {
        //            if (OneRow["game_name"].ToString() != "")
        //            {
        //                OneRow["game_name"] += "<br/>";
        //            }

        //            OneRow["game_name"] += ChildRow["game_name"].ToString();
        //        }
        //    }
        //    ListViewCheckout.DataSource = rst;
        //    ListViewCheckout.DataBind();

        //    string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
        //    string querry = "select sum(games.prices) from cart join games on cart.id_games=games.id join users on cart.id_users=users.id where cart.id_users=@id";

        //    using (SqlConnection con = new SqlConnection(con_str))
        //    {
        //        using (SqlCommand cmd = new SqlCommand(querry, con))
        //        {
        //            cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Session["id"]);
        //            try
        //            {
        //                con.Open();
        //                using (SqlDataReader reader = cmd.ExecuteReader())
        //                {
        //                    if (reader.Read())
        //                    {
        //                        LabelHarga.Text = Convert.ToInt64(reader["prices"]).ToString();
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                notif.Visible = true;
        //                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
        //                message.Text = ex.Message;
        //            }
        //        }
        //    }
        //}

        //public DataTable MyRst(string query)
        //{
        //    DataTable rstData = new DataTable();
        //    using (SqlCommand cmdSQL = new SqlCommand(query, new SqlConnection(ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString)))
        //    {
        //        cmdSQL.Connection.Open();
        //        rstData.Load(cmdSQL.ExecuteReader());
        //    }
        //    return rstData;
        //}

        protected void ListViewCart_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}