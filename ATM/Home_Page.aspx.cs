using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM
{
    public partial class Home_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void login_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration_Page.aspx");
        }
    }
}