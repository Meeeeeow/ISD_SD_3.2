using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class PaymentgateWay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<form action='http://www.sandbox.paypal.com/cgi-bin/webscr' method ='post' name='buyCredits' id='buyCredits'>");
            Response.Write("<input type='hidden' name ='cmd' value='_xclick'>");
            Response.Write("<input type='hidden' name ='business' value='bsx@gmail.com'>");
            Response.Write("<input type='hidden' name ='currency_code' value='USD'>");
            Response.Write("<input type='hidden' name ='item_name' value='payment for donate'>");
            Response.Write("<input type='hidden' name ='item_number' value='0'>");
            Response.Write("<input type='hidden' name ='amount' value='"+ Session["grand_total"].ToString() + "'>");
            Response.Write("<input type='hidden' name ='return' value='http://localhost:12182/payment_success.aspx?userid="+Session["username"].ToString()+"'>");
            Response.Write("</form>");

            Response.Write("<script type='text/javascript'>");
            Response.Write("document.getElementById('buyCredits').submit();");
            Response.Write("</script>");
        }
    }
}