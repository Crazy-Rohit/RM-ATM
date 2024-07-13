<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Dashboard.aspx.cs" Inherits="ATM.User_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Dashboard - RM_Bank</title>
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
            margin-top:10px;
        }

        .container {
            margin-top: 50px;
            text-align: center;
            align-items:center;
            align-content:center;
        }

        .card {
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
            align-content: center;
            align-items: center;
            text-align: center;
        }
        .card h2{
            font-family:'Times New Roman';
            font-size:40px;
            font-weight:bold;
            color: mediumorchid;
        }
       
        .btn-group {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .btn-group-left {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
         width: 300px;
            align-items: flex-start;
        }

        .btn-group-right {
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            width: 300px;
            align-items: flex-end;
        }
        
.btn-group-left .btn,
.btn-group-right .btn {
    width: 100%; /* Set width to fill the parent container */
    font-size: 30px; /* Increase font size */
    text-align:center;
    border-width:2px;
    border-color:white;
    font-family:'Times New Roman';
    font-weight:bold;
}
         .user_table {
             align-items:center;
             align-content:center;
             text-align:center;
            margin: 0 auto; /* Center the table horizontally */
        }
         .tabr{
             height:100px;
             width: 100%;
             align-content:center;
             align-items:center;
         }
         .tabcl{
             column-width:300px;
             padding-right:250px;
         }
         .tabcr{
    column-width:300px;
    padding-left:255px;
}
    </style>
</head>
<body>
    <form id="logform" runat="server">
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
                    <asp:Button ID="logout" runat="server" Text="Logout" CssClass="btn btn-success" OnClick="logout_Click"/>
                </div>
        </div>
    </div>

    <!-- Content -->
    <div class="container">
        <div class="card">
            <h2>User Dashboard</h2>
            </div>
            <!-- Buttons -->
        <div class="user_table">
            <table>
                <tr class="tabr">
                    <td class="tabcl">
                        <div class="btn-group btn-group-left">
                            <asp:Button ID="btnDeposit" runat="server" Text="Deposit" CssClass="btn btn-primary" OnClick="btnDeposit_Click" />
                        </div>
                    </td>
                    <td class="tabcr">
                        <div class="btn-group btn-group-right">
                            <asp:Button ID="btnBalanceEnquiry" runat="server" Text="Balance Enquiry" CssClass="btn btn-primary" OnClick="btnBalanceEnquiry_Click" />
                        </div>
                    </td>
                </tr>
                <tr class="tabr">
                    <td class="tabcl">
                        <div class="btn-group btn-group-left">
                            <asp:Button ID="btnWithdraw" runat="server" Text="Withdraw" CssClass="btn btn-primary" OnClick="btnWithdraw_Click" />
                        </div>
                    </td>
                    <td class="tabcr">
                        <div class="btn-group btn-group-right">
                            <asp:Button ID="btnChangePIN" runat="server" Text="Change PIN" CssClass="btn btn-primary" OnClick="btnChangePIN_Click" />
                        </div>
                    </td>
                </tr>
                <tr class="tabr">
                    <td class="tabcl">
                        <div class="btn-group btn-group-left">
                            <asp:Button ID="btnTransfer" runat="server" Text="Transfer" CssClass="btn btn-primary" OnClick="btnTransfer_Click" />
                        </div>
                    </td>
                    <td class="tabcr">
                        <div class="btn-group btn-group-right">
                            <asp:Button ID="btnUserInfo" runat="server" Text="User Info" CssClass="btn btn-primary" OnClick="btnUserInfo_Click" />
                        </div>
                    </td>
                </tr>
            </table>
        
    </div>
        </div>
        </form>
    <!-- Include Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

