<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard.aspx.cs" Inherits="ATM.Admin_Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard - RM_Bank</title>
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

        .container {
            margin-top: 50px;
            text-align: center;
        }

        .card {
            margin: 20px auto;
            max-width: 500px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        .btn {
            margin-top: 10px;
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

        .header h1 {
            font-size: 40px;
            display: inline-block;
            vertical-align: middle;
        }

        .container {
            margin-top: 50px;
            text-align: center;
        }

        .card {
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        .btn-group {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        .btn-group-left {
            justify-content: flex-start;
        }

        .btn-group-right {
            justify-content: flex-end;
        }

        .btn {
            margin: 10px;
        }
    .form-group {
            margin-bottom: 20px;
            display: flex;
            align-items: center; /* Vertically center align */
        }

        .form-group label {
            margin-right: 10px; /* Adjust margin between label and input */
            width: 120px; /* Set label width */
            text-align: right; /* Align label text to right */
        }

        .form-group .form-control {
            flex: 1; /* Allow the input to take up remaining space */
            font-size: 15px; /* Set font size */
        }
        .form-control{
            text-align:left;
        }
.table-responsive {
    background-color: #fff; /* White background color */
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow effect */
    padding: 20px;
}
    </style>
</head>
<body>
       <!-- Header -->
<div class="header">
    <div class="container">
        <div class="logo-container">
            <p class="navbar-brand" style="font-family:'Times New Roman'">
                <img src="Image\logo.png" alt="RM_Bank Logo" />
                RM Bank
            </p>
        </div>
        <form id="logform" runat="server">
        <div class="login-register-container">
            <asp:Button ID="logout" runat="server" Text="Logout" CssClass="btn btn-success" OnClick="logout_Click"/>
        </div>
    </div>
</div>


    <!-- Marquee -->
    <marquee behavior="scroll" direction="left" style="color:white;font-size:20px">
        <i>Welcome to RM Bank Admin Dashboard.</i>
    </marquee>
    <br /><br />
    <h1 style="color:white;font-family:'Times New Roman';font-size:40px; font-weight:bold; text-align:center; color:white">Admin Portal</h1>
  
    <!-- Admin Information Card -->
    <div class="container">
        <div class="card">
            <h2>Admin Information</h2>
            <br /><br />
 <div class="form-group">
     <!-- Display user data fetched from the database -->
     <label>Name:</label>
         <asp:Label ID="lblName" runat="server" CssClass="form-control"></asp:Label>
 </div>
 <div class="form-group">
     <label>Date of Birth:</label>
     <asp:Label ID="lblDOB" runat="server" CssClass="form-control"></asp:Label>
 </div>
 <div class="form-group">
     <label>Address:</label>
     <asp:Label ID="lblAddress" runat="server" CssClass="form-control"></asp:Label>
 </div>
            <div class="form-group">
    <label>Email:</label>
    <asp:Label ID="lblEmail" runat="server" CssClass="form-control"></asp:Label>
</div>
<div class="form-group">
    <label>Contact:</label>
    <asp:Label ID="lblContact" runat="server" CssClass="form-control"></asp:Label>
</div>
 <div class="form-group">
     <label>Nationality:</label>
     <asp:Label ID="lblNationality" runat="server" CssClass="form-control"></asp:Label>
 </div>
            <div class="form-group">
    <label>Username:</label>
    <asp:Label ID="lblUsername" runat="server" CssClass="form-control"></asp:Label>
</div>
 
 <!-- Buttons for updating and deleting user data -->
 <div>
     <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"  />
     <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click1"  />
 </div>
            </div>
    </div>

    <!-- Buttons -->
    <div class="container">
        <asp:Button ID="btnTotal" runat="server" CssClass="btn btn-success" Text="Total Bank Amount" BackColor="#0066FF" ForeColor="White" OnClick="btnTotal_Click" />
        <br />
        <asp:Label ID="lblBalance" runat="server"  CssClass="form-control" Font-Bold="True" Font-Size="15pt" Width="300px"></asp:Label>

        <br/>
        <div>
         <asp:Button ID="btnInfo" runat="server" CssClass="btn btn-success" Text="User Info" BackColor="#00CCFF" ForeColor="White" OnClick="btnInfo_Click"/>
        <div class="table-responsive">
     <asp:Table ID="Table1" runat="server" CssClass="table table-striped table-bordered" BorderColor="Blue">
         <asp:TableHeaderRow>
             <asp:TableHeaderCell BorderColor="Blue">Name</asp:TableHeaderCell>
             <asp:TableHeaderCell BorderColor="Blue">DOB</asp:TableHeaderCell>             
             <asp:TableHeaderCell BorderColor="Blue">Address</asp:TableHeaderCell>
             <asp:TableHeaderCell BorderColor="Blue">Email</asp:TableHeaderCell>
             <asp:TableHeaderCell BorderColor="Blue">Contact No.</asp:TableHeaderCell>
             <asp:TableHeaderCell BorderColor="Blue">Nationalty</asp:TableHeaderCell>
         </asp:TableHeaderRow>
     </asp:Table>
 </div>

        <asp:Label ID="message" runat="server"  CssClass="form-control" Font-Bold="True" Font-Size="20pt"></asp:Label>

            </div>
    </div>
 </form>
    <!-- Include Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
