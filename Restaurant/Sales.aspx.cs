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
using System.Xml.Linq;

namespace Restaurant
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.txtUser.Text == "")
            {
                DateTime date = DateTime.Today;

                //Response.Write(date.Year + "-" + date.Month + "-" + date.Day);
                this.SqlDataSales.SelectCommand = "select * from sales where sdate like '%" + date.Year + "-" + date.Month + "-" + date.Day + "%' order by sdate desc;";
                //SqlDataSales.Select(new DataSourceSelectArguments());
            }
            else
            {
                this.SqlDataSales.SelectCommand = "select * from sales where sdate like '%" + txtUser.Text + "%' order by sdate desc;";
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string chk = "";
            string cmb = "";
            string usr = txtUser.Text;
            string sql = "";
            
            switch (cmbSearch.SelectedIndex)    //0:날짜, 1:시간, 2:품목
            {
                case 0:
                    cmb = "sdate";
                    break;
                case 1:
                    cmb = "stime";
                    break;
                case 2:
                    cmb = "menu";
                    break;
                default:
                    cmb = "sdate";
                    break;
            }
            if (chkGroup.Checked)
            {
                chk = "group by " + cmb;
            }
            sql = "select * from sales where " + cmb + " like '%" + usr + "%' " + chk +" order by sdate desc";
            SqlDataSales.SelectCommand = sql;
            SqlDataSales.Select(new DataSourceSelectArguments());
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            Response.Write("하하");
        }
    }
}
