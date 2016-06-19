using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// required for Identity and OWIN Security
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using SendGrid;
using System.Net.Mail;

/*
* @File name : Registration page 
* @Author : Ritesh Patel and Parvati Patel
* @Website name : GameTracking(http://gametracking.azurewebsites.net/)
* @File description : This is registration page.  
*/
namespace GameTracking.AdminPanel
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Redirect back to the Default page
            Response.Redirect("~/Default.aspx");
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            // create new userStore and userManager objects
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);

            // create a new user object
            var user = new IdentityUser()
            {
                UserName = UserNameTextBox.Text,
                PhoneNumber = PhoneNumberTextBox.Text,
                Email = EmailTextBox.Text
            };

            // create a new user in the db and store the result 
            IdentityResult result = userManager.Create(user, PasswordTextBox.Text);
           
            // check if successfully registered
            if (result.Succeeded)
            {
                //send email confirmation
                SendMailConfirm(user);


                // authenticate and login our new user
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                // sign in 
                authenticationManager.SignIn(new AuthenticationProperties() { }, userIdentity);

                // Redirect to the Main Menu page
                Response.Redirect("~/Contoso/MainMenu.aspx");
            }
            else
            {
                // display error in the AlertFlash div
                StatusLabel.Text = result.Errors.FirstOrDefault();
                AlertFlash.Visible = true;
            }
        }

        private void SendMailConfirm(IdentityUser user)
        {
            // "Confirm your account","Please confirm your account by clicking this link: <a href=\"" + callbackUrl + "\">link</a>");
            SendGridMessage myMessage = new SendGridMessage();
            myMessage.AddTo(user.Email);
            myMessage.From = new MailAddress("testwebritz@gmail.com", "Ritesh Patel");
            myMessage.Subject = "Confirm your account";
            myMessage.Text = " Hi " + user.UserName + "\n\n Please confirm your account by clicking below link\n\n "+"https://gametracking.azurewebsites.net/ConfirmEmail.aspx?UID=" + user.Id +"  \n\n Thank you. ";

            // Create a Web transport, using API Key
            var transportWeb = new Web("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");

            // Send the email.
            transportWeb.DeliverAsync(myMessage);

            //redirect page
            Response.Redirect("ConfitmMessage.aspx");
        }
    }
}