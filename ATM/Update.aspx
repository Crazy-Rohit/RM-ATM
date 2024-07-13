<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="ATM.Update" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Information - RM_Bank</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        /* Your CSS Styles */
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
            <form id="UpdateInfoForm" runat="server">
                <h1 style="font-family:'Times New Roman';font-weight:bold;font-size:40px; color:mediumpurple">Update Information</h1>
                <br /><br />
                <div class="form-group">
                    <label>Name:</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Date of Birth:</label>
                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Address:</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Contact No.:</label>
                    <asp:TextBox ID="txtContact" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Nationality:</label>
                    <asp:TextBox ID="txtNationality" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <!-- Common Buttons for Updating -->
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"  />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click"/>
            </form>
        </div>
    </div>

    <!-- Back Button -->
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
