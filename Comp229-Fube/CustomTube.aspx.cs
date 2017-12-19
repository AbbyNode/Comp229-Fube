using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Fube {
	public partial class CustomTube : System.Web.UI.Page {
		public const string SESSION_VAR = "Ingredients";

		private List<string> selectedIngredients;

		protected void Page_Load(object sender, EventArgs e) {
			if (Session[SESSION_VAR] != null) {
				selectedIngredients = Session[SESSION_VAR] as List<string>;

				foreach (string s in selectedIngredients) {
					Response.Write(s);
				}
			} else {
				selectedIngredients = new List<string>();
			}
		}

		protected void AddIngredientButton_Click(object sender, EventArgs e) {
			selectedIngredients.Add("ingredient 1");
			Session[SESSION_VAR] = selectedIngredients;
		}
	}
}