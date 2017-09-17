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
    public struct NowTable
    {
        //public int tblnum;
        public int num;
        public int price;
    }
    public partial class TableManager : System.Web.UI.Page
    {
        public static int tblNum = 1;
        public static string tblData = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            int rowNum = 5;
            int colNum = 5;
            tblStatus.Width = 600;
            tblStatus.Height = 600;

            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;

            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select tblnum, count(tblnum) as num, sum(price) as sum from nowtable group by tblnum;";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();

            NowTable[] nowtbl = new NowTable[rowNum * colNum];
            string str = "";
            int i = 0;
            int j = 0;

            while (rd.Read())
            {
                int tmp = Convert.ToInt32(rd[0]);
                nowtbl[tmp - 1].num = Convert.ToInt32(rd[1]);
                nowtbl[tmp - 1].price = Convert.ToInt32(rd[2]);
                //strReq += "selDB[" + i + "][0] = '" + rd[0] + "';\n";  //카테고리
                //strReq += "selDB[" + i + "][1] = '" + rd[1] + "';\n";  //이름
                //strReq += "selDB[" + i + "][2] = '" + rd[2] + "';\n";  //가격
                //strReq += "menuDB[" + i + "][3] = '" + rd[3] + "';\n\n";//이미지 위치
                i++;
            }

            con.Close();
            
            
            int num = 0;
            for(i = 0; i < rowNum; i++){
                TableRow tr = new TableRow();
                for (j = 0; j < colNum; j++)
                {
                    TableCell tc = new TableCell();
                    tc.Width = (int)tblStatus.Width.Value / colNum;
                    tc.Height = (int)tblStatus.Height.Value / rowNum;
                    tc.CssClass = "status";
                    tc.Attributes.Add("id", "c" + ((i * colNum) + j + 1));
                    //tc.Attributes.Add("onClick", "popWinAcc(document.getElementById('tmc" + ((i * colNum) + j + 1) + "'))");
                    num = j + (i * rowNum);
                    str = "";
                    if (nowtbl[num].price != 0)
                    {
                        str = "주문 건수: " + nowtbl[num].num + "\n\n";
                        str += "총계산: " + nowtbl[num].price;
                    }
                    else
                    {
                        
                    }

                    Button btn = new Button();
                    btn.ID = "tmc" + ((i * colNum) + j + 1);
                    btn.Text = str;
                    btn.CssClass = "tmcStyle";
                    btn.Click += new EventHandler(btn_Click);
                    //btn.OnClientClick = "popWinAcc(" + ((i * colNum) + j + 1) + ")";
                    tc.Controls.Add(new LiteralControl(TableNum((i*colNum) + j + 1)));
                    //tc.Controls.Add(new LiteralControl("<div id='tmc" + ((i * colNum) + j + 1) + "' class='tmcStyle'></div>\n"));
                    tc.Controls.Add(btn);
                    tr.Cells.Add(tc);
                }
                tblStatus.Rows.Add(tr);
            }
        }

        public string TableNum(int tableNum)
        {
            return "<div style='width:100%; text-align:left'><div class='tableNum'>" + tableNum + "</div></div>\n";
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            tblNum = Int32.Parse(((Button)sender).ID.Replace("tmc",""));
            if (tblNum < 1)
            {
                Response.Write("테이블 이름 값이 잘못 되었습니다<br />" + "현재 테이블 번호 : " + tblNum);
                tblNum = 1;
                return;
            }
            Response.Write(tblNum);

            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;

            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "SELECT menu, price, quant FROM nowtable where tblNum = " + tblNum + ";";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();

            string strReq = "";
            int i = 0;
            while (rd.Read())
            {//각 4개의 항목을 4개의 새로운 배열로 묶음(2차월 배열 선언)
                strReq += "ntblDB[" + i + "] = new Array(3);\n";
                //각 항목을 2차원 배열에 바인딩 시킴
                strReq += "ntblDB[" + i + "][0] = '" + rd[0] + "';\n";  //카테고리
                strReq += "ntblDB[" + i + "][1] = '" + rd[1] + "';\n";  //이름
                strReq += "ntblDB[" + i + "][2] = '" + rd[2] + "';\n";  //가격
                i++;
            }
            
            string strReqHead = "var tblNum = " + tblNum + ";\n";
            Response.Write(strReq);
            if (i != 0)
            {
                strReqHead += "var ntblDB = new Array(" + i + ");\n";
            }
            else
            {
                strReqHead += "var ntblDB = null;\n";
            }
            tblData = strReqHead + strReq;

            

            con.Close();

            Response.Redirect("Account.aspx");
        }
    }
}
