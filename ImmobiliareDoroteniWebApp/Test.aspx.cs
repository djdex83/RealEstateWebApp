using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace ImmobiliareDoroteniWebApp
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStr =
" server=62.149.153.53;uid=MSSql112451;pwd=hqsd5h040p;database=MSSql112451";
            string queryStr = "SELECT * FROM Comuni";

            SqlConnection connectObj = new
            SqlConnection(connectionStr);
            SqlCommand commandObj = new
            SqlCommand(queryStr, connectObj);

            SqlDataReader readerObj;

            connectObj.Open();
            readerObj = commandObj.ExecuteReader();

            dataGridControl.DataSource = readerObj;

            dataGridControl.DataBind();
        }
    }
}