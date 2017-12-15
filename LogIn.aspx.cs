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

        public void ChangeView(object sender, EventArgs e) {
			if (loginPageView.ActiveViewIndex == 0) {
				loginPageView.ActiveViewIndex = 1;
			} else {
				loginPageView.ActiveViewIndex = 0;
			}
		}

		public void LoginClick(object sender, EventArgs e) {
            try
            {
                string id = idTxtBox.Text;
                string pwd = pwTxtBox.Text;
                string query = "SELECT * FROM Users where email = '" + id + "' and password='" + pwd + "'";

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
                con.Open();
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader sdr = cmd.ExecuteReader();

                if (sdr.Read())
                {
                    // now we create a session
                    Session["user"] = idTxtBox.Text;
                    Response.Redirect("");
                }
                else
                {
                    Response.Write("Not Match");
                }
                con.Close();
            }catch(Exception ex)
            {
                //Response.Write(ex.Message);
            }
		}

		public void SignUpClick(object sender, EventArgs e) {
			//checks all validators on page
			Page.Validate();

			if (Page.IsValid) {

			} else {

			}

		}
	}
}