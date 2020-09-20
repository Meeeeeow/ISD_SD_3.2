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
    public partial class UserProfile : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
            try
            {
                if(Session["username"].ToString() == "" || Session["username"] == null)
                {
                    Response.Write("<script>alert('Session Expired Login Again');</script>");
                    Response.Redirect("UserLogin.aspx");
                }
                else
                {
                   
                    if (!Page.IsPostBack)
                    {
                        getUserPersonalDetails();
                    }
                }

            }catch(Exception ex)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
        }
        //update button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Session["username"].ToString() == "" || Session["username"] == null)
            {
                Response.Write("<script>alert('Session Expired Login Again');</script>");
                Response.Redirect("UserLogin.aspx");
            }
            else
            {
                updateUserPersonalDetails();
            }
        }


        //user definition function
        void updateUserPersonalDetails()
        {
            string password = "";
            if(TextBox19.Text.Trim() == "")
            {
                password = TextBox9.Text.Trim();
            }
            else
            {
                password = TextBox19.Text.Trim();
            }
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("UPDATE UserReg SET " +
                    "UserID = @UserID , Password = @Password , AccStatus = @AccStatus WHERE UserID='"+ 
                    Session["username"].ToString().Trim() + "'" , con );
                cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@AccStatus", "pending");

                int result = cmd.ExecuteNonQuery();
                con.Close();
                if(result > 0)
                {
                    Response.Write("<script>alert('Your Details Updated Successfully');</script>");
                    getUserPersonalDetails();
                    
                }
                else
                {
                    Response.Write("<script>alert('Invaid entry');</script>");
                }

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        void getUserPersonalDetails()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg WHERE  UserID = '" +
                    Session["username"].ToString().Trim() + "'", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                TextBox3.Text = dt.Rows[0]["FullName"].ToString().Trim();
                TextBox4.Text = dt.Rows[0]["BirthDate"].ToString().Trim();
                TextBox5.Text = dt.Rows[0]["ContactNumber"].ToString().Trim();
                TextBox6.Text = dt.Rows[0]["EmailID"].ToString().Trim();
                TextBox7.Text = dt.Rows[0]["NidNumber"].ToString().Trim();
                TextBox12.Text = dt.Rows[0]["Location"].ToString().Trim();
                TextBox11.Text = dt.Rows[0]["Gender"].ToString().Trim();
                TextBox8.Text = dt.Rows[0]["Address"].ToString().Trim();
                TextBox10.Text = dt.Rows[0]["Occupation"].ToString().Trim();
                TextBox2.Text = dt.Rows[0]["Nationality"].ToString().Trim();

                Label2.Text = dt.Rows[0]["AccStatus"].ToString().Trim();

                if(dt.Rows[0]["AccStatus"].ToString().Trim() == "active")
                {
                    Label2.Attributes.Add("class", "badge badge-pill badge-success");
                }else if(dt.Rows[0]["AccStatus"].ToString().Trim() == "pending")
                {
                    Label2.Attributes.Add("class", "badge badge-pill badge-warning");
                }
                else if(dt.Rows[0]["AccStatus"].ToString().Trim() == "deactive")
                {
                    Label2.Attributes.Add("class", "badge badge-pill badge-danger");
                }
                else
                {
                    Label2.Attributes.Add("class", "badge badge-pill badge-info");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                
                foreach (Button button in e.Row.Cells[7].Controls.OfType<Button>())
                {
                    if (button.CommandName == "Delete")
                    {
                        Session["order"] = item;
                    }
                }
            }


        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM OrderDetails where OrderId ='" + Session["order"].ToString().Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                foreach (DataRow row in da.Rows)
                {
                    DateTime currentTime = DateTime.Now;
                    var retdate = row["returndate"].ToString().Trim();
                    var carid = row["Carid"].ToString().Trim(); 
                    if (retdate != "")
                    {
                        var retDate = Convert.ToDateTime(retdate);
                        if (currentTime > retDate)
                        {
                            var extraDays = (currentTime - retDate).TotalDays;
                            Response.Write("<script>alert('You have to pay extra charge for this " + extraDays + "and your status will change to pending. ');</script>");
                            cmd = new SqlCommand("UPDATE UserReg SET AccStatus = 'pending'  WHERE  UserID = '" +
                                Session["username"].ToString().Trim() + "'", conn);
                            cmd.ExecuteNonQuery();



                        }
                    }
                    cmd = new SqlCommand("Update CarDetails  SET currentStock = (currentStock + 1) WHERE CarID ='" + carid.ToString().Trim() + "'", conn);
                    cmd.ExecuteNonQuery();
                    Response.Write("<script>alert('Thank you for being with us.');</script>");




                }
                conn.Close();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
           
        }
    }
}