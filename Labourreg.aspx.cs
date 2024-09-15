using System;
using System.IO;
using System.Web;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class labourreg : System.Web.UI.Page
    {
        protected void Button1_Click(object sender, EventArgs e)
        {
            // Get the form data
            string email = txtEmail.Text;
            string password = txtPass.Text;
            string firstName = txtFname.Text;
            string lastName = txtLname.Text;
            string address = txtAdd.Text;
            string phone = txtPhone.Text;
            string gender = DropDownList1.SelectedValue;
            string dob = txtDOB.Text;
            string documentType = ddlDocumentType.SelectedValue; // Get selected document type

            // Handle multiple file uploads
            HttpFileCollection uploadedFiles = Request.Files;

            // Create a directory for uploaded files if it does not exist
            string uploadPath = Server.MapPath("~/UploadedDocuments/");
            if (!Directory.Exists(uploadPath))
            {
                Directory.CreateDirectory(uploadPath);
            }

            // Loop through each uploaded file
            for (int i = 0; i < uploadedFiles.Count; i++)
            {
                HttpPostedFile userPostedFile = uploadedFiles[i];

                // Check if the file has content
                if (userPostedFile != null && userPostedFile.ContentLength > 0)
                {
                    try
                    {
                        // Get the file name and save it to the server
                        string fileName = Path.GetFileName(userPostedFile.FileName);
                        string filePath = Path.Combine(uploadPath, fileName);
                        userPostedFile.SaveAs(filePath);

                        // Optionally, you can save the file information (e.g., file path) to a database
                        // Example: Save file info to database or perform other actions

                        // Log success message or display a success notification
                    }
                    catch (Exception ex)
                    {
                        // Handle any errors during the file upload
                        // Example: Log the exception or show an error message
                        // Example: ErrorMessage.Text = "An error occurred while uploading the file.";
                    }
                }
            }

            // Continue with the rest of your form processing, e.g., saving other form data to a database
        }
    }
    Response.Redirect("login.aspx");
}

