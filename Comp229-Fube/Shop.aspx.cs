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
		public const string Session_OrderNum = "OrderNum";
		public const string Session_CurrentUser = "CurrentUser";

		private static string ConnectionStringProfile = "FUBE";

		private SqlConnection connection;

		private SqlCommand cmd_GetTubes;

		private SqlCommand cmd_LastID;

		protected void Page_Load(object sender, EventArgs e) {
			connection = new SqlConnection(ConfigurationManager.ConnectionStrings[ConnectionStringProfile].ToString());

			cmd_GetTubes = new SqlCommand("SELECT * FROM Tubes", connection);
			cmd_LastID = new SqlCommand("SELECT SCOPE_IDENTITY()", connection);

			LoadTubes();
		}

		private void LoadTubes() {
			try {
				connection.Open();
				SqlDataReader reader = cmd_GetTubes.ExecuteReader();

				if (reader.HasRows) {
					while (reader.Read()) {
						AddTube(Convert.ToInt32(reader.GetValue(0))
							, reader.GetString(1)
							, Convert.ToDecimal(reader.GetValue(2))
							, reader.GetString(3)
							, reader.GetString(4));
					}
				} else {
					EmptyMsg();
				}
				reader.Close();
			} finally {
				connection.Close();
			}
		}

		private void AddTube(int id, string name, Decimal price, string imgFile, string desc) {
			LinkButton link = new LinkButton();
			link.Attributes.Add("class", "ShopItem");
			link.Click += (object sender, EventArgs e) => { SelectTube(id, name, price); };

			HtmlGenericControl h = new HtmlGenericControl("h1");
			h.InnerText = name + " $" + price;
			h.Attributes.Add("class", "ShopItemTitle");
			link.Controls.Add(h);

			HtmlImage img = new HtmlImage();
			img.Attributes.Add("class", "ShopItemImg");
			img.Src = "/res/Tubes/" + imgFile;
			link.Controls.Add(img);

			ShopItemsPlaceHolder.Controls.Add(link);
		}

		private void EmptyMsg() {
			HtmlGenericControl h = new HtmlGenericControl("h1");
			h.InnerText = "No tubes available :(";
			ShopItemsPlaceHolder.Controls.Add(h);
		}

		private void SelectTube(int tubeId, string name, Decimal price) {
			if (Session[Session_CurrentUser] == null) {
				Response.Redirect("LogIn.aspx");
				return;
			}

			if (Session[Session_OrderNum] == null) {
				NewOrder();
			}

			if (!CheckOrderItem(tubeId)) {
				NewOrderItem(tubeId);
			} else {
				IncrementOrderItem(tubeId);
			}

			CartGridView.DataBind();
			TotalGridView.DataBind();
		}

		private bool CheckOrderItem(int tubeId) {
			bool result;

			string query = string.Format("SELECT * FROM OrderItems WHERE OrderID = {0} AND TubeID = {1}"
				, Convert.ToInt32(Session[Session_OrderNum]), tubeId);
			SqlCommand cmd_CheckOrderItem = new SqlCommand(query, connection);

			connection.Open();
			SqlDataReader reader = cmd_CheckOrderItem.ExecuteReader();
			result = reader.Read();
			reader.Close();
			connection.Close();

			return result;
		}

		private void NewOrderItem(int tubeId) {
			string query = string.Format("INSERT INTO OrderItems (OrderID, TubeID, Quantity, SizeMultiplier) VALUES ({0}, {1}, {2}, {3})"
				, Convert.ToInt32(Session[Session_OrderNum]), tubeId, 1, 1);
			SqlCommand cmd_AddOrderItem = new SqlCommand(query, connection);

			connection.Open();
			cmd_AddOrderItem.ExecuteNonQuery();
			connection.Close();
		}

		private void IncrementOrderItem(int tubeId) {
			string query = string.Format("UPDATE OrderItems SET Quantity = Quantity+1 WHERE OrderID = {0} AND TubeID = {1}"
				, Convert.ToInt32(Session[Session_OrderNum]), tubeId);
			SqlCommand cmd_IncrementOder = new SqlCommand(query, connection);

			connection.Open();
			cmd_IncrementOder.ExecuteNonQuery();
			connection.Close();
		}

		private void NewOrder() {
			string query = string.Format("INSERT INTO Orders (UserID, OrderDate) VALUES ({0}, getdate())"
				, Convert.ToInt32(Session[Session_CurrentUser]));
			SqlCommand cmd_AddOrder = new SqlCommand(query, connection);

			try {
				connection.Open();

				cmd_AddOrder.ExecuteNonQuery();

				SqlDataReader reader = cmd_LastID.ExecuteReader();
				reader.Read();
				Session[Session_OrderNum] = Convert.ToInt32(reader.GetValue(0));
				reader.Close();
			} finally {
				connection.Close();
			}
		}

		protected void SubmitOrderButton_Click(object sender, EventArgs e) {
			Response.Redirect("~/SubmitOrder.aspx");
		}

		protected void CartGridView_RowDeleted(object sender, GridViewDeletedEventArgs e) {
			TotalGridView.DataBind();
		}

		protected void CartGridView_RowUpdated(object sender, GridViewUpdatedEventArgs e) {
			TotalGridView.DataBind();
		}
	}
}
