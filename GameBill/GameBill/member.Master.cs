using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GameBill
{
    public partial class member : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Convert.ToInt32(Session["admin"]) == 1)
                {
                    Response.Redirect("~/pages/auth/login.aspx");
                }
                else if (Session["id"] == null)
                {
                    Response.Redirect("~/pages/auth/login.aspx");
                }
            }
        }

        protected void LinkButtonLogOut_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/pages/auth/login.aspx");
        }
    }
}