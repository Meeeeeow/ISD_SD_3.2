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
    public partial class Membermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }

        protected void LinkButton4_Click(object sender, EventArgs e)//go
        {
            Getuserid();
        }
        bool checkIfUserExists()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg where UserID='" + TextBox2.Text.Trim() + "';", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }
        void Getuserid()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg WHERE UserID='" + TextBox2.Text.Trim() + "'", conn);//Member ID
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {

                        TextBox1.Text= dr.GetValue(1).ToString(); //Full Name
                        TextBox7.Text = dr.GetValue(14).ToString();//Account Status
                        TextBox3.Text = dr.GetValue(0).ToString();//NID
                        TextBox4.Text = dr.GetValue(8).ToString();//contact
                        TextBox5.Text = dr.GetValue(5).ToString();//date of birth
                        TextBox6.Text = dr.GetValue(4).ToString();//city
                        TextBox9.Text = dr.GetValue(7).ToString();//occupation
                        TextBox8.Text = dr.GetValue(12).ToString();//email
                        TextBox10.Text = dr.GetValue(2).ToString();//full address
                        
                    }
                   
                }
                else
                    Response.Write("<script>alert('UserID doesnot exist');</script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)//accept
        {
            Updatememberstatus("active");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)//pending
        {
            Updatememberstatus("pending");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)//delete
        {
             Updatememberstatus("deactive");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Deleteuser();
        }
        void Updatememberstatus(string status)
        {
            if (checkIfUserExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE UserReg SET AccStatus='" + status + "' WHERE UserID='" + TextBox2.Text.Trim() + "'", conn);//member id
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('User Status Updated');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('User ID doesnot exist!');</script>");
            }
        }
        void Deleteuser()
        {
            if(checkIfUserExists())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open(); //connection open plz
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM UserReg WHERE UserID='" + TextBox2.Text.Trim() + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('User deleted successfully!');</script>");
                    cleartable();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('UserID doesnot exist!');</script>");
            }
        }
        void cleartable()
        {
            TextBox1.Text = "";
            TextBox7.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox9.Text = "";
            TextBox8.Text = "";
            TextBox10.Text= "";
        }      
    }
}