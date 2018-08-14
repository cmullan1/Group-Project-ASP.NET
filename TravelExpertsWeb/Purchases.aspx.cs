using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelExpertsWeb
{
    public partial class About : Page
    {
        decimal total = 0;

        // ----  Corinne Mullan ---
        protected void Page_Load(object sender, EventArgs e)
        {
            // On the initial page load, check if a user is logged in.
            if (!IsPostBack)
            {
                if (User?.Identity.IsAuthenticated == false)
                {
                    // Redirect to the login page if no user is logged in
                    Response.Redirect("~/Account/Login.aspx");
                }
            }

            //***** Brijesh *****//
            if (GridView1.Rows.Count != 0)
            {
                for (int i = 0; i < GridView1.Rows.Count; i++)
                {
                    total += decimal.Parse(GridView1.Rows[i].Cells[2].Text);
                }
                lblTotalPrice.Text = string.Concat("Total Price : ", total.ToString("c"));
            }
        }

        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["custEmail"] = User.Identity.GetUserName();
        }



        // ----------------------

        // Catch and handle any exceptions thrown by the object data source's select method
        protected void ObjectDataSource1_Selected(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessage.Text = "Error trying to retrieve from database";
                e.ExceptionHandled = true;
            }
        }
    }
}