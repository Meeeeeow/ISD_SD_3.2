using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class UserLogin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //login? are u sure?
        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if(conn.State==System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg WHERE UserID='" + TextBox3.Text.Trim() + "' AND Password='" + TextBox1.Text.Trim() + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if(dr.HasRows)
                {
                    while(dr.Read())
                    {

                        //Creating session variable
                        Session["username"] = dr.GetValue(10).ToString();
                        Session["fullname"] = dr.GetValue(1).ToString();
                        Session["role"] = "user";
                        Session["status"] = dr.GetValue(14).ToString();
                    }
                    Response.Redirect("Homepage.aspx");
                }
                else
                    Response.Write("<script>alert('Invalid User or Password');</script>");

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}