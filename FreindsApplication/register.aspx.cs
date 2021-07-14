using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace FreindsApplication
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("~/Dashboard.aspx");
            }
        }

        protected void submitRegister_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string s = @"SELECT COUNT(*) FROM friends_login WHERE phone=@phone";
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
            con.Open();
            Int32 records = (Int32)cmd.ExecuteScalar();

            if (records == 0)
            {
                cmd.Parameters.Clear();
                s = @"INSERT INTO friends_login VALUES (@name, @phone, HASHBYTES('SHA2_512', @pwd))";
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@name", name.Value.ToString());
                cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
                cmd.Parameters.AddWithValue("@pwd", password.Value.ToString());
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Account Created Successfully!')</script>");
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.Write("<script>alert('Phone Number already Exists')</script>");
            }
            con.Close();
        }
    }
}