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
    public partial class ViewCarsUser : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; 
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = Session["user"];
            if(user!=null )
                if(!IsPostBack)
                    CheckIfUserHasRented(); //check on page load if user has already rented a car
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e) //row select
        {
           
            if (e.CommandName == "Select")
            {
                //Determine the RowIndex of the Row whose Button was clicked.
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow selectedRow = GridView1.Rows[rowIndex];
                
                String carId = selectedRow.Cells[0].Text.Trim();
                Session["carid"] = selectedRow.Cells[0].Text.Trim();
                Session["services"] = selectedRow.Cells[1].Text.Trim();
                int currentStock = Convert.ToInt32((selectedRow.FindControl("StockPresent") as Label).Text.Trim());//changes
                Session["taka"] = (selectedRow.FindControl("Costing") as Label).Text.Trim();
                if (currentStock < 1)//changes
                    Response.Write("<script>alert('Sorry! This car is not available now');</script>");

                GetImage(carId);

                
                if (rowIndex == 0 || rowIndex == 3 || rowIndex == 2)
                    Response.Redirect("Yaris.aspx");
                if (rowIndex == 1)
                    Response.Redirect("Axio.aspx");
                if (rowIndex == 4)
                    Response.Redirect("Vellfire.aspx");
            }
        }
        protected void CheckIfUserHasRented()
        {
            DateTime currentdate = DateTime.Now;
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                
                SqlCommand cmd = new SqlCommand("SELECT * FROM OrderDetails WHERE Userid='" + Session["username"].ToString().Trim() + "' ", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                foreach (DataRow row in da.Rows)
                {
                    
                    if (row["returndate"].ToString().Trim() != "")
                    {
                     
                        if (currentdate <  Convert.ToDateTime(row["returndate"].ToString().Trim()))
                        {
                            GridView1.Enabled = false;
                            Response.Write("<script>alert('Sorry! You are not allowed to rent any car now at this moement.You have already rented a car.');</script>");
                            break;
                        }
                    }

                }
               
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        void GetImage( String carid) //get image of the car for later use in order and payment
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CarDetails WHERE CarID='" + carid.ToString().Trim() + "' ", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        //Creating session variable
                       Session["imagepath"] = dr.GetValue(17).ToString();
            
                    }
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
            
        }

        

        
    }
}