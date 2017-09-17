using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Restaurant
{
    public partial class Food : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = new DateTime();
            date = DateTime.Today;
            this.txtDate.Text = date.Year + "-" + date.Month + "-" + date.Day;
        }

        protected void GridViewFood_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write(GridViewFood.SelectedValue);

            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select * from food where name = '" + GridViewFood.SelectedValue + "'";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            //2009-11-10 오전 12:00:00
            string fdate = "";
            string name = "";
            string fleft = "";
            //string strReq = "";

            while (rd.Read())
            {
                fdate = rd[0].ToString();
                name = rd[1].ToString();
                fleft = rd[2].ToString();
            }
            con.Close();
            txtDate.Text = fdate.Replace(" 오전 12:00:00", "");
            txtName.Text = name;
            txtLeft.Text = fleft;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
                MySqlConnection con = new MySqlConnection(conStr);
                con.Open();

                string strSql = "delete from food where name = '" + GridViewFood.SelectedValue + "'";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();

                Response.Redirect("Food.aspx");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('삭제 오류') </script>");
                return;
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
                MySqlConnection con = new MySqlConnection(conStr);
                con.Open();

                string strSql = "Insert into food values('" + txtDate.Text + "', '" + txtName.Text + "', " + txtLeft.Text + ")";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();

                Response.Redirect("Food.aspx");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('삽입 오류') </script>");
                return;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
                MySqlConnection con = new MySqlConnection(conStr);
                con.Open();

                string strSql = "update food set fdate = '" + txtDate.Text + "', fleft = " + txtLeft.Text + " where name = '" + txtName.Text + "'";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();
                Response.Redirect("Food.aspx");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('갱신 오류') </script>");
                return;
            }
        }

    }
}
