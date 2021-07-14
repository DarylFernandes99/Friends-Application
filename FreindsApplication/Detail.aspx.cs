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
    public partial class Detail : System.Web.UI.Page
    {
        public static string fn;
        public static string ln;
        public static string ph;
        public static string em;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["id"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                if (Session["idDetail"] == null)
                {
                    Response.Redirect("~/Dashboard.aspx");
                }

                else
                {
                    if(!Page.IsPostBack)
                    {
                        editSubmit.Visible = false;
                        string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                        SqlConnection con = new SqlConnection(connStr);
                        string s = @"SELECT fname, lname, phone, email FROM friends_list WHERE id=@id";
                        SqlCommand cmd = new SqlCommand(s, con);
                        cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["idDetail"]));
                        con.Open();
                        SqlDataReader read = cmd.ExecuteReader();
                        while (read.Read())
                        {
                            fname.Value = read["fname"].ToString();
                            lname.Value = read["lname"].ToString();
                            phone.Value = read["phone"].ToString();
                            email.Value = read["email"].ToString();
                            Detail.fn = fname.Value.ToString();
                            Detail.ln = lname.Value.ToString();
                            Detail.ph = phone.Value.ToString();
                            Detail.em = email.Value.ToString();
                        }
                        con.Close();
                    }
                }
            }
        }

        private void disableFields(bool ob)
        {
            fname.Disabled = ob;
            lname.Disabled = ob;
            phone.Disabled = ob;
            email.Disabled = ob;
        }

        private void visibleFields(bool ob, bool ob1)
        {
            editDelete.Visible = ob1;
            clear.Visible = ob;
            editSubmit.Visible = ob;
            edit.Visible = ob1;
        }

        protected void editFriend_Click(object sender, EventArgs e)
        {
            disableFields(false);

            visibleFields(true, false);
        }

        protected void editClear_Click(object sender, EventArgs e)
        {
            fname.Value = Detail.fn;
            lname.Value = Detail.ln;
            phone.Value = Detail.ph;
            email.Value = Detail.em;

            disableFields(true);

            visibleFields(false, true);
        }

        protected void deleteFriend_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string s = @"DELETE FROM friends_list WHERE id=@id";
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["idDetail"]));
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Friend Deleted Successfully!')</script>");
            Response.Redirect("~/Dashboard.aspx");
        }

        protected void editSubmit_Click(object sender, EventArgs e)
        {
            disableFields(true);

            string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
            SqlConnection con = new SqlConnection(connStr);
            string s = @"SELECT COUNT(*) FROM friends_list WHERE phone=@phone and userID=@id";
            SqlCommand cmd = new SqlCommand(s, con);
            cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"]));
            con.Open();
            Int32 records = (Int32)cmd.ExecuteScalar();

            if (records == 0)
            {
                cmd.Parameters.Clear();
                s = @"UPDATE friends_list SET fname=@fname, lname=@lname, phone=@phone, email=@email WHERE id=@id";
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@fname", fname.Value.ToString());
                cmd.Parameters.AddWithValue("@lname", lname.Value.ToString());
                cmd.Parameters.AddWithValue("@phone", phone.Value.ToString());
                cmd.Parameters.AddWithValue("@email", email.Value.ToString());
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["idDetail"]));
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Details Updated Successfully!')</script>");
                Response.Redirect("~/Detail.aspx");
            }
            else
            {
                Response.Write("<script>alert('Phone Number already Exists')</script>");
            }
            con.Close();

            visibleFields(false, true);
        }
    }
}