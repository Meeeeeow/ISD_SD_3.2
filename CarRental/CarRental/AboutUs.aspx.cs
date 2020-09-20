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
    public partial class AboutUs : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e) //Send Message
        {
            try
            {
               

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO ContactUsList(UserID,Name,Email,MobileNo,Problem,Dateofsending,Solution)" +
                    "values(@UserID,@Name,@Email,@MobileNo,@Problem,@Dateofsending,@Solution)", conn);
                DateTime currentDate = DateTime.Now;
                if(Session["username"] == null)
                    cmd.Parameters.AddWithValue("@UserID", "User");
                else
                    cmd.Parameters.AddWithValue("@UserID", Session["username"].ToString().Trim());
                cmd.Parameters.AddWithValue("@Name", name.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@Email", email.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@MobileNo", phone.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@Problem", message.Value.ToString().Trim());
                cmd.Parameters.AddWithValue("@Dateofsending", currentDate.ToString().Trim());
                cmd.Parameters.AddWithValue("@Solution", "");
                
                

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Your messsage has been saved.Thank you for contacting.');</script>");
                cleartable();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void cleartable() //clears the form
        {
            name.Value = "";
            email.Value = "";
            phone.Value = "";
            message.Value = "";
        }
    }
}