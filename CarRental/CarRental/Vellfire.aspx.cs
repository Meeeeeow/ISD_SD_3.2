using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class Vellfire : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {

            if (Session["role"] == null)//if  not logged in
            {
                Response.Write("<script>alert('You are not logged in!Please Log in first.');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                if (String.Equals(Session["status"], "active"))//if status is deactivated
                {
                    Response.Redirect("DrivingOptions.aspx");

                }
                else
                {
                    Response.Write("<script>alert('Status not activated.');</script>");
                }

            }
        }
    }
}