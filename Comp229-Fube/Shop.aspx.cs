using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Fube {
	public partial class Shop : System.Web.UI.Page {
		private static string ConnectionStringProfile = "FUBE";

		private SqlConnection connection;
		private SqlCommand cmd_GetTubes;

		protected void Page_Load(object sender, EventArgs e) {
			connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionStringProfile].ToString());
			cmd_GetTubes = new SqlCommand("SELECT * FROM Tubes", connection);

			connection.Open();
			SqlDataReader reader = cmd_GetTubes.ExecuteReader();

			if (reader.HasRows) {
				while (reader.Read()) {
					AddTube(reader.GetString(1), 1, reader.GetString(3), reader.GetString(4));
				}
			} else {
				EmptyMsg();
			}
			reader.Close();
		}

		private void EmptyMsg() {
			HtmlGenericControl h = new HtmlGenericControl("h1");
			h.InnerText = "No tubes available :(";
			ShopItemsPlaceHolder.Controls.Add(h);
		}

		private void AddTube(string name, float price, string imgFile, string desc) {
			HtmlAnchor a = new HtmlAnchor();
			a.Attributes.Add("class", "ShopItem");
			a.HRef = "#";

			HtmlGenericControl h = new HtmlGenericControl("h1");
			h.InnerText = name;
			h.Attributes.Add("class", "ShopItemTitle");
			a.Controls.Add(h);

			HtmlImage img = new HtmlImage();
			img.Attributes.Add("class", "ShopItemImg");
			img.Src = "/res/Tubes/" + imgFile;
			a.Controls.Add(img);

			ShopItemsPlaceHolder.Controls.Add(a);
		}
	}
}
