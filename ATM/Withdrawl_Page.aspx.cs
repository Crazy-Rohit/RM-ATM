using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM
{
    public partial class Withdrawl_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Username"] == null)
            {
                // If the user is not logged in, redirect to the login page
                Response.Redirect("Login_Page.aspx");
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string pin = password.Value; // Assuming password is the ID of your PIN input control
                decimal amountToWithdraw;

                // Validate and parse the amount to withdraw
                if (decimal.TryParse(txtWithdraw.Text, out amountToWithdraw))
                {
                    // Connection string to your database
                    string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                    // SQL query to update the amount for the given username and pin
                    string updateQuery = "UPDATE RM_Bank SET amount = amount - @amountToWithdraw WHERE userName = @username AND pin = @pin";

                    string bankBalanceQuery = "SELECT amount FROM RM_Bank WHERE userName = @username AND pin = @pin";

                    // Create a SqlConnection object
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        // Create a SqlCommand object with the update query and connection
                        using (SqlCommand command = new SqlCommand(updateQuery, con))
                        {
                            // Add parameters to the query to prevent SQL injection
                            command.Parameters.AddWithValue("@amountToWithdraw", amountToWithdraw);
                            command.Parameters.AddWithValue("@username", username);
                            command.Parameters.AddWithValue("@pin", pin);

                            // Open the connection
                            con.Open();

                            // Check bank balance
                            using (SqlCommand balanceCommand = new SqlCommand(bankBalanceQuery, con))
                            {
                                balanceCommand.Parameters.AddWithValue("@username", username);
                                balanceCommand.Parameters.AddWithValue("@pin", pin);
                                object balanceObj = balanceCommand.ExecuteScalar();
                                if (balanceObj != null && balanceObj != DBNull.Value)
                                {
                                    decimal balance = Convert.ToDecimal(balanceObj);

                                    // Check if the requested amount is available
                                    if (amountToWithdraw <= balance)
                                    {
                                        // Execute the update query
                                        int rowsAffected = command.ExecuteNonQuery();

                                        if (rowsAffected > 0)
                                        {
                                            message.Text = "Amount successfully withdrawn from the bank";
                                        }
                                        else
                                        {
                                            message.Text = "Sorry! Transaction Failed";
                                        }
                                    }
                                    else
                                    {
                                        message.Text = "Requested amount is not available.";
                                    }
                                }
                                else
                                {
                                    message.Text = "Invalid username or pin.";
                                }
                            }
                        }
                    }
                }
                else
                {
                    string script = "alert('Invalid amount entered.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorScript", script, true);
                }
            }
            else
            {
                // If the username is not found in the session, redirect to the login page
                Response.Redirect("Login_Page.aspx");
            }
        }
    }
}
