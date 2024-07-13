using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] != null)
                {
                    string username = Session["Username"].ToString();
                    DisplayData(username);
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string name = txtName.Text;
            string dob = txtDOB.Text;
            string address = txtAddress.Text;
            string email = txtEmail.Text;
            string contact = txtContact.Text;
            string nationality = txtNationality.Text;
            string username = Session["Username"].ToString();

            UpdateData(name, dob, address, email, contact, nationality, username);

            // Redirect to the appropriate page based on the user type
            string userType = GetUserType(username);
            if (userType == "User")
            {
                Response.Redirect("User_Info.aspx");
            }
            else 
            {
                Response.Redirect("AdminP_Dashboard.aspx");
            }
           

            // Show a message box upon successful data update
            string script = "alert('Data updated successfully.');";
            ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
        }
        private string GetUserType(string username)
        {
            string userType = "";
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";
            ;
            string query = "SELECT UserType FROM RM_Bank WHERE Username = @Username";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", username);
                    con.Open();
                    userType = cmd.ExecuteScalar()?.ToString();
                }
            }

            return userType;
        }


        private void DisplayData(string username)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";
            ;
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
                        txtName.Text = reader["Name"].ToString();
                        txtDOB.Text = reader["DOB"].ToString();
                        txtAddress.Text = reader["Address"].ToString();
                        txtEmail.Text = reader["Email"].ToString();
                        txtContact.Text = reader["Contact"].ToString();
                        txtNationality.Text = reader["Nationality"].ToString();
                    }
                }
            }
        }

        private void UpdateData(string name, string dob, string address, string email, string contact, string nationality, string username)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";
            ;
            string query = "UPDATE RM_Bank SET Name = @Name, DOB = @DOB, Address = @Address, Email = @Email, Contact = @Contact, Nationality = @Nationality WHERE Username = @Username";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@DOB", dob);
                    cmd.Parameters.AddWithValue("@Address", address);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Contact", contact);
                    cmd.Parameters.AddWithValue("@Nationality", nationality);
                    cmd.Parameters.AddWithValue("@Username", username);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            string username = Session["Username"].ToString();
            string userType = GetUserType(username);

            if (userType == "User")
            {
                Response.Redirect("User_Info.aspx");
            }
            else
            {
                Response.Redirect("Admin_Dashboard.aspx");
            }
            
        }

    }
}
