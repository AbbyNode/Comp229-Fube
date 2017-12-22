using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Comp229_Fube {
	public partial class SiteMaster : MasterPage {
		public const string Session_CurrentUser = "CurrentUser";

		protected void Page_Load(object sender, EventArgs e) {
			if (Session[Session_CurrentUser] == null) {
				HtmlAnchor logIn = new HtmlAnchor();
				logIn.HRef = "~/LogIn";
				logIn.InnerText = "Log In";
				LogInPlaceHolder.Controls.Add(logIn);
			} else {
				LinkButton logOut = new LinkButton();
				logOut.Click += LogOut;
				logOut.Text = "Log Out";
				LogInPlaceHolder.Controls.Add(logOut);
			}
		}

		private void LogOut(object sender, EventArgs e) {
			Session[Session_CurrentUser] = null;
			Response.Redirect("Default.aspx");
		}
	}
}