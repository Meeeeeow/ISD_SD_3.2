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
    
    public partial class payment_success : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        string user = "";
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Order_deatils(); //save the order details
                PaymentInfo(); //save the payment info along with the last order
            }

        }

        void PaymentInfo()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                user = Request.QueryString["userid"].ToString().Trim();
               
                    SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg WHERE UserID='" + Session["username"].ToString() + "'", conn);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    foreach(DataRow dr in dt.Rows)
                    {
                        SqlCommand cmd1 = new SqlCommand("INSERT INTO PaymentDetail(userid,orderid,ordertime,fullname,city,location,address,mobile,email,totalpaid)" +
                    "values(@userid,@orderid,@ordertime,@fullname,@city,@location,@address,@mobile,@email,@totalpaid)", conn);

                        cmd1.Parameters.AddWithValue("@userid", dr["UserID"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@orderid", Session["LastOrderID"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@ordertime", Session["LastCurrentTime"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@fullname", dr["FullName"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@city", dr["City"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@location", dr["Location"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@address", dr["Address"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@mobile", dr["ContactNumber"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@email", dr["EmailID"].ToString().Trim());
                        cmd1.Parameters.AddWithValue("@totalpaid", Session["grand_total"].ToString().Trim());
                        cmd1.ExecuteNonQuery();
                        
                    }

                conn.Close();
                DeleteCart(); //delete saved cart when completes payment

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void Order_deatils()
        {
            var orderid="";
           var curtime = "";
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                user = Request.QueryString["userid"].ToString().Trim();
               
                SqlCommand cmd = new SqlCommand("SELECT * FROM SavedCart WHERE UserID='" + Session["username"].ToString() + "'", conn);
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                foreach(DataRow dr in dt.Rows)
                {
                    orderid = dr["OrderId"].ToString().Trim();
                    var carid = dr["Carid"].ToString().Trim();
                    var pickdate = dr["PickupDate"].ToString().Trim();
                    var retdate = dr["ReturnDate"].ToString().Trim();
                    var costvalue = dr["CostPerValue"].ToString().Trim();
                    DateTime currenttime = DateTime.Now;
                    curtime = currenttime.ToString().Trim();
                    var service = dr["Service"].ToString().Trim();
                    var rentday = dr["RentalDays"].ToString().Trim();
                    
                        SqlCommand cmd1 = new SqlCommand("INSERT INTO OrderDetails(Orderid,Userid,Carid,pickupdate,returndate,Costitem,Grandtotal,Ordertime,Servicetaken,rentaldays)" +
                    "values(@Orderid,@Userid,@Carid,@pickupdate,@returndate,@Costitem,@Grandtotal,@Ordertime,@Servicetaken,@rentaldays)", conn);

                     cmd1.Parameters.AddWithValue("@Orderid", orderid.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Userid", Session["username"].ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Carid", carid.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@pickupdate", pickdate.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@returndate", retdate.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Costitem", costvalue.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Grandtotal", Session["grand_total"].ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Ordertime",curtime.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@Servicetaken", curtime.ToString().Trim());
                     cmd1.Parameters.AddWithValue("@rentaldays", rentday.ToString().Trim());
                     cmd1.ExecuteNonQuery();


                    cmd1 = new SqlCommand("Update CarDetails  SET currentStock = (currentStock - 1) WHERE CarID ='" + carid.ToString().Trim() + "'", conn);
                    cmd1.ExecuteNonQuery();
                }
                Session["LastOrderID"] = orderid; //get the last issued order
                Session["LastCurrentTime"] = curtime; //last issued time of the order
                conn.Close();
                

                
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void DeleteCart()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); 
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM SavedCart WHERE UserID='" + Session["username"].ToString().Trim() + "'", conn);
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Your cart is now empty!');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        
    }
}