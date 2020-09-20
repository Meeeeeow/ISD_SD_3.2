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
    public partial class SavedCart : System.Web.UI.Page
    {
        double grand_total = 0;
        int rows = 0;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Grand_Total();
           

        }
        protected void GridView1_RowDataBound(object sender , GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                Session["order"] = item;
                foreach (Button button in e.Row.Cells[7].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        button.Attributes["onclick"] = "if(!confirm('Do you want to delete order no. " + item + "?')){ return false; };";
                    }
                }
            }
                
            
        }
        bool First_Payment()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM paymentDetail WHERE UserID='" +Session["username"].ToString().Trim() + "'", conn);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
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
        
        protected void Grand_Total()
        {
            
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SavedCart where UserID='" + Session["username"].ToString().Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                
                
                    
                foreach(DataRow row in da.Rows)
                {
                    grand_total += Convert.ToInt32(row["GrandTotal"].ToString().Trim());
                    rows++;
                }
                if(First_Payment() == true)
                {
                    TextBox1.Text = grand_total.ToString();
                    Session["grand_total"] = grand_total;
                }
                else
                {
                    grand_total = grand_total - (grand_total * 0.1);
                    TextBox1.Text = grand_total.ToString();
                    Session["grand_total"] = grand_total;
                }

                
                if (rows == 2)
                {
                    Response.Write("<script>alert('You are requested to checkout your cart first!');</script>");

                    backButton.Attributes["style"] = "pointer-events:none; opacity:0.5; ";
                    backButton.Attributes.Add("class", "text-muted");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                

            }
        }

       
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var grand_value = Convert.ToDouble(TextBox1.Text.Trim());
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM SavedCart where OrderId ='" + Session["order"].ToString().Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                foreach (DataRow row in da.Rows)
                {
                    if(First_Payment() == true)
                    {
                        var subtotal = row["GrandTotal"].ToString().Trim();
                        grand_value = grand_value - Convert.ToInt32(subtotal);
                        TextBox1.Text = grand_value.ToString();
                        Session["grand_total"] = grand_value;
                    }
                    else
                    {
                        var subtotal = row["GrandTotal"].ToString().Trim();
                        grand_value = grand_value - (Convert.ToDouble(subtotal) - Convert.ToDouble(subtotal) * 0.1);
                        var grand_total = grand_value;
                        TextBox1.Text = grand_total.ToString();
                        Session["grand_total"] = grand_total;
                    }
                    rows--;
                    var rowing = rows;
                    if (rowing < 2)
                    {
                        backButton.Attributes["style"] = "pointer-events:auto; opacity:1; ";
                        backButton.Attributes["class"] = backButton.Attributes["class"].Replace("text-muted", "").Trim();
                    }

                }
                

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}