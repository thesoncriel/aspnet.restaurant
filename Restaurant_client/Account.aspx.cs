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
    public enum MsgBoxType{Alert,Confirm};
    

    public partial class Account : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            litTitle.Text = "<div id='accTitle' align='right'>" + TableManager.tblNum + "번# 테이블 계산 내역 #</div>";
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["thesonConn"].ConnectionString;

            MySqlConnection con = new MySqlConnection(conStr);
            con.Open();

            string strSql = "select category, menu, price, imgurl, food1, quant1 from menu order by category desc, menu asc;";
            MySqlCommand cmd = new MySqlCommand(strSql, con);
            MySqlDataReader rd = cmd.ExecuteReader();

            string[] cate = new string[30];
            string strReq = "";
            string strFood = "";
            int i = 0;
            int j = 0;
            int f = 0;
            int cCnt = 0;
            
            while (rd.Read())
            {//각 4개의 항목을 4개의 새로운 배열로 묶음(2차월 배열 선언)
                strReq += "menuDB[" + i + "] = new Array(4);\n";
                if (i == 0)
                {
                    cate[0] = rd[0].ToString();
                }
                if (cate[j] != rd[0].ToString())
                {
                    j++;
                    cate[j] = rd[0].ToString();
                    
                }
                //각 항목을 2차원 배열에 바인딩 시킴
                strReq += "menuDB[" + i + "][0] = '" + rd[0] + "';\n";  //카테고리
                strReq += "menuDB[" + i + "][1] = '" + rd[1] + "';\n";  //이름
                strReq += "menuDB[" + i + "][2] = '" + rd[2] + "';\n";  //가격
                strReq += "menuDB[" + i + "][3] = '" + rd[3] + "';\n\n";  //이미지 위치
                if (Convert.ToInt32(rd[5]) > 0)
                {
                    strFood += "foodDB[" + f + "] = new Array(3);\n";
                    strFood += "foodDB[" + f + "][0] = '" + rd[1] + "';\n";
                    strFood += "foodDB[" + f + "][1] = '" + rd[4] + "';\n";
                    strFood += "foodDB[" + f + "][2] = '" + rd[5] + "';\n";
                    f++;
                }
                i++;
            }

            con.Close();
            strFood = "//식재료 데이터\nvar foodDB = new Array(" + f + ");\n" + strFood;
            string strReqHead = "<script type='text/javascript'>\nvar menuDB = new Array(" + i + ");\n";
            
            con.Open();
            cCnt = j + 1;


            strSql = "SELECT menu, price, quant FROM nowtable where tblnum = " + TableManager.tblNum + ";";
            cmd = new MySqlCommand(strSql, con);
            rd = cmd.ExecuteReader();
            i = 0;

            
            string strReq2 = "\n//" + TableManager.tblNum + " 테이블 내역\n";
            
            while (rd.Read())
            {
                strReq2 += "ntblDB[" + i + "] = new Array(3);\n";
                strReq2 += "ntblDB[" + i + "][0] = '" + rd[0] + "';\n";  //
                strReq2 += "ntblDB[" + i + "][1] = '" + rd[1] + "';\n";  //
                strReq2 += "ntblDB[" + i + "][2] = '" + rd[2] + "';\n";  //
                //strReq2 += "ntblDB[" + i + "][3] = '" + rd[3] + "';\n";  //
                i++;
            }
            con.Close();
            if (i > 0)
            {
                strReqHead += "var ntblDB = new Array(" + i + ");\n";
                strReq += strReq2;
            }
            strReq = strReq  + strFood + "</script>\n";

            Response.Write(strReqHead + strReq);
            
            /*
            setCate.Text = "";
            for (int n = 0; n < cCnt; n++)
            {
                this.setCate.Text += "<input type='button' class='cateMember" + (n % 2) + "' onclick='popCate_Click(" + i + ")' value='" + cate[n] + "' /><br />\n";
            }*/
        }

        protected void btnComp_Click(object sender, EventArgs e)
        {
            sqlDataCate.DeleteCommand = sqlTempD.Value.Replace(":::", TableManager.tblNum.ToString());
            sqlDataCate.Delete();
            sqlDataCate.InsertCommand = sqlTemp.Value.Replace(":::", TableManager.tblNum.ToString());
            sqlDataCate.Insert();
            sqlDataCate.UpdateCommand = sqlTempU.Value;
            if (sqlDataCate.UpdateCommand.Length > 6)
            {
                sqlDataCate.Update();
            }
            //Response.Write(sqlDataCate.Insert() + "개의 데이터 입력이 완료 되었습니다");
            Response.Redirect("TableManager.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            
            sqlDataCate.DeleteCommand = sqlTempD.Value.Replace(":::", TableManager.tblNum.ToString());
            //Response.Write(sqlDataCate.DeleteCommand);
            //Response.Write("<script type='text/javascript'> alert('" + sqlDataCate.DeleteCommand + "'); </script>");
            sqlDataCate.Delete();
            //Response.Write(sqlDataCate.Delete() + "개의 데이터 삭제가 완료 되었다능");

            sqlDataCate.InsertCommand = sqlTemp.Value.Replace(":::", TableManager.tblNum.ToString());
            sqlDataCate.Insert();
            //Response.Write(sqlDataCate.Insert() + "개의 데이터 입력이 완료 ^^");
            //Response.Write("백 클릭됐음");

            Response.Redirect("TableManager.aspx");
        }
    }
}
