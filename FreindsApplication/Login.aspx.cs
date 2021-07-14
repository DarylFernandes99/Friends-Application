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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null)
            {
                Response.Redirect("~/Dashboard.aspx");
            }
        }

        protected void submitLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string s = @"SELECT id, name FROM friends_login WHERE phone=@phone and pwd=HASHBYTES('SHA2_512', @password)";
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
            cmd.Parameters.AddWithValue("@password", password.Value.ToString());
            con.Open();
            SqlDataReader read = cmd.ExecuteReader();
            if (read.HasRows)
            {
                while (read.Read())
                {
                    Session["id"] = Convert.ToInt32(read["id"]);
                    Session["name"] = read["name"].ToString();
                }
                con.Close();
                Response.Write("<script>alert('Logged In')</script>");
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Phone/Password')</script>");
            }
        }
    }
}