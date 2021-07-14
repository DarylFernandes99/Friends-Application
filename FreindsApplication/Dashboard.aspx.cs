using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace FreindsApplication
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Session["idDetail"] = null;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Session["id"] = null;
            Session["name"] = null;
            Response.Redirect("~/Login.aspx");
        }

        private void ToggleCheckState(bool checkState)
        {
            // Iterate through the Products.Rows property
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (CheckBox)row.FindControl("chkRow");
                    if (chkRow != null)
                    {
                        chkRow.Checked = checkState;
                    }
                }
            }
        }

        protected void CheckAll_Click(object sender, EventArgs e)
        {
            ToggleCheckState(true);
        }

        protected void UncheckAll_Click(object sender, EventArgs e)
        {
            ToggleCheckState(false);
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string ids = string.Empty;
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowType == DataControlRowType.DataRow)
                {
                    CheckBox chkRow = (row.Cells[0].FindControl("chkRow") as CheckBox);
                    if (chkRow != null && chkRow.Checked)
                    {
                        if (ids == "")
                        {
                            ids = GridView1.DataKeys[row.RowIndex].Value.ToString();
                        }
                        else
                        {
                            ids += ", " + GridView1.DataKeys[row.RowIndex].Value.ToString();
                        }
                    }
                }
            }
            if (ids == "")
            {
                Response.Write("<script>alert('No Friends Selected')</script>");
            }
            else
            {
                string connStr = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
                SqlConnection con = new SqlConnection(connStr);
                string s = @"DELETE FROM friends_list WHERE id IN (" + ids + ")";
                SqlCommand cmd = new SqlCommand(s, con);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Friends Deleted Successfully!')</script>");
                Response.Redirect("~/Dashboard.aspx");
            }
        }

        protected void Detail_Click(object sender, EventArgs e)
        {
            //Get the button that raised the event
            Button btn = (Button)sender;

            //Get the row that contains this button
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;

            Session["idDetail"] = Convert.ToInt32(GridView1.DataKeys[gvr.RowIndex].Value);

            Response.Redirect("~/Detail.aspx");
        }
    }
}