<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PIN_Change.aspx.cs" Inherits="ATM.PIN_change" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pin_Change</title>    <meta charset="utf-8" />
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
    height:150px;
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
            align-content:center;
            align-items:center;
        }

        .card h1{
            text-align:center;
            font-family:'Times New Roman';
            font-size:40px;
            color:mediumpurple;
            font-weight:bold;
        }

        .card h2{
            text-align:center;
font-family:'Times New Roman';
font-size:25px;
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

        .class{
           font-weight:bold;
           font-size:15px;
           text-align:center;
           color:red;
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
         <h1>Change or update pin</h1>
     <br /><br />
         
         <form id="balance" runat="server"> 
             <!-- TextBox for entering PIN -->
             <h2>Please enter the current pin</h2>
             <asp:TextBox ID="txtPIN" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter PIN" Required="true"></asp:TextBox>
             

             <br /><br />
             <h2>Please enter the new pin</h2>
             <asp:TextBox ID="txtNewPin" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Amount" Required="true"></asp:TextBox>
             <br />

             <!-- Submit button to verify PIN -->
             <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click"/>
             <br /><br />
             <div class="result">
                          <div style="color:mediumpurple;font-family:'Times New Roman';font-size:20px;font-weight:400">
<asp:Label ID="message" runat="server"></asp:Label>
    </div> 

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
</html>