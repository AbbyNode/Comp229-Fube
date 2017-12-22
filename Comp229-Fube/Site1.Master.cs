using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fube {
	public partial class Site1 : System.Web.UI.MasterPage {
		public const string Session_CurrentUser = "CurrentUser";

		protected void Page_Load(object sender, EventArgs e) {

		}

		protected void LogOut(object sender, EventArgs e) {
			Session[Session_CurrentUser] = null;
			Response.Redirect("Default.aspx");
		}
	}
}