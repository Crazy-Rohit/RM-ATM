using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM
{
    public partial class Deposit_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any necessary logic here for page load
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string pin = password.Value; // Assuming password is the ID of your PIN input control
                decimal amountToDeposit;

                // Validate and parse the amount to deposit
                if (decimal.TryParse(txtDeposit.Text, out amountToDeposit))
                {
                    // Connection string to your database
                    string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                    // SQL query to update the amount for the given username and pin
                    string updateQuery = "UPDATE RM_Bank SET amount = amount + @amountToDeposit WHERE userName = @username AND pin = @pin";

                    // Create a SqlConnection object
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        // Create a SqlCommand object with the update query and connection
                        using (SqlCommand command = new SqlCommand(updateQuery, con))
                        {
                            // Add parameters to the query to prevent SQL injection
                            command.Parameters.AddWithValue("@amountToDeposit", amountToDeposit);
                            command.Parameters.AddWithValue("@username", username);
                            command.Parameters.AddWithValue("@pin", pin);

                            // Open the connection
                            con.Open();

                            // Execute the update query
                            int rowsAffected = command.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                result.Text = "Amount successfully deposited in the bank";
                            }
                            else
                            {
                                result.Text = "Sorry! Transaction Failed";
                            }
                        }
                    }
                }
                else
                {
                    string script = "alert('Sorry! Transaction Failed');";
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
