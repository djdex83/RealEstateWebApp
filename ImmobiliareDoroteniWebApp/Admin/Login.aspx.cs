using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MarcoElleWebApp.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnsubmitClick(object sender, EventArgs e)
        {
            try
            {
                if (username.Value.Equals("immobiliare") && adminpassword.Value.Equals("sdoroteni"))
                {
                    Session.Add("username", username.Value.ToString());
                    Session.Add("password", username.Value.ToString());
                    Response.Redirect("Home.aspx",false);

                }
                else
                {
                    
                }
            }
            catch (Exception ex)
            {
               
            }
        }
    }

    
}