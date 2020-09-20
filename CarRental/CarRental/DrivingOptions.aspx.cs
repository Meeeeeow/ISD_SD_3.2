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
    public partial class DrivingOptions : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        int grand_value = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            btnSubmits.Attributes["style"] = "visibility:hidden;";
            btnSubmit.Attributes["style"] = "visibility:hidden;";
            RetDate.Visible = true;
            RetTime.Visible = true;
            DriveReturn.Visible = true;
            DriveReturnTime.Visible = true;
            round_trip.Visible = false;
            round_trip1.Visible = false;
            count_hours_1.Visible = false;
            count_hours.Visible = false;
            //Auto input driving license
            var user = Session["username"];
            var service = Session["services"];
            if (user != null && service != null)
            {
                Checkdrivinglicense();//check for license  if not self driving will be disabled 
                AirportService(); //Page reworked
            }
            //Visibility
            
            


        }
        void Checkdrivinglicense() //driving license check if true show or else blur
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                //License checked according to user name
                SqlCommand cmd = new SqlCommand("SELECT DrivingLicense  FROM UserReg WHERE UserID ='" + Session["username"].ToString() + "';", conn);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    string LicenseNumber = Convert.ToString(rd["DrivingLicense"]);
                    if (LicenseNumber.Trim() == "")
                    {
                        selfDriving.Attributes["style"] = "opacity:0.5; pointer-events:none;"; //no click events for div
                    }
                    else
                    {
                        LicenseNo.Value = LicenseNumber.ToString().Trim(); //show license number
                    }

                }
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                

            }
        }

        protected int SubTotal(double days, int hours, int hours_rate) //grand value of each item  of how musch it costs 
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("SELECT Cost  FROM CarDetails WHERE CarID ='" + Session["carid"].ToString() + "'", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                int rows = da.Rows.Count;
                foreach(DataRow row in da.Rows)//to get grand total of each item
                {
                    if(hours_rate == 1)
                        grand_value += Convert.ToInt32(row["Cost"].ToString().Trim()) * (int)days * hours;
                    else
                        grand_value += Convert.ToInt32(row["Cost"].ToString().Trim()) * (int)days + hours_rate;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            return grand_value;
        }


        protected void btnSubmits_Click(object sender, EventArgs e)//save the cart of user in db ; self driver 
        {
            addsavedcart();
        }
        void addsavedcart()
        {
            if(checkDate() == true) //checks for dates smaller than current date = invalid
            {
                Response.Write("<script>alert('Invalid date given');</script>");
            }
            else
            {
                var PickupDate = Pickup.Value;
                var Driverpickdate = DriverPickup.Value;
                var ReturnDate = "";
                var DriverretDate = "";
                double days = 1;
                int hours = 1;
                int hours_rate = 1;
                var pickuploc = location_self.Value.ToString();
                var driverpickup = location_driver.Value.ToString();
                var total_price = Session["taka"];
                Session["tot_price"] = total_price;
                if (Session["services"].ToString() == "Airport Transfer")
                {

                }
                else if(Session["services"].ToString() == "Hourly Rate")//if hourly get hours
                {
                    if (count_hours_text.Text.ToString().Trim() == "")
                    {
                        string hours_str = count_hours_text_1.Text.ToString();
                        hours = Int32.Parse(hours_str);
                    }
                    else
                        hours = Convert.ToInt32(count_hours_text.Text.ToString().Trim());
                    if (hours > 4)
                        hours_rate = (hours - 4) * 3; //if hours is more than 4 extra 250 added
                    
                    
                }
                else if (Session["services"].ToString() == "Daily Basis" || Session["services"].ToString() == "Monthly Car Rental")
                {
                    //get days from monthly and daily
                    ReturnDate = returndate.Value;
                    DriverretDate = DriverReturn.Value;
                    if(DriverretDate.ToString().Trim() != "" )
                        days = (Convert.ToDateTime(DriverretDate) - Convert.ToDateTime(Driverpickdate)).TotalDays;
                    else if(ReturnDate.ToString().Trim() != "")
                        days = (Convert.ToDateTime(ReturnDate) - Convert.ToDateTime(PickupDate)).TotalDays;



                }
                if (CheckDaysExceed() == true && Session["services"].ToString() == "Daily Basis" || Session["services"].ToString() == "Monthly Car Rental")
                {
                    //if days are >5  in monthly and  >15 in daily it will return true 
                }
                else
                {
                    total_price = SubTotal(days, hours, hours_rate);//go to subtotal to find price of each item
                    Session["tot_price"] = total_price;


                    //save these in SavedCart datatable
                    try
                    {
                        SqlConnection conn = new SqlConnection(strcon);
                        if (conn.State == ConnectionState.Closed)
                        {
                            conn.Open(); //connection open plz
                        }
                        SqlCommand cmd = new SqlCommand("INSERT INTO SavedCart(UserID,Carid,Service,PickupDate,ReturnDate,RentalDays,CostPerValue,GrandTotal,CarImage,PickupLocation)" +
                            "values(@UserID,@Carid,@Service,@PickupDate,@ReturnDate,@RentalDays,@CostPerValue,@GrandTotal,@CarImage,@PickupLocation)", conn);
                        cmd.Parameters.AddWithValue("@UserID", Session["username"].ToString().Trim());
                        cmd.Parameters.AddWithValue("@Carid", Session["carid"].ToString().Trim());
                        cmd.Parameters.AddWithValue("@Service", Session["services"].ToString().Trim());
                        if(PickupDate.ToString().Trim() != "")
                            cmd.Parameters.AddWithValue("@PickupDate", PickupDate.ToString().Trim());
                        else
                            cmd.Parameters.AddWithValue("@PickupDate", Driverpickdate.ToString().Trim());
                        if (Session["services"].ToString() == "Airport Transfer")
                        {
                            cmd.Parameters.AddWithValue("@ReturnDate", "");
                            cmd.Parameters.AddWithValue("@RentalDays", 1);
                        }
                        else
                        {
                           if(ReturnDate.ToString().Trim() != "")
                                cmd.Parameters.AddWithValue("@ReturnDate", ReturnDate.ToString().Trim());
                           else
                                cmd.Parameters.AddWithValue("@ReturnDate", DriverretDate.ToString().Trim());
                            cmd.Parameters.AddWithValue("@RentalDays", days.ToString().Trim());
                        }
                        cmd.Parameters.AddWithValue("@CostPerValue", Session["taka"].ToString().Trim());
                        cmd.Parameters.AddWithValue("@GrandTotal", total_price.ToString().Trim());
                        cmd.Parameters.AddWithValue("@CarImage", Session["imagepath"]);
                        if(pickuploc.ToString().Trim() != "")
                            cmd.Parameters.AddWithValue("@PickupLocation", pickuploc.ToString().Trim());
                        else
                            cmd.Parameters.AddWithValue("@PickupLocation", driverpickup.ToString().Trim());

                        cmd.ExecuteNonQuery();
                        conn.Close();

                        Response.Redirect("SavedCart.aspx");


                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('" + ex.Message + "');</script>");

                    }
                }
            }
            
           
            
        }
        bool CheckDaysExceed()//for checking the dates in monthly and daily
        {
            //2 parts one is with driver and other is self driving bothe needs to be checked
            if (Session["services"].ToString() == "Airport Transfer" || Session["services"].ToString() == "Hourly Rate")
                return false;
            var PickupDate = Pickup.Value;
            var ReturnDate = "";
            
            var DriverretDate = "";
            double days = 1;
            
            ReturnDate = returndate.Value;
            var Driverpickdate = DriverPickup.Value;
            DriverretDate = DriverReturn.Value;



                if (DriverretDate.ToString().Trim() != "")
                    days = (Convert.ToDateTime(DriverretDate) - Convert.ToDateTime(Driverpickdate)).TotalDays;
                else if (ReturnDate.ToString().Trim() != "")
                    days = (Convert.ToDateTime(ReturnDate) - Convert.ToDateTime(PickupDate)).TotalDays;
                if (days > 5 && Session["services"].ToString() == "Monthly Car Rental") //monthly return true if days > 5
                {
                    Response.Write("<script>alert('Please switch to daily basis for more days!');</script>");
                    return true;

                }
                if (days > 15 && Session["services"].ToString() == "Daily Basis") //daily return true if days >15
                {
                    Response.Write("<script>alert('You are not allowed to rent cars more than 15 days!');</script>");
                    return true;
                }
            
            return false;
        }

        protected void check_CheckedChanged(object sender, EventArgs e) //checkbox changed to hide or show button
        {
            if (check.Checked)
            {
                btnSubmits.Attributes["style"] = "visibility:visible;";
                withDriver.Attributes["style"] = "opacity:0.5; pointer-events:none;";
            }
            else
            {
                btnSubmits.Attributes["style"] = "visibility:hidden;";
                withDriver.Attributes["style"] = "opacity:1; pointer-events:auto;";
            }
        }
        protected void check1_CheckedChanged(object sender, EventArgs e)//with driver
        {
            if (CheckDriver.Checked)
            {
                btnSubmit.Attributes["style"] = "visibility:visible;";
                selfDriving.Attributes["style"] = "opacity:0.5; pointer-events:none;";
            }
            else
            {
                btnSubmit.Attributes["style"] = "visibility:hidden;";
                selfDriving.Attributes["style"] = "opacity:1; pointer-events:auto;";
            }
        }
        protected void check2_CheckedChanged(object sender, EventArgs e)//for round trip
        {
            if (CheckRound.Checked || CheckRound1.Checked)
            {
                Session["taka"] =  Convert.ToInt32(Session["taka"]) + 6;
            }
            
        }
        protected void AirportService()//airport service page reworked
        {
            if (Session["services"].ToString() == "Airport Transfer")
            {
                RetDate.Visible = false;
                RetTime.Visible = false;
                DriveReturn.Visible = false;
                DriveReturnTime.Visible = false;
                round_trip.Visible = true;
                round_trip1.Visible = true;
            }
            if (Session["services"].ToString() == "Hourly Rate")//hourly page reworked
            {
                RetDate.Visible = false;
                RetTime.Visible = false;
                DriveReturn.Visible = false;
                DriveReturnTime.Visible = false;
                count_hours.Visible = true;
                count_hours_1.Visible = true;
            }
        }
  

        bool checkDate()//checks if entered previous dates
        {
            var selfpick = Pickup.Value;
            var driverpick = DriverPickup.Value;
            DateTime currentDate = DateTime.Now;
            if (selfpick == "")
            {
                DateTime compareDate1 = Convert.ToDateTime(this.DriverPickup.Value.Trim());
                if (currentDate > compareDate1)
                    return true;
            }
            else
            {
                DateTime compareDate = Convert.ToDateTime(this.Pickup.Value.Trim());
                if (currentDate > compareDate)
                    return true;
            }
          
            return false;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)//will inittiate function for with driver side
        {
            addsavedcart();
        }
    }
}