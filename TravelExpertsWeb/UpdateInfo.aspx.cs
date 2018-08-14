using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TravelExpertsWeb
{
    public partial class UpdateInfo : System.Web.UI.Page
    {
        // ----- Corinne Mullan -----
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                // On the initial page load, confirm that a user is logged in.
                // If no user is logged in, redirect back to the log in page.
                if (User?.Identity.IsAuthenticated == false)
                {
                    Response.Redirect("~/Account/Login.aspx");
                }
            }
        }

        // When the ObjectDataSource for the formview is used to select the customer data
        // for the currently logged in user, pass the user's email to the SQL query parameter.
        protected void ObjectDataSource1_Selecting(object sender, ObjectDataSourceSelectingEventArgs e)
        {
            e.InputParameters["custEmail"] = User.Identity.GetUserName();
            
        }

        // Catch and handle any exceptions thrown by the object data source's update method
        protected void ObjectDataSource1_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessage.Text = "Error trying to update database";
                e.ExceptionHandled = true;
            }
        }

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
        // --------------------------
}