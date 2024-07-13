<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration_Page.aspx.cs" Inherits="ATM.Registration_Page" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background-image: url('Image/bg.jpg');
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
        }

        .header {
            background-color: #c51ff6;
            color: white;
            padding: 20px;
            text-align: center;
            height:150px;
            font-family:Algerian;
        }

        .header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            vertical-align: middle;
            margin-right: 10px;
        }

        .header h1 {
            font-size: 50px;
            display: inline-block;
            vertical-align: middle;
        }

        .container {
            margin-top: 50px;
            text-align: center;
            width: 750px;
            
        }

        .registration-form {
            width: 70%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
        }

       /* .registration-form h2{
            font-family:'Times New Roman';
            font-size:40px;
            color:black;
            font-weight:bold;
        }*/

        .form-group {
            margin-bottom: 20px;
            text-align:left;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control {
            width: 100%;
            height: 40px;
            padding: 5px 10px;
            font-size: 16px;
            border-radius: 15px;
            border: 1px solid #ccc;
        }

       .same {
        display: inline-block;
        margin-right: 20px;
            width: 332px;
        }

        .btn {
            margin-top: 20px;
            margin-right: 10px;
        }
         .register-link {
     text-align: center;
     margin-top: 20px;
 }

 .register-link a {
     color: #c94c4c;
     text-decoration: none;
 }

 
    </style>

</head>
<body>
    <div class="header">
        <img src="Image/logo.png" alt="RM_Bank Logo" />
        <h1 class="align-middle">RM Bank</h1>
    </div>

    <div class="container">
        <div class="registration-form">
            <h2>User Registration Form</h2>
           
                    <form id="registrationForm" runat="server">
                        
                        <!-- Form fields -->
                        <div class="form-group">
                            <label for="txtName">Name:</label>
                            <input type="text" runat="server" class="form-control" id="txtName" name="txtName" placeholder="Name Surname" required />
                        </div>
                        <div class="form-group">
                            <label for="txtDOB">Date of Birth:</label>
                            <input type="date" runat="server" class="form-control" id="txtDOB" name="txtDOB" required />
                        </div>
                        <div class="form-group">
                            <label for="txtAddress">Address:</label>
                            <input type="text" runat="server" class="form-control" id="txtAddress" name="txtAddress" placeholder="Address" required>
                        </div>
                        <div class="form-group">
                            <label for="txtEmail">Email:</label>
                            <input type="text" runat="server" class="form-control" id="txtEmail" name="txtEmail" placeholder="abc@gmail.com" required />
                        </div>
                        <div class="form-group">
                            <label for="txtContact">Contact:</label>
                            <input type="text" runat="server" class="form-control" id="txtContact" name="txtContact" placeholder="xxx-xxx-xxxx" maxlength="12"  required />
                        </div>
                        <div class="form-group">
                            <label for="txtNationality">Nationality:</label>
                            <input type="text" runat="server" class="form-control" id="txtNationality" name="txtNationality" required />
                        </div>
                        <div class="form-group">
                            <label for="chkAdmin">User Type:</label><br />
                            <div class="same">
                                <label class="radio-inline">
                                    <input type="radio" runat="server" id="chkAdmin" name="userType" value="Admin" required onclick="toggleFields()"> Admin
                               &nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="radio" runat="server" id="chkUser" name="userType" value="User" required onclick="toggleFields()"> User
                                </label>
                            </div>
                        </div>
                        <div class="form-group" id="adminFields" style="display: none;">
                            <label for="txtAccountNo">Account No. (12 digits):</label>
                            <input type="text" runat="server" class="form-control" id="txtAccountNo" name="txtAccountNo" minlength="12" maxlength="12" />
                        
                            <label for="txtIFSC">IFSC Code (8 characters):</label>
                            <input type="text" runat="server" class="form-control" id="txtIFSC" name="txtIFSC" minlength="8" maxlength="8" />
                        
                            <label for="ddlAccountType">Account Type:</label>
                            <select class="form-control" runat="server" id="ddlAccountType" name="ddlAccountType" >
                                <option value="">Select Account Type</option>
                                <option value="Savings">Savings</option>
                                <option value="Current">Current</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="txtUserName">Username:</label>
                             <input type="text" runat="server" class="form-control" id="txtUserName" name="txtUserName" required />
                        </div>
                        <div class="form-group">
                            <label for="txtPIN">PIN No. (4 digits):</label>
                            <input type="password" runat="server" class="form-control" id="txtPIN" name="txtPIN" required minlength="4" maxlength="4" />
                        </div>
                        <asp:Button ID="reg_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="reg_submit_Click" />
                        <button type="button" class="btn btn-secondary" onclick="resetForm()">Reset</button>
                   
                          
            </form>
                <div class="register-link">
    <a style="color:blue; font-size:20px" href="Home_Page.aspx">Return to home page</a>
</div>
        </div>
    </div>

    <script>
        function resetForm() {
            document.getElementById("registrationForm").reset();
        }

        function toggleFields() {
            var userType = document.querySelector('input[name="userType"]:checked').value;
            var adminFields = document.getElementById('adminFields');
            var accountNoField = document.getElementById('txtAccountNo');

            if (userType === "Admin") {
                adminFields.style.display = "none";
                // Clear and disable the Account No. field for Admin
                accountNoField.value = "";
                accountNoField.removeAttribute("required");
                accountNoField.setAttribute("disabled", "disabled");
            } else {
                adminFields.style.display = "block";
                // Enable the Account No. field for User
                accountNoField.setAttribute("required", "required");
                accountNoField.removeAttribute("disabled");
            }
        }
    </script>
</body>
</html>
