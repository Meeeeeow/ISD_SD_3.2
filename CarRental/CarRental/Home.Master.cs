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
    public partial class Home : System.Web.UI.MasterPage
    {
        int count = 0;
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            
                
            //when not logged in
            try
            {
                if (Session["role"].Equals(""))
                {
                    //setting for default
                    LinkButton1.Visible = true;//login
                    LinkButton2.Visible = true;//signup

                    LinkButton3.Visible = false;//logout
                    LinkButton5.Visible = false;//welcome msg

                    //footer
                    LinkButton7.Visible = true;
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    ServiceButton.Visible = false;

                }
                //if   the human is an user
                else if (Session["role"].Equals("user"))
                {
                    //setting for the human
                    if (!IsPostBack)
                        SavedCartNotification();
                    LinkButton1.Visible = false;//login
                    LinkButton2.Visible = false;//signup

                    LinkButton3.Visible = true;//logout
                    LinkButton5.Visible = true;//welcome msg
                    LinkButton5.Text = "Hello " + Session["username"].ToString();
                    //footer
                    LinkButton7.Visible = true;
                    LinkButton11.Visible = false;
                    LinkButton12.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton9.Visible = false;
                    LinkButton10.Visible = false;
                    ServiceButton.Visible = false;
                }
                else if (Session["role"].Equals("admin"))
                {
                    if(!IsPostBack)
                        Sendnotification();
                    //setting for only meeeee ^~^
                    LinkButton1.Visible = false;//login
                    LinkButton2.Visible = false;//signup

                    LinkButton3.Visible = true;//logout
                    LinkButton5.Visible = true;//welcome msg
                    LinkButton5.Text = "Welome Master!";
                    //footer
                    LinkButton7.Visible = false;
                    LinkButton11.Visible = true;
                    LinkButton12.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton9.Visible = true;
                    LinkButton10.Visible = true;
                    ServiceButton.Visible = true;
                }
            }
            catch(Exception ex)
            {

            }
        }
        //LinkButtons
        protected void LinkButton7_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AdminLogin.aspx");
        }

        protected void LinkButton11_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCarBrand.aspx");
        }

        protected void LinkButton12_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminCarModel.aspx");
        }
        protected void ServiceButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminServices.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Response.Redirect("carInventoryAdmin.aspx");
        }

        protected void LinkButton10_Click(object sender, EventArgs e)
        {
            Response.Redirect("Membermanagement.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserLogin.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserSignUp.aspx");
        }
        //Logout
        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Session["username"] = "";
            Session["fullname"] = "";
            Session["role"] = "";
            Session["status"] = "";
            //setting for default
            LinkButton1.Visible = true;//login
            LinkButton2.Visible = true;//signup

            LinkButton3.Visible = false;//logout
            LinkButton5.Visible = false;//welcome msg

            //footer
            LinkButton7.Visible = true;
            LinkButton11.Visible = false;
            LinkButton12.Visible = false;
            LinkButton8.Visible = false;
            LinkButton9.Visible = false;
            LinkButton10.Visible = false;

            //redirect
            Response.Redirect("Homepage.aspx");
        }
        //Profile
        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }
        protected void Sendnotification()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                if(Session["role"].Equals("admin"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM ContactUsList", conn);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    count = Convert.ToInt32(dt.Rows.Count.ToString());
                    notification1.Text = count.ToString();
                    notification2.Text = count.ToString();
                    repeater1.DataSource = dt;
                    repeater1.DataBind();
                    
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }

        public string GetTwentyCharacter(object myvalues)
        {
            string a;
            a = Convert.ToString(myvalues.ToString());
            string b = "";
            if(a.Length>=10)
            {
                b = a.Substring(0, 10);
                return b.ToString() + "...";
            }
            else
            {
                b = a.ToString();
                return b.ToString();
            }
        }

        protected void SavedCartNotification()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                if (Session["role"].Equals("user"))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM SavedCart WHERE UserID='" + Session["username"].ToString().Trim() + "'", conn);
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    count = Convert.ToInt32(dt.Rows.Count.ToString());
                    savedcartcount.Text = count.ToString();


                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void LinkButton9_Click(object sender, EventArgs e)
        {
            Response.Redirect("PaymentAdmin.aspx");
        }
    }
}