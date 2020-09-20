using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class PaymentAdmin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; 
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void OldOrderDetails() //delete old order and payment id
        {
            DateTime currntDate = DateTime.Now;
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM OrderDetails", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                foreach (DataRow row in da.Rows)
                {
                    var orderedTime = Convert.ToDateTime(row["Ordertime"].ToString().Trim());
                    if(orderedTime.Date.AddDays(10) ==  currntDate.Date)
                    {
                        SqlCommand cmd1 = new SqlCommand("DELETE FROM OrderDetails WHERE Orderid ='"+ row["Orderid"].ToString().Trim() +"'", conn);
                        cmd1.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("DELETE FROM PaymentDetail WHERE orderid ='" + row["Orderid"].ToString().Trim() + "'", conn);
                        cmd2.ExecuteNonQuery();

                    }
                    

                }
                GridView1.DataBind();//payment
                GridView2.DataBind();//order
                

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}