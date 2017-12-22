using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fube {
	public partial class Admin_Account : System.Web.UI.Page {
		private static string ConnectionStringProfile = "FUBE";

		private SqlConnection connection;
		private SqlCommand cmd_AddNew;

		protected void Page_Load(object sender, EventArgs e) {
			connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionStringProfile].ToString());
			cmd_AddNew = new SqlCommand("INSERT INTO Users (Username, Password, IsAdmin) VALUES ('Empty', 'Empty', 0)", connection);
		}

		protected void AddUserButton_Click(object sender, EventArgs e) {
			try {
				connection.Open();
				cmd_AddNew.ExecuteNonQuery();
			} finally {
				connection.Close();
			}

			UsersGridView.DataBind();
		}
	}
}