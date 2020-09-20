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
    //lots lots of checking
    public partial class UserSignUp : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString; //connect me ms
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)//submit
        {


            if(Checknid()==true)   
            {
                Response.Write("<script>alert('Sorry! we were not able to vaerify you!');</script>");
            }
            else if(Checknid() == false)
            {
                if (Checkemail())
                {
                    Response.Write("<script>alert('Email already exists');</script>");
                }
                 if (Checkuser())
                {
                    Response.Write("<script>alert('User already exists');</script>");
                }
                 if (CheckAge())
                {
                    Response.Write("<script>alert('Sorry! you are not eligible at this age');</script>");
                }

                else
                {
                    signupnewuser();
                }
            }
            

        }

        bool Checkuser()     //user, are u  already there in our db??
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg where UserID='"+TextBox1.Text.Trim()+"';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                if(da.Rows.Count >=1)
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
            
        
        bool Checkemail()  //no duplicate email
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM UserReg where EmailID='" + TextBox6.Text.Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
                if (da.Rows.Count >= 1)
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
        bool CheckAge() //Are u under 21? user..
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT BirthDate,GETDATE() AS [Today],DATEDIFF(YY,BirthDate,GETDATE())-CASE WHEN DATEADD(YY, DATEDIFF(YY, BirthDate, GETDATE()), BirthDate) > GETDATE() THEN 1 ELSE 0 END AS [Age]  FROM NidList WHERE Nid ='"+ TextBox10.Text.Trim()+"';" , conn);
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    rd.Read();
                    var age = rd.GetInt32(2);
                    if(age<21)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                    
                }
                else
                {
                    return true;
                }
         }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }
            
        }
        bool Checknid() //hmph..let me verify you
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM NidList WHERE Nid ='" + TextBox10.Text.Trim() + "';", conn);
                SqlDataReader rd1 = cmd.ExecuteReader();
                string fname = TextBox3.Text.ToString();
                var ar = TextBox8.Text.ToString();
                var loc = DropDownList1.SelectedItem.ToString();
                var ci = TextBox7.Text.ToString();
                var dateofbirth = TextBox4.Text.ToString();
                var gen = DropDownList2.SelectedItem.ToString();
                var occ = DropDownList3.SelectedItem.ToString();
                var cont = TextBox5.Text.ToString();
                var nation = TextBox2.Text.ToString();
                var driving = License.Text.ToString();
                if (rd1.HasRows)
                {
                    rd1.Read();
                    var fullname = rd1.GetValue(1).ToString();
                    var address = rd1.GetValue(2).ToString();
                    var location = rd1.GetValue(3).ToString();
                    var city = rd1.GetValue(4).ToString().Trim();
                    var dob = rd1.GetValue(5).ToString();
                    var gender = rd1.GetValue(6).ToString().Trim();
                    var occupation = rd1.GetValue(7).ToString();
                    var contact = rd1.GetValue(8).ToString();
                    var nationality = rd1.GetValue(9).ToString();
                    var license = rd1.GetValue(10).ToString();


                    if (fullname != fname || address != ar || location != loc || city != ci || dob != dateofbirth || gender != gen || occupation != occ || contact != cont  || license != driving) //so long checking
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return true;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;

            }
        }
        void signupnewuser() //finally signup
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO UserReg(NidNumber,FullName,Address,Location,City,BirthDate,Gender,Occupation,ContactNumber,Nationality,UserID,Password,EmailID,DrivingLicense,AccStatus)" +
                    "values(@NidNumber,@FullName,@Address,@Location,@City,@BirthDate,@Gender,@Occupation,@ContactNumber,@Nationality,@UserID,@Password,@EmailID,@DrivingLicense,@AccStatus)", conn);

                cmd.Parameters.AddWithValue("@NidNumber", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@FullName", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Location", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@City", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@BirthDate", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Gender", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Occupation", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ContactNumber", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Nationality", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@UserID", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@EmailID", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@DrivingLicense", License.Text.Trim());
                cmd.Parameters.AddWithValue("@AccStatus", "Pending");

                cmd.ExecuteNonQuery();
                conn.Close();
                cleartable();
                Response.Redirect("UserLogin.aspx");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void cleartable()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}