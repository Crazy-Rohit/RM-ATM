using System;
using System.Data.SqlClient;
using System.Web.SessionState;

namespace ATM
{
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void log_submit_Click1(object sender, EventArgs e)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM RM_Bank WHERE userName = @username AND pin = @password";
                string userTypeQuery = "SELECT userType FROM RM_Bank WHERE userName = @username";

                SqlCommand command = new SqlCommand(query, con);
                SqlCommand userTypeCommand = new SqlCommand(userTypeQuery, con);

                command.Parameters.AddWithValue("@username", username.Value); // Use Text property here
                command.Parameters.AddWithValue("@password", password.Value); // Use Text property here


                con.Open();

               
                int count = (int)command.ExecuteScalar();

                if (count > 0)
                {
                    // User is authenticated, now fetch user type
                    userTypeCommand.Parameters.AddWithValue("@username", username.Value); // Use Text property here
                    string userType = userTypeCommand.ExecuteScalar()?.ToString();


                    // Store username in session
                    Session["Username"] = username.Value; // Use Text property here

                    // Redirect to respective dashboard based on user type
                    if (userType == "Admin")
                    {
                        Response.Redirect("Admin_Dashboard.aspx");
                    }
                    else if (userType == "User")
                    {
                        Response.Redirect("User_Dashboard.aspx");
                    }
                    else
                    {
                        // Handle invalid user type
                        string script = "alert('Invalid user type.');";
                        ClientScript.RegisterStartupScript(this.GetType(), "ErrorScript", script, true);
                    }
                }
                else
                {
                    string script = "alert('Invalid username or password.');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorScript", script, true);
                }
            }
        }
    }
}
