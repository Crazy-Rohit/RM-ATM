<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_Page.aspx.cs" Inherits="ATM.Home_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register - RM_Bank</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="styles.css" /> <!-- Optional: You can add your custom styles in styles.css -->
    <style>
        .footer {
            margin-top: 20px;
            background-color: #343a40;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
        .navbar-brand img {
            height: 30px;
            width: auto;
            margin-right: 10px;
        }
        .navbar-nav {
            margin-left: auto;
        }
        .navbar-nav .nav-item {
            margin-left: 10px;
        }
        .content {
            height:500px;
            padding: 50px;
        }
        .content p{
            text-align:justify;
            font-family:'Times New Roman'
        }
        .rules {
            text-align: left;
            margin-top: 20px;
            font-family:'Times New Roman'
        }
        .carousel-item img {
            width: 100%;
            height: auto;
        }
        /* Custom CSS */
       body {
            background-size: cover; /* Cover the entire viewport with the background image */
            background-repeat: no-repeat;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-attachment: fixed;
        }

        .header {
            background-color: #c51ff6; /* Purple pink background */
            color: #fff; /* Text color */
            padding: 10px; /* Padding around the content */
            text-align: center; /* Center align the content */
            height: 75px;
        }

        .logo-container {
            position: absolute; /* Position the logo container */
            top: 10px; /* 10px from the top */
            left: 10px; /* 10px from the left */
            display: flex; /* Use flexbox for alignment */
            align-items: center; /* Center align vertically */
        }

        .logo-container img {
            height: 50px; /* Adjust the height of the logo image */
            width: auto; /* Maintain aspect ratio */
            border-radius: 50%; /* Circular shape */
            margin-right: 10px; /* Margin between logo and text */
        }

        .bank-name {
            font-size: 1.5em; /* Larger font size for bank name */
            font-weight: bold; /* Bold font weight */
            margin: 0; /* Remove default margin */
        }

        .login-register-container {
            position: absolute; /* Position the login/register container */
            top: 10px; /* 10px from the top */
            right: 10px; /* 10px from the right */
            z-index: 999; /* Ensure it's above other elements */
        }

        .button-box {
            background-color: #fff; /* White background for button box */
            padding: 5px; /* Padding for the button box */
            border-radius: 5px; /* Rounded corners */
            display: inline-block; /* Display as inline block */
        }

        .login-register-container .btn {
            padding: 5px 10px; /* Padding for the buttons */
        }
        .box{
            margin-top:12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <!-- Header -->
    <div class="header">
        <div class="container">
            <div class="logo-container">
                <p class="navbar-brand" style="font-family:'Times New Roman'">
                    <img src="Image\logo.png" alt="RM_Bank Logo" />
                    RM Bank
                </p>
            </div>
            <div class="login-register-container">
                <div class="box">
                <asp:Button ID="login" runat="server" Text="Login" CssClass="btn btn-success" OnClick="login_Click" />
                <asp:Button ID="register" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="register_Click" />
            </div>
                </div>
        </div>
    </div>

    <!-- Content -->
        
            <br /><h1 style="text-align:center; color:black; font-family:'Times New Roman';font-weight:bold">Welcome to RM Bank</h1>
    <div class="content">
        <div class="container">
            <div class="row">
                <br />
                <!-- Left Content -->
                <div class="col-md-6">
                    <p>RM_Bank is committed to ensuring the security and confidentiality of your financial transactions. 
                        With state-of-the-art encryption technology, we provide a secure platform for all your banking needs. 
                        Our dedicated team is available to assist you round the clock, ensuring prompt resolution of any queries or concerns you may have. 
                        Moreover, we offer a wide range of banking services, including savings accounts, loans, investments, and more, tailored to meet your specific requirements. At RM_Bank, we prioritize transparency and trust, fostering long-term relationships with our valued customers. Join us today and experience the convenience and reliability of modern banking solutions.
                    </p>
                    <div class="rules">
                        <h2>Banking Security Guidelines: Protecting Your Financial Well-being</h2>
                        <ul>
                            <li>Keep your PIN and passwords confidential.</li>
                            <li>Report any suspicious activity to the bank immediately.</li>
                            <li>Regularly check your account statements for unauthorized transactions.</li>
                            <li>Keep your contact information up to date with the bank to ensure timely communication.</li>
                            </ul>
                    </div>
                </div>
                <!-- Right Content -->
                <div class="col-md-6">
                    <div id="imageCarousel" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="Image\i1.jpg" class="d-block" alt="Image 1">
                            </div>
                            <div class="carousel-item">
                                <img src="Image\i2.jpg" class="d-block" alt="Image 2">
                            </div>
                            <div class="carousel-item">
                                <img src="Image\i3.jpg" class="d-block" alt="Image 3">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <div class="container">
            <p>Email: info@rmbank.com</p>
            <p>Phone: +1234567890</p>
        </div>
    </div>

    <!-- JavaScript libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- Initialize Carousel -->
    <script>
        $(document).ready(function () {
            $('.carousel').carousel({
                interval: 1500 // Change interval as required
            });
        });
    </script>
    </form>
</body>
</html>
