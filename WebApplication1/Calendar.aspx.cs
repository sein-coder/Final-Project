using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Calendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public class eventData
        {
            public string id;
            public string name;
            public string title;
            public string description;
            public string start;
            public string end;
            public string className;
        }

        [WebMethod]
        public static object GetData()
        {
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ToString());
            List<eventData> obj = new List<eventData>();
            cn.Open();

            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter("select id, name, title, description, startdate, enddate from event", cn);
            da.Fill(dt);
            cn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                eventData tempData = new eventData();

                tempData.id = dr[0].ToString();
                tempData.name = dr[1].ToString();
                tempData.title = dr[2].ToString();
                tempData.description = dr[3].ToString();
                tempData.start = dr[4].ToString();
                tempData.end = dr[5].ToString();
                if (tempData.title == "출장") tempData.className = "important";
                else if(tempData.title == "교육") tempData.className = "success";
                else tempData.className = "info";
                obj.Add(tempData);
            }
            return obj.ToArray();
        }

        [System.Web.Services.WebMethod]
        public static string InsertData(string name, string title, string description, string startdate, string enddate)
        {
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            string insertquery = "insert into event (name, title, description, startdate, enddate) values(N'" + name + "',N'" + title + "',N'" + description + "','" + startdate + "','" + enddate + "')";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(insertquery))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            string returnid = "";
            DataTable dt = new DataTable();
            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ToString());
            SqlCommand cm = new SqlCommand();
            cn.Open();
            string selectquery = "select id from event where name = N'" + name + "' and title =  N'" + title + "' and description =  N'" + description + "'  and startdate  = '" + startdate + "' and enddate = '" + enddate + "' ";
            SqlDataAdapter da = new SqlDataAdapter(selectquery, cn);
            da.Fill(dt);
            cn.Close();

            foreach (DataRow dr in dt.Rows)
            {
                returnid = dr[0].ToString();
            }
            return returnid;
        }

        [System.Web.Services.WebMethod]
        public static string UpdateData(string id, string name, string title, string description, string startdate, string enddate)
        {
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            string updatequery = "update event set name = N'" + name + "', title = N'" + title + "', description = N'" + description + "', startdate = '" + startdate + "', enddate = '" + enddate + "' where id = " + id;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(updatequery))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            //  return obj.ToArray();*/
            return id + " 수정 완료";
        }

        [System.Web.Services.WebMethod]
        public static string DeleteData(string id)
        {
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("delete event where id = @id"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Parameters.AddWithValue("@id", id);
                        cmd.Connection = con;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }

            //  return obj.ToArray();*/
            return id;
        }
    }
}