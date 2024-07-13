<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transfer_Page.aspx.cs" Inherits="ATM.Transfer_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Transfer Amount - RM_Bank</title>
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

        .card h1 {
            text-align: center;
            font-family: 'Times New Roman';
            font-size: 40px;
            color: mediumpurple;
            font-weight:bold;
        }

        .card h2 {
            text-align: center;
            font-family: 'Times New Roman';
            font-size: 25px;
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
        }
        .centered {
    display: flex;
    justify-content: center;
    font-size:30px;
    color:white;
    font-weight:bolder;
    margin-top: 20px; /* Adjust top margin as needed */
}

.btn-back {
     font-size: 30px; /* Increase font size */
 font-weight:bold;
 background-color: white; /* Set background color */
 color: mediumpurple; /* Set text color */
 padding: 5px; /* Add padding to increase button size */
 margin:5px;
 width:100px;
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
    <div class="container">
        <div class="card">
            <h1>Transfer Amount</h1>
            <br /><br />
            <form id="transfer" runat="server">
                <!-- PIN input -->
                <div class="form-group">
                     <h2>Please enter the pin</h2>
                        <div class="input-group">
    <input type="password" id="password" runat="server" name="password" class="form-control" placeholder="Enter pin" required />
    <div class="input-group-append">
        <span class="input-group-text toggle-password" onclick="togglePasswordVisibility()">
            <i class="fas fa-eye" id="toggleIcon"></i>
        </span>
    </div>
</div>

                </div>
                <!-- Bank Account No. input -->
                <div class="form-group">
                     <h2>Account no. of reciepent</h2>
                    <input type="text" class="form-control" id="txtAccountNo" runat="server" placeholder="Enter Bank Account No." required />
                </div>
                <!-- IFSC Code input -->
                <div class="form-group">
                     <h2>IFSC Code</h2>
                    <input type="text" class="form-control" id="txtIFSC" runat="server" placeholder="Enter IFSC Code" required />
                </div>
                <!-- Amount input -->
                <div class="form-group">
                     <h2>Please enter the amount</h2>
                    <input type="number" class="form-control" id="txtAmount" runat="server" placeholder="Enter Amount" required />
                </div>
                <div class="btn_transfer">
                <!-- Submit button -->
                <asp:Button ID="btnTransfer" runat="server" Text="Transfer" CssClass="btn btn-primary" OnClick="btnTransfer_Click" />
                    </div>
                </br>
                             <div style="color:mediumpurple;font-family:'Times New Roman';font-size:20px;font-weight:400">
<asp:Label ID="result" runat="server"></asp:Label>
    </div>
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
    <script>function togglePasswordVisibility() {
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
    }</script>
</body>
</html>

