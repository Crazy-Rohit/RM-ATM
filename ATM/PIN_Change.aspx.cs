using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM
{
    public partial class PIN_change : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here if needed
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string currentPin = txtPIN.Text.Trim();
                string newPin = txtNewPin.Text.Trim();

                // Connection string to your database
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                // SQL query to update the PIN for the given username and current PIN
                string updateQuery = "UPDATE RM_Bank SET pin = @newPin WHERE userName = @username AND pin = @currentPin";

                // Create a SqlConnection object
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Create a SqlCommand object with the update query and connection
                    using (SqlCommand command = new SqlCommand(updateQuery, con))
                    {
                        // Add parameters to the query to prevent SQL injection
                        command.Parameters.AddWithValue("@newPin", newPin);
                        command.Parameters.AddWithValue("@username", username);
                        command.Parameters.AddWithValue("@currentPin", currentPin);

                        // Open the connection
                        con.Open();

                        // Execute the update query
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            message.Text = "PIN successfully changed";
                        }
                        else
                        {
                            message.Text = "Failed to change PIN. Please check your current PIN.";
                        }
                    }
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
