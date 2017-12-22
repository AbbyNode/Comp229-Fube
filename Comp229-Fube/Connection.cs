using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace Fube {
	public class Connection {
		private static SqlConnection con;

		static Connection() {
			string connectionString = ConfigurationManager.ConnectionStrings["FUBE"].ToString();
			con = new SqlConnection(connectionString);
		}

		public static string loginAccount(string id, string password) {
			string result;

			string query_CurrentUser = "SELECT * FROM Users WHERE username = '" + id + "' and password='" + password + "'";
			SqlCommand cmd_CurrentUser = new SqlCommand(query_CurrentUser, con);

			con.Open();
			SqlDataReader sdr_CurrentUser = cmd_CurrentUser.ExecuteReader();

			try {
				if (sdr_CurrentUser.Read()) {
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

		public static void createAccount(Account account) {
			string query = string.Format(@"INSERT INTO Users VALUES('{0}', '{1}', '{2}', '{3}', '{4}')",
				account.Username, account.Password, account.Firstname, account.Lastname, account.Address);

			SqlCommand cmd_Insert = new SqlCommand(query);

			try {
				con.Open();
				cmd_Insert.ExecuteNonQuery();
			} finally {
				con.Close();
			}
		}

	}
}