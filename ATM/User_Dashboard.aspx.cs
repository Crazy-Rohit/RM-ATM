using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM
{
    public partial class User_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                // Now you have the username available for use in this page
            }
            else
            {
                // If the username is not found in the session, redirect to the login page
                Response.Redirect("Login_Page.aspx");
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login_Page.aspx");
        }

        protected void btnBalanceEnquiry_Click(object sender, EventArgs e)
        {
            Response.Redirect("Balance_Inquiry.aspx");
        }

        protected void btnDeposit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Deposit_Page.aspx");
        }

        protected void btnWithdraw_Click(object sender, EventArgs e)
        {
            Response.Redirect("Withdrawl_Page.aspx");
        }

        protected void btnChangePIN_Click(object sender, EventArgs e)
        {
            Response.Redirect("PIN_Change.aspx");
        }

        protected void btnUserInfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("User_Info.aspx");
        }

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Transfer_Page.aspx");
        }
    }
}