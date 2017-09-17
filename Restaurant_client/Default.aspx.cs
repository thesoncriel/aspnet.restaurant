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

    public partial class _Default : System.Web.UI.Page
    {
        //DataSourceSelectArguments dataSelect = new DataSourceSelectArguments();
        
        //string[] loginStr = {"id","pw"};
        //IEnumerable en;
        //IEnumerator en = loginStr.GetEnumerable;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
            DataSourceSelectArguments dataSelect = new DataSourceSelectArguments();
            sqlDataLogin.SelectCommand = "select id from theson.admin;";
            en = sqlDataLogin.Select(dataSelect);
            if(dataSelect.TotalRowCount != 0){
                TxtID.Visible = false;
                btnAC.Enabled = false;
            }
            */
            btnAC.Visible = false;
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            if (TxtID.Text == "사장님" && TxtPW.Text == "1234")
            {
                Response.Redirect("TableManager.aspx");
            }
            else
            {
                Response.Write("<script type='text/javascript'> alert('로그인 오류\n다시 입력 해 주세요 ^^;'); </script>");
            }
        }

        protected void btnAC_Click(object sender, EventArgs e)
        {
            try
            {
                sqlDataLogin.InsertCommand = "insert into theson.admin values('" + TxtID.Text + "', '" + TxtPW.Text + "');";
                sqlDataLogin.Insert();
                Response.Write("<script type='text/javascript'> alert('관리자 등록에 성공 했습니다 :)'); </script>");
                TxtID.Visible = false;
                btnAC.Enabled = false;
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('등록 오류\n다시 입력 해 주세요 ^^;'); </script>");
                    
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {

        }
    }
}
