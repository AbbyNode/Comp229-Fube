using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using Comp229_Fube;

namespace Fube
{
    public partial class LogIn : Page
    {

        public void ChangeView(object sender, EventArgs e)
        {
            if (loginPageView.ActiveViewIndex == 0)
            {
                loginPageView.ActiveViewIndex = 1;
            }
            else
            {
                loginPageView.ActiveViewIndex = 0;
            }
        }

        public void LoginClick(object sender, EventArgs e)
        {
			Session[SiteMaster.Session_CurrentUser] = "hi";
			return;



            string id = idTxtBox.Text;
            string pwd = pwTxtBox.Text;

            string check = Connection.loginAccount(id, pwd);
            Response.Write("Welcome " + check);

            if (check == "user")
            {

                //Response.Write("Welcome " + id);
                Session["CurrentUser"] = idTxtBox.Text;
                Response.Redirect("Default.aspx");
                
            }
            else if (check == "admin")
            {
                //Response.Write("Welcome " + id);
                //Response.Redirect("");
                Session["CurrentUser"] = idTxtBox.Text;
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
                       "alert('They do not match any account. Double check and try again.');", true);
            }

        }

        public void SignUpClick(object sender, EventArgs e)
        {
            //checks all validators on page
            Page.Validate();

            if (Page.IsValid)
            {
                try
                {
                    string email = txtSignupEmail.Text;
                    string password = txtSignupPassword.Text;
                    string firstName = txtFirstName.Text;
                    string lastName = txtLastName.Text;
                    string address = txtAddress.Text + ", " + provinceList.SelectedValue;

                    Account account = new Account(email, password, firstName, lastName, address);
                    Connection.createAccount(account);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Thank you for registering " + firstName + " " + lastName + ", your record was created successfully.');", true);
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
                        "alert('Upload failed');", true);
                }
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
                       "alert('Your registration information is invalid');", true);
            }
        }

    }
}