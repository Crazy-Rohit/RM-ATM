using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM
{
    public partial class Balance_Inquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if username exists in session
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string pin = password.Value.ToString(); // Assuming txtPin is the ID of your PIN input control

                // Connection string to your database
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                // SQL query to retrieve amount for the given username and pin
                string query = "SELECT amount FROM RM_Bank WHERE userName = @username AND pin = @pin";

                // Create a SqlConnection object
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Create a SqlCommand object with the query and connection
                    using (SqlCommand command = new SqlCommand(query, con))
                    {
                        // Add parameters to the query to prevent SQL injection
                        command.Parameters.AddWithValue("@username", username);
                        command.Parameters.AddWithValue("@pin", pin);

                        // Open the connection
                        con.Open();

                        // Execute the query and get the result (amount)
                        object result = command.ExecuteScalar();

                        // Check if result is not null
                        if (result != null)
                        {
                            // Display the amount in the txtBalance label
                            amount.Text = result.ToString()+" Rupees";
                        }
                        else
                        {
                            // If no result found, display an error message or handle it accordingly
                            // For example, txtBalance.Text = "Error: No amount found for the given username and pin";
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