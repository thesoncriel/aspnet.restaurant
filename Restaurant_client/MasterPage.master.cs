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
    public partial class Restarurant : System.Web.UI.MasterPage
    {
        int alertMax = 300;
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = new DateTime();
            date = DateTime.Today;
            string today = date.Year + "-" + date.Month + "-" + date.Day;

            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select sum(amount) as suma from sales where sdate like '%" + today + "%'";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();

            string suma = "";

            while (rd.Read())
            {
                suma = rd[0].ToString();
            }
            //Response.Write(suma);
            con.Close();

            con.Open();
            TimeSpan ts = new TimeSpan(1, 0, 0, 0);
            DateTime yesdate = new DateTime();
            yesdate = date.Subtract(ts);
            string yesterday = yesdate.Year + "-" + yesdate.Month + "-" + yesdate.Day;
            //Response.Write(date.Date);

            strSql = "select sum(amount) as suma from sales where sdate like '%" + yesterday + "%'";
            cmd = new MySqlCommand(strSql, con);
            rd = cmd.ExecuteReader();

            string suma2 = "";
            while (rd.Read())
            {
                suma2 = rd[0].ToString();
            }
            con.Close();

            todayData.Text = suma + "(원)";
            yesterData.Text = suma2 + "(원)";

            con.Open();
            strSql = "select count(*) as alert from food where fleft <= " + this.alertMax;
            cmd = new MySqlCommand(strSql, con);
            rd = cmd.ExecuteReader();

            string suma3 = "";
            while (rd.Read())
            {
                suma3 = rd[0].ToString();
            }
            con.Close();

            if (Int32.Parse(suma3) != 0)
            {
                this.link.Text = "재고가 부족한 물품이 " + suma3 + "건 있습니다.";
            }
            else
            {
                this.link.Text = "";
            }
        }
    }
}
