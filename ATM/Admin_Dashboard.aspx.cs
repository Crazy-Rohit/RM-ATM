using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ATM
{
    public partial class Admin_Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Call a method to fetch and display admin information
                DisplayAdminInformation();
            }
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            // Redirect to login page
            Session.Abandon();
            Response.Redirect("Login_Page.aspx");
        }

        // Method to fetch and display admin information
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

        protected void btnTotal_Click(object sender, EventArgs e)
        {
            // Fetch and display total bank amount
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";
            string query = "SELECT SUM(amount) AS TotalAmount FROM RM_Bank";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        lblBalance.Text = result.ToString()+"Rupees";
                    }
                }
            }
        }
        protected void btnInfo_Click(object sender, EventArgs e)
        {
            // Display user information table
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";
            string query = "SELECT * FROM RM_Bank WHERE userType='User'";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();

                    // Clear existing rows from the table except for the header row
                    Table1.Rows.Clear();
                    TableHeaderRow headerRow = new TableHeaderRow();
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Name" });
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Date of Birth" });
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Address" });
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Email" });
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Contact" });
                    headerRow.Cells.Add(new TableHeaderCell { Text = "Nationality" });
                    Table1.Rows.Add(headerRow);

                    // Check if there are rows returned by the query
                    if (reader.HasRows)
                    {
                        // Loop through each row in the result set
                        while (reader.Read())
                        {
                            // Get values from the current row
                            string name = reader["name"].ToString();
                            string dob = Convert.ToDateTime(reader["dob"]).ToShortDateString();
                            string address = reader["address"].ToString();
                            string email = reader["email"].ToString();
                            string contact = reader["contact"].ToString();
                            string nationality = reader["nationality"].ToString();

                            // Create a new row for the table
                            TableRow row = new TableRow();

                            // Add cells to the row
                            row.Cells.Add(new TableCell { Text = name });
                            row.Cells.Add(new TableCell { Text = dob });
                            row.Cells.Add(new TableCell { Text = address });
                            row.Cells.Add(new TableCell { Text = email });
                            row.Cells.Add(new TableCell { Text = contact });
                            row.Cells.Add(new TableCell { Text = nationality });

                            // Add the row to the table
                            Table1.Rows.Add(row);
                        }
                    }
                    else
                    {
                        // Handle case when no data is found for the provided userType
                        // For example, display an error message
                        TableRow noDataRow = new TableRow();
                        TableCell noDataCell = new TableCell();
                        noDataCell.ColumnSpan = 6; // Span across all columns
                        noDataCell.Text = "No data found for the provided userType.";
                        noDataRow.Cells.Add(noDataCell);
                        Table1.Rows.Add(noDataRow);
                    }
                }
            }
        }



        protected void btnDelete_Click1(object sender, EventArgs e)
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

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string username = lblUsername.Text;

            // Redirect to Update page with username as query parameter
            Response.Redirect("Update.aspx?username=" + username);
        }

      
    }
}
