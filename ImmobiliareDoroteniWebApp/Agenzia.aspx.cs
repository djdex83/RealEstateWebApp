using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ImmobiliareDoroteniWebApp
{
    public partial class Agenzia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String line;
            try
            {
                if (!this.IsPostBack)
                {//Pass the file path and file name to the StreamReader constructor
                    StreamReader sr = new StreamReader(Server.MapPath("Admin/contenuti/Agenzia.txt"));

                    //Read the first line of text
                    line = sr.ReadToEnd();
                    txtAgenzia.Text = line;

                    //close the file
                    sr.Close();
                }
            }
            catch (Exception ex)
            {
                string errore = ex.ToString();
                System.Web.HttpContext.Current.Response.Write("<SCRIPT LANGUAGE='JavaScript'>alert('Exception to read file')</SCRIPT>");
            }
            finally
            {
                Console.WriteLine("Executing finally block.");
            }
        }
    }
}