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
using System.Runtime.Remoting.Lifetime;
using System.Collections;

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

        protected void LinkButtonCheckout_Click(object sender, EventArgs e)
        {
            DateTime currentDateTime = DateTime.Now;
            string date = string.Format("{0:dd.MM.yyyy.hh.mm.ss}", currentDateTime);
            string id_order = "GB" + "/" + Convert.ToInt64(Session["id"]) + "/" + date;
            var id_games = new ArrayList();
            long id = Convert.ToInt64(Session["id"]);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select * from games join cart on cart.id_games=games.id where cart.id_users=@id", con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = id;
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                foreach (string item in id_games)
                                {
                                    id_games.Add(reader["id_games"].ToString());
                                }
                            }
                        }
                    }
                    Response.Write(id_games[0]);
                    //string querry = "insert into checkout (id_order, id_games, id_users) values (@id_order, @id_games, @id_users)";

                    //using (SqlCommand cmd = new SqlCommand(querry, con))
                    //{
                    //    foreach (string item in id_games)
                    //    {
                    //        cmd.Parameters.Clear();
                    //        cmd.Parameters.Add("@id_order", SqlDbType.NVarChar).Value = id_order;
                    //        cmd.Parameters.Add("@id_games", SqlDbType.BigInt).Value = item;
                    //        cmd.Parameters.Add("@id_users", SqlDbType.BigInt).Value = id;
                    //        cmd.ExecuteNonQuery();
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

        protected void ListViewCart_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {

        }
    }
}