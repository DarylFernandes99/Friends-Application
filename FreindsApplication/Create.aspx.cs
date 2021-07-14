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
    public partial class Create : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void submitFriend_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string s = @"SELECT COUNT(*) FROM friends_list WHERE phone=@phone and userID=@userID";
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
            cmd.Parameters.AddWithValue("@userID", Convert.ToInt32(Session["id"]));
            con.Open();
            Int32 records = (Int32)cmd.ExecuteScalar();

            if (records == 0)
            {
                cmd.Parameters.Clear();
                s = @"INSERT INTO friends_list VALUES (@fname, @lname, @phone, @email, @userID)";
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@fname", fname.Value.ToString());
                cmd.Parameters.AddWithValue("@lname", lname.Value.ToString());
                cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
                cmd.Parameters.AddWithValue("@email", email.Value.ToString());
                cmd.Parameters.AddWithValue("@userID", Convert.ToInt32(Session["id"]));
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Friend Created Successfully!')</script>");
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Friend with Same Number already Exists')</script>");
            }
            con.Close();
        }
    }
}