using System;

namespace YourNamespace
{
    public partial class labourreg : System.Web.UI.Page
    {

        // Your Button1_Click method and other code here
        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPass.Text;
            string firstName = txtFname.Text;
            string lastName = txtLname.Text;
            string address = txtAdd.Text;
            string phone = txtPhone.Text;
            string gender = DropDownList1.SelectedValue;
            string dob = txtDOB.Text;

            // Check if a file is uploaded
            if (fileUpload.HasFile)
            {
                try
                {
                    // Get the file name
                    string fileName = System.IO.Path.GetFileName(fileUpload.PostedFile.FileName);

                    // Save the file to the server (you may want to change the path)
                    fileUpload.SaveAs(Server.MapPath("~/UploadedDocuments/") + fileName);

                    // Success message or other processing
                }
                catch (Exception ex)
                {
                    // Handle any errors during file upload
                }
            }
            else
            {
                // Handle the case where no file was uploaded
            }

            // Continue with the rest of your form processing (e.g., saving to a database)
        }



    }
}
