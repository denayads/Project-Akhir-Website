using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill.pages.member.history
{
    public partial class invoice : System.Web.UI.Page
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
            string querry = "select * from checkout join games on checkout.id_games=games.id join users on checkout.id_users=users.id where checkout.id_users=@id order by checkout.dates desc";

            if (!searchText.Equals(""))
            {
                querry = "select * from checkout join games on checkout.id_games=games.id join users on checkout.id_users=users.id where checkout.id_users=@id and checkout.id_order like '%' + @search + '%' order by checkout.dates desc";
            }
            using (SqlConnection con = new SqlConnection(con_str))
            {
                using (SqlCommand cmd = new SqlCommand(querry, con))
                {
                    cmd.Parameters.Add("@id", SqlDbType.BigInt).Value = Convert.ToInt64(Session["id"]);
                    if (!searchText.Equals(""))
                    {
                        cmd.Parameters.Add("@search", SqlDbType.NVarChar).Value = searchText.Trim();
                    }
                    try
                    {
                        con.Open();
                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            sda.SelectCommand = cmd;
                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                ListViewInvoice.DataSource = dt;
                                ListViewInvoice.DataBind();
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

        protected void LinkButtonImage_Click(object sender, EventArgs e)
        {
            LinkButton lbtn = (LinkButton)sender;
            string id = (lbtn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "select img_location from checkout where id_order=@id";

            using (SqlConnection con = new SqlConnection(con_str))
            {
                try
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = id;
                    }
                    ButtonUpdateImage.CommandArgument = id.ToString();
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

        protected void ButtonUpdateImage_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string id = (btn.CommandArgument);
            string con_str = ConfigurationManager.ConnectionStrings["GameBillCS"].ConnectionString;
            string querry = "update checkout set img_location=@img_location where id_order=@id";
            string img_name = FileUploadImage.PostedFile.FileName;

            if (FileUploadImage != null && !img_name.Equals(""))
            {
                int img_file_size = FileUploadImage.PostedFile.ContentLength;
                string img_ext = System.IO.Path.GetExtension(img_name);
                string[] allowed_ext = { ".jpg", ".jpeg", ".png", ".jfif" };
                if (img_file_size > 15240000)
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File terlalu besar')", true);
                }
                else if (!allowed_ext.Contains(img_ext))
                {
                    Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('Ekstensi tidak diperbolehkan')", true);
                }

                using (SqlConnection con = new SqlConnection(con_str))
                {
                    using (SqlCommand cmd = new SqlCommand(querry, con))
                    {
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar).Value = id;
                        try
                        {
                            if (FileUploadImage != null && !img_name.Equals(""))
                            {
                                string path_name = "assets/img/" + img_name;
                                cmd.Parameters.Add("@img_location", SqlDbType.NVarChar).Value = path_name;
                                FileUploadImage.SaveAs(Server.MapPath("~/" + path_name));
                            }
                            con.Open();
                            if (cmd.ExecuteNonQuery() > 0)
                            {
                                Response.Redirect("~/pages/member/history/invoice.aspx");
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Success upload payment image";
                            }
                            else
                            {
                                notif.Visible = true;
                                notif.Attributes.Add("class", "alert alert-danger alert-dismissible fade show");
                                message.Text = "Failed upload payment image!";
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
        }

        protected void ListViewInvoice_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListViewInvoice.FindControl("DataPagerInvoice") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            BindData();
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            BindData(TextBoxSearch.Text.Trim());
        }
    }
}