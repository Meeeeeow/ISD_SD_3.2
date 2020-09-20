using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRental
{
    public partial class CarInventoryAdmin : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actualstock,global_current_stock,global_rented_cars;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)//as  dropdown is loading every time the page is refreshed iw is getting the first value.so to prevent that 
                Fillbrandmodel();
            GridView1.DataBind();
        }
        //Go button
        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            GetcarbyID();
        }
        //Add
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkCarID())
            {
                Response.Write("<script>alert('Car already exists!Try with another ID');</script>");
            }
            else
                Addnewcar();
        }
        //update
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdatecarbyID();
        }
        //delete
        protected void Button4_Click(object sender, EventArgs e)
        {
            DeletecarbyID();
        }
        void Fillbrandmodel()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open 
                }
                SqlCommand cmd = new SqlCommand("SELECT BrandName FROM BrandTable", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                DropDownList2.DataSource = dt;
                DropDownList2.DataValueField = "BrandName";
                DropDownList2.DataBind();

                cmd = new SqlCommand("SELECT ModelName FROM ModelTable", conn);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList1.DataSource = dt;
                DropDownList1.DataValueField = "ModelName";
                DropDownList1.DataBind();

                cmd = new SqlCommand("SELECT ServiceName FROM Services", conn);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                DropDownList3.DataSource = dt;
                DropDownList3.DataValueField = "ServiceName";
                DropDownList3.DataBind();

            }
            catch (Exception ex)
            {

            }
        }
        bool checkCarID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CarDetails where CarID='" + TextBox2.Text.Trim() + "';", conn);
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
        void Addnewcar()
        {
            try
            {
                /* string options = "";
                 foreach( int i in ListBox1.GetSelectedIndices())
                 {
                     options = options + ListBox1.Items[i] + ","; 
                 }//options = options+ selected items such as  (monthly,hourly,airport,)
                 options = options.Remove(options.Length - 1);//to get rid of the extra comma*/

                string filepath = "~/images/car.jpg";//for the default logo
                string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);//whenever upload the image will be posted and gotta catch'em the file name
                FileUpload1.SaveAs(Server.MapPath("CarImage/" + filename));//this will save the  image file to path with the filename
                filepath = "~/CarImage/" + filename;//to store the image files to store in back end

                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open(); //connection open 
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO CarDetails(CarID,BrandName,ModelName,Route,RentOptions,Cost,Doors,Engine,Exterior,Interior,Seats,AirCon,RunsOn,ActualStock,currentStock,ArrivalDate,Description,CarImage,Category,BodyStyle,Bags)" +
                    "values(@CarID,@BrandName,@ModelName,@Route,@RentOptions,@Cost,@Doors,@Engine,@Exterior,@Interior,@Seats,@AirCon,@RunsOn,@ActualStock,@currentStock,@ArrivalDate,@Description,@CarImage,@Category,@BodyStyle,@Bags)", conn);

                cmd.Parameters.AddWithValue("@CarID", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@BrandName", DropDownList2.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ModelName", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Route", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@RentOptions", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Cost", TextBox9.Text.Trim());
                cmd.Parameters.AddWithValue("@Doors", TextBox8.Text.Trim());
                cmd.Parameters.AddWithValue("@Engine", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@Exterior", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@Interior", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@Seats", DropDownList5.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@AirCon", DropDownList6.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@RunsOn", DropDownList7.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@ActualStock", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@currentStock", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@ArrivalDate", TextBox12.Text.Trim());
                cmd.Parameters.AddWithValue("@Description", TextBox11.Text.Trim());
                cmd.Parameters.AddWithValue("@CarImage", filepath);
                cmd.Parameters.AddWithValue("@Category", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@BodyStyle", DropDownList8.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@Bags", DropDownList9.SelectedItem.Value);

                cmd.ExecuteNonQuery();
                conn.Close();
                Response.Write("<script>alert('Car added successfully!');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        void DeletecarbyID()
        {
            if (checkCarID())
            {
                try
                {
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open(); //connection open plz
                    }
                    SqlCommand cmd = new SqlCommand("DELETE FROM CarDetails WHERE CarID='" + TextBox2.Text.Trim() + "'", conn);
                    cmd.ExecuteNonQuery();
                    conn.Close();
                    Response.Write("<script>alert('Car deleted successfully!');</script>");
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");

                }
            }
            else
            {
                Response.Write("<script>alert('CarID doesnot exist!');</script>");
            }
        }
        void UpdatecarbyID()
        {
            if (checkCarID())
            {
                try
                {
                    int actual_stock = Convert.ToInt32(TextBox6.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox7.Text.Trim());

                    if (global_actualstock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_rented_cars)//the cars are out until they are in we cannot reducve actual value less than the rented cars
                        {
                            Response.Write("<script>alert('Actual Stock value cannot be less than the rented cars');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_rented_cars;//available cars
                            TextBox7.Text = "" + current_stock;
                        }
                    }

                    string filepath = "~/images/car.jpg";//for the default logo
                    string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);//whenever upload the image will be posted and gotta catch'em the file name
                    if(filename == "" || filename == null)//for update if we donot choose any image it will return blank or null so no updates were made
                    {
                        filename = global_filepath;// and keep the old filepath
                    }
                    else//if we choose any file then it will not be null 
                    {
                        FileUpload1.SaveAs(Server.MapPath("CarImage/" + filename));//this will save the  image file to path with the filename
                        filepath = "~/CarImage/" + filename;//to store the image files to store in back end
                    }
                    SqlConnection conn = new SqlConnection(strcon);
                    if (conn.State == ConnectionState.Closed)
                    {
                        conn.Open();

                    }
                    SqlCommand cmd = new SqlCommand("UPDATE CarDetails SET BrandName=@BrandName,ModelName =  @ModelName, Route = @Route,RentOptions = @RentOptions,Cost =@Cost,Doors =@Doors,Engine= @Engine,Exterior = @Exterior,Interior = @Interior,Seats = @Seats,AirCon = @AirCon,RunsOn = @RunsOn,ActualStock = @ActualStock,currentStock = @currentStock,ArrivalDate = @ArrivalDate,Description = @Description,CarImage = @CarImage,Category = @Category,BodyStyle = @BodyStyle,Bags = @Bags WHERE CarID='" + TextBox2.Text.Trim() + "'", conn);
                    cmd.Parameters.AddWithValue("@BrandName", DropDownList2.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@ModelName", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Route", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@RentOptions", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Cost", TextBox9.Text.Trim());
                    cmd.Parameters.AddWithValue("@Doors", TextBox8.Text.Trim());
                    cmd.Parameters.AddWithValue("@Engine", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@Exterior", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@Interior", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@Seats", DropDownList5.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@AirCon", DropDownList6.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@RunsOn", DropDownList7.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@ActualStock", actual_stock.ToString());
                    cmd.Parameters.AddWithValue("@currentStock", current_stock.ToString());
                    cmd.Parameters.AddWithValue("@ArrivalDate", TextBox12.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", TextBox11.Text.Trim());
                    cmd.Parameters.AddWithValue("@CarImage", filepath);
                    cmd.Parameters.AddWithValue("@Category", DropDownList4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@BodyStyle", DropDownList8.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Bags", DropDownList9.SelectedItem.Value);

                    cmd.ExecuteNonQuery();
                    conn.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Car Details Updated Successfully!');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Car ID doesnot exist!');</script>");
            }
        }
        void GetcarbyID()
        {
            try
            {
                SqlConnection conn = new SqlConnection(strcon);
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * FROM CarDetails where CarID='" + TextBox2.Text.Trim() + "';", conn);
                SqlDataAdapter dt = new SqlDataAdapter(cmd);
                DataTable da = new DataTable();
                dt.Fill(da);
               if(da.Rows.Count >= 1)
                {
                    TextBox12.Text = da.Rows[0]["ArrivalDate"].ToString().Trim();
                    DropDownList2.SelectedValue = da.Rows[0]["BrandName"].ToString().Trim();
                    DropDownList1.SelectedValue = da.Rows[0]["ModelName"].ToString().Trim();
                    DropDownList3.SelectedValue = da.Rows[0]["RentOptions"].ToString().Trim();
                    TextBox1.Text = da.Rows[0]["Route"].ToString().Trim();
                    TextBox9.Text = da.Rows[0]["Cost"].ToString().Trim();
                    TextBox8.Text = da.Rows[0]["Doors"].ToString().Trim();
                    TextBox5.Text = da.Rows[0]["Engine"].ToString().Trim();
                    TextBox3.Text = da.Rows[0]["Exterior"].ToString().Trim();
                    TextBox4.Text = da.Rows[0]["Interior"].ToString().Trim();
                    DropDownList5.SelectedValue = da.Rows[0]["Seats"].ToString().Trim();
                    DropDownList6.SelectedValue = da.Rows[0]["AirCon"].ToString().Trim();
                    DropDownList7.SelectedValue = da.Rows[0]["RunsOn"].ToString().Trim();
                    TextBox6.Text = da.Rows[0]["ActualStock"].ToString().Trim();
                    TextBox7.Text = da.Rows[0]["currentStock"].ToString().Trim();
                    TextBox10.Text = "" + (Convert.ToInt32(da.Rows[0]["ActualStock"].ToString().Trim()) - Convert.ToInt32(da.Rows[0]["currentStock"].ToString().Trim()));
                    TextBox11.Text = da.Rows[0]["Description"].ToString().Trim();
                    DropDownList4.SelectedValue = da.Rows[0]["Category"].ToString().Trim();
                    DropDownList8.SelectedValue = da.Rows[0]["BodyStyle"].ToString().Trim();
                    DropDownList9.SelectedValue = da.Rows[0]["Bags"].ToString().Trim();
                    da.Rows[0]["CarImage"].ToString().Trim();

                    global_actualstock = Convert.ToInt32(da.Rows[0]["ActualStock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(da.Rows[0]["currentStock"].ToString().Trim());
                    global_rented_cars = global_actualstock - global_current_stock;
                    global_filepath = da.Rows[0]["CarImage"].ToString().Trim();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Car ID!');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                

            }
        }
    }
}