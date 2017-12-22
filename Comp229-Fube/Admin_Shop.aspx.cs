﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fube {
	public partial class Admin_Shop : System.Web.UI.Page {
		private static string ConnectionStringProfile = "FUBE";

		private SqlConnection connection;
		private SqlCommand addNewCmd;

		protected void Page_Load(object sender, EventArgs e) {
			connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionStringProfile].ToString());
			addNewCmd = new SqlCommand("INSERT INTO Tubes (Name, Price) VALUES ('Empty', 0)", connection);
		}

		protected void AddNewButton_Click(object sender, EventArgs e) {
			try {
				connection.Open();
				addNewCmd.ExecuteNonQuery();
			} finally {
				connection.Close();
			}

			ShopItemsGridView.DataBind();
		}
	}
}