using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Fube {
	public partial class LogIn : Page {
		public const string Session_CurrentUser = "CurrentUser";

		private static SqlConnection con;

		protected void Page_Load(object sender, EventArgs e) {
			string connectionString = ConfigurationManager.ConnectionStrings["FUBE"].ToString();
			con = new SqlConnection(connectionString);
		}

		public void ChangeView(object sender, EventArgs e) {
			if (loginPageView.ActiveViewIndex == 0) {
				loginPageView.ActiveViewIndex = 1;
			} else {
				loginPageView.ActiveViewIndex = 0;
			}
		}

		public void LoginClick(object sender, EventArgs e) {
			string id = idTxtBox.Text;
			string pwd = pwTxtBox.Text;

			string check = LoginAccount(id, pwd);
			Response.Write("Welcome " + check);

			if (check == "user") {
				Response.Redirect("Default.aspx");
			} else if (check == "admin") {
				Response.Redirect("Admin_Shop.aspx");
			} else {
				Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
					   "alert('They do not match any account. Double check and try again.');", true);
			}

		}

		public void SignUpClick(object sender, EventArgs e) {
			//checks all validators on page
			Page.Validate();

			if (Page.IsValid) {
				try {
					string username = txtSignupEmail.Text;
					string password = txtSignupPassword.Text;
					string firstName = txtFirstName.Text;
					string lastName = txtLastName.Text;
					string address = txtAddress.Text + ", " + provinceList.SelectedValue;

					Account account = new Account(username, password, firstName, lastName, address);
					CreateAccount(account);
					Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
						"alert('Thank you for registering " + firstName + " " + lastName + ", your record was created successfully.');", true);
				} catch (Exception ex) {
					Response.Write(ex.Message);
					Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
						"alert('Upload failed');", true);
				}
			} else {
				Page.ClientScript.RegisterStartupScript(this.GetType(), "alert",
					   "alert('Your registration information is invalid');", true);
			}
		}

		private string LoginAccount(string id, string pwd) {
			string result;

			string query_CurrentUser = "SELECT * FROM Users WHERE username = '" + id + "' and password='" + pwd + "'";
			SqlCommand cmd_CurrentUser = new SqlCommand(query_CurrentUser, con);

			con.Open();
			SqlDataReader sdr_CurrentUser = cmd_CurrentUser.ExecuteReader();

			try {
				if (sdr_CurrentUser.Read()) {
					Session[Session_CurrentUser] = sdr_CurrentUser.GetInt32(0);

					if (sdr_CurrentUser.GetBoolean(3)) {
						result = "admin";
					} else {
						result = "user";
					}
				} else {
					result = string.Empty;
				}
			} finally {
				sdr_CurrentUser.Close();
				con.Close();
			}

			return result;
		}

		private void CreateAccount(Account account) {
			string query = string.Format(@"INSERT INTO Users (Username, Password, FirstName, LastName, Address, IsAdmin) VALUES('{0}', '{1}', '{2}', '{3}', '{4}', {5})",
				account.Username, account.Password, account.Firstname, account.Lastname, account.Address, 0);

			SqlCommand cmd_Insert = new SqlCommand(query, con);

			try {
				con.Open();
				cmd_Insert.ExecuteNonQuery();
			} finally {
				con.Close();
			}
		}

	}
}