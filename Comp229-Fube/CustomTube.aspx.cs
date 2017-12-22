using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Comp229_Fube {
	public partial class CustomTube : System.Web.UI.Page {
		public const string SESSION_VAR = "Ingredients";
		public const int MAX_INGREDIENTS = 4;

		private List<string> selectedIngredients;

		private string filePath = "/res/Ingredients/";
		private string fileExt = ".png";

		protected void Page_Load(object sender, EventArgs e) {
			if (Session[SESSION_VAR] != null) {
				selectedIngredients = Session[SESSION_VAR] as List<string>;
				ShowIngredients();
			} else {
				selectedIngredients = new List<string>();
			}
		}

		protected void AddIngredientButton_Click(object sender, EventArgs e) {
			if (selectedIngredients.Count >= MAX_INGREDIENTS) {
				return;
			}

			string ingredientName = IngredientsDropDown.SelectedValue;
			selectedIngredients.Add(ingredientName);
			Session[SESSION_VAR] = selectedIngredients;
			ShowIngredients();
		}

		private void ShowIngredients() {
			IngredientsPlaceholder.Controls.Clear();
			foreach (string ingredientName in selectedIngredients) {
				Image img = new Image();
				img.ImageUrl = filePath + ingredientName + fileExt;
				IngredientsPlaceholder.Controls.Add(img);
			}
		}

        protected void ResetButton_Click(object sender, EventArgs e)
        {
            IngredientsPlaceholder.Controls.Clear();
            Session[SESSION_VAR] = null;
        }
    }
}