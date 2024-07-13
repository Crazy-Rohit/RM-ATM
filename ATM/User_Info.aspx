<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Info.aspx.cs" Inherits="ATM.UserInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Information - RM_Bank</title>
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

        .container {
            margin-top: 50px;
            text-align: center;
        }

        .card {
            margin: 20px auto;
            max-width: 500px;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }

        .btn {
            margin-top: 10px;
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
        .centered {
            display: flex;
            justify-content: center;
            font-size: 30px;
            color: white;
            font-weight: bolder;
            margin-top: 20px; /* Adjust top margin as needed */
        }

        .btn-back {
            font-size: 30px; /* Increase font size */
            font-weight: bold;
            background-color: white; /* Set background color */
            color: mediumpurple; /* Set text color */
            padding: 5px; /* Add padding to increase button size */
            margin: 5px;
            width: 100px;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <img src="Image/logo.png" alt="RM_Bank Logo" />
        <h1 class="align-middle">RM Bank</h1>
    </div>

    <!-- Content -->
    <div class="container">
        <div class="card">
            <form id="User_info" runat="server">
            <h1 style="font-family:'Times New Roman';font-weight:bold;font-size:40px; color:mediumpurple">User Information</h1>
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
                <label>Mail:</label>
                <asp:Label ID="lblEmail" runat="server" CssClass="form-control"></asp:Label>
            </div>
            <div class="form-group">
                <label>Contact No.:</label>
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
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click"  />
            </div>

            <asp:Label ID="message" runat="server"  CssClass="form-control" Font-Bold="True" Font-Size="20pt"></asp:Label>

            </form>
        </div>
    </div>
    <div class="container">
        <div class="centered">
            <button type="button" class="btn btn-back" onclick="window.location.href='User_Dashboard.aspx'">Back</button>
        </div>
    </div>

    <!-- Include Bootstrap JavaScript -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
