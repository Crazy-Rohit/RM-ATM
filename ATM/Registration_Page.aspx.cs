using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ATM
{
    public partial class Registration_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void reg_submit_Click(object sender, EventArgs e)
        {
            // Your registration logic goes here

            SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True");
            

                string insertQuery = @"INSERT INTO RM_Bank (accountNo, name, dob, address, email, contact, nationality, userType, ifsc, accountType, userName, pin, amount) 
                                       VALUES (@accountNo, @name, @dob, @address, @email, 
                                               @contact, @nationality, @userType, @ifsc, 
                                               @accountType, @userName, @pin, @amount)";

                SqlCommand command = new SqlCommand(insertQuery, con);

                command.Parameters.AddWithValue("@accountNo", txtAccountNo.Value);
                command.Parameters.AddWithValue("@name", txtName.Value);
                command.Parameters.AddWithValue("@dob", Convert.ToDateTime(txtDOB.Value));
                command.Parameters.AddWithValue("@address", txtAddress.Value);
                command.Parameters.AddWithValue("@email", txtEmail.Value);
                command.Parameters.AddWithValue("@contact", txtContact.Value);
                command.Parameters.AddWithValue("@nationality", txtNationality.Value);
                command.Parameters.AddWithValue("@userType", chkAdmin.Checked ? "Admin" : "User");
                command.Parameters.AddWithValue("@ifsc", txtIFSC.Value);
                command.Parameters.AddWithValue("@accountType", ddlAccountType.Value);
                command.Parameters.AddWithValue("@userName", txtUserName.Value);
                command.Parameters.AddWithValue("@pin", txtPIN.Value);
                command.Parameters.AddWithValue("@amount", 0); // Initial balance


            try
            {
                con.Open();
                int rowsAffected = command.ExecuteNonQuery();
                if (rowsAffected > 0)
                {
                    string script = "alert('Registered Successfully'); window.location.href = 'Login_Page.aspx';";
                    ClientScript.RegisterStartupScript(this.GetType(), "SuccessScript", script, true);
                }
                else
                {
                    string script = "alert('Registration failed');";
                    ClientScript.RegisterStartupScript(this.GetType(), "ErrorScript", script, true);
                }
            }
            catch (Exception ex)
            {
                string errorMessage = "An error occurred: " + ex.Message;
                string script = $"alert('{errorMessage}'); window.location.href = 'Home_Page.aspx';";
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorRedirectScript", script, true);
            }

            // Assuming registration is success

        }
    }
    }
