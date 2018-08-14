using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using TravelExpertsWeb.Models;

namespace TravelExpertsWeb.Account
{
    public partial class Register : Page
    {
        // ----  Corinne Mullan ---
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // On the initial page load, set the default value of the customer country text box
                TextBox txtCountry = (TextBox)fvCustomer.FindControl("CustCountryTextBox");
                txtCountry.Text = "Canada";

                // Also populate the values in the drop down list of provinces
                DropDownList ddlProv = (DropDownList)fvCustomer.FindControl("CustProvDDL");
                ddlProv.Items.Add(new ListItem("Alberta", "AB"));
                ddlProv.Items.Add(new ListItem("British Columbia", "BC"));
                ddlProv.Items.Add(new ListItem("Manitoba", "MB"));
                ddlProv.Items.Add(new ListItem("New Brunswick", "NB"));
                ddlProv.Items.Add(new ListItem("Newfoundland and Labrador", "NL"));
                ddlProv.Items.Add(new ListItem("Northwest Territories", "NT"));
                ddlProv.Items.Add(new ListItem("Nova Scotia", "NS"));
                ddlProv.Items.Add(new ListItem("Nunavut", "NU"));
                ddlProv.Items.Add(new ListItem("Ontario", "ON"));
                ddlProv.Items.Add(new ListItem("Prince Edward Island", "PE"));
                ddlProv.Items.Add(new ListItem("Quebec", "QC"));
                ddlProv.Items.Add(new ListItem("Saskatchewan", "SK"));                
                ddlProv.Items.Add(new ListItem("Yukon", "YT"));
            }          
        }

        // When the clear button is clicked, simply reload the page.  All fields will be
        // reset.  This allows a single "Clear" button to be used for both forms.
        protected void Clear_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Account/Register.aspx");
        }
        // ----------------------

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            // ----  Corinne Mullan ---
            // Read the email from the customer email text box within the form view,
            // so it can be used by the automatically generated code below when creating
            // the user account.  (The provided email text box has been deleted so as not
            // to duplicate the customer email in the formview that is bound to the 
            // CustEmail field of the Customers table in the Travel Experts database.)
            TextBox Email = (TextBox)fvCustomer.FindControl("CustEmailTextBox");
            // ----------------------

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
            var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
            IdentityResult result = manager.Create(user, Password.Text);
            if (result.Succeeded)
            {
                // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                //string code = manager.GenerateEmailConfirmationToken(user.Id);
                //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");

                // ----  Corinne Mullan ---
                // If the user account was successfully created, proceed to add a new 
                // record in the Customers table in the TravelExperts database.
                try
                {
                    fvCustomer.InsertItem(true);
                    ErrorMessage.Text = "Customers table updated!";
                }
                catch
                {
                    ErrorMessage.Text = "Error updating the database";
                    return;
                }
                // ----------------------

                signInManager.SignIn( user, isPersistent: false, rememberBrowser: false);
                IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
            }
            else 
            {
                ErrorMessage.Text = result.Errors.FirstOrDefault();
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

        // Catch and handle any exceptions thrown by the object data source's insert method
        protected void ObjectDataSource1_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                ErrorMessage.Text = "Error trying to add record to database";
                e.ExceptionHandled = true;
            }
        }


    }
}