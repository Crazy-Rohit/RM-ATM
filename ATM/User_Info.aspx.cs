using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM
{
    public partial class UserInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call a method to fetch and display admin information
                DisplayAdminInformation();
            }
        }

        private void DisplayAdminInformation()
        {
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                string query = "SELECT * FROM RM_Bank WHERE Username = @Username";

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            lblName.Text = reader["name"].ToString();
                            lblDOB.Text = Convert.ToDateTime(reader["dob"]).ToShortDateString();
                            lblAddress.Text = reader["address"].ToString();
                            lblEmail.Text = reader["email"].ToString();
                            lblContact.Text = reader["contact"].ToString();
                            lblNationality.Text = reader["nationality"].ToString();
                            lblUsername.Text = reader["userName"].ToString();
                        }
                    }
                }
            }
            else
            {
                // If the user is not logged in, redirect to login page
                Response.Redirect("Login_Page.aspx");
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = lblUsername.Text;

            // Redirect to Update page with username as query parameter
            Response.Redirect("Update.aspx?username=" + username);
        }


        protected void btnDelete_Click(object sender, EventArgs e)
        {
            // Retrieve user ID to be deleted
            string usernameToDelete = lblUsername.Text; // Assuming username is used as the identifier

            // Check if username is valid
            if (!string.IsNullOrEmpty(usernameToDelete))
            {
                // Connection string to your database
                string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                // SQL query to delete user data based on username
                string query = "DELETE FROM RM_Bank WHERE Username = @Username";

                // Create a SqlConnection object
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Create a SqlCommand object
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters to the command
                        cmd.Parameters.AddWithValue("@Username", usernameToDelete);

                        try
                        {
                            // Open the connection
                            con.Open();

                            // Execute the query
                            int rowsAffected = cmd.ExecuteNonQuery();

                            // Check if any rows were affected (i.e., if the user data was deleted)
                            if (rowsAffected > 0)
                            {
                                // User data successfully deleted
                                string script = "alert('Deleted Successfully'); window.location.href = Registration_Page.aspx';";
                                ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                            }
                            else
                            {
                                // No rows affected (user data not found)
                                string script = "alert('No user data found for the provided username.'); window.location.href = 'Login_Page.aspx';";
                                ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);

                            }
                        }
                        catch (Exception ex)
                        {
                            // Handle any exceptions
                            message.Text = "An error occurred: " + ex.Message;
                        }
                    }
                }
            }
            else
            {
                // Invalid username
                message.Text = "Invalid username.";
            }
        }
    }
}