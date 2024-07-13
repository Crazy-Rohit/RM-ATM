using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace ATM
{
    public partial class Transfer_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any initialization logic here if needed
        }

        protected void btnTransfer_Click(object sender, EventArgs e)
        {
            // Check if the user is logged in
            if (Session["Username"] != null)
            {
                string username = Session["Username"].ToString();
                string pin = password.Value; // Assuming password is the ID of your PIN input control
                string recipientAccountNo = txtAccountNo.Value.ToString();
                string ifscCode = txtIFSC.Value.ToString();
                decimal amountToTransfer;

                // Validate and parse the amount to transfer
                if (decimal.TryParse(txtAmount.Value, out amountToTransfer))
                {
                    // Connection string to your database
                    string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Rohit\source\repos\ATM\ATM\App_Data\Database1.mdf;Integrated Security=True";

                    // SQL query to check if the PIN is valid
                    string pinValidationQuery = "SELECT COUNT(*) FROM RM_Bank WHERE userName = @username AND pin = @pin";

                    // SQL query to check the account balance
                    string balanceQuery = "SELECT amount FROM RM_Bank WHERE userName = @username";

                    // SQL query to transfer amount to recipient account
                    string transferQuery = "UPDATE RM_Bank SET amount = amount - @amountToTransfer WHERE userName = @username;" +
                                           "UPDATE RM_Bank SET amount = amount + @amountToTransfer WHERE accountNo = @recipientAccountNo ";

                    // Create a SqlConnection object
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        // Verify PIN
                        con.Open();
                        using (SqlCommand pinValidationCommand = new SqlCommand(pinValidationQuery, con))
                        {
                            pinValidationCommand.Parameters.AddWithValue("@username", username);
                            pinValidationCommand.Parameters.AddWithValue("@pin", pin);
                            int pinCount = (int)pinValidationCommand.ExecuteScalar();

                            if (pinCount == 0)
                            {
                                result.Text = "Invalid PIN. Transfer failed.";
                                return;
                            }
                        }

                        // Check account balance
                        using (SqlCommand balanceCommand = new SqlCommand(balanceQuery, con))
                        {

                            balanceCommand.Parameters.AddWithValue("@username", username);
                            decimal balance = (decimal)balanceCommand.ExecuteScalar();

                            if (amountToTransfer > balance)
                            {
                                result.Text = "Insufficient balance. Transfer failed.";
                                return;
                            }
                        }

                        // Execute transfer
                        using (SqlCommand transferCommand = new SqlCommand(transferQuery, con))
                        {
                            transferCommand.Parameters.AddWithValue("@amountToTransfer", amountToTransfer);
                            transferCommand.Parameters.AddWithValue("@username", username);
                            transferCommand.Parameters.AddWithValue("@recipientAccountNo", recipientAccountNo);

                            int rowsAffected = transferCommand.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                result.Text = "Amount successfully transferred to recipient account.";
                            }
                            else
                            {
                                result.Text = "Transfer failed. Please try again.";
                            }
                        }
                    }
                }
                else
                {
                    // Display error message if amount is not valid
                    result.Text = "Invalid amount entered.";
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
