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
    public partial class AdminCarBrand : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.DataBind();
        }
        //Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if(checkBrandID())
            {
                Response.Write("<script>alert('This brand already exists!');</script>");
            }
            else
            {
                addnewBrand();
            }
        }
        //Update
        protected void Button3_Click(object sender, EventArgs e)
        {
            if (checkBrandID())
            {
                updateBrand();
                
            }
            else
            {
                Response.Write("<script>alert('Incorrect BrandID!');</script>");
            }
        }
        //Delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (checkBrandID())
            {
                deleteBrand();

            }
            else
            {
                Response.Write("<script>alert('Incorrect BrandID!');</script>");
            }
        }
        //Go
        protected void Button2_Click(object sender, EventArgs e)
        {
            addnewBrand();
        }
        void addnewBrand()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO BrandTable(BrandID,BrandName)values(@BrandID,@BrandName)", conn);
                cmd.Parameters.AddWithValue("@BrandID", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@BrandName", TextBox4.Text.Trim());             
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Brand Name added successfully!');</script>");
                cleartable();
                GridView1.DataBind();
               
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void updateBrand()
        {

            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("UPDATE  BrandTable SET BrandName=@BrandName WHERE BrandID='"+TextBox3.Text.Trim()+"'", conn);
               
                cmd.Parameters.AddWithValue("@BrandName", TextBox4.Text.Trim());
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Brand Name Updated successfully!');</script>");
                cleartable();
                GridView1.DataBind();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        void deleteBrand()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open plz
                }
                SqlCommand cmd = new SqlCommand("DELETE FROM BrandTable WHERE BrandID='" + TextBox3.Text.Trim() + "'", conn);

               
                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Brand Name deleted successfully!');</script>");
                cleartable();
                GridView1.DataBind();
                
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");

            }
        }
        bool  checkBrandID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM BrandTable where BrandID='" + TextBox3.Text.Trim() + "';", conn);
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
        void cleartable()
        {
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}