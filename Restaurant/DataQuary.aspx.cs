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
    public partial class DataQuary : System.Web.UI.Page
    {
        string userID = "theson";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sqlStr = TextBox1.Text;
            int resultNum = 0;
            DataSourceSelectArguments args = new DataSourceSelectArguments();

            if (sqlStr.IndexOf("insert") > -1)
            {
                SqlDataSource1.InsertCommand = sqlStr;
                resultNum = SqlDataSource1.Insert();
            }
            else if (sqlStr.IndexOf("delete") > -1)
            {
                SqlDataSource1.DeleteCommand = sqlStr;
                resultNum = SqlDataSource1.Delete();
            }
            else if (sqlStr.IndexOf("select") > -1)
            {
                SqlDataSource1.SelectCommand = sqlStr;
                SqlDataSource1.Select(args);
            }
            else if (sqlStr.IndexOf("update") > -1)
            {
                SqlDataSource1.UpdateCommand = sqlStr;
                resultNum = SqlDataSource1.Update();
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('SQL명령문이 잘못되었당께 -_-');</script>");
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            BoundColumn bc = new BoundColumn();
            
            
            //SqlDataSource1.SelectCommand = "select * from " + userID + "." + DropDownList1.Text;
            //SqlDataSource1.Select(
            //GridView1.Columns.Add(bc);
        }
    }
}
