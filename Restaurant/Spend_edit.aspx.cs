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
    public partial class Spend_edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = new DateTime();
            date = DateTime.Today;
            this.txtDate.Text = date.Year + "-" + date.Month + "-" + date.Day;
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("Spend.aspx");
        }

        protected void btnComp_Click(object sender, EventArgs e)
        {
            string sdate = txtDate.Text;
            string content = txtName.Text;
            string category = cmbCate.Text;
            string weight = txtWeight.Text;
            string price = txtPrice.Text;
            string quant = txtQuant.Text;
            string store = txtStore.Text;
            SqlDataSource1.InsertCommand = "insert into spend values('" + sdate + "', '" + content + "', '" + category + "', " + weight + ", " + price + ", " + quant + ", '" + store + "')";
            try
            {
                SqlDataSource1.Insert();
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('입력오류 : 다시 입력해 주세요') </script>");
                return;
            }
            txtName.Text = "";
            txtWeight.Text = "";
            txtPrice.Text = "";
            txtQuant.Text = "";
            txtStore.Text = "";
            litResult.Text = "입력이 완료 되었습니다 :)";
        }
    }
}
