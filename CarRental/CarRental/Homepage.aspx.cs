using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class Homepage : System.Web.UI.Page
    {
        public enum MessageType { Info }; // for script manager
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = Session["username"];
            if(user != null)
                CheckIfTodayisPickupReturnDate(); //check if current date is the pick up or return date

            if (!IsPostBack)
           {
                 
                
               
                if (user != null)
                {
                    
                    if (GetSavedCart()) //if the cart is not empty
                    {
                        lblModalTitle.Text = "Notification for Unchecked Cart";
                        lblModalBody.Text = "You have an unchecked cart.Would you like to take a look?";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
                        upModal.Update(); //update the modal
                        
                    }
                }

           }
        }
        
        protected void Button3_Click(object sender, EventArgs e) //Car price button
        {
            Response.Redirect("ViewCarsUser.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)// offer on weeekends not implemented
        {
            Response.Redirect("ViewCarsUser.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)//button of The best place for service 
        {
            Response.Redirect("Services.aspx");
        }
        bool GetSavedCart()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                var user = Session["username"].ToString();
                SqlCommand cmd = new SqlCommand("SELECT * FROM SavedCart WHERE UserID = '" + Session["username"].ToString().Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                var rows = da.Rows.Count;
                if (da.Rows.Count > 0)
                {
                    return true;
                }
                
               
                
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            return false;
        }

        protected void CheckIfTodayisPickupReturnDate()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                var user = Session["username"].ToString();
                if(user != "")
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM OrderDetails WHERE Userid = '" + Session["username"].ToString().Trim() + "';", conn);
                    SqlDataAdapter dt = new SqlDataAdapter(cmd);
                    DataTable da = new DataTable();
                    dt.Fill(da);
                    foreach (DataRow row in da.Rows)
                    {
                        var pickupDate = Convert.ToDateTime(row["pickupdate"].ToString().Trim());
                        var retdate = row["returndate"].ToString().Trim();
                        var orderid = row["Orderid"].ToString().Trim();
                        DateTime currentDate = DateTime.Now;
                        if (pickupDate.Date == currentDate.Date)
                            Response.Write("<script>alert('You are requested to pickup your order no. " + orderid + " today. ');</script>");
                        if (retdate != "") //check for airport and hourly as no need return date there
                        {
                            var retDate = Convert.ToDateTime(retdate);
                            if (retDate == currentDate)
                                Response.Write("<script>alert('You are requested to return your order no. " + orderid + " today. ');</script>");
                        }
                    }
                }





            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button4_Click(object sender, EventArgs e) // button of About us 
        {
            Response.Redirect("AboutUs.aspx");
        }
    }
}