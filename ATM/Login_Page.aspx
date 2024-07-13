<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="ATM.Login_Page" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - RM_Bank</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- Include Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url('Image/bg.jpg');
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            background-attachment: fixed;
        }

        .header {
            background-color: #c51ff6;
            color: white;
            padding: 20px;
            text-align: center;
            height: 150px;
            font-family: Algerian;
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

        .content {
            padding: 20px;
        }

        .login-form {
            background: #fff;
            padding: 30px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }


        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .register-link {
            text-align: center;
            margin-top: 20px;
        }

        .register-link a {
            color: #c94c4c;
            text-decoration: none;
        }

        .register-link a:hover {
            text-decoration: underline;
        }

        .home-link{
             text-align: center;
 margin-top: 20px;
        }

        .form-group.text-center {
      text-align: center;
    }
        .toggle-password {
    position: absolute;
    right: 10px;
    background:none;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    border:0px;
    color:black;
}

    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="Image/logo.png" alt="RM_Bank Logo" />
        <h1 class="align-middle">RM Bank</h1>
    </div>

    <!-- Content -->
    <div class="content">
        <div class="container">
            <div class="row justify-content-center"> <!-- Center the login form -->
                <div class="col-md-6"> <!-- Adjust the column size as needed -->
                    <div class="login-form">
                        <h2 class="text-center">Login</h2>
                        <form id="loginform" runat="server">
                            <div class="form-group">
                                <label for="username">Username</label>
                                <input type="text" runat="server" id="username" name="username" placeholder="Enter username" class="form-control" required />
                            </div>

                           <div class="form-group">
    <label for="password">Password</label>
    <div class="input-group">
        <input type="password" id="password" runat="server" name="password" class="form-control" required />
        <div class="input-group-append">
            <span class="input-group-text toggle-password" placeholder="Enter pin" onclick="togglePasswordVisibility()">
                <i class="fas fa-eye" id="toggleIcon"></i>
            </span>
        </div>
    </div>
</div>

                            <div class="form-group text-center">  
                                <asp:Button ID="log_submit" runat="server" Text="Submit" OnClick="log_submit_Click1" BackColor="#0066FF" ForeColor="White" Width="200px" />
              </div>
                            <div class="register-link">
                                <p>If you are not logged in? <a href="Registration_Page.aspx">Register</a></p>
                            </div>
                            <div class="home-link">
                                <a style="color:blue" href="Home_Page.aspx">Return to home page</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Include Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        function togglePasswordVisibility() {
            var passwordField = document.getElementById("password");
            var icon = document.getElementById("toggleIcon");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("fa-eye");
                icon.classList.add("fa-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.remove("fa-eye-slash");
                icon.classList.add("fa-eye");
            }
        }
    </script>
</body>
</html>
