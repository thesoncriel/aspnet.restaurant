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
    public partial class Spend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime date = new DateTime();
            date = DateTime.Today;
            this.txtDate.Text = date.Year + "-" + date.Month + "-" + date.Day;
        }
        protected void GridViewSpend_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Response.Write(GridViewSpend.SelectedValue);
            /*
            //GridViewSpend.SelectedDataKey;
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select * from spend where content = '" + GridViewSpend.SelectedValue + "'";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();
            //2009-11-10 오전 12:00:00
            /*
            <asp:TextBox ID="txtDate" runat="server" CssClass="editText" Enabled="False"></asp:TextBox><br />
        <asp:TextBox ID="txtCont" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:DropDownList ID="txtCate" runat="server" CssClass="editText" 
            DataSourceID="SqlDataCmb" DataTextField="category" DataValueField="category"></asp:DropDownList><br />
        <asp:TextBox ID="txtWeight" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtPrice" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtQuant" runat="server" CssClass="editText"></asp:TextBox><br />
        <asp:TextBox ID="txtStore" runat="server" CssClass="editText"></asp:TextBox><br />
             
            string date = "";
            string cont = "";
            string cate = "";
            string weight = "";
            string price = "";
            string quant = "";
            string store = "";

            while (rd.Read())
            {
                date = rd[0].ToString();
                cont = rd[1].ToString();
                cate = rd[2].ToString();
                weight = rd[3].ToString();
                price = rd[4].ToString();
                quant = rd[5].ToString();
                store = rd[6].ToString();
            }
            con.Close();
            txtDate.Text = date;
            txtCont.Text = cont;
            txtCate.Text = cate;
            txtWeight.Text = weight;
            txtPrice.Text = price;
            txtQuant.Text = quant;
            txtStore.Text = store;
            */
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;
                MySqlConnection con = new MySqlConnection(conStr);
                con.Open();

                string strSql = "delete from menu where spend like '%" + GridViewSpend.SelectedValue + "%'";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();

                Response.Redirect("Spend.aspx");
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
                /*
                 * txtDate.Text = date;
            txtCont.Text = cont;
            txtCate.Text = cate;
            txtWeight.Text = weight;
            txtPrice.Text = price;
            txtQuant.Text = quant;
            txtStore.Text = store;
                 */
                if (txtQuant.Text == "")
                {
                    txtQuant.Text = "0";
                }
                string strSql = "Insert into spend(sdate, content, category, weight, price, quant, store) values('" + txtDate.Text + "', '" + txtCont.Text + "', '" + txtCate.Text + "', " + txtWeight.Text + ", " + txtPrice.Text + ", " + txtQuant.Text + ", '" + txtStore.Text + "')";
                MySqlCommand cmd = new MySqlCommand(strSql, con);
                MySqlDataReader rd = cmd.ExecuteReader();
                con.Close();

                con.Open();
                strSql = "update food set fdate = '" + txtDate.Text + "', fleft = fleft + " + txtWeight.Text + " where name = '" + txtCont.Text + "'";
                cmd = new MySqlCommand(strSql, con);
                rd = cmd.ExecuteReader();
                con.Close();

                Response.Redirect("Spend.aspx");
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

                //string strSql = "update spend set category = '" + txtCate.Text + "', price = " + txtPrice.Text + ", food1 = '" + txtFood.Text + "', quant1 = " + txtQuant.Text + ", imgurl = '" + txtImgurl.Text + "' where menu = '" + txtMenu.Text + "'";
                //MySqlCommand cmd = new MySqlCommand(strSql, con);
                //MySqlDataReader rd = cmd.ExecuteReader();

                con.Close();
                Response.Redirect("Spend.aspx");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('갱신 오류') </script>");
                return;
            }
        }

        

    }
}
