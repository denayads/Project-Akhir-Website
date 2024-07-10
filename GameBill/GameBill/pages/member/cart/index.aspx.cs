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

        private static int codeCounter = 0;

        private string CDCode(string release, string gameName)
        {
            string acronymCapital = "GB";

            string[] date = release.Split('-');
            string year = date[0].Substring(2, 2);
            string month = date[1];

            string gameFirstThirdLetter = gameName.Substring(0, 3).ToUpper();

            string increaseNumber = (Convert.ToString(Session["id"]) + (++codeCounter)).ToString();

            string code = acronymCapital + month + year + gameFirstThirdLetter + increaseNumber;

            return code;
        }

        protected void LinkButtonCheckout_Click(object sender, EventArgs e)
        {
            string release = string.Empty;
            string gameName = string.Empty;
            string title = string.Empty;
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
                            if (reader.Read())
                            {
                                release = reader["game_name"].ToString();
                                gameName = reader["game_name"].ToString();
                            }
                        }
                    }
                    string code = CDCode(release, gameName);
                    string querry = "insert into checkout (id_order, status, id_users) values (@id_order, @status, @id_users); SELECT SCOPE_IDENTITY()";
                    string querry2 = "insert into checkout (id_games) select id_games from cart where id_users=@id";

                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id_order", SqlDbType.NVarChar).Value = code;
                        cmd.Parameters.Add("@status", SqlDbType.NVarChar).Value = "Order Processing";
                        cmd.Parameters.Add("@id_users", SqlDbType.BigInt).Value = id;
                        id = Convert.ToInt64(cmd.ExecuteScalar());
                    }
                    using (SqlCommand cmd = new SqlCommand(querry2, con))
                    {
                        cmd.ExecuteNonQuery();
                    }
                    Response.Redirect("~/pages/member/cart/index.aspx");
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