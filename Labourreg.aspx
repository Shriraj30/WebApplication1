﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="labourreg.aspx.cs" Inherits="YourNamespace.labourreg" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Labour Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="container">
        <form class="row g-3 bg-light" runat="server" method="post" enctype="multipart/form-data">
            <div class="bg-primary p-4 rounded mb-3 mt-3">
                <h1 class="text-center text-light">Labour Registration Form</h1>
            </div>

            <!-- First Name -->
            <div class="col-md-6">
                <label for="inputFname" class="form-label">First Name</label>
                <asp:TextBox ID="txtFname" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFname" runat="server" ControlToValidate="txtFname" 
                    ErrorMessage="First Name is required" CssClass="text-danger" />
            </div>

            <!-- Last Name -->
            <div class="col-md-6">
                <label for="inputLname" class="form-label">Last Name</label>
                <asp:TextBox ID="txtLname" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLname" runat="server" ControlToValidate="txtLname" 
                    ErrorMessage="Last Name is required" CssClass="text-danger" />
            </div>

            <!-- Email -->
            <div class="col-md-6">
                <label for="inputEmail" class="form-label">Email</label>
                <asp:TextBox ID="txtEmail" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Email is required" CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                    ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" 
                    ErrorMessage="Please enter a valid email address" CssClass="text-danger" />
            </div>

            <!-- Password -->
            <div class="col-md-6">
                <label for="inputPassword" class="form-label">Password</label>
                <asp:TextBox ID="txtPass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPass" 
                    ErrorMessage="Password is required" CssClass="text-danger" />
            </div>

            <!-- Address -->
            <div class="col-12">
                <label for="inputAddress" class="form-label">Address</label>
                <asp:TextBox ID="txtAdd" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAdd" 
                    ErrorMessage="Address is required" CssClass="text-danger" />
            </div>

            <!-- Phone Number -->
            <div class="col-md-4">
                <label for="inputPhone" class="form-label">Phone</label>
                <asp:TextBox ID="txtPhone" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                    ErrorMessage="Phone number is required" CssClass="text-danger" />
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone" 
                    ValidationExpression="^\d{10}$" 
                    ErrorMessage="Please enter a valid 10-digit phone number" CssClass="text-danger" />
            </div>

            <!-- Gender -->
            <div class="col-md-4">
                <label for="inputGender" class="form-label">Gender</label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-select" runat="server">
                    <asp:ListItem Value="male">Male</asp:ListItem>
                    <asp:ListItem Value="female">Female</asp:ListItem>
                    <asp:ListItem Value="others">Others</asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Date of Birth -->
            <div class="col-md-4">
                <label for="inputDOB" class="form-label">DOB</label>
                <asp:TextBox ID="txtDOB" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB" 
                    ErrorMessage="Date of birth is required" CssClass="text-danger" />
            </div>

            <!-- Type of Document -->
            <div class="col-md-6">
                <label for="inputDocumentType" class="form-label">Document Type</label>
                <asp:DropDownList ID="ddlDocumentType" CssClass="form-select" runat="server">
                    <asp:ListItem Text="ID Card" Value="ID"></asp:ListItem>
                    <asp:ListItem Text="Driving License" Value="License"></asp:ListItem>
                    <asp:ListItem Text="Aadhar Card" Value="Aadhar"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
            </div>

            <!-- Document Upload Section -->
            <div class="col-12">
                <label for="inputDocuments" class="form-label">Upload Documents</label>
                <div id="fileUploadContainer">
                    <div class="mb-2">
                        <input type="file" name="fileUpload[]" class="form-control" />
                    </div>
                </div>
                <button type="button" id="btnAdd" class="btn btn-success mt-2">Add Document</button>
                <button type="button" id="btnRemove" class="btn btn-danger mt-2">Remove Document</button>
            </div>

            <!-- Submit Button -->
            <div class="col-12 mb-3">
                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Register" OnClick="Button1_Click" />
            </div>

        </form>
    </div>

    <script>
        const addButton = document.getElementById('btnAdd');
        const removeButton = document.getElementById('btnRemove');
        const container = document.getElementById('fileUploadContainer');
        let fileUploadCount = 1;

        // Add more file upload fields
        addButton.addEventListener('click', () => {
            fileUploadCount++;
            const newUploadField = document.createElement('div');
            newUploadField.classList.add('mb-2');
            newUploadField.innerHTML = `<input type="file" name="fileUpload[]" class="form-control" />`;
            container.appendChild(newUploadField);
        });

        // Remove the last file upload field
        removeButton.addEventListener('click', () => {
            if (fileUploadCount > 1) {
                container.removeChild(container.lastChild);
                fileUploadCount--;
            }
        });
    </script>
</body>
</html>
