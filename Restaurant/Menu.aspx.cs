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
    public partial class Menu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridViewSpend_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write(GridViewSpend.SelectedDataKey.Value);
            //Response.Write(GridViewFood.SelectedValue);

            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select category, menu, price, food1, quant1, imgurl from menu where menu = '" + GridViewMenu.SelectedValue + "'";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            //2009-11-10 오전 12:00:00
            /*
            <asp:TextBox ID="txtCate" runat="server" CssClass="editText" Enabled="False"></asp:TextBox><br />
        <asp:TextBox ID="txtMenu" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtFood" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtQuant" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtImgurl" runat="server" CssClass="editText"></asp:TextBox><br />
             */
            string cate = "";
            string menu = "";
            string price = "";
            string food = "";
            string quant = "";
            string imgurl = "";
            //string strReq = "";

            while (rd.Read())
            {
                cate = rd[0].ToString();
                menu = rd[1].ToString();
                price = rd[2].ToString();
                food = rd[3].ToString();
                quant = rd[4].ToString();
                imgurl = rd[5].ToString();
            }

            con.Close();
            txtCate.Text = cate;
            txtMenu.Text = menu;
            txtPrice.Text = price;
            txtFood.Text = food;
            txtQuant.Text = quant;
            txtImgurl.Text = imgurl;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
                MySqlConnection con = new MySqlConnection(conStr);
                con.Open();

                string strSql = "delete from menu where menu = '" + GridViewMenu.SelectedValue + "'";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();

                Response.Redirect("Menu.aspx");
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

                string strSql = "Insert into menu(category, menu, price, food1, quant1, imgurl) values('" + txtCate.Text + "', '" + txtMenu.Text + "', " + txtPrice.Text + ", '" + txtFood.Text + "', " + txtQuant.Text + ", '" + txtImgurl.Text + "')";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();

                Response.Redirect("Menu.aspx");
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

                string strSql = "update menu set category = '" + txtCate.Text + "', price = " + txtPrice.Text + ", food1 = '" + txtFood.Text + "', quant1 = " + txtQuant.Text + ", imgurl = '" + txtImgurl.Text + "' where menu = '" + txtMenu.Text + "'";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();
                Response.Redirect("Menu.aspx");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('갱신 오류') </script>");
                return;
            }
        }
    }
}
